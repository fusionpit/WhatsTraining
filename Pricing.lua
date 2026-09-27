local _, wt = ...

local floor = math.floor
local ipairs = ipairs
local pairs = pairs
local tinsert = tinsert
local sort = table.sort

local sideNumber = { Alliance = 1, Horde = 2 }
local standingPct = { [5] = 5, [6] = 10, [7] = 15, [8] = 20 } -- tbc and forever

local function roleOf(spellInfo)
    if wt:IsPetAbility(spellInfo.id) then return "PET" end
    if spellInfo.tooltipType == "item" or spellInfo.taughtSpell then return "GRIMOIRE" end
    return wt.currentClass
end

-- Faction keys that train spellInfo on the player's side; may repeat a key.
-- Weapon skills go by the masters that teach them, everything else by role.
local function factionKeys(spellInfo)
    if spellInfo.altTooltipType == "weapon" then
        local keys = {}
        for _, trainer in ipairs(wt.WeaponSkills[spellInfo.id].trainers[wt.playerFaction]) do
            keys[#keys + 1] = wt.TrainerFactions.npcs[trainer.npc] -- an unmapped npc appends nil, i.e. is skipped
        end
        return keys
    end
    local role = wt.TrainerFactions.roles[roleOf(spellInfo)]
    return role and role[wt.playerFaction] or {}
end

-- UnitPVPRank 7 is rank 3 (Sergeant), which gets the faction vendor discount
function wt.hasPvpRankDiscount()
    return wt.gameVersion == "era" and (UnitPVPRank("player") or 0) >= 7
end

local function factionRow(key)
    local faction = wt.TrainerFactions.factions[key]
    if faction.noRep then
        return { key = key, name = C_Map.GetAreaInfo(faction.area) or ("Area " .. faction.area), pct = 0, noRep = true }
    end
    local name, standing
    if wt.gameVersion == "forever" then
        local d = C_Reputation.GetFactionDataByID(key)
        if d then name, standing = d.name, d.reaction end
    else
        name, _, standing = GetFactionInfoByID(key)
    end
    name, standing = name or ("Faction " .. key), standing or 4
    local pct
    if wt.gameVersion == "era" then
        pct = standing >= 6 and 10 or 0
        if faction.side == sideNumber[wt.playerFaction] and wt.hasPvpRankDiscount() then pct = pct + 10 end
    else
        pct = standingPct[standing] or 0
    end
    return { key = key, name = name, standingLabel = _G["FACTION_STANDING_LABEL" .. standing], pct = pct,
        city = faction.city }
end

-- spells: one spellInfo table or an array of them.
-- Returns rows sorted by price ascending then name, and the summed base cost.
-- Each row: { key, name, standingLabel (nil for noRep), pct, price, noRep }
-- A faction that doesn't train some spell's role charges base for that spell.
-- extraKey: a faction to list even when it trains none of the spells (so a selected faction never vanishes).
function wt.priceRows(spells, extraKey)
    if spells.cost then spells = { spells } end
    local base, trains, byKey = 0, {}, {}
    for i, spellInfo in ipairs(spells) do
        base = base + spellInfo.cost
        trains[i] = {}
        for _, key in ipairs(factionKeys(spellInfo)) do
            trains[i][key] = true
            byKey[key] = byKey[key] or factionRow(key)
        end
    end
    if #spells == 0 then
        local role = wt.TrainerFactions.roles[wt.currentClass]
        for _, key in ipairs(role and role[wt.playerFaction] or {}) do byKey[key] = factionRow(key) end
    end
    if extraKey and not byKey[extraKey] and wt.TrainerFactions.factions[extraKey] then
        byKey[extraKey] = factionRow(extraKey)
    end
    local rows = {}
    for key, row in pairs(byKey) do
        row.price = 0
        for i, spellInfo in ipairs(spells) do
            local cost = spellInfo.cost
            row.price = row.price + (trains[i][key] and floor((cost * (100 - row.pct) + 50) / 100) or cost)
        end
        tinsert(rows, row)
    end
    sort(rows, function(a, b)
        if a.price ~= b.price then return a.price < b.price end
        if a.city ~= b.city then return a.city == true end
        return a.name < b.name
    end)
    return rows, base
end

-- "auto" = the cheapest faction, "none" = base cost, or a faction id if the user selected one
function wt.selectedKey()
    return type(WT_PriceFaction) == "number" and WT_PriceFaction or nil
end

function wt.priceKey(rows)
    if WT_PriceFaction == "none" then return nil end
    if wt.selectedKey() then return WT_PriceFaction end
    rows = rows or wt.priceRows((wt.availableSpells()))
    return rows[1] and rows[1].key
end

-- Tooltips and the broker list only the capital city reputations
function wt.shownRows(rows, key)
    key = key or wt.priceKey()
    local shown = {}
    for _, row in ipairs(rows) do
        if row.key == key or wt.TrainerFactions.factions[row.key].city then shown[#shown + 1] = row end
    end
    return shown
end

-- The price at key from priceRows output
function wt.priceIn(key, rows, base)
    for _, row in ipairs(rows) do
        if row.key == key then return row.price, row end
    end
    return base
end

-- Price of spells (one or a list) at key and the row it came from
function wt.selectedPrice(spells, key)
    key = key or wt.priceKey()
    return wt.priceIn(key, wt.priceRows(spells, key))
end
