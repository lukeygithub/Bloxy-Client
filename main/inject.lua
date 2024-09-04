local function getWorkspacePath()
    local executorName = detectExecutor()
    local workspacePath

    if executorName == "Delta" then
        workspacePath = "Delta/Workspace/"
    elseif executorName == "KRNL" then
        workspacePath = "KRNL/Workspace/"
    elseif executorName == "Fluxus" then
        workspacePath = "Fluxus/Workspace/"
    elseif executorName == "Solara" then
        workspacePath = "Solara/Workspace/"
    elseif executorName == "Wave" then
        workspacePath = "Wave/Workspace/"
    elseif executorName == "Appleware" then
        workspacePath = "Appleware/Workspace/"
    elseif executorName == "Synapse X" then
        workspacePath = "SynapseX/Workspace/"
    else
        workspacePath = "Unknown/Workspace/"
    end

    return workspacePath
end

local function createFolders()
    local workspacePath = getWorkspacePath()

    local bloxyClientPath = workspacePath .. "BloxyClient"
    local bloxyModsPath = workspacePath .. "BloxyMods"

    if not pcall(function()
        makefolder(bloxyClientPath)
    end) then
        showNotification("Error", "Failed to create BloxyClient folder.", 5)
    end

    if not pcall(function()
        makefolder(bloxyModsPath)
    end) then
        showNotification("Error", "Failed to create BloxyMods folder.", 5)
    end
end

createFolders()
