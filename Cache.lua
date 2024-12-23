local _, wt = ...

-- Spell Cache
wt.petAbilities = {}
wt.spellInfoCache = {}
wt.allRanksCache = {}
wt.idToRanks = {}

-- done has params cacheHit: bool, spellInfo
function wt:CacheSpell(spell, level, done)
    if (self.spellInfoCache[spell.id] ~= nil) then
        done(true, self.spellInfoCache[spell.id])
        return
    end
    local si = Spell:CreateFromSpellID(spell.id)
    si:ContinueOnSpellLoad(function()
        if (self.spellInfoCache[spell.id] ~= nil) then
            done(true, self.spellInfoCache[spell.id])
            return
        end
        -- some stuff, like subtext, might be nil even though we're in the load continuation
        -- delaying it seems to fix it, and subtext always appears
        RunNextFrame(function()
            local subText = si:GetSpellSubtext() -- C_Spell.GetSpellSubtext(spell.id)
            local formattedSubText = (subText and subText ~= "") and
                                         format(PARENS_TEMPLATE, subText) or ""
            local name = si:GetSpellName()
            local formattedFullName = (subText and subText ~= "") and format("%s %s", name, formattedSubText) or name
            self.spellInfoCache[spell.id] = {
                id = spell.id,
                name = name,
                subText = subText,
                formattedSubText = formattedSubText,
                icon = select(3, GetSpellInfo(spell.id)),
                cost = spell.cost,
                formattedCost = GetCoinTextureString(spell.cost),
                level = level,
                formattedLevel = format(wt.L.LEVEL_FORMAT, level),
                formattedFullName = formattedFullName,
                searchText = strlower(formattedFullName),
                link = string.format("|cff71d5ff|Hspell:%d:0|h[%s]|h|r", spell.id, name),
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
            done(false, self.spellInfoCache[spell.id])
        end)
    end)
end

function wt:SpellInfo(spellId) return self.spellInfoCache[spellId] end

function wt:PetAbility(forName) return self.petAbilities[forName] end

function wt:AllRanks(spellId) return self.idToRanks[spellId] end

-- Item Cache
wt.itemInfoCache = {}
-- for warlock pet tomes, the name includes the rank
-- however, this will cause overlap with the level text and there's no good way to fix it with setting points
-- instead, strip the rank text out of the name and put it as the subText
local parensPattern = " (%(.+%))"
function wt:CacheItem(item, level, done, taughtSpell)
    if (self.itemInfoCache[item.id] ~= nil) then
        done(true)
        return
    end
    local ii = Item:CreateFromItemID(item.itemId)
    ii:ContinueOnItemLoad(function()
        if (self.itemInfoCache[item.id] ~= nil) then
            done(true)
            return
        end
        local rankText = string.match(ii:GetItemName(), parensPattern)
        local ranklessName = string.gsub(ii:GetItemName(), parensPattern, "")
        local rankCacheKey = ranklessName
        if wt.SayaadTomes[item.itemId] then
           rankCacheKey = item.family..ranklessName 
        end
        self.itemInfoCache[item.id] = {
            id = item.id,
            itemId = item.itemId,
            name = ranklessName,
            formattedSubText = rankText,
            icon = ii:GetItemIcon(),
            cost = item.cost,
            formattedCost = GetCoinTextureString(item.cost),
            level = level,
            formattedLevel = format(wt.L.LEVEL_FORMAT, level),
            isItem = true,
            searchText = strlower(ii:GetItemName()),
            formattedFullName = ii:GetItemName(),
            localFamily = item.localFamily,
            family = item.family,
            altIcon = item.altIcon,
            link = ii:GetItemLink(),
            taughtSpell = taughtSpell
        }
        if self.allRanksCache[rankCacheKey] == nil then
            self.allRanksCache[rankCacheKey] = {}
        end
        tinsert(self.allRanksCache[rankCacheKey], item.id)
        self.idToRanks[item.id] = self.allRanksCache[rankCacheKey]
        done(false)
    end)
end

function wt:ItemInfo(itemId) return self.itemInfoCache[itemId] end
