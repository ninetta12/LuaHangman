local json = require "dkjson"

--get the wrong guesses
local file = io.open("save.json", "r")
local content = file:read("*all")
file:close()

local thisthinggg = json.decode(content)
WrongGuesses = thisthinggg["WrongGuesses"] or 0




if not WrongGuesses then return end


print("assets/"..WrongGuesses..".png")


