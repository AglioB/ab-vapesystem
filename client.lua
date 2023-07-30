local QBCore = exports['qb-core']:GetCoreObject()

Keys = {
    ["ESC"]       = 322,  ["F1"]        = 288,  ["F2"]        = 289,  ["F3"]        = 170,  ["F5"]  = 166,  ["F6"]  = 167,  ["F7"]  = 168,  ["F8"]  = 169,  ["F9"]  = 56,   ["F10"]   = 57, 
    ["~"]         = 243,  ["1"]         = 157,  ["2"]         = 158,  ["3"]         = 160,  ["4"]   = 164,  ["5"]   = 165,  ["6"]   = 159,  ["7"]   = 161,  ["8"]   = 162,  ["9"]     = 163,  ["-"]   = 84,   ["="]     = 83,   ["BACKSPACE"]   = 177, 
    ["TAB"]       = 37,   ["Q"]         = 44,   ["W"]         = 32,   ["E"]         = 38,   ["R"]   = 45,   ["T"]   = 245,  ["Y"]   = 246,  ["U"]   = 303,  ["P"]   = 199,  ["["]     = 116,  ["]"]   = 40,   ["ENTER"]   = 18,
    ["CAPS"]      = 137,  ["A"]         = 34,   ["S"]         = 8,    ["D"]         = 9,    ["F"]   = 23,   ["G"]   = 47,   ["H"]   = 74,   ["K"]   = 311,  ["L"]   = 182,
    ["LEFTSHIFT"] = 21,   ["Z"]         = 20,   ["X"]         = 73,   ["C"]         = 26,   ["V"]   = 0,    ["B"]   = 29,   ["N"]   = 249,  ["M"]   = 244,  [","]   = 82,   ["."]     = 81,
    ["LEFTCTRL"]  = 36,   ["LEFTALT"]   = 19,   ["SPACE"]     = 22,   ["RIGHTCTRL"] = 70, 
    ["HOME"]      = 213,  ["PAGEUP"]    = 10,   ["PAGEDOWN"]  = 11,   ["DELETE"]    = 178,
    ["LEFT"]      = 174,  ["RIGHT"]     = 175,  ["UP"]        = 27,   ["DOWN"]      = 173,
    ["NENTER"]    = 201,  ["N4"]        = 108,  ["N5"]        = 60,   ["N6"]        = 107,  ["N+"]  = 96,   ["N-"]  = 97,   ["N7"]  = 117,  ["N8"]  = 61,   ["N9"]  = 118
}

local CurrentVape = {}
local vapeinhand = false
local isSmoking = false


RegisterNetEvent('ab-vapesystem:cl:VapeAnimFix', function()
    local ped = GetPlayerPed(-1)
	local ad = "anim@heists@humane_labs@finale@keycards"
	local anim = "ped_a_enter_loop"
	while (not HasAnimDictLoaded(ad)) do
		RequestAnimDict(ad)
	  Wait(1)
	end
	TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)
end)

RegisterNetEvent("ab-vapesystem:cl:smoke", function(c_ped)
	for _,bones in pairs({20279}) do
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then
            local ad = "mp_player_inteat@burger"
            local anim = "mp_player_int_eat_burger"
            while (not HasAnimDictLoaded(ad)) do
                RequestAnimDict(ad)
                Wait(1)
            end
            isSmoking = true
            TaskPlayAnim(GetPlayerPed(-1), ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)
            PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
            Wait(950)
            createdSmoke = UseParticleFxAssetNextCall("core")
			createdPart = StartParticleFxLoopedOnEntityBone("exp_grd_bzgas_smoke", NetToPed(c_ped), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToPed(c_ped), bones), Config.SmokeSize, 0.0, 0.0, 0.0)
			Wait(Config.SmokeTime)
			while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist(createdPart) do
				StopParticleFxLooped(createdPart, 1)
			  Wait(0)
			end
			while DoesParticleFxLoopedExist("exp_grd_bzgas_smoke") do
				StopParticleFxLooped("exp_grd_bzgas_smoke", 1)
			  Wait(0)
			end
            if Config.RemoveStress then
                TriggerServerEvent('hud:server:RelieveStress', Config.StressToRemove)           
            end
			while DoesParticleFxLoopedExist("core") do
				StopParticleFxLooped("core", 1)
                Wait(0)
			end
			Wait(Config.SmokeTime)
            isSmoking = false
			RemoveParticleFxFromEntity(NetToPed(c_ped))
			break
		end
	end
end)

RegisterNetEvent('ab-vapesystem:cl:Stop', function()
    local ped = GetPlayerPed(-1)
    DeleteObject(VapeMod)
    ClearPedTasksImmediately(ped)
    ClearPedSecondaryTask(ped)
    vapeinhand = false
    CurrentVape = {}
end)

RegisterNetEvent('ab-vapesystem:cl:Drag', function(prop, item)
    local prop_name = prop
    CurrentVape = item
    local ped = GetPlayerPed(-1)
    local ad = "anim@heists@humane_labs@finale@keycards"
    local anim = "ped_a_enter_loop"
    
    while (not HasAnimDictLoaded(ad)) do
        RequestAnimDict(ad)
      Wait(1)
    end
    TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)
    
    local x,y,z = table.unpack(GetEntityCoords(ped))
    VapeMod = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(VapeMod, ped, GetPedBoneIndex(ped, 18905), 0.1, -0.01, 0.02, -70.0, 90.0, -10.0, true, true, false, true, 1, true)
    vapeinhand = true
    Citizen.CreateThread(function()
        while vapeinhand do
            Citizen.Wait(1)
            local ped = GetPlayerPed(-1)
            if IsPedInAnyVehicle(ped, true) and vapeinhand then
                TriggerEvent('ab-vapesystem:cl:Stop')
            end
            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
            DrawText3D(x2, y2, z2+1, Lang.Text3D)
            if IsControlJustReleased(0, Keys[Config.Keys.smoke] or Keys["E"]) then
                if not isSmoking then
                    local coords = GetEntityCoords(PlayerPedId())
                    QBCore.Functions.TriggerCallback('ab-vapesystem:cb:UseVape', function(result)
                        CurrentVape = result[2]
                        if result[1] then
                            TriggerServerEvent("ab-vapesystem:sv:smokesync", PedToNet(ped), coords)
                        else
                            TriggerServerEvent("ab-vapesystem:sv:smokesync", PedToNet(ped), coords)
                            Wait(Config.SmokeTime*2 + 1000)
                            TriggerEvent('ab-vapesystem:cl:Stop')
                        end
                    end, CurrentVape)
                end
            end
            if IsControlJustReleased(0, Keys[Config.Keys.save] or Keys["G"]) then
                if not isSmoking then
                    TriggerEvent('ab-vapesystem:cl:Stop')
                end
            end
        end
    end)
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


lib.callback.register('ab-vapesystem:cb:IsPlayerInAnyVehicle', function()
    return IsPedInAnyVehicle(GetPlayerPed(-1), true)
end)