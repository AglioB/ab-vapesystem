Config = {}

Config.Keys = {
    smoke = 'E',
    save = 'G'
}

Config.VapeCoolDownTime = 4000 -- The amount of time in (ms) the player has to wait before the can hit the vape again. (4000) by default.	
Config.SmokeTime = 2800 -- The amount of time in (ms) the smoke from the vape will linger. (2800) by default.
Config.SmokeSize = 0.5

Config.items = {
    [1] = {itemName = 'waka_blueberry', prop = 'elfbar_blueberry', durability = 800 },
    [2] = {itemName = 'waka_cherry', prop = 'elfbar_cola', durability = 750 },
    [3] = {itemName = 'waka_grape', prop = 'elfbar_elfbar_grape', durability = 700 },
    [4] = {itemName = 'waka_kiwi', prop = 'elfbar_kiwi', durability = 650 },
    [5] = {itemName = 'waka_mango', prop = 'elfbar_mango', durability = 600 },
    [6] = {itemName = 'waka_melon', prop = 'elfbar_melon', durability = 550 },
    [7] = {itemName = 'waka_strawberry', prop = 'elfbar_strawberry', durability = 500 }
}

-- Config.UseOxInventory = GetResourceState('ox_inventory') == 'started'

Config.Decay = 1

Config.RemoveStress = true
Config.StressToRemove = 10

Config.ShowDurabilityInDescription = true