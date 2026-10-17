local _, wt = ...

-- Spell Cache
wt.petAbilities = {}
wt.spellInfoCache = {}
wt.allRanksCache = {}
wt.idToRanks = {}
local pending = 0

function wt.cacheRequestsPending() return pending end

local function trackRequest(done)
    pending = pending + 1
    local finished = false
    local function complete(callback, ...)
        if finished then return end
        finished = true
        -- complete chained requests and rebuilds before announcing idle
        if callback then callback(...) end
        pending = pending - 1
        if pending == 0 and wt.onCacheIdle then wt.onCacheIdle() end
    end
    return function(...) complete(done, ...) end, function() complete() end
end

if wt.currentClass == "WARLOCK" then
    wt.TomeIds = {}
    -- Succubus and Incubus share tomes, but you need to buy them twice to train both
    wt.SayaadTomes = {}
end

-- Not Spell/Item:ContinueOn*Load: Blizzard's SpellEventListener and ItemEventListener are shared with the
-- spellbook and action bars and run every waiting callback in one loop, possibly tainting a whole lotta things
local waiting = { SPELL_DATA_LOAD_RESULT = {}, ITEM_DATA_LOAD_RESULT = {} }
local loader = CreateFrame("Frame")
loader:RegisterEvent("SPELL_DATA_LOAD_RESULT")
loader:RegisterEvent("ITEM_DATA_LOAD_RESULT")
loader:SetScript("OnEvent", function(_, event, id, success)
    local callbacks = waiting[event][id]
    if not callbacks then return end
    waiting[event][id] = nil
    for _, callback in ipairs(callbacks) do callback(success) end
end)
local function continueOnLoad(event, id, isCached, request, callback, failed)
    if isCached(id) then return callback() end
    local onLoad = function(success)
        if success then callback() else failed() end
    end
    local callbacks = waiting[event][id]
    waiting[event][id] = callbacks or { onLoad }
    if callbacks then return tinsert(callbacks, onLoad) end
    -- the load event is synchronous, so register the callback first
    request(id)
end

-- done has params cacheHit: bool, spellInfo
function wt:CacheSpell(spell, level, done)
    local failed
    done, failed = trackRequest(done)
    if (self.spellInfoCache[spell.id] ~= nil) then
        done(true, self.spellInfoCache[spell.id])
        return
    end
    local si = Spell:CreateFromSpellID(spell.id)
    continueOnLoad("SPELL_DATA_LOAD_RESULT", spell.id, C_Spell.IsSpellDataCached, C_Spell.RequestLoadSpellData, function()
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
            local spellName = si:GetSpellName()
            local name = wt.stripRankNumeral(spellName, subText)
            local formattedFullName = (subText and subText ~= "") and format("%s %s", name, formattedSubText) or name
            self.spellInfoCache[spell.id] = {
                id = spell.id,
                name = name,
                subText = subText,
                formattedSubText = formattedSubText,
                icon = C_Spell.GetSpellTexture(spell.id),
                cost = spell.cost,
                quest = spell.quest,
                tooltipType = "spell",
                tooltipId = spell.id,
                formattedCost = C_CurrencyInfo.GetCoinTextureString(spell.cost),
                level = level,
                formattedLevel = format(wt.L.LEVEL_FORMAT, level),
                formattedFullName = formattedFullName,
                searchText = strlower(formattedFullName),
                link = string.format("|cff71d5ff|Hspell:%d:0|h[%s]|h|r", spell.id, spellName),
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
    end, failed)
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
    local failed
    done, failed = trackRequest(done)
    if (self.itemInfoCache[item.id] ~= nil) then
        done(true)
        return
    end
    local ii = Item:CreateFromItemID(item.itemId)
    continueOnLoad("ITEM_DATA_LOAD_RESULT", item.itemId, C_Item.IsItemDataCachedByID, C_Item.RequestLoadItemDataByID, function()
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
            subText = taughtSpell.subText,
            formattedSubText = rankText,
            icon = ii:GetItemIcon(),
            cost = item.cost,
            formattedCost = C_CurrencyInfo.GetCoinTextureString(item.cost),
            level = level,
            formattedLevel = format(wt.L.LEVEL_FORMAT, level),
            tooltipType = "item",
            tooltipId = wt.TomeTaughtSpells[item.itemId],
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
    end, failed)
end

function wt:ItemInfo(itemId) return self.itemInfoCache[itemId] end

-- separate cache for catalog
wt.resolvedSpells = {}
wt.resolvedItems = {}
function wt.ResolveSpell(spellId, done)
    if wt.resolvedSpells[spellId] then return done(wt.resolvedSpells[spellId]) end
    local si = Spell:CreateFromSpellID(spellId)
    continueOnLoad("SPELL_DATA_LOAD_RESULT", spellId, C_Spell.IsSpellDataCached, C_Spell.RequestLoadSpellData, function()
        -- subText can be nil in the load continuation (see CacheSpell)
        RunNextFrame(function()
            if not wt.resolvedSpells[spellId] then
                local subText = si:GetSpellSubtext()
                local spellName = si:GetSpellName()
                wt.resolvedSpells[spellId] = {
                    name = wt.stripRankNumeral(spellName, subText),
                    subText = (subText and subText ~= "") and subText or nil,
                    icon = C_Spell.GetSpellTexture(spellId),
                    link = format("|cff71d5ff|Hspell:%d:0|h[%s]|h|r", spellId, spellName),
                }
            end
            done(wt.resolvedSpells[spellId])
        end)
    end, function() done(nil) end)
end

function wt.ResolveItem(itemId, done)
    if wt.resolvedItems[itemId] then return done(wt.resolvedItems[itemId]) end
    local ii = Item:CreateFromItemID(itemId)
    continueOnLoad("ITEM_DATA_LOAD_RESULT", itemId, C_Item.IsItemDataCachedByID, C_Item.RequestLoadItemDataByID, function()
        if not wt.resolvedItems[itemId] then
            wt.resolvedItems[itemId] = {
                name = (string.gsub(ii:GetItemName(), parensPattern, "")),
                icon = ii:GetItemIcon(),
                link = ii:GetItemLink(),
            }
        end
        done(wt.resolvedItems[itemId])
    end, function() done(nil) end)
end
