# AB-VAPESYSTEM


## Installation

Follow these steps to install the Vape System on your server:

### step1:

- Add images inside `inventoryimages` to `qb-inventory/html/images`

### step2:

- Add Below code to `qb-core/shared/items.lua`

```lua
['waka_blueberry'] = {
    ['name'] = 'waka_blueberry',
    ['label'] = 'Waka blueberry dream',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'waka_blueberry.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = ''
},
['waka_cherry'] = {
    ['name'] = 'waka_cherry',
    ['label'] = 'Waka cherry bomb',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'waka_cherry.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = ''
},
['waka_grape'] = {
    ['name'] = 'waka_grape',
    ['label'] = 'Waka grape',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'waka_grape.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = ''
},
['waka_kiwi'] = {
    ['name'] = 'waka_kiwi',
    ['label'] = 'Waka kiwi cocktail',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'waka_kiwi.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = ''
},
['waka_mango'] = {
    ['name'] = 'waka_mango',
    ['label'] = 'Waka mango cocktail',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'waka_mango.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = ''
},
['waka_melon'] = {
    ['name'] = 'waka_melon',
    ['label'] = 'Waka melon',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'waka_melon.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = ''
},
['waka_strawberry'] = {
    ['name'] = 'waka_strawberry',
    ['label'] = 'Waka strawberry ice',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'waka_strawberry.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = ''
},
```






### step3 (optional): add vapeshop

- open 'qb-shops/config.lua'
- add new 'products' to 'Config.Products'

```lua
["vapeshop"] = {
    [1] = {
        name = "waka_blueberry",
        price = 800,
        amount = 1,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "waka_cherry",
        price = 750,
        amount = 1,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "waka_grape",
        price = 700,
        amount = 1,
        info = {},
        type = "item",
        slot = 3,
    },
    [4] = {
        name = "waka_kiwi",
        price = 650,
        amount = 1,
        info = {},
        type = "item",
        slot = 4,
    },
    [5] = {
        name = "waka_mango",
        price = 600,
        amount = 1,
        info = {},
        type = "item",
        slot = 5,
    },
    [6] = {
        name = "waka_melon",
        price = 550,
        amount = 1,
        info = {},
        type = "item",
        slot = 6,
    },
    [7] = {
        name = "waka_strawberry",
        price = 550,
        amount = 1,
        info = {},
        type = "item",
        slot = 7,
    },
},
```

- now add new shop to 'Config.Locations'

```lua
["vapeshop"] = {
    ["label"] = "Vape Shop",
    ["coords"] = vector4(-1163.43, -1588.04, 4.39, 132.92),
    ["ped"] = 'mp_m_waremech_01',
    ["scenario"] = "WORLD_HUMAN_CLIPBOARD",
    ["radius"] = 1.5,
    ["targetIcon"] = "fas fa-shopping-basket",
    ["targetLabel"] = "Open Shop",
    ["products"] = Config.Products["vapeshop"],
    ["showblip"] = true,
    ["blipsprite"] = 497,
    ["blipscale"] = 0.8,
    ["blipcolor"] = 1
},
```