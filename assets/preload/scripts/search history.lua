--script made by agnab, please give credit if you use it!!

--DISCLAIMER, this only works if the person effected uses google or opera gx, and only if they have downloaded it in the default directory
--theoretically though, it should work for most people

--THIS IS THE ONLY THING YOU SHOULD EDIT
--put in the terms you want it to pick up
--for example, if i wanted it to pick up when someone searched handholding or agnab i would set the array to {'handholding', 'agnab'}

local searchTerms = {'handholding'}




local username = os.getenv("USERPROFILE")

local handle = io.popen("echo %USERNAME%")
local hi = handle:read("*a"):sub(1, -2) -- remove the newline character
handle:close()

show = false

function onCreate()


local historyFilePath = username .. "/AppData/Roaming/Opera Software/Opera GX Stable/History"
local file = io.open(historyFilePath, "rb")
local contents = file:read("*all")
file:close()

for _, term in ipairs(searchTerms) do
  -- Search for the term in the file contents using Lua's string.find function
  local matchStart, matchEnd = contents:find(term)
  
  if matchStart then
    local startIndex = contents:sub(1, matchStart):reverse():find("[^%s]")
    startIndex = startIndex and matchStart - startIndex + 1 or matchStart    
    local endIndex = contents:find("\r\n", matchEnd) or contents:len()
    local line = contents:sub(startIndex, endIndex)
    
    printThis = 'the term "' .. term .. '"'
    show = true
    break
end
end

local historyFilePath = os.getenv("APPDATA") .. "\\..\\Local\\Google\\Chrome\\User Data\\Default\\History"
local file = io.open(historyFilePath, "rb")
local contents = file:read("*all")
file:close()

for _, term in ipairs(searchTerms) do
  -- Search for the term in the file contents using Lua's string.find function
  local matchStart, matchEnd = contents:find(term)
  
  if matchStart then
    local startIndex = contents:sub(1, matchStart):reverse():find("[^%s]")
    startIndex = startIndex and matchStart - startIndex + 1 or matchStart    
    local endIndex = contents:find("\r\n", matchEnd) or contents:len()
    local line = contents:sub(startIndex, endIndex)
    
    printThis = 'the term ' .. term '"'
    show = true
    break
end
end

--STOP
--HERE
--THIS IS WHERE YOU EDIT TEXT STUFF

--Hallo :)

if show then
makeLuaText('scary1', 'hey '..hi..' whats good', 500, 0, 0)
addLuaText('scary1')
screenCenter('scary1')
setProperty('scary1.y', getProperty('scary1.y') - 20)

makeLuaText('scary2', 'guess what i found?', 500, 0, 0)
addLuaText('scary2')
screenCenter('scary2')
setProperty('scary2.y', getProperty('scary1.y') + 20)

makeLuaText('scary3', printThis..' was found in YOUR search history', 500, 0, 0)
addLuaText('scary3')
screenCenter('scary3')
setProperty('scary3.y', getProperty('scary2.y') + 20)

makeLuaText('scary4', 'its a shame really, you seemed nice enough', 500, 0, 0)
addLuaText('scary4')
screenCenter('scary4')
setProperty('scary4.y', getProperty('scary3.y') + 20)

--dont edit stuff below this lol

--this is for the screenshots for the gb page
makeLuaSprite('back3', '', 0, 0);
makeGraphic('back3', 5280, 5720, '000000');
setScrollFactor('back3', 0, 0);

screenCenter('back3');

--addLuaSprite('back3', true)

end

end