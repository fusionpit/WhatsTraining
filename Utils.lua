local _, wt = ...

local tinsert = tinsert
local ipairs = ipairs

local function filter(spellsByLevel, pred)
    local output = {}
    for level, spells in pairs(spellsByLevel) do
        output[level] = {}
        for _, spell in ipairs(spells) do
            if (pred(spell) == true) then
                tinsert(output[level], spell)
            end
        end
    end
    return output
end
function wt.FactionFilter(spellsByLevel)
    return filter(spellsByLevel, function(spell)
        return spell.faction == nil or spell.faction == wt.playerFaction
    end)
end
function wt.RaceFilter(spellsByLevel)
    return filter(spellsByLevel, function(spell)
        if (spell.race == nil and spell.races == nil) then return true end
        if (spell.races == nil) then return spell.race == wt.playerRace end
        return spell.races[1] == wt.playerRace or spell.races[2] == wt.playerRace
    end)
end

--[[
    varargs is just a set of tables, where each table is a list of spell ids that
    totally overwrite a previous rank of that ability ordered by rank.
    Most warrior and rogue abilities are like this, as they cost the same amount
    of resources but just last longer or do more damage.
]]
function wt:AddOverriddenSpells(...)
    local abilityMap = {}
    for _, abilityIds in ipairs({...}) do
        for _, abilityId in ipairs(abilityIds) do
            abilityMap[abilityId] = abilityIds
        end
    end
    self.overriddenSpellsMap = abilityMap
end

local ROMAN_DIGITS = { I = 1, V = 5, X = 10 }
local function romanToNumber(numeral)
    local total, prev = 0, 0
    for i = #numeral, 1, -1 do
        local value = ROMAN_DIGITS[numeral:sub(i, i)]
        total = value < prev and total - value or total + value
        prev = value
    end
    return total
end

-- In Classic Era 1.15.9, trainers list poisons without a roman numeral
-- TBC Anniversary does include the roman numeral (as 1.15.8 did)
-- strip roman numerals if the name has the same number as the subText (Rank #)
function wt.stripRankNumeral(name, subText)
    local base, numeral = string.match(name, "^(.-)%s+([IVX]+)$")
    local rank = subText and string.match(subText, "%d+")
    if base and rank and romanToNumber(numeral) == tonumber(rank) then
        return base
    end
    return name
end

function wt:IsPetAbility(spellId)
    return self.PetAbilityIds ~= nil and self.PetAbilityIds[spellId]
end
function wt:IsPetAbilityLearned(key)
    return self.learnedPetAbilityMap[key] == true
end
-- returns a bool indicating if the value changed
function wt:SetPetAbilityStatus(key, learned)
    local prior = self.learnedPetAbilityMap[key]
    self.learnedPetAbilityMap[key] = learned
    return prior ~= learned
end

function wt.formatSpellCost(spellInfo, fontHeight, costFormat)
    local coloredCoinString = spellInfo.formattedCost or
                                    C_CurrencyInfo.GetCoinTextureString(spellInfo.cost, fontHeight)
    if spellInfo.costColor then
        coloredCoinString = spellInfo.costColor .. coloredCoinString .. FONT_COLOR_CODE_CLOSE
    elseif (GetMoney() < spellInfo.cost) then
        coloredCoinString = RED_FONT_COLOR_CODE .. coloredCoinString .. FONT_COLOR_CODE_CLOSE
    end
    local formatString = costFormat or (spellInfo.isHeader and
        (spellInfo.costFormat or wt.L.TOTALCOST_FORMAT) or
        (spellInfo.costFormat or wt.L.COST_FORMAT))

    return HIGHLIGHT_FONT_COLOR_CODE .. format(formatString, coloredCoinString) .. FONT_COLOR_CODE_CLOSE
end

-- the spells under the Available header in wt.spellListData (they sum to its cost), and that header
function wt.availableSpells()
    local spells, header = {}, nil
    for _, entry in ipairs(wt.spellListData) do
        if entry.isHeader then
            if header then break end
            if entry.key == wt.AVAILABLE_KEY then header = entry end
        elseif header then
            tinsert(spells, entry)
        end
    end
    return spells, header
end

-- Base cost plus one line per trainer faction, cheapest first; spells defaults to spellInfo.
-- Falls back to the plain cost line when no faction trains it.
-- A price is red when unaffordable, else green when it's the cheapest and below base (red wins).
function wt.addPricingBlock(tooltip, spellInfo, spells)
    local rows, base = wt.priceRows(spells or spellInfo)
    if #rows == 0 or base == 0 then
        tooltip:AddLine(wt.formatSpellCost(spellInfo))
        return
    end
    tooltip:AddLine(wt.formatSpellCost(spellInfo, nil, wt.L.BASE_COST_FORMAT))
    local best = rows[1].price < base and rows[1].price
    local money = GetMoney()
    for _, row in ipairs(rows) do
        local left = row.noRep and format(wt.L.NO_REP_ROW_FORMAT, row.name) or
            format(wt.L.REP_ROW_FORMAT, row.name, row.standingLabel, row.pct)
        local right = C_CurrencyInfo.GetCoinTextureString(row.price)
        local rightColor = money < row.price and RED_FONT_COLOR_CODE or row.price == best and GREEN_FONT_COLOR_CODE
        if rightColor then right = rightColor .. right .. FONT_COLOR_CODE_CLOSE end
        if row.price == best then left = GREEN_FONT_COLOR_CODE .. left .. FONT_COLOR_CODE_CLOSE end
        tooltip:AddDoubleLine(left, right)
    end
    if wt.hasPvpRankDiscount() then tooltip:AddLine(wt.L.PVP_RANK_FOOTER, 0.5, 0.5, 0.5) end
end

local BEAST_TRAINING_SPELL = 5149
function wt.needsBeastTraining()
    return WT_NeedsToOpenBeastTraining == true and wt.hasBeastTraining()
end
function wt.hasBeastTraining()
    return C_SpellBook.IsSpellKnown(BEAST_TRAINING_SPELL, Enum.SpellBookSpellBank.Player)
end
function wt.openBeastTraining()
    CastSpellByID(BEAST_TRAINING_SPELL)
end

function wt.isPreviouslyLearnedAbility(spellId)
    if wt.overriddenSpellsMap == nil or not wt.overriddenSpellsMap[spellId] then
        return false
    end

    local spellIndex, knownIndex = 0, 0
    for i, otherId in ipairs(wt.overriddenSpellsMap[spellId]) do
        if otherId == spellId then spellIndex = i end
        if (C_SpellBook.IsSpellInSpellBook(otherId, Enum.SpellBookSpellBank.Player, false)
            or C_SpellBook.IsSpellKnown(otherId, Enum.SpellBookSpellBank.Player)) then
            knownIndex = i
        end
    end
    return spellIndex <= knownIndex
end

function wt.isAbilityKnown(spellId)
    if (C_SpellBook.IsSpellInSpellBook(spellId, Enum.SpellBookSpellBank.Player, false)
        or C_SpellBook.IsSpellKnown(spellId, Enum.SpellBookSpellBank.Player) or
        wt.isPreviouslyLearnedAbility(spellId)) then return true end
    if (not wt:IsPetAbility(spellId)) then return false end
    if wt:IsPetAbilityLearned(spellId) then return true end
    local info = wt:SpellInfo(spellId)

    if info.subText == nil or wt.learnedPetAbilityMap[info.name] == nil then
        return false
    end

    return wt.learnedPetAbilityMap[info.name][info.subText]
end
