WT = {}

local _, classFilename, _ = UnitClass("player")

WT.currentClass = classFilename

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
function WT.FactionFilter(spellsByLevel)
  return filter(spellsByLevel, function(spell)
    return spell.faction == nil or spell.faction == playerFaction
  end)
end

function WT.RaceFilter(spellsByLevel)
  local playerRace = UnitRace("player")
  WT.log(playerRace)
  return filter(spellsByLevel, function(spell)
    if (spell.race == nil and spell.races == nil) then
      return true
    end

    if (spell.races == nil) then
      return spell.race == playerRace
    end

    return HasValue(spell.races, playerRace)
  end)
end

--[[
    varargs is just a set of tables, where each table is a list of spell ids that
    totally overwrite a previous rank of that ability ordered by rank.
    Most warrior and rogue abilities are like this, as they cost the same amount
    of resources but just last longer or do more damage.
]]
function WT:AddOverriddenSpells(spells)
  local abilityMap = {}
  for _, abilityIds in ipairs(spells) do
    for _, abilityId in ipairs(abilityIds) do
      abilityMap[abilityId] = abilityIds
    end
  end
  self.overriddenSpellsMap = abilityMap
end

function WT:IsPetAbility(spellId)
  return self.PetAbilityIds ~= nil and self.PetAbilityIds[spellId]
end

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function HasValue(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

function WT.log(msg)
  DEFAULT_CHAT_FRAME:AddMessage(msg)
end