local _, wt = ...

local tinsert = tinsert
local ipairs = ipairs

wt.currentClass = select(2, UnitClass("player"))

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
local playerFaction = UnitFactionGroup("player")
function wt.FactionFilter(spellsByLevel)
    return filter(spellsByLevel, function(spell)
        return spell.faction == nil or spell.faction == playerFaction
    end)
end
local playerRace = select(3, UnitRace("player"))
function wt.RaceFilter(spellsByLevel)
    return filter(spellsByLevel, function(spell)
        if (spell.race == nil and spell.races == nil) then return true end
        if (spell.races == nil) then return spell.race == playerRace end
        return spell.races[1] == playerRace or spell.races[2] == playerRace
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

function wt:IsPetAbility(spellId)
    return self.PetAbilityIds ~= nil and self.PetAbilityIds[spellId]
end

function wt.formatSpellCost(spellInfo, fontHeight)
    local coloredCoinString = spellInfo.formattedCost or
                                    GetCoinTextureString(spellInfo.cost, fontHeight)
    if (GetMoney() < spellInfo.cost) then
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
