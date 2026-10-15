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

-- plugins add providers through WT_API (Api.lua).
-- runs under xpcall so a broken plugin can't break tooltips or row clicks
local providers, order = {}, {}

local function available(provider)
    if not provider.isAvailable then return true end
    local ok, result = xpcall(provider.isAvailable, geterrorhandler(), provider)
    return ok and result
end

-- error level 2 points at the plugin line that called WT_API.RegisterWaypointProvider
function wt.registerWaypointProvider(id, def)
    if type(id) ~= "string" then error("WT_API.RegisterWaypointProvider: id must be a string", 2) end
    if type(def) ~= "table" or type(def.setWaypoint) ~= "function" then
        error("WT_API.RegisterWaypointProvider: def must be a table with a setWaypoint function", 2)
    end
    if providers[id] then error("WT_API.RegisterWaypointProvider: '" .. id .. "' is already registered", 2) end
    def.id, def.name = id, def.name or id
    providers[id] = def
    tinsert(order, def)
end

function wt.waypointProviders()
    local list = {}
    for _, provider in ipairs(order) do
        if available(provider) then tinsert(list, provider) end
    end
    return list
end

-- the fallback is never saved, so the chosen provider comes back once it's available again
function wt.activeWaypointProvider()
    local saved = providers[WT_WaypointProvider]
    if saved and available(saved) then return saved end
    return wt.waypointProviders()[1]
end

function wt.setWaypointProvider(id)
    if providers[id] then WT_WaypointProvider = id end
end

local function waypointTarget(npcInfo)
    local uiMapId = wt.npcUiMapId(npcInfo)
    local provider = uiMapId and wt.activeWaypointProvider()
    if not provider then return end
    if provider.canSetWaypoint then
        local ok, can = xpcall(provider.canSetWaypoint, geterrorhandler(), provider, uiMapId)
        if not (ok and can) then return end
    end
    return provider, uiMapId
end

function wt.canSetWaypoint(npcInfo)
    return waypointTarget(npcInfo) ~= nil
end

function wt.setWaypoint(npcInfo)
    local provider, uiMapId = waypointTarget(npcInfo)
    if not provider then return false end
    local ok, placed = xpcall(provider.setWaypoint, geterrorhandler(), provider, uiMapId,
        npcInfo.x / 100, npcInfo.y / 100, npcInfo.masterName or npcInfo.name)
    return ok and placed ~= false
end

wt.registerWaypointProvider("tomtom", {
    name = "TomTom",
    isAvailable = getTomTom,
    setWaypoint = function(_, uiMapId, x, y, title)
        getTomTom():AddWaypoint(uiMapId, x, y, {
            title = title,
            from = addonName,
            persistent = false,
            minimap = true,
            world = true,
            crazy = true
        })
    end,
})
