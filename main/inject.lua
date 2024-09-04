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

local function checkDevice()
    showNotification("Bloxy Client", "Bloxy Client has been successfully injected!", 5)

    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        showNotification("Bloxy Client", "Warning: Bloxy Client may not be fully supported on mobile devices.", 10)
    end
end

local function onInject()
    checkDevice()
end

onInject()
