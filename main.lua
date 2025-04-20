love.graphics.setDefaultFilter("nearest", "nearest")
local DebiterGenerator = require("GenerativeScr")

local day1Debiters = {}
local genericSprites = {}

local error = 0
local currentIndex = 1
local showData = false

function love.load()
    math.randomseed(os.time())
    setup = love.graphics.newImage("sprites/Setup.png")
    day1Debiters = DebiterGenerator.generateDay1Debiters(10, 5)

    for i = 1, 10 do
        local path = "sprites/Random/Random" .. i .. ".png"
        if love.filesystem.getInfo(path) then
            table.insert(genericSprites, love.graphics.newImage(path))
        end
    end
end

local function isNameListed(nameToCheck)
    for _, name in ipairs(DebiterGenerator.listedNames) do
        if name == nameToCheck then
            return true
        end
    end
    return false
end

local function loadSpriteIfExists(name)
    local path = "sprites/" .. name .. ".png"
    if love.filesystem.getInfo(path) then
        return love.graphics.newImage(path)
    else
        return nil
    end
end

local function assignGenericSprite()
    if #genericSprites > 0 then
        return genericSprites[math.random(#genericSprites)]
    else
        return nil
    end
end

function love.keypressed(key)
    local debtor = day1Debiters[currentIndex]
    if key == "space" then
        if currentIndex <= #day1Debiters then
            showData = true
        else
            showData = false
        end
    end
    if key == "y" then
        if isNameListed(debtor.name) then
            currentIndex = currentIndex + 1
        else
            error = error + 1
            currentIndex = currentIndex + 1
        end
    end
    if key == "n" then
        if isNameListed(debtor.name) then
            error = error + 1
            currentIndex = currentIndex + 1
        else
            currentIndex = currentIndex + 1
        end
    end
end

function love.update(dt)
end

function love.draw()
    love.graphics.print("ErrorCount: " .. error, 10, 25)
    love.graphics.draw(setup, 0, 200, 0, 5, 5)

    if showData and day1Debiters[currentIndex] then
        local debtor = day1Debiters[currentIndex]

        if not debtor.sprite then
            if isNameListed(debtor.name) then
                debtor.sprite = loadSpriteIfExists(debtor.name)
            else
                debtor.sprite = assignGenericSprite()
            end
        end

        if debtor.sprite then
            love.graphics.draw(debtor.sprite, 40, 158, 0, 4, 4)
        end

        love.graphics.print("Name: " .. debtor.name, 400, 340)
        love.graphics.print("Age: " .. debtor.age, 400, 370)
        love.graphics.print("Occupation: " .. debtor.occupation, 400, 390)
        love.graphics.print("Sector: " .. debtor.sectorRegion, 400, 410)
        love.graphics.print("Crime: " .. debtor.crime, 400, 430)
        love.graphics.print("Identification: " .. debtor.identification, 400, 450)
        love.graphics.print("Press [Y] to accept", 400, 500)
        love.graphics.print("Press [N] to reject", 400, 520)
    else
        love.graphics.print("Press [Space] to start showing debtors", 400, 300)
    end
end
