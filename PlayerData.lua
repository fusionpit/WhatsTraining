setfenv(1, WhatsTraining)

---@class RequiredTalent
---@field id integer ID of the talent
---@field tabIndex integer tabIndex of the talent

---@class Spell
---@field id integer The database ID of the spell
---@field name string Name of the spell
---@field subText? string Rank of the spell
---@field level integer Base level required for the spell
---@field icon string Icon of the spell
---@field requiredIds? integer[] List of required spell ids for this spell
---@field requiredTalent? RequiredTalent The required talent for this spell
---@field race? string The single race that this spell is allowed to be used
---@field races? integer[] The list of races that this spell is allowed to be used
---@field faction? string The faction requirement for the spell

PlayerData = {
  ---@type string
  name = "",
  ---@type string
  race = "",
  ---@type string
  class = "",
  ---@type integer
  level = 1,
  ---@type SpellsByLevel
  spellsByLevel = {},
  ---@type table<integer, Spell>
  spellsById = {},
  ---@type table<string, Spell>
  spellsByNameAndRank = {},
  ---@type table<integer>
  knownSpellIds = {},
  ---@type table<SpellCategories, Spell[]>
  spellsByCategory = {}
}

function PlayerData:SayHello()
  Utils.log("Hello! My name is " ..
    self.name .. " and I'm a level " .. self.level .. " " .. self.race .. " " .. self.class)
end

---Sets the player name
---@param name string
function PlayerData:SetName(name)
  self.name = name
end

---Sets the player race
---@param race string
function PlayerData:SetRace(race)
  self.race = race
end

---Sets the player class
---@param class string
function PlayerData:SetClass(class)
  self.class = class
end

---Sets the player class
---@param level integer
function PlayerData:SetLevel(level)
  self.level = level
end

---Sets the spells by level for the player
---@param spellsByLevel SpellsByLevel
function PlayerData:SetSpellsByLevel(spellsByLevel)
  self.spellsByLevel = Utils.FilterByRace(spellsByLevel, self.race)

  for _, spells in pairs(self.spellsByLevel) do
    for _, spell in ipairs(spells) do
      self.spellsById[spell.id] = spell

      local spellNameKey = Utils.getSpellWithRankKey(spell.name, spell.subText)
      self.spellsByNameAndRank[spellNameKey] = spell
    end
  end
end

function PlayerData:GetKnownSpells()
  -- Reset the known spells every time we call this function
  self.knownSpellIds = {}
  local i = 1
  while true do
    local name, rank = GetSpellName(i, BOOKTYPE_SPELL)
    if not name then
      break
    end

    local spellNameKey = Utils.getSpellWithRankKey(name, rank)
    local spell = self.spellsByNameAndRank[spellNameKey]

    if (spell) then
      -- Utils.log(name .. " (" .. rank .. ") - [" .. spell.id .. "]")
      tinsert(self.knownSpellIds, spell.id)
    end

    i = i + 1
  end
end

function PlayerData:IsSpellRequirementsMet(spellIds)
  local isRequiredSpellKnown = true
  for _, spellId in ipairs(spellIds) do
    if not Utils.TableHasValue(self.knownSpellIds, spellId) then
      isRequiredSpellKnown = false
      break
    end
  end

  return isRequiredSpellKnown
end

function PlayerData:GetAvailableSpells()
  self.spellsByCategory = {}

  local learnableSpellsByLevel = Utils.FilterByLevel(self.spellsByLevel, self.level)
  ---@type Spell[]
  local availableSpells = {}
  ---@type Spell[]
  local missingTalentRequirement = {}
  ---@type Spell[]
  local missingRequirements = {}
  ---@type Spell[]
  local comingSoon = {}
  ---@type Spell[]
  local notAvailable = {}

  for level, spells in pairs(self.spellsByLevel) do
    for _, spell in ipairs(spells) do
      if not (Utils.TableHasValue(self.knownSpellIds, spell.id)) then
        if (spell.level > self.level) then
          if (spell.level - self.level <= 2) then
            tinsert(comingSoon, spell)
          else
            tinsert(notAvailable, spell)
          end
        else
          -- Check for talents
          if spell.requiredTalent ~= nil and not PlayerData:IsTalentKnown(spell.name, spell.requiredTalent.tabIndex) then
            Utils.log("Missing talent: " .. spell.name .. " (" .. spell.subText .. ") - [" .. spell.id .. "]")
            tinsert(missingTalentRequirement, spell)
          elseif spell.requiredIds ~= nil and not PlayerData:IsSpellRequirementsMet(spell.requiredIds) then
            Utils.log("Missing requirement: " .. spell.name .. " (" .. spell.subText .. ") - [" .. spell.id .. "]")
            tinsert(missingRequirements, spell)
          else
            Utils.log("CAN LEARN: " .. spell.name .. " (" .. spell.subText .. ") - [" .. spell.id .. "]")
            tinsert(availableSpells, spell)
          end
        end
      end
    end
  end

  self.spellsByCategory[SpellCategories.MISSING_TALENT] = missingTalentRequirement
  self.spellsByCategory[SpellCategories.MISSING_REQS] = missingRequirements
  self.spellsByCategory[SpellCategories.AVAILABLE] = availableSpells
  self.spellsByCategory[SpellCategories.NEXT_LEVEL] = comingSoon
  self.spellsByCategory[SpellCategories.NOT_LEVEL] = notAvailable
end

function PlayerData:IsTalentKnown(spellname, talentTabIndex)
  local numTalents = GetNumTalents(talentTabIndex);
  for i = 1, numTalents do
    local nameTalent, icon, tier, column, currRank, maxRank = GetTalentInfo(talentTabIndex, i);
    if spellname == nameTalent then
      return currRank == maxRank
    end
  end
end