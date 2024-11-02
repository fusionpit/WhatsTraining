setfenv(1, WhatsTraining)
Utils = {}

--- Filters the spellsByLevel table with the given predicate
---@param spellsByLevel SpellsByLevel
---@param predicate fun(spell: Spell): boolean
---@return SpellsByLevel
local function filter(spellsByLevel, predicate)
  local output = {}
  for level, spells in pairs(spellsByLevel) do
    output[level] = {}
    for _, spell in ipairs(spells) do
      if (predicate(spell) == true) then
        tinsert(output[level], spell)
      end
    end
  end
  return output
end

function Utils.TableHasValue(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

--- Returns the table of spells filtered by the given race
---@param spellsByLevel SpellsByLevel
---@param playerRace string
---@return SpellsByLevel
function Utils.FilterByRace(spellsByLevel, playerRace)
  return filter(spellsByLevel, function(spell)
    if (spell.race == nil and spell.races == nil) then
      return true
    end

    if (spell.races == nil) then
      return spell.race == playerRace
    end

    return Utils.TableHasValue(spell.races, playerRace)
  end)
end

--- Returns the table of spells that has level requirements less than or equal the given level
---@param spellsByLevel SpellsByLevel
---@param playerLevel integer
---@return SpellsByLevel
function Utils.FilterByLevel(spellsByLevel, playerLevel)
  return filter(spellsByLevel, function(spell)
    return (spell.level <= playerLevel)
  end)
end

--- Splits the given string by the given separator
---@param input string
---@param separator? string
function Utils.SplitString(input, separator)
  if separator == nil then
    separator = "%s"
  end
  Utils.log(string.gmatch(input, separator))
  local t = {}
  -- for str in string.gmatch(input, separator) do
  --   table.insert(t, str)
  -- end
  return t
end

--- Returns the rank number of a given rankText
---@param rankText? string
---@returns integer
function Utils.GetRankNumber(rankText)
  if rankText == nil or rankText == "" then
    return 0 -- Lua arrays start from 1.
  end

  local _, rankNumber = Utils.SplitString(rankText)

  return tonumber(rankNumber)
end

function Utils.log(msg)
  DEFAULT_CHAT_FRAME:AddMessage(msg)
end

---Returns the spell key for a given name and rank
---@param name string
---@param rank string
function Utils.getSpellWithRankKey(name, rank)
  local spellNameKey = name
  if (rank ~= "") then
    spellNameKey = spellNameKey .. "-" .. rank
  end

  return spellNameKey
end