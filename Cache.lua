-- Spell Cache
WT.petAbilities = {}
WT.spellInfoCache = {}
WT.allRanksCache = {}
WT.idToRanks = {}

-- done has param cacheHit
function WT:CacheSpell(spell, level, done)
  if (self.spellInfoCache[spell.id] ~= nil) then
    done(true)
    return
  end

  local name = spell.name
  local formattedSubText = (spell.subText and spell.subText ~= "") and format(PARENS_TEMPLATE, spell.subText) or ""
  local formattedFullName = (spell.subText and spell.subText ~= "") and format("%s %s", spell.name, formattedSubText) or
      spell.name

  self.spellInfoCache[spell.id] = {
    id = spell.id,
    name = spell.name,
    subText = spell.subText,
    formattedSubText = formattedSubText,
    icon = spell.icon,
    cost = 0,          -- TODO spell.cost,
    formattedCost = 0, -- TODO spell.cost,
    level = spell.level,
    formattedLevel = format("%s - " .. WT.L.LEVEL_FORMAT, spell.id, spell.level),
    formattedFullName = formattedFullName,
  }

  if self.allRanksCache[name] == nil then
    self.allRanksCache[name] = {}
  end

  tinsert(self.allRanksCache[name], spell.id)
  self.idToRanks[spell.id] = self.allRanksCache[name]

  if (self:IsPetAbility(spell.id)) then
    if (formattedSubText ~= "") then
      self.petAbilities[name .. " " .. formattedSubText] =
          self.spellInfoCache[spell.id]
    else
      self.petAbilities[name] =
          self.spellInfoCache[spell.id]
    end
  end
  done(false)
end

function WT:SpellInfo(spellId) return self.spellInfoCache[spellId] end

function WT:PetAbility(forName) return self.petAbilities[forName] end

function WT:AllRanks(spellId) return self.idToRanks[spellId] end

-- Item Cache
WT.itemInfoCache = {}
-- for warlock pet tomes, the name includes the rank
-- however, this will cause overlap with the level text and there's no good way to fix it with setting points
-- instead, strip the rank text out of the name and put it as the subText
local parensPattern = " (%(.+%))"
function WT:CacheItem(item, level, done)
  if (self.itemInfoCache[item.id] ~= nil) then
    done(true)
    return
  end

  local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, sellPrice, classID, subclassID, bindType, expansionID, setID, isCraftingReagent =
      GetItemInfo(item.id)
  -- local rankText = string.match(itemName, parensPattern)
  self.itemInfoCache[item.id] = {
    id = item.id,
    name = itemName, --string.gsub(itemName, parensPattern, ""),
    formattedSubText = "",
    icon = itemTexture,
    cost = item.cost,
    formattedCost = item.cost, -- TODO GetCoinTextureString(item.cost),
    level = level,
    formattedLevel = format(WT.L.LEVEL_FORMAT, level),
    isItem = true
  }
  done(false)
end

function WT:ItemInfo(itemId) return self.itemInfoCache[itemId] end