os.execute("clear")

--libraries and stuff
local json = require "dkjson"


local words = {
    "alphabet", "amazing", "abnormal",
    "banana", "bomb", "beginner", "basket", "baby", "boat", "bubble", "bucket", "black", "bottle", "bat", "beautiful",
    "computer", "cat", "circus",
    "dictionary", "dandelion",
    "eclipse", "email",
    "flower", "fart", "follower",
    "gamer", "galloping", "gecko", "gate", "goat",
    "helpful",
    "imagination", "impressive",
    "justified", "jealousy"
}

local HangmanString

local letter = arg[1]

local ChosenWord = words[math.random(1, #words)]
local UsedLetters = {}
local WrongGuesses = 0

local wins = 0

local function WriteData()
    local result = {}

    result["ChosenWord"] = ChosenWord
    result["UsedLetters"] = UsedLetters
    result["WrongGuesses"] = WrongGuesses

    result["wins"] = wins

    local jsonString = json.encode(result, {indent = false})


    local file = io.open("save.json", "w")
    file:write(jsonString)
    file:close()

    --io.write("save.json", jsonString)
end

local function ReadAndApplyData()
    local file = io.open("save.json", "r")
    local content = file:read("*all")
    file:close()

    local thisthinggg = json.decode(content)

    --if thisthinggg["ChosenWord"] == nil then return end

    if thisthinggg["ChosenWord"] then
        ChosenWord = thisthinggg["ChosenWord"]
        UsedLetters = thisthinggg["UsedLetters"]
        WrongGuesses = thisthinggg["WrongGuesses"]

        wins = thisthinggg["wins"]
    end


end

local function ResetGamedata()
    local result = {}

    result["wins"] = wins

    local jsonString = json.encode(result, {indent = false})


    local file = io.open("save.json", "w")
    file:write(jsonString)
    file:close()
end




--flags

if letter == "--help" or letter == "-help" or letter == "--h" or letter == "-h" then
    print("how to play?")
    print("type the letter you want to try at the end of the command that launches the game.")
    print("like this!: LuaHangman a")
    print()
    print("flags")
    print("-h -help".."   prints out what you can do with LuaHangman")
    print("-g -giveup".."   resets the game. You'll start with a new word. This doesnt reset your wins.")
    print("-p -playerdata".."   prints out your player data. (includes your wins)" )
    return
end

if letter == "--giveup" or letter == "-giveup" or letter == "--g" or letter == "-g" then
    ResetGamedata()
    print("resetted the game!")
    return
end

if letter == "--playerdata" or letter == "-playerdata" or letter == "--p" or letter == "-p" then
    ReadAndApplyData()
    print("Player data")
    print("wins: "..wins)
    return
end




--errors and help
if not letter then
    print("type a letter!")
    print("(example) type something like this in the terminal: LuaHangman a")
    return
end

if string.len(letter) > 1 then
    print("you can only write one letter!")
    print("(example) type something like this in the terminal: LuaHangman a")
    return
end





local function HasValue(tab, val)
    local times = 0

    for i, v in ipairs(tab) do
        if v == val then
            times = times + 1
        end
    end

    if times > 0 then return true, times end
    return false, times
end

function GenerateHangmanString()
    local result = ChosenWord



    for i = 1, #result do
        local ch = result:sub(i,i)

        if HasValue(UsedLetters, ch) == false then
           result = string.gsub(result, ch, "_")
        end
    end

    return result
end


--do the actual stuff

ReadAndApplyData()

--i did this because if i put this in the if statement after this one, when you die, it wont print the dead hangman image but the new one.
if WrongGuesses > 4 then
    ResetGamedata()
    return
end


table.insert(UsedLetters, letter)

HangmanString = GenerateHangmanString()

print("this word has "..string.len(ChosenWord).." characters.")
print(HangmanString)
print()

local _, times = HasValue(UsedLetters, letter)

if times == 1 and string.match(ChosenWord, letter) then
    print("You guessed the right letter!")
else
    --WrongGuesses = WrongGuesses + 1
    if times > 1 then
        print("You already tried that letter!")
    else
        WrongGuesses = WrongGuesses + 1
        print("Wrong!")
    end
end

print("Wrong attempts left: "..5 - WrongGuesses)

--check win/lose
if WrongGuesses > 4 then
    print()
    print("Too many wrong guesses, you lose.")
    print("The word was: "..ChosenWord)
    ResetGamedata()
end

if HangmanString == ChosenWord then
    print()
    print("you win!!!!")
    wins = wins + 1

    ResetGamedata()
    return
end

WriteData()

