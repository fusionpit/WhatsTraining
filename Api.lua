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

---@alias WT_API.Event "Ready"|"SpellsChanged"|"LevelChanged"|"IgnoredChanged"|"ClassReady"
---@alias WT_API.Callback fun(event: WT_API.Event, payload?: (number|string)[]|number|string, ignored?: boolean)

local events = readOnly({
    READY = "Ready",
    SPELLS_CHANGED = "SpellsChanged",
    LEVEL_CHANGED = "LevelChanged",
    IGNORED_CHANGED = "IgnoredChanged",
    CLASS_READY = "ClassReady",
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

---@return WT_API.Trainer
local function toTrainerRecord(trainer)
    return {
        npc = trainer.npc, name = trainer.name, zoneId = trainer.zone,
        uiMapId = wt.zoneUiMapIds[trainer.zone], x = trainer.x, y = trainer.y,
    }
end

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
            tinsert(source.trainers, toTrainerRecord(trainer))
        end
    elseif info.tooltipType == "item" then
        source.kind, source.itemId = "item", info.itemId
    else
        source.kind = "trainer"
    end
    return source
end

---@class WT_API.CatalogQuest
---@field races number[]
---@field level number
---@field areas number[]
---@field quests number[]

---@class WT_API.CatalogEntry
---@field id number|string Spell id, item id, or separate Succubus/Incubus tome key.
---@field kind "trainer"|"quest"|"item"|"weaponMaster"
---@field name? string Set once LoadClass has resolved the class; nil if the client failed to load it.
---@field subText? string Rank text, when present. For tomes, the taught spell's rank.
---@field icon? number
---@field link? string
---@field level number Lowest variant level for quests without a race filter.
---@field cost number Data-file base cost in copper; quests always zero.
---@field requiredIds? number[]
---@field requiredTalentId? number
---@field faction? string The entry's own faction tag.
---@field races? number[] Normalized race tags.
---@field petAbility boolean Always true for tomes.
---@field itemId? number
---@field family? string English pet family for tomes.
---@field taughtSpellId? number
---@field quest? WT_API.CatalogQuest[] All variants, or the first matching race variant.
---@field trainers? { Alliance?: WT_API.Trainer[], Horde?: WT_API.Trainer[] }

local function withSpellNames(entry, spellId)
    local resolved = wt.resolvedSpells[spellId or entry.id]
    if resolved then
        entry.name, entry.subText, entry.icon, entry.link = resolved.name, resolved.subText, resolved.icon, resolved.link
    end
    return entry
end

local function withItemNames(entry, taughtSpellId)
    local resolved = wt.resolvedItems[entry.itemId]
    if resolved then entry.name, entry.icon, entry.link = resolved.name, resolved.icon, resolved.link end
    local taught = taughtSpellId and wt.resolvedSpells[taughtSpellId]
    if taught then entry.subText = taught.subText end
    return entry
end

---@return WT_API.CatalogEntry[]
local function buildCatalog(class, token, filter)
    local result = {}
    local petAbilityIds = class.petAbilityIds or {}
    local spellsByLevel = class.spellsByLevel
    if filter.faction then spellsByLevel = wt.FactionFilter(spellsByLevel, filter.faction) end
    if filter.race then spellsByLevel = wt.RaceFilter(spellsByLevel, filter.race) end
    for level, spells in pairs(spellsByLevel) do
        for _, spell in ipairs(spells) do
            tinsert(result, withSpellNames({
                id = spell.id, kind = "trainer", level = level, cost = spell.cost,
                requiredIds = copy(spell.requiredIds), requiredTalentId = spell.requiredTalentId,
                faction = spell.faction, races = copy(spell.races) or (spell.race and {spell.race}),
                petAbility = petAbilityIds[spell.id] == true,
            }))
        end
    end
    local quests = wt.QuestSpells[token] or {}
    if filter.race then
        local matched = {}
        for _, entry in ipairs(wt.questSpellsFor(quests, filter.race)) do matched[entry.id] = {entry} end
        quests = matched
    end
    for id, variants in pairs(quests) do
        local entry = { id = id, kind = "quest", cost = 0, petAbility = petAbilityIds[id] == true, quest = {} }
        for _, variant in ipairs(variants) do
            entry.level = math.min(entry.level or variant.level, variant.level)
            tinsert(entry.quest, {
                races = copy(variant.races), level = variant.level,
                areas = copy(variant.areas) or {variant.area}, quests = copy(variant.quests),
            })
        end
        tinsert(result, withSpellNames(entry))
    end
    for level, tomes in pairs(class.tomesByLevel or {}) do
        for _, tome in ipairs(tomes) do
            local taughtSpellId = class.tomeTaughtSpells[tome.itemId]
            tinsert(result, withItemNames({
                id = type(tome.id) == "string" and tome.id or tome.itemId,
                kind = "item", level = level, cost = tome.cost, petAbility = true,
                itemId = tome.itemId, family = tome.family, taughtSpellId = taughtSpellId,
            }, taughtSpellId))
        end
    end
    for id, weapon in pairs(wt.WeaponSkills) do
        if weapon.classes[token] then
            local entry = {
                id = id, kind = "weaponMaster", level = weapon.level or 1, cost = weapon.cost or 1000,
                petAbility = petAbilityIds[id] == true, trainers = {},
            }
            for _, faction in ipairs({ "Alliance", "Horde" }) do
                if not filter.faction or filter.faction == faction then
                    entry.trainers[faction] = {}
                    for _, trainer in ipairs(weapon.trainers[faction] or {}) do
                        tinsert(entry.trainers[faction], toTrainerRecord(trainer))
                    end
                end
            end
            tinsert(result, withSpellNames(entry))
        end
    end
    table.sort(result, function(a, b)
        if a.level ~= b.level then return a.level < b.level end
        if a.kind ~= b.kind then return a.kind < b.kind end
        return tostring(a.id) < tostring(b.id)
    end)
    return result
end

-- Every spell id and item id a class's catalog can show, before any filter.
local function catalogIds(class, token)
    local spellIds, itemIds = {}, {}
    for _, spells in pairs(class.spellsByLevel) do
        for _, spell in ipairs(spells) do spellIds[spell.id] = true end
    end
    for id in pairs((wt.QuestSpells or {})[token] or {}) do spellIds[id] = true end
    for _, tomes in pairs(class.tomesByLevel or {}) do
        for _, tome in ipairs(tomes) do
            itemIds[tome.itemId] = true
            local taughtSpellId = class.tomeTaughtSpells[tome.itemId]
            if taughtSpellId then spellIds[taughtSpellId] = true end
        end
    end
    for id, weapon in pairs(wt.WeaponSkills or {}) do
        if weapon.classes[token] then spellIds[id] = true end
    end
    return spellIds, itemIds
end

local classReady, classLoading = {}, {}
local fireClassReady -- set after the callback registry exists

-- Returns true when every id is already resolved. Otherwise returns false and ClassReady fires on
-- a later frame, once, after the last resolution (including failures) completes.
local function loadClass(class, token)
    if classReady[token] then return true end
    if classLoading[token] then return false end
    local spellIds, itemIds = catalogIds(class, token)
    local pending, collecting = 0, true
    local function step()
        pending = pending - 1
        if pending > 0 or collecting then return end
        RunNextFrame(function()
            classLoading[token] = nil
            if classReady[token] then return end
            classReady[token] = true
            fireClassReady(token)
        end)
    end
    for id in pairs(spellIds) do
        pending = pending + 1
        wt.ResolveSpell(id, step)
    end
    for id in pairs(itemIds) do
        pending = pending + 1
        wt.ResolveItem(id, step)
    end
    collecting = false
    if pending == 0 then
        classReady[token] = true
        return true
    end
    classLoading[token] = true
    return false
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
---Player callbacks are suppressed before Ready. Registering after Ready does not replay it.
---GetCatalog is synchronous for every class, independent of Ready, with no status or cache loads.
---LoadClass resolves a class's names, rank text, icons and links; ClassReady(classToken) fires
---once per class when that completes, independent of Ready, and never during the LoadClass call.
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

    ---Static class data, sorted by level, kind, then stringified id. Returns fresh copies.
    ---No status or discounted prices. Names, rank text, icons and links are present once
    ---LoadClass has resolved the class (see IsClassReady), and nil before that.
    ---@param classToken string Upper-case English token, as returned by UnitClass("player").
    ---@param filter? { race?: number, faction?: "Alliance"|"Horde" }
    ---@return WT_API.CatalogEntry[]? nil when the class has no data.
    GetCatalog = function(classToken, filter)
        if type(classToken) ~= "string" then
            error("WT_API.GetCatalog: classToken must be a string", 2)
        end
        if filter ~= nil and type(filter) ~= "table" then
            error("WT_API.GetCatalog: filter must be a table or nil", 2)
        end
        local class = wt.ClassData[classToken]
        return class and buildCatalog(class, classToken, filter or {}) or nil
    end,

    ---Requests names, rank text, icons and links for every entry in a class's catalog. Returns
    ---true when they are already available. Otherwise returns false and ClassReady(classToken)
    ---fires once they are, on a later frame, including after failed loads (those entries keep a
    ---nil name). These loads never delay Ready. Raises an error for a class without data.
    ---@param classToken string
    ---@return boolean ready
    LoadClass = function(classToken)
        local class = type(classToken) == "string" and wt.ClassData[classToken]
        if not class then error("WT_API.LoadClass: no data for class " .. tostring(classToken), 2) end
        return loadClass(class, classToken)
    end,

    ---Whether LoadClass has completed for the class. False for a class without data.
    ---@param classToken string
    ---@return boolean
    IsClassReady = function(classToken) return classReady[classToken] == true end,

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
fireClassReady = function(token) registry:Fire(events.CLASS_READY, token) end

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
