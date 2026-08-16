local addonName, wt = ...

local function getTomTom()
    local tomtom = _G.TomTom
    if tomtom and tomtom.AddWaypoint then return tomtom end
end

function wt.npcUiMapId(npcInfo)
    if not npcInfo or not npcInfo.zone then return nil end
    if npcInfo.x == nil or npcInfo.y == nil then return nil end
    return wt.zoneUiMapIds and wt.zoneUiMapIds[npcInfo.zone]
end

function wt.canSetWaypoint(npcInfo)
    return getTomTom() ~= nil and wt.npcUiMapId(npcInfo) ~= nil
end

function wt.setWaypoint(npcInfo)
    local tomtom = getTomTom()
    local uiMapId = wt.npcUiMapId(npcInfo)
    if not tomtom or not uiMapId then return false end

    tomtom:AddWaypoint(uiMapId, npcInfo.x / 100, npcInfo.y / 100, {
        title = npcInfo.masterName or npcInfo.name,
        from = addonName,
        persistent = false,
        minimap = true,
        world = true,
        crazy = true
    })
    return true
end
