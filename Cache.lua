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
  local si = Spell:CreateFromSpellID(spell.id)
  si:ContinueOnSpellLoad(function()
    if (self.spellInfoCache[spell.id] ~= nil) then
      done(true)
      return
    end
    local subText = si:GetSpellSubtext()
    local formattedSubText = (subText and subText ~= "") and
        format(PARENS_TEMPLATE, subText) or ""
    local name = si:GetSpellName()
    local formattedFullName = (subText and subText ~= "") and format("%s %s", name, formattedSubText) or name
    self.spellInfoCache[spell.id] = {
      id = spell.id,
      name = name,
      subText = subText,
      formattedSubText = formattedSubText,
      icon = GetSpellTexture(spell.id),
      cost = spell.cost,
      formattedCost = GetCoinTextureString(spell.cost),
      level = level,
      formattedLevel = format(WT.L.LEVEL_FORMAT, level),
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
  end)
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
  local ii = Item:CreateFromItemID(item.id)
  ii:ContinueOnItemLoad(function()
    if (self.itemInfoCache[item.id] ~= nil) then
      done(true)
      return
    end
    local rankText = string.match(ii:GetItemName(), parensPattern)
    self.itemInfoCache[item.id] = {
      id = item.id,
      name = string.gsub(ii:GetItemName(), parensPattern, ""),
      formattedSubText = rankText,
      icon = ii:GetItemIcon(),
      cost = item.cost,
      formattedCost = GetCoinTextureString(item.cost),
      level = level,
      formattedLevel = format(WT.L.LEVEL_FORMAT, level),
      isItem = true
    }
    done(false)
  end)
end

function WT:ItemInfo(itemId) return self.itemInfoCache[itemId] end