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

function wt.formatSpellCost(spellInfo, fontHeight)
    local coloredCoinString = spellInfo.formattedCost or
                                    GetCoinTextureString(spellInfo.cost, fontHeight)
    if spellInfo.costColor then
        coloredCoinString = spellInfo.costColor .. coloredCoinString .. FONT_COLOR_CODE_CLOSE
    elseif (GetMoney() < spellInfo.cost) then
        coloredCoinString = RED_FONT_COLOR_CODE .. coloredCoinString .. FONT_COLOR_CODE_CLOSE
    end
    local formatString = spellInfo.isHeader and
        (spellInfo.costFormat or wt.L.TOTALCOST_FORMAT) or
        (spellInfo.costFormat or wt.L.COST_FORMAT)

    return HIGHLIGHT_FONT_COLOR_CODE .. format(formatString, coloredCoinString) .. FONT_COLOR_CODE_CLOSE
end

local BEAST_TRAINING_SPELL = 5149
function wt.needsBeastTraining()
    return WT_NeedsToOpenBeastTraining == true and wt.hasBeastTraining()
end
function wt.hasBeastTraining()
    return IsPlayerSpell(BEAST_TRAINING_SPELL)
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
        if (IsSpellKnown(otherId) or IsPlayerSpell(otherId)) then
            knownIndex = i
        end
    end
    return spellIndex <= knownIndex
end

function wt.isAbilityKnown(spellId)
    if (IsSpellKnown(spellId) or IsPlayerSpell(spellId) or
        wt.isPreviouslyLearnedAbility(spellId)) then return true end
    if (not wt:IsPetAbility(spellId)) then return false end
    local info = wt:SpellInfo(spellId)

    if info.subText == nil or wt.learnedPetAbilityMap[info.name] == nil then
        return false
    end

    return wt.learnedPetAbilityMap[info.name][info.subText]
end
