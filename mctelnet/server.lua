-- RAW TELNET SERVER WITH REMOTE SHELL
local modem = peripheral.find("modem") or error("No modem attached")
local SERVER_ID = os.getComputerID()
local PORT = 23

-- Użytkownicy lokalni serwera:
local users = {
    ["admin"] = "admin123",
    ["test"] = "test"
}

print("Server "..SERVER_ID.." running on port 23")
modem.open(PORT)

while true do
    local _, _, channel, replyChannel, message = os.pullEvent("modem_message")

    if channel == PORT then
        -- format:
        -- LOGIN:username:password
        -- CMD:username:komenda
        local cmd, user, data = message:match("^(%w+):([^:]+):(.+)$")

        if cmd == "LOGIN" then
            if users[user] and users[user] == data then
                modem.transmit(replyChannel, PORT, "LOGIN_OK")
                print("User "..user.." logged in from channel "..replyChannel)
            else
                modem.transmit(replyChannel, PORT, "LOGIN_FAIL")
            end

        elseif cmd == "CMD" then
            if not users[user] then
                modem.transmit(replyChannel, PORT, "NOT_AUTH")
            else
                -- wykonanie polecenia i przechwycenie wyniku
                local handle = io.popen(data.." 2>&1")
                local output = handle:read("*a")
                handle:close()

                -- podziel output na linie (CC nie lubi za długich wiadomości)
                for line in output:gmatch("[^\r\n]+") do
                    modem.transmit(replyChannel, PORT, "OUT:"..line)
                    sleep(0)
                end
                modem.transmit(replyChannel, PORT, "OUT:__END__")
            end
        end
    end
end
