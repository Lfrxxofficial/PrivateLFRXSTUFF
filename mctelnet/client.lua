-- RAW TELNET CLIENT WITH REMOTE SHELL ACCESS
local modem = peripheral.find("modem") or error("No modem attached")
local myChannel = math.random(1000,9999)
local PORT = 23

modem.open(myChannel)

print("Enter server ID:")
local serverId = tonumber(read())
print("Enter username:")
local user = read()
print("Enter password:")
local pass = read("*")

-- Wysyłamy LOGIN
modem.transmit(serverId, myChannel, "LOGIN:"..user..":"..pass)

-- Oczekiwanie na LOGIN_OK
while true do
    local _, _, ch, reply, msg = os.pullEvent("modem_message")
    if ch == myChannel then
        if msg == "LOGIN_OK" then
            print("Logged in successfully.")
            break
        elseif msg == "LOGIN_FAIL" then
            print("Wrong username or password.")
            return
        end
    end
end

-- Listener – odbiera output serwera
local function listen()
    while true do
        local _, _, ch, _, msg = os.pullEvent("modem_message")
        if ch == myChannel then
            local prefix, data = msg:match("^(%w+):(.+)$")
            if prefix == "OUT" then
                if data == "__END__" then
                    io.write("> ")
                else
                    print(data)
                end
            end
        end
    end
end

local thread = coroutine.create(listen)
coroutine.resume(thread)

-- Wysyłanie poleceń
while true do
    io.write("> ")
    local cmd = read()
    if cmd == "exit" then return end

    modem.transmit(serverId, myChannel, "CMD:"..user..":"..cmd)
end
