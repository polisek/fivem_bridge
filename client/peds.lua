local staticPeds = {}
local spawnedPeds = {}

-- Thread pro kontrolu vzdálenosti a správu spawnu/despawnu pedů
CreateThread(function()
    while true do
        if BRIDGE.UsePeds and next(staticPeds) then
            local playerCoords = GetEntityCoords(cache.ped)
            
            for pedId, pedData in pairs(staticPeds) do
                local distance = #(playerCoords - pedData.coords)
                local isSpawned = spawnedPeds[pedId] ~= nil
                
                if distance <= BRIDGE.PED_RENDER_DISTANCE and not isSpawned then
                    -- Spawn peda pokud je hráč poblíž a ped není spawnutý
                    local model = GetHashKey(pedData.model)
                    
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(0)
                    end
                    
                    local ped = CreatePed(4, model, pedData.coords.x, pedData.coords.y, pedData.coords.z, pedData.heading or 0.0, false, true)
                    
                    if ped and ped ~= 0 then
                        SetEntityAsMissionEntity(ped, true, true)
                        SetPedCanRagdoll(ped, false)
                        SetEntityInvincible(ped, true)
                        FreezeEntityPosition(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        
                        -- Aplikuj další vlastnosti pokud jsou definované
                        if pedData.scenario then
                            TaskStartScenarioInPlace(ped, pedData.scenario, 0, true)
                        end
                        
                        if pedData.anim and pedData.anim.dict and pedData.anim.name then
                            RequestAnimDict(pedData.anim.dict)
                            while not HasAnimDictLoaded(pedData.anim.dict) do
                                Wait(0)
                            end
                            TaskPlayAnim(ped, pedData.anim.dict, pedData.anim.name, 8.0, -8.0, -1, pedData.anim.flag or 1, 0, false, false, false)
                        end
                        
                        spawnedPeds[pedId] = ped
                        
                        -- Zavolej callback pokud je definován
                        if pedData.onSpawn then
                            pedData.onSpawn(ped, pedData)
                        end
                    end
                    
                    SetModelAsNoLongerNeeded(model)
                    
                elseif distance > BRIDGE.PED_RENDER_DISTANCE and isSpawned then
                    -- Despawn peda pokud je hráč daleko
                    local ped = spawnedPeds[pedId]
                    if ped and DoesEntityExist(ped) then
                        -- Zavolaj callback před despawnem
                        if pedData.onDespawn then
                            pedData.onDespawn(ped, pedData)
                        end
                        
                        DeleteEntity(ped)
                    end
                    spawnedPeds[pedId] = nil
                end
            end
        end
        
        -- Čeká kratší dobu pokud jsou pedy aktivní, delší pokud jsou vypnuté
        Wait(BRIDGE.UsePeds and 1000 or 5000)
    end
end)

--- Vytvoří statického peda který se automaticky spawnuje/despawnuje podle vzdálenosti hráče
--- @param pedId string Unikátní identifikátor peda
--- @param data table Konfigurace peda
--- @return boolean success Zda byl ped úspěšně vytvořen
function createStaticPed(pedId, data)
    if not pedId or not data then
        if BRIDGE.Debug then print("^1[PLS_SECRET_ITEMS] createStaticPed: Chybí pedId nebo data^0") end
        return false
    end
    
    if not data.model then
        if BRIDGE.Debug then print("^1[PLS_SECRET_ITEMS] createStaticPed: Chybí model peda^0") end
        return false
    end
    
    if not data.coords then
        if BRIDGE.Debug then print("^1[PLS_SECRET_ITEMS] createStaticPed: Chybí souřadnice peda^0") end
        return false
    end
    
    -- Konverze coords na vector3 pokud není
    if type(data.coords) == "table" and not data.coords.x then
        data.coords = vector3(data.coords[1] or data.coords.x or 0, data.coords[2] or data.coords.y or 0, data.coords[3] or data.coords.z or 0)
    elseif type(data.coords) ~= "vector3" then
        data.coords = vector3(data.coords.x or 0, data.coords.y or 0, data.coords.z or 0)
    end
    
    -- Uložení do registru
    staticPeds[pedId] = {
        model = data.model,
        coords = data.coords,
        heading = data.heading or 0.0,
        scenario = data.scenario,
        anim = data.anim,
        onSpawn = data.onSpawn,
        onDespawn = data.onDespawn,
        customData = data.customData
    }
    
    if BRIDGE.Debug then print("^2[PLS_SECRET_ITEMS] Vytvořen statický ped: " .. pedId .. "^0") end
    return true
end

--- Smaže statického peda a despawnuje ho pokud je spawnutý
--- @param pedId string Identifikátor peda k smazání
--- @return boolean success Zda byl ped úspěšně smazán
function deleteStaticPed(pedId)
    if not pedId then
        if BRIDGE.Debug then print("^1[PLS_SECRET_ITEMS] deleteStaticPed: Chybí pedId^0") end
        return false
    end
    
    if not staticPeds[pedId] then
        if BRIDGE.Debug then print("^1[PLS_SECRET_ITEMS] deleteStaticPed: Ped s ID '" .. pedId .. "' neexistuje^0") end
        return false
    end
    
    -- Despawn pokud je spawnutý
    if spawnedPeds[pedId] then
        local ped = spawnedPeds[pedId]
        if ped and DoesEntityExist(ped) then
            -- Zavolaj callback před despawnem
            if staticPeds[pedId].onDespawn then
                staticPeds[pedId].onDespawn(ped, staticPeds[pedId])
            end
            
            DeleteEntity(ped)
        end
        spawnedPeds[pedId] = nil
    end
    
    -- Smazání z registru
    staticPeds[pedId] = nil
    
    if BRIDGE.Debug then print("^2[PLS_SECRET_ITEMS] Smazán statický ped: " .. pedId .. "^0") end
    return true
end

--- Získá informace o statickém pedovi
--- @param pedId string Identifikátor peda
--- @return table|nil pedData Data peda nebo nil pokud neexistuje
function getStaticPedData(pedId)
    return staticPeds[pedId]
end

--- Získá spawnutého peda podle ID
--- @param pedId string Identifikátor peda
--- @return number|nil ped Handle spawnutého peda nebo nil pokud není spawnutý
function getSpawnedPed(pedId)
    return spawnedPeds[pedId]
end

--- Získá všechny registrované statické pedy
--- @return table staticPeds Tabulka všech registrovaných pedů
function getAllStaticPeds()
    return staticPeds
end

--- Získá všechny aktuálně spawnuté pedy
--- @return table spawnedPeds Tabulka všech spawnutých pedů
function getAllSpawnedPeds()
    return spawnedPeds
end

--- Nastaví vzdálenost pro renderování pedů
--- @param distance number Nová vzdálenost v metrech
function setRenderDistance(distance)
    if type(distance) == "number" and distance > 0 then
        BRIDGE.PED_RENDER_DISTANCE = distance
        if BRIDGE.Debug then print("^2[PLS_SECRET_ITEMS] Nastavena render vzdálenost: " .. distance .. "m^0") end
    else
        if BRIDGE.Debug then print("^1[PLS_SECRET_ITEMS] Neplatná render vzdálenost^0") end
    end
end

--- Vymaže všechny statické pedy
function clearAllStaticPeds()
    -- Despawn všech spawnutých pedů
    for pedId, ped in pairs(spawnedPeds) do
        if ped and DoesEntityExist(ped) then
            if staticPeds[pedId] and staticPeds[pedId].onDespawn then
                staticPeds[pedId].onDespawn(ped, staticPeds[pedId])
            end
            DeleteEntity(ped)
        end
    end
    
    -- Vymazání tabulek
    staticPeds = {}
    spawnedPeds = {}
    
    if BRIDGE.Debug then print("^2[PLS_SECRET_ITEMS] Všichni statičtí pedové byli smazáni^0") end
end

-- Export funkcí pro použití v ostatních skriptech
exports('createStaticPed', createStaticPed)
exports('deleteStaticPed', deleteStaticPed)
exports('getStaticPedData', getStaticPedData)
exports('getSpawnedPed', getSpawnedPed)
exports('getAllStaticPeds', getAllStaticPeds)
exports('getAllSpawnedPeds', getAllSpawnedPeds)
exports('setRenderDistance', setRenderDistance)
exports('clearAllStaticPeds', clearAllStaticPeds)
