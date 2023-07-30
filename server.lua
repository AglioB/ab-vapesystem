local QBCore = exports['qb-core']:GetCoreObject()

----------------
-- AÑADIR PROPS x
-- AÑADIR LOS SABORES x
-- AÑADIR DURABILIDADES x
-- AÑADIR EFECTOS 
--------------

for _, v in pairs(Config.items) do
	QBCore.Functions.CreateUseableItem(v.itemName, function(source, data)
		local src = source
		local item = data
		local Player = QBCore.Functions.GetPlayer(src)
		lib.callback('ab-vapesystem:cb:IsPlayerInAnyVehicle', src, function(result)
			if result == false then
				if Player.Functions.GetItemByName(item.name) ~= nil then
					if item.info.durability == nil then
						-- exports['qb-inventory']:RemoveItem(src, item.name, 1, item.slot)
						item.info.durability = v.durability
						if Config.ShowDurabilityInDescription then
							item.description = string.format(Lang.Desc, item.info.durability)
						end
						Player.PlayerData.items[item.slot] = item
						Player.Functions.SetPlayerData("items", Player.PlayerData.items)
						Wait(100)
					end
					TriggerClientEvent("ab-vapesystem:cl:Drag", src, v.prop, item)
				end
			end
		end)
	end)
end

QBCore.Functions.CreateCallback('ab-vapesystem:cb:UseVape', function(source, cb, data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local item = data
	local callback = false

	if not Player then return end
	if not item then return false end

	if item.info.durability - Config.Decay <= 0 then
		exports['qb-inventory']:RemoveItem(src, item.name, 1, item.slot)
	else
		item.info.durability = item.info.durability - Config.Decay
		Player.PlayerData.items[item.slot] = item
		if Config.ShowDurabilityInDescription then
			item.description = string.format(Lang.Desc, item.info.durability)
		end
		Player.Functions.SetPlayerData("items", Player.PlayerData.items)
		callback = true
	end
	cb({callback, item})
end)

RegisterNetEvent('ab-vapesystem:sv:smokesync', function(entity, coords)
    for _, player in pairs(QBCore.Functions.GetPlayers()) do
        TriggerClientEvent("ab-vapesystem:cl:smoke", player, entity, coords)
    end
end)