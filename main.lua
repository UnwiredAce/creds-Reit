love.graphics.setDefaultFilter("nearest", "nearest")
local DebiterGenerator = require("GenerativeScr")

local day1Debiters = {}

local totalBalance = 75
local error = 0

local currentIndex = 1
local showData = false
local selectedRegions = {}
local susItems = {}

function love.load()
    math.randomseed(os.time())
    day1Debiters = DebiterGenerator.generateDay1Debiters(10)
    allItems = DebiterGenerator.items
    regions = DebiterGenerator.regions
    for i = 1, 5 do
        table.insert(susItems, allItems[i])
        table.insert(selectedRegions, regions[i])
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
        if totalBalance >= debtor.sellingPrice then
            totalBalance = debtor.sellingPrice - totalBalance
        else
            
        end
    end
    if key == "n" then
        
    end
end


function love.update(dt)
    local debtor = day1Debiters[currentIndex]
end

function love.draw()
    love.graphics.print("TotalBalance: " .. totalBalance, 10, 10)
    love.graphics.print("ErrorCount: " .. error, 10, 25)
    love.graphics.print("Suspicious Items: " .. #susItems, 10, 50)
    love.graphics.print("Authorized regions: " .. #selectedRegions, 200, 50)
    for i, item in ipairs(susItems) do
        love.graphics.print("- " .. item, 10, 50 + i * 20)
    end
    for i, regions in ipairs(selectedRegions) do
        love.graphics.print("- " .. regions, 200, 50 + i * 20)
    end
    if showData and day1Debiters[currentIndex] then
        local debtor = day1Debiters[currentIndex]
        love.graphics.print("Name: " .. debtor.name, 400, 340)
        love.graphics.print("Occupation: " .. debtor.occupation, 400, 370)
        love.graphics.print("Region: " .. debtor.sectorRegion, 400, 390)
        love.graphics.print("Selling Item: " .. debtor.item, 400, 410)
        love.graphics.print("Bid: " .. debtor.sellingPrice, 400, 430)
        love.graphics.print("Press [Y] to accept", 400, 475)
        love.graphics.print("Press [N] to reject", 400, 500)
    else
        love.graphics.print("Press [Space] to start showing debtors", 400, 300)
    end
end
