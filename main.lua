love.graphics.setDefaultFilter("nearest", "nearest")
local DebiterGenerator = require("GenerativeScr")

local day1Debiters = {}

local totalBalance = 20
local error = 0

local currentIndex = 1
local showData = false

local susItems = {}

function love.load()
    math.randomseed(os.time())
    day1Debiters = DebiterGenerator.generateDay1Debiters(10)
    allItems = DebiterGenerator.items

    for i = 1, 5 do
        table.insert(susItems, allItems[i])
    end
end

function love.keypressed(key)
    if key == "space" then
        if currentIndex <= #day1Debiters then
            showData = true
        else
            showData = false
        end
    end
    if key == "y" then
        if day1Debiters[currentIndex].balance >= day1Debiters[currentIndex].debtAmount then
            if totalBalance >= day1Debiters[currentIndex].debtAmount then
                if day1Debiters[currentIndex].pin == day1Debiters[currentIndex].enteredPin then
                    totalBalance = totalBalance - day1Debiters[currentIndex].debtAmount
                    currentIndex = currentIndex + 1
                else
                    totalBalance = totalBalance - day1Debiters[currentIndex].debtAmount
                    currentIndex = currentIndex + 1
                    error = error + 1
                end
            else
                print("No amount")
                totalBalance = totalBalance - day1Debiters[currentIndex].debtAmount
                error = error + 1
                currentIndex = currentIndex + 1
            end
        else
            print("Insufficient Balance")
            totalBalance = totalBalance - day1Debiters[currentIndex].debtAmount
            error = error + 1
            currentIndex = currentIndex + 1
        end
    end
    if key == "n" then
        if day1Debiters[currentIndex].balance >= day1Debiters[currentIndex].debtAmount and not day1Debiters[currentIndex].paid then
            if totalBalance >= day1Debiters[currentIndex].debtAmount then
                if day1Debiters[currentIndex].pin ~= day1Debiters[currentIndex].enteredPin then
                    currentIndex = currentIndex + 1
                else
                    error = error + 1
                    currentIndex = currentIndex + 1
                end

            else
                print("No amount")
                currentIndex = currentIndex + 1
            end
        else
            print("Insufficient Balance")
            currentIndex = currentIndex + 1
        end
    end
end


function love.update(dt)
    local debtor = day1Debiters[currentIndex]
end

function love.draw()
    love.graphics.print("TotalBalance: " .. totalBalance, 10, 10)
    love.graphics.print("ErrorCount: " .. error, 10, 25)
    love.graphics.print("Suspicious Items: " .. #susItems, 10, 50)
    for i, item in ipairs(susItems) do
        love.graphics.print("- " .. item, 50, 50 + i * 20)
    end
    if showData and day1Debiters[currentIndex] then
        local debtor = day1Debiters[currentIndex]
        love.graphics.print("Name: " .. debtor.name, 400, 340)
        love.graphics.print("Occupation: " .. debtor.occupation, 400, 390)
        love.graphics.print("Region: " .. debtor.sectorRegion, 400, 410)
        love.graphics.print("Selling Item: " .. debtor.item, 400, 430)
        love.graphics.print("Press [Y] to accept", 400, 465)
        love.graphics.print("Press [N] to reject", 400, 490)
    else
        love.graphics.print("Press [Space] to start showing debtors", 400, 300)
    end
end
