local _, wt = ...
local CallbackHandler = LibStub("CallbackHandler-1.0")
local ignoreStore = LibStub("FusionIgnoreStore-1.0")

local function readOnly(values)
    return setmetatable({}, {
        __index = values,
        __newindex = function() error("WT_API is read-only", 2) end,
        __metatable = false,
    })
end

local function copy(values)
    if not values then return nil end
    local result = {}
    for key, value in pairs(values) do result[key] = value end
    return result
end

local status = readOnly({
    AVAILABLE = wt.AVAILABLE_KEY,
    MISSINGREQS = wt.MISSINGREQS_KEY,
    NEXTLEVEL = wt.NEXTLEVEL_KEY,
    NOTLEVEL = wt.NOTLEVEL_KEY,
    MISSINGTALENT = wt.MISSINGTALENT_KEY,
    IGNORED = wt.IGNORED_KEY,
    IGNORED_PET = wt.IGNORED_PET_KEY,
    KNOWN = wt.KNOWN_KEY,
    KNOWN_PET = wt.KNOWN_PET_KEY,
    PET = wt.PET_KEY,
    WEAPON_AVAILABLE = wt.WEAPON_AVAILABLE_KEY,
    WEAPON_NEXTLEVEL = wt.WEAPON_NEXTLEVEL_KEY,
    WEAPON_NOTLEVEL = wt.WEAPON_NOTLEVEL_KEY,
    WEAPON_KNOWN = wt.WEAPON_KNOWN_KEY,
    WEAPON_IGNORED = wt.WEAPON_IGNORED_KEY,
})

---@alias WT_API.Event "Ready"|"SpellsChanged"|"LevelChanged"|"IgnoredChanged"
---@alias WT_API.Callback fun(event: WT_API.Event, payload?: (number|string)[]|number, ignored?: boolean)

local events = readOnly({
    READY = "Ready",
    SPELLS_CHANGED = "SpellsChanged",
    LEVEL_CHANGED = "LevelChanged",
    IGNORED_CHANGED = "IgnoredChanged",
})

local ready, enteredWorld, readyScheduled = false, false, false
local lastStatus = {}
local suppressSpellsChanged = false
local spellsById = {}
for _, spells in pairs(wt.SpellsByLevel) do
    for _, spell in ipairs(spells) do spellsById[spell.id] = spell end
end
local tomeKeys = {}
for _, tomes in pairs(wt.TomesByLevel or {}) do
    for _, tome in ipairs(tomes) do
        if type(tome.id) == "string" then tomeKeys[tome.id] = true end
    end
end

---@return (number|string)[] changedIds Unique ids; order is unspecified.
local function changedSpellIds()
    local changedIds = {}
    for id, key in pairs(wt.spellStatus) do
        if lastStatus[id] ~= key then tinsert(changedIds, id) end
    end
    for id in pairs(lastStatus) do
        if wt.spellStatus[id] == nil then tinsert(changedIds, id) end
    end
    return changedIds
end

---@class WT_API.Spell
---@field id number|string Strings identify separate Succubus/Incubus tomes.
---@field name string
---@field subText? string Rank text, when present.
---@field level number
---@field cost number Price under the player's faction selection, in copper.
---@field baseCost number Data-file cost, in copper.
---@field status string One of WT_API.Status's values.
---@field requiredIds? number[] Copied prerequisite spell ids.
---@field requiredTalentId? number
---@field quest boolean
---@field isItem boolean
---@field itemId? number
---@field link? string
---@field icon? number

---@return WT_API.Spell
local function toSpellRecord(info, key)
    local spell = spellsById[info.id]
    local isItem = info.tooltipType == "item"
    return {
        id = info.id, name = info.name, subText = info.subText, level = info.level,
        cost = wt.selectedPrice(info), baseCost = info.cost, status = key,
        requiredIds = spell and copy(spell.requiredIds),
        requiredTalentId = spell and spell.requiredTalentId,
        quest = info.quest ~= nil, isItem = isItem, itemId = isItem and info.itemId or nil,
        link = info.link, icon = info.icon,
    }
end

---@class WT_API.Trainer
---@field npc number
---@field name string
---@field zoneId number
---@field uiMapId? number
---@field x number Map coordinate (0-100).
---@field y number Map coordinate (0-100).

---@class WT_API.Source
---@field kind "quest"|"weaponMaster"|"item"|"trainer"
---@field cost number Selected price in copper; quests always cost zero.
---@field baseCost number Data-file cost in copper.
---@field level? number Quest minimum level.
---@field areas? number[] Quest area ids, filtered to the player's race.
---@field quests? number[] Quest ids, filtered to the player's race.
---@field trainers? WT_API.Trainer[] Weapon masters for the player's faction.
---@field itemId? number Grimoire item id.

---@return WT_API.Source
local function buildSource(info)
    if info.quest then
        return {
            kind = "quest", cost = 0, baseCost = 0, level = info.quest.level,
            areas = copy(info.quest.areas), quests = copy(info.quest.quests),
        }
    end
    local source = { cost = wt.selectedPrice(info), baseCost = info.cost }
    local weapon = wt.WeaponSkills and wt.WeaponSkills[info.id]
    if weapon then
        source.kind = "weaponMaster"
        source.trainers = {}
        for _, trainer in ipairs(weapon.trainers[wt.playerFaction] or {}) do
            tinsert(source.trainers, {
                npc = trainer.npc, name = trainer.name, zoneId = trainer.zone,
                uiMapId = wt.zoneUiMapIds[trainer.zone], x = trainer.x, y = trainer.y,
            })
        end
    elseif info.tooltipType == "item" then
        source.kind, source.itemId = "item", info.itemId
    else
        source.kind = "trainer"
    end
    return source
end

---A waypoint service, such as TomTom or Blizzard's map pin. What's Training calls each function
---with the provider as `self` and inside `xpcall`, so an error is reported without breaking
---tooltips or row clicks.
---@class WT_API.WaypointProvider
---@field name? string Label in the settings menu. Defaults to the provider's id.
---@field setWaypoint fun(self: WT_API.WaypointProvider, uiMapId: integer, x: number, y: number, title: string): boolean? Places a waypoint at `x`, `y` (0-1) for the trainer named `title`. Return `false` if nothing was placed.
---@field isAvailable? fun(self: WT_API.WaypointProvider): boolean Whether it can be used right now, e.g. its addon is loaded. Missing means always.
---@field canSetWaypoint? fun(self: WT_API.WaypointProvider, uiMapId: integer): boolean Whether it can place a waypoint on this map. Missing means every map.

---Public API for other addons. Read-only: assigning to it raises an error.
---Register with dot syntax: WT_API.RegisterCallback(owner, WT_API.Event.LEVEL_CHANGED, fn).
---Handlers receive (event, ...). Ready fires once with no payload.
---SpellsChanged(changedIds) reports unique added, removed and status-changed numeric ids or tome keys.
---The changedIds array has no defined order. Removed entries are absent from GetSpells().
---LevelChanged(level) and IgnoredChanged(ids, ignored) imply status changes without SpellsChanged.
---All callbacks are suppressed before Ready. Registering after Ready does not replay it.
---@class WT_API
---@field RegisterCallback fun(owner: table|string|thread, event: WT_API.Event, fn: WT_API.Callback)
---@field UnregisterCallback fun(owner: table|string|thread, event: WT_API.Event)
---@field UnregisterAllCallbacks fun(owner: table|string|thread)
local api = {
    ---Raised when functions are added. Check it before calling a newer function.
    version = 1,

    ---Adds a waypoint provider. When two or more are available, players pick one in the settings
    ---menu and the choice is saved account-wide. `id` must be unique, so prefix it with your addon's
    ---name. Raises an error if `id` is taken or `def` has no `setWaypoint`.
    ---@type fun(id: string, def: WT_API.WaypointProvider)
    RegisterWaypointProvider = wt.registerWaypointProvider,

    ---The category keys used by both the API and UI. Read-only.
    ---@type table<string, string>
    Status = status,

    ---Callback names for registration and matching the event argument. Read-only.
    ---@type table<string, WT_API.Event>
    Event = events,

    ---Whether the login build and all initial cache requests have completed.
    ---@return boolean
    IsReady = function() return ready end,

    ---All categorized spells, independent of UI filters. Returns fresh copies, or {} before Ready.
    ---Starting-rank prerequisites cached only at level zero are excluded.
    ---@return WT_API.Spell[]
    GetSpells = function()
        local result = {}
        if not ready then return result end
        for id, key in pairs(wt.spellStatus) do
            local info = wt:ItemInfo(id) or wt:SpellInfo(id)
            tinsert(result, toSpellRecord(info, key))
        end
        return result
    end,

    ---The cached source of a spell, or nil for an unknown id. Returns fresh copies.
    ---@param spellId number|string Numeric id or an existing Succubus/Incubus tome key.
    ---@return WT_API.Source?
    GetSource = function(spellId)
        if type(spellId) ~= "number" and not tomeKeys[spellId] then
            error("WT_API.GetSource: spellId must be a number or an existing tome key", 2)
        end
        local info = wt:ItemInfo(spellId) or wt:SpellInfo(spellId)
        return info and buildSource(info) or nil
    end,

    ---The player's ignore-list choice, including false for unknown ids.
    ---@param spellId number|string Numeric id or an existing Succubus/Incubus tome key.
    ---@return boolean
    IsIgnored = function(spellId)
        if type(spellId) ~= "number" and not tomeKeys[spellId] then
            error("WT_API.IsIgnored: spellId must be a number or an existing tome key", 2)
        end
        return ignoreStore:IsIgnored(spellId) == true
    end,
}

local registry = CallbackHandler:New(api)

wt.afterRebuild = function(isLevelUp, level)
    if not ready then return end
    local changedIds = changedSpellIds()
    if #changedIds > 0 then lastStatus = copy(wt.spellStatus) end
    if isLevelUp then
        registry:Fire(events.LEVEL_CHANGED, level)
    elseif #changedIds > 0 and not suppressSpellsChanged then
        registry:Fire(events.SPELLS_CHANGED, changedIds)
    end
end

local function maybeReady()
    if ready or readyScheduled or not enteredWorld or wt.cacheRequestsPending() ~= 0 then return end
    readyScheduled = true
    RunNextFrame(function()
        readyScheduled = false
        if ready or wt.cacheRequestsPending() ~= 0 then return end
        lastStatus = copy(wt.spellStatus)
        ready = true
        registry:Fire(events.READY)
    end)
end

wt.onCacheIdle = maybeReady
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self)
    enteredWorld = true
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    maybeReady()
end)

ignoreStore:AddSubscription(function(ids, ignored)
    suppressSpellsChanged = true
    wt:RebuildData()
    suppressSpellsChanged = false
    if ready and ids and #ids > 0 then registry:Fire(events.IGNORED_CHANGED, ids, ignored) end
end)

---@type WT_API
WT_API = readOnly(api)
