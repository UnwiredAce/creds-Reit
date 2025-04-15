love.graphics.setDefaultFilter("nearest", "nearest")
local DebiterGenerator = require("GenerativeScr")

local day1Debiters = {}

local totalBalance = 10000
local error = 0

local currentIndex = 1
local showData = false

function love.load()
    math.randomseed(os.time())
    day1Debiters = DebiterGenerator.generateDay1Debiters(20)
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
    if showData and day1Debiters[currentIndex] then
        local debtor = day1Debiters[currentIndex]
        love.graphics.print(debtor.name, 510, 340)
        love.graphics.print("occupation: " .. debtor.occupation .."\n".. "Sector: " .. debtor.sectorRegion, 450, 358)
        love.graphics.print(debtor.balance, 540, 405)
        love.graphics.print(debtor.debtAmount, 540, 435)
        love.graphics.print("Press [Y] to accept", 400, 465)
        love.graphics.print("Press [N] to reject", 400, 490)
    else
        love.graphics.print("Press [Space] to start showing debtors", 400, 300)
    end
end
