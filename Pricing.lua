local _, wt = ...

local floor = math.floor
local ipairs = ipairs
local pairs = pairs
local tinsert = tinsert
local sort = table.sort

local sideNumber = { Alliance = 1, Horde = 2 }
local standingPct = { [5] = 5, [6] = 10, [7] = 15, [8] = 20 } -- tbc and forever

local function roleOf(spellInfo)
    if spellInfo.altTooltipType == "weapon" then return "WEAPON" end
    if wt:IsPetAbility(spellInfo.id) then return "PET" end
    if spellInfo.tooltipType == "item" or spellInfo.taughtSpell then return "GRIMOIRE" end
    return wt.currentClass
end

-- UnitPVPRank 7 is rank 3 (Sergeant), which gets the faction vendor discount
function wt.hasPvpRankDiscount()
    return wt.gameVersion == "era" and (UnitPVPRank("player") or 0) >= 7
end

local function factionRow(key)
    local faction = wt.TrainerFactions.factions[key]
    if faction.noRep then
        return { name = C_Map.GetAreaInfo(faction.area) or ("Area " .. faction.area), pct = 0, noRep = true }
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
    return { name = name, standingLabel = _G["FACTION_STANDING_LABEL" .. standing], pct = pct }
end

-- spells: one spellInfo table or an array of them.
-- Returns rows sorted by price ascending then name, and the summed base cost.
-- Each row: { name, standingLabel (nil for noRep), pct, price, noRep }
-- A faction that doesn't train some spell's role charges base for that spell.
function wt.priceRows(spells)
    if spells.cost then spells = { spells } end
    local roles = wt.TrainerFactions.roles
    local base, trains, byKey = 0, {}, {}
    for i, spellInfo in ipairs(spells) do
        base = base + spellInfo.cost
        trains[i] = {}
        local role = roles[roleOf(spellInfo)]
        for _, key in ipairs(role and role[wt.playerFaction] or {}) do
            trains[i][key] = true
            byKey[key] = byKey[key] or factionRow(key)
        end
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
        return a.name < b.name
    end)
    return rows, base
end
