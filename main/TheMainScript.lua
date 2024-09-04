local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

local function showNotification(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration or 5;
    })
end

local function onMobileInput()
    local inputStarted = false
    local startTime = tick()

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Touch then
            inputStarted = true
            startTime = tick()
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            if inputStarted and (tick() - startTime) >= 5 then
                showNotification("Bloxy Client", "Mobile Menu Button held for 5 seconds!", 5)
            end
            inputStarted = false
        end
    end)
end

local function onPCInput()
    local inputStarted = false
    local startTime = tick()

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            inputStarted = true
            startTime = tick()
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightShift then
            if inputStarted and (tick() - startTime) >= 5 then
                showNotification("Bloxy Client", "Right Shift held for 5 seconds!", 5)
            end
            inputStarted = false
        end
    end)
end

local function checkDevice()
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        onMobileInput()
    else
        onPCInput()
    end
end

checkDevice()
