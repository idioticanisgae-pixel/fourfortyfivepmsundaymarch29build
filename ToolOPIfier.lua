local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local weaponNames = {
    "VampireMK-18", "AKM", "BetterG19", "BetterM4A1", "BounceUMP-45", "C4",
    "Devil's Gun", "ExplosiveAKM", "Flashlight", "G19", "Grenade", "IceRevolver",
    "IncendiaryAKM", "IncendiaryShotgun", "Landmine", "M4A1", "MK-18", "Minigun",
    "Molotov", "NPCRadar", "P90", "PREMIUMAKM", "Pen90", "PlasmaM4A1",
    "PlasmaSniper", "RPG", "Revolver", "RocketJump", "SHOTGUN", "SNIPER",
    "UMP", "VIPM4A1", ".357 Magnum", "Shotgun", "UMP-45",
}
local weaponPatches = {
    Lifesteal = 99999,
    Spread = 0,
    BaseDamage = 999999,
    ChargingTime = 0,
    BulletSpeed = 90000,
    HeadshotEnabled = 100,
    DelayBeforeFiring = 0,
    EquipTime = 0,
    BurstRate = 0,
    Recoil = 0,
    CriticalDamageEnabled = 999999,
    ShotgunEnabled = false,
    Knockback = 9999999,
    SwitchTime = 0,
    Debuff = true,
    DebuffName = "IgniteScript",
    DebuffChance = 100,
    AmmoPerMag = 999999,
    FireRate = 0.1,
    Auto = false,
    BulletSize = 0.8,
    MeleeCriticalDamageMultiplier = 999999,
    ZeroDamageDistance = 999999,
    DualFireEnabled = false,
    CriticalDamageMultiplier = 999999,
    TacticalReloadTime = 0,
    DelayAfterFiring = 0,
    ReduceSelfDamageOnAirOnly = 999999,
    SelfDamage = 0,
    DamageBasedOnDistance = 999999,
    DamageDropOffEnabled = false,
    ReloadTime = 0,
    CrossSize = 2,
    BulletPerShot = 5,
    FriendlyFire = true,
    Accuracy = 0,
    LimitedAmmoEnabled = false,
    FullDamageDistance = 999999,
    HeadshotDamageMultiplier = 999999,
    SelfDamageRedution = 999999,
}
local G19Patches = {
    Lifesteal = 0,
    Spread = 0,
    BaseDamage = 0,
    ChargingTime = 0,
    BulletSpeed = 90000,
    HeadshotEnabled = 0,
    DelayBeforeFiring = 0,
    EquipTime = 0,
    BurstRate = 0,
    Recoil = 0,
    CriticalDamageEnabled = 0,
    ShotgunEnabled = true,
    Knockback = math.huge,
    SwitchTime = 0,
    AmmoPerMag = 999999,
    FireRate = 0.1,
    Auto = false,
    BulletSize = 0.8,
    ZeroDamageDistance = 0,
    DualFireEnabled = false,
    CriticalDamageMultiplier = 0,
    TacticalReloadTime = 0,
    DelayAfterFiring = 0,
    ReduceSelfDamageOnAirOnly = 0,
    SelfDamage = 0,
    DamageBasedOnDistance = 0,
    DamageDropOffEnabled = false,
    SilenceEffect = true,
    Debuff = true,
    DebuffName = "IcifyScript",
    DebuffChance = 100,
    ReloadTime = 0,
    CrossSize = 2,
    BulletPerShot = 15,
    FriendlyFire = true,
    Accuracy = 0,
    LimitedAmmoEnabled = false,
    FullDamageDistance = 0,
    HeadshotDamageMultiplier = 0,
    SelfDamageRedution = 0,
}
local patchedModules = {}
local totalPatched = 0
local function patchWeaponModule(weapon)
    if not weapon then return false, "Weapon is nil" end
    if not weapon:IsA("Tool") then return false, "Not a tool" end
    local weaponName = weapon.Name
    local success, result = pcall(function()
        local settingFolder = weapon:FindFirstChild("Setting")
        if not settingFolder then
            return false, "No Setting folder"
        end
        local configModule = settingFolder:FindFirstChild("1")
        if not configModule then
            return false, "No '1' module"
        end
        if patchedModules[configModule] then
            return false, "Module already patched"
        end
        task.wait(0.05)
        local moduleTable = require(configModule)
        if setreadonly then
            pcall(setreadonly, moduleTable, false)
        end
        local patchedCount = 0
        local activeStats = (weaponName == "G19") and G19Patches or weaponPatches
        for key, value in pairs(activeStats) do
            if moduleTable[key] ~= nil then
                local success = pcall(function()
                    moduleTable[key] = value
                end)
                if success then
                    patchedCount = patchedCount + 1
                end
            end
        end
        if setreadonly then
            pcall(setreadonly, moduleTable, true)
        end
        patchedModules[configModule] = {
            weaponName = weaponName,
            patchedCount = patchedCount,
            time = tick()
        }
        return true, tostring(patchedCount)
    end)
    if success then
        totalPatched = totalPatched + 1
        return true, result
    else
        return false, tostring(result)
    end
end
local function monitorAndPatch(weapon)
    if not weapon:IsA("Tool") then return end
    local success, message = patchWeaponModule(weapon)
    if success then
        print(string.format("[PATCHED] %s (%s properties)", weapon.Name, message))
    elseif message ~= "Module already patched" then
        if message ~= "No Setting folder" and message ~= "No '1' module" then
            warn(string.format("[ERROR] %s - %s", weapon.Name, message))
        end
    end
end
local count = 0
for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
    if item:IsA("Tool") then
        task.spawn(function() monitorAndPatch(item) end)
        count = count + 1
    end
end
if LocalPlayer.Character then
    for _, item in ipairs(LocalPlayer.Character:GetChildren()) do
        if item:IsA("Tool") then
            task.spawn(function() monitorAndPatch(item) end)
            count = count + 1
        end
    end
end
LocalPlayer.Backpack.ChildAdded:Connect(function(item)
    task.wait(0.1)
    if item:IsA("Tool") then
        task.spawn(function() monitorAndPatch(item) end)
    end
end)
local function setupCharacterMonitor(character)
    character.ChildAdded:Connect(function(item)
        task.wait(0.1)
        if item:IsA("Tool") then
            task.spawn(function() monitorAndPatch(item) end)
        end
    end)
end
if LocalPlayer.Character then setupCharacterMonitor(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(1)
    setupCharacterMonitor(character)
end)
_G.PatcherStatus = function()
    print(string.format("Total modules patched: %d", totalPatched))
    for module, data in pairs(patchedModules) do
        print(string.format(" - %s (%d props)", data.weaponName, data.patchedCount))
    end
end
