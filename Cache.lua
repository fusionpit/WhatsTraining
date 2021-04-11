local _, wt = ...

-- Spell Cache
wt.petAbilities = {}
wt.spellInfoCache = {}

-- done has param cacheHit
function wt:CacheSpell(spell, level, done)
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
        self.spellInfoCache[spell.id] = {
            id = spell.id,
            name = si:GetSpellName(),
            subText = subText,
            formattedSubText = formattedSubText,
            icon = select(3, GetSpellInfo(spell.id)),
            cost = spell.cost,
            formattedCost = GetCoinTextureString(spell.cost),
            level = level,
            formattedLevel = format(wt.L.LEVEL_FORMAT, level)
        }
        if (self:IsPetAbility(spell.id)) then
            if (formattedSubText ~= "") then
                self.petAbilities[si:GetSpellName() .. " " .. formattedSubText] =
                    self.spellInfoCache[spell.id]
            else
                self.petAbilities[si:GetSpellName()] =
                    self.spellInfoCache[spell.id]
            end
        end
        done(false)
    end)
end

function wt:SpellInfo(spellId) return self.spellInfoCache[spellId] end

function wt:PetAbility(forName) return self.petAbilities[forName] end

-- Item Cache
wt.itemInfoCache = {}
-- for warlock pet tomes, the name includes the rank
-- however, this will cause overlap with the level text and there's no good way to fix it with setting points
-- instead, strip the rank text out of the name and put it as the subText
local parensPattern = " (%(.+%))"
function wt:CacheItem(item, level, done)
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
            formattedLevel = format(wt.L.LEVEL_FORMAT, level),
            isItem = true
        }
        done(false)
    end)
end

function wt:ItemInfo(itemId) return self.itemInfoCache[itemId] end
