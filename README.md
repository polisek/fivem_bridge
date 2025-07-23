# 🌉 BRIDGE System by PLS_SCRIPTS

Complete bridge system for unifying different frameworks, inventory systems, targeting and ped management in FiveM.
This BRIDGE using ALL Scripts from me.
U wanna use in your own script?
Move folder into your script

## 📋 Table of Contents

- [Configuration](#configuration)
- [Framework Bridge](#framework-bridge)
- [Inventory Bridge](#inventory-bridge)
- [Target Bridge](#target-bridge)
- [Peds System](#peds-system)
- [Functions](#functions)
- [Usage Examples](#usage-examples)

---

## ⚙️ Configuration

All settings are located in `BRIDGE/config.lua`:

```lua
BRIDGE.Framework = "ESX" -- ESX / QB / OX
BRIDGE.Inventory = "ox_inventory" -- ox_inventory, qb_inventory, quasar_inventory, codem
BRIDGE.ESXOld = false -- true for old ESX versions
BRIDGE.Target = "ox_target" -- ox_target / qb_target
BRIDGE.UsePeds = true -- Enable/disable static peds system
BRIDGE.PED_RENDER_DISTANCE = 70.0 -- Distance for ped spawn/despawn (meters)
BRIDGE.Debug = false -- Enable/disable debug prints
```

---

## 🎯 Framework Bridge

### Supported frameworks:
- **ESX** (including old versions)
- **QBCore**
- **OX Core**

### Client Side Functions:

#### Player events
```lua
-- Automatically triggered event when player is loaded
RegisterNetEvent(GetCurrentResourceName()..':playerLoaded')
AddEventHandler(GetCurrentResourceName()..':playerLoaded', function(playerData, isNew, skin)
    -- Your code here
end)
```

#### Framework objects
```lua
-- Get framework object
Framework -- Global variable with framework object
```

### Server Side Functions:

#### Player management
```lua
-- Automatically triggered event when player is loaded
RegisterNetEvent(GetCurrentResourceName()..':playerLoaded')
AddEventHandler(GetCurrentResourceName()..':playerLoaded', function(playerId, value1, value2)
    -- Your code here
end)
```

---

## 📦 Inventory Bridge

### Supported inventory systems:
- **ox_inventory**
- **qb_inventory**
- **quasar_inventory**
- **codem-inventory**

### Client & Server Side Functions:

#### Get items
```lua
-- Get all items
local items = BRIDGE.GetItems()
```

#### Stash management (Server)
```lua
-- Register stash
BRIDGE.RegisterStash(stashId, data)

-- Open stash
BRIDGE.OpenStash(playerId, stashId)
```

#### Drop management (Server)
```lua
-- Create drop
BRIDGE.CreateDrop(dropId, coords, items)

-- Remove drop
BRIDGE.RemoveDrop(dropId)
```

#### Item operations (Server)
```lua
-- Add item
BRIDGE.AddItem(playerId, item, count, metadata)

-- Remove item
BRIDGE.RemoveItem(playerId, item, count, metadata)

-- Check item
local hasItem = BRIDGE.HasItem(playerId, item, count)

-- Get item count
local count = BRIDGE.GetItemCount(playerId, item)
```

---

## 🎯 Target Bridge

### Supported targeting systems:
- **ox_target**
- **qb_target**

### Client Side Functions:

#### Entity targeting
```lua
-- Add target to entity
local targetId = BRIDGE.AddEntityTarget(entity, {
    label = "Use",
    icon = "fas fa-hand",
    distance = 2.0,
    onSelect = function()
        -- Your code here
    end
})

-- Remove target
BRIDGE.RemoveEntityTarget(entity, targetId)
```

#### Model targeting
```lua
-- Add target to model
local targetId = BRIDGE.AddModelTarget("prop_atm_01", {
    label = "Use ATM",
    icon = "fas fa-credit-card",
    distance = 2.0,
    onSelect = function()
        -- Your code here
    end
})

-- Remove model target
BRIDGE.RemoveModelTarget("prop_atm_01", targetId)
```

#### Zone targeting
```lua
-- Add box zone
local zoneId = BRIDGE.AddBoxZone("myzone", vector3(0, 0, 0), 2.0, 2.0, {
    label = "Enter",
    icon = "fas fa-door-open",
    onSelect = function()
        -- Your code here
    end
})

-- Remove zone
BRIDGE.RemoveZone(zoneId)
```

---

## 🚶 Peds System

Advanced system for managing static NPCs with automatic optimization based on distance.

### Functions:

#### Create static ped
```lua
createStaticPed(pedId, {
    model = "a_m_y_business_01", -- Ped model (required)
    coords = vector3(100.0, 200.0, 30.0), -- Position (required)
    heading = 90.0, -- Direction (optional)
    scenario = "WORLD_HUMAN_SMOKING", -- Scenario (optional)
    anim = { -- Animation (optional)
        dict = "amb@world_human_smoking@male@male_a@base",
        name = "base",
        flag = 1
    },
    onSpawn = function(ped, data) -- Callback on spawn
        -- Your code here
    end,
    onDespawn = function(ped, data) -- Callback on despawn
        -- Your code here
    end,
    customData = {} -- Custom data
})
```

#### Delete static ped
```lua
deleteStaticPed(pedId)
```

#### Additional functions
```lua
-- Get ped data
local pedData = getStaticPedData(pedId)

-- Get spawned ped
local ped = getSpawnedPed(pedId)

-- Get all peds
local allPeds = getAllStaticPeds()
local spawnedPeds = getAllSpawnedPeds()

-- Set render distance
setRenderDistance(100.0)

-- Clear all peds
clearAllStaticPeds()
```

### Optimization:
- ✅ **Automatic spawn/despawn** based on player distance
- ✅ **Configurable distance** (default 70m)
- ✅ **Optimized threading** (check every second)
- ✅ **Scenario and animation support**
- ✅ **Callback system** for spawn/despawn events

---

## 🚀 Usage Examples

### Basic setup
```lua
-- In client.lua

    -- Wait for player to load
    RegisterNetEvent(GetCurrentResourceName()..':playerLoaded')
    AddEventHandler(GetCurrentResourceName()..':playerLoaded', function()
        print("Player loaded!")
        
        -- Create static ped
        createStaticPed("dealer_01", {
            model = "a_m_y_business_01",
            coords = vector3(100.0, -1000.0, 30.0),
            heading = 180.0,
            scenario = "WORLD_HUMAN_SMOKING",
            onSpawn = function(ped)
                -- Add target to ped
                BRIDGE.AddEntityTarget(ped, {
                    label = "Talk to dealer",
                    icon = "fas fa-comments",
                    distance = 2.0,
                    onSelect = function()
                        print("Talking to dealer!")
                    end
                })
            end
        })
    end)

```

### Advanced usage
```lua
-- Create complex NPC system
local npcs = {
    {
        id = "shop_keeper",
        model = "a_m_m_business_01",
        coords = vector3(25.7, -1347.3, 29.49),
        heading = 180.0,
        scenario = "WORLD_HUMAN_STAND_MOBILE"
    },
    {
        id = "mechanic",
        model = "s_m_y_construct_01",
        coords = vector3(-347.3, -133.7, 39.0),
        heading = 90.0,
        anim = {
            dict = "mini@repair",
            name = "fixing_a_ped",
            flag = 1
        }
    }
}

-- Spawn all NPCs
for _, npc in pairs(npcs) do
    createStaticPed(npc.id, npc)
end

-- Debug mode for testing
if BRIDGE.Debug then
    RegisterCommand('ped_debug', function()
        local allPeds = getAllStaticPeds()
        local spawnedPeds = getAllSpawnedPeds()
        
        print("Registered peds: " .. #allPeds)
        print("Spawned peds: " .. #spawnedPeds)
    end)
end
```

---

## 🛠️ Configuration for different servers

### ESX Legacy
```lua
BRIDGE.Framework = "ESX"
BRIDGE.ESXOld = false
BRIDGE.Inventory = "ox_inventory"
BRIDGE.Target = "ox_target"
```

### QBCore
```lua
BRIDGE.Framework = "QB"
BRIDGE.Inventory = "qb_inventory"
BRIDGE.Target = "qb_target"
```

### OX Core
```lua
BRIDGE.Framework = "OX"
BRIDGE.Inventory = "ox_inventory"
BRIDGE.Target = "ox_target"
```

---

## 📝 Notes

- **Performance**: Peds system is optimized for minimal performance impact
- **Compatibility**: Tested with latest versions of all supported systems
- **Debug**: Enable `BRIDGE.Debug = true` for detailed logging
- **Exports**: All functions are exported for use in other scripts

---

## 🔧 Maintenance

### Adding new framework
1. Extend conditions in `framework.lua`
2. Add new events and functions
3. Update documentation

### Adding new inventory
1. Extend conditions in `inventory.lua`
2. Implement functions for new system
3. Test compatibility

---

## 🏷️ Versions
- **v1.0.0** - Basic framework, inventory and target bridge
- **v1.1.0** - Added advanced peds system with optimization
- **v1.2.0** - Configurable debug prints and render distance

---

*Documentation created for PLS Secret Items BRIDGE system* 
