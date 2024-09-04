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

local function detectExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif syn then
        return "Synapse X"
    elseif KRNL_LOADED then
        return "KRNL"
    elseif isfluxus then
        return "Fluxus"
    elseif getgenv().Delta then
        return "Delta"
    elseif getgenv().Solara then
        return "Solara"
    elseif getgenv().Wave then
        return "Wave"
    elseif getgenv().Appleware then
        return "Appleware"
    else
        return "Unknown Executor"
    end
end

local function checkDevice()
    local executorName = detectExecutor()
    
    showNotification("Bloxy Client", "Loaded Bloxy Client for " .. executorName, 5)
    showNotification("Bloxy Client", "Bloxy Client has been successfully injected using " .. executorName, 5)

    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        showNotification("Bloxy Client", "Warning: Bloxy Client may not be fully supported on mobile devices.", 10)
    end
end

local function onInject()
    checkDevice()
end

onInject()
