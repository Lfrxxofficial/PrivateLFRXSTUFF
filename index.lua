{
  ["title"] = "ZepDomains",
  ["description"] = "Premium domain advertising platform",

  ["objs"] = {

    -- LOGO / HEADER
    {
      ["type"] = "text",
      ["text"] = "ZepDomains",
      ["class"] = "logo",
      ["x"] = 2,
      ["y"] = 2,
    },

    -- HERO TITLE
    {
      ["type"] = "text",
      ["text"] = "Promote Your Brand",
      ["class"] = "hero",
      ["x"] = 2,
      ["y"] = 4,
    },

    {
      ["type"] = "text",
      ["text"] = "Advertising for modern domains",
      ["class"] = "sub",
      ["x"] = 2,
      ["y"] = 5,
    },

    -- CTA BUTTON
    {
      ["type"] = "button",
      ["text"] = "Get Started",
      ["class"] = "btn",
      ["page"] = "buy",
      ["x"] = 2,
      ["y"] = 7,
    },

    -- ===== PRICING =====

    -- .mn
    {
      ["type"] = "text",
      ["text"] = ".mn Domain",
      ["class"] = "cardTitle",
      ["x"] = 5,
      ["y"] = 10,
    },

    {
      ["type"] = "text",
      ["text"] = "$10/month",
      ["class"] = "price",
      ["x"] = 5,
      ["y"] = 11,
    },

    {
      ["type"] = "button",
      ["text"] = "Buy .mn",
      ["class"] = "btn",
      ["page"] = "buy_mn",
      ["x"] = 5,
      ["y"] = 13,
    },

    -- .zp
    {
      ["type"] = "text",
      ["text"] = ".zp Domain",
      ["class"] = "cardTitle",
      ["x"] = 25,
      ["y"] = 10,
    },

    {
      ["type"] = "text",
      ["text"] = "$3/month",
      ["class"] = "price",
      ["x"] = 25,
      ["y"] = 11,
    },

    {
      ["type"] = "button",
      ["text"] = "Buy .zp",
      ["class"] = "btn",
      ["page"] = "buy_zp",
      ["x"] = 25,
      ["y"] = 13,
    },

  },

  ["style"] = {

    ["body"] = {
      ["background"] = "black",
      ["textColor"] = "white",
    },

    [".logo"] = {
      ["textColor"] = "cyan",
    },

    [".hero"] = {
      ["textColor"] = "white",
    },

    [".sub"] = {
      ["textColor"] = "lightGray",
    },

    [".btn"] = {
      ["background"] = "blue",
      ["textColor"] = "white",
    },

    [".cardTitle"] = {
      ["textColor"] = "yellow",
    },

    [".price"] = {
      ["textColor"] = "green",
    },

  },

  ["script"] = [[
-- basic script (opcjonalne)
function onClick(id)
  print("Clicked: "..id)
end
  ]]
}
