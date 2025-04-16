love.graphics.setDefaultFilter("nearest", "nearest")
local DebiterGenerator = require("GenerativeScr")

local day1Debiters = {}
local selectedRegion = "Echo Basin"

local error = 0
local currentIndex = 1

local showData = false

function love.load()
    math.randomseed(os.time())
    day1Debiters = DebiterGenerator.generateDay1Debiters(10)

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
        if selectedRegion == debtor.sectorRegion then
            error = 0
            currentIndex = currentIndex + 1
        else
            error = error + 1
            currentIndex = currentIndex + 1
        end
    end
end


function love.update(dt)
end

function love.draw()
    love.graphics.print("ErrorCount: " .. error, 10, 25)
    if showData and day1Debiters[currentIndex] then
        local debtor = day1Debiters[currentIndex]
        love.graphics.print("Name: " .. debtor.name, 400, 340)
        love.graphics.print("Age: " .. debtor.occupation, 400, 370)
        love.graphics.print("Sector: " .. debtor.sectorRegion, 400, 390)
        love.graphics.print("Crime: " .. debtor.crime, 400, 410)
        love.graphics.print("Identification: " .. debtor.identification, 400, 430)
        love.graphics.print("Press [Y] to accept", 400, 475)
        love.graphics.print("Press [N] to reject", 400, 500)
    else
        love.graphics.print("Press [Space] to start showing debtors", 400, 300)
    end
end
