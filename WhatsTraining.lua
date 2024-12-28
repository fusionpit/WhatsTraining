local addonName, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local AVAILABLE_KEY = "available"
local MISSINGREQS_KEY = "missingReqs"
local NEXTLEVEL_KEY = "nextLevel"
local NOTLEVEL_KEY = "notLevel"
local MISSINGTALENT_KEY = "missingTalent"
local IGNORED_KEY = "ignored"
local IGNORED_PET_KEY = "ignoredPet"
local KNOWN_KEY = "known"
local KNOWN_PET_KEY = "knownPet"
local PET_KEY = "pet"
local COMINGSOON_FONT_COLOR_CODE = "|cff82c5ff"
local MISSINGTALENT_FONT_COLOR_CODE = "|cffffffff"
local PET_FONT_COLOR_CODE = "|cffffffff"

local function isPreviouslyLearnedAbility(spellId)
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

local function isAbilityKnown(spellId)
    if (IsSpellKnown(spellId) or IsPlayerSpell(spellId) or
        isPreviouslyLearnedAbility(spellId)) then return true end
    if (not wt:IsPetAbility(spellId)) then return false end
    local info = wt:SpellInfo(spellId)

    if info.subText == nil or wt.learnedPetAbilityMap[info.name] == nil then
        return false
    end

    return wt.learnedPetAbilityMap[info.name][info.subText]
end

local headers = {
    {
        name = wt.L.AVAILABLE_HEADER,
        color = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = AVAILABLE_KEY
    }, {
        name = wt.L.MISSINGREQS_HEADER,
        color = ORANGE_FONT_COLOR_CODE,
        hideLevel = true,
        key = MISSINGREQS_KEY
    }, {
        name = wt.L.NEXTLEVEL_HEADER,
        color = COMINGSOON_FONT_COLOR_CODE,
        key = NEXTLEVEL_KEY
    }, {
        name = wt.L.NOTLEVEL_HEADER,
        color = RED_FONT_COLOR_CODE,
        key = NOTLEVEL_KEY
    }, {
        name = wt.L.PET_HEADER,
        color = PET_FONT_COLOR_CODE,
        key = PET_KEY
        -- nameSort = true
    }, {
        name = wt.L.MISSINGTALENT_HEADER,
        color = MISSINGTALENT_FONT_COLOR_CODE,
        key = MISSINGTALENT_KEY,
        nameSort = true
    }, {
        name = wt.L.IGNORED_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        costColor = GREEN_FONT_COLOR_CODE,
        key = IGNORED_KEY,
        nameSort = true
    }, {
        name = wt.L.IGNORED_PET_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        costColor = GREEN_FONT_COLOR_CODE,
        key = IGNORED_PET_KEY,
        nameSort = true
    },{
        name = wt.L.KNOWN_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = KNOWN_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        nameSort = true
    }, {
        name = wt.L.KNOWN_PET_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = KNOWN_PET_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        nameSort = true
    }
}
local function makeCategories(headers) 
    return {
        _spellsByCategoryKey = {},
        Insert = function(self, key, spellInfo)
            if self._spellsByCategoryKey[key] ~= nil then tinsert(self._spellsByCategoryKey[key], spellInfo) end
        end,
        Initialize = function(self)
            for _, cat in ipairs(headers) do
                cat.spells = {}
                self._spellsByCategoryKey[cat.key] = cat.spells
                cat.formattedName = cat.color and cat.color .. cat.name .. FONT_COLOR_CODE_CLOSE or cat.name
                cat.isHeader = true
                tinsert(self, cat)
            end
        end,
        ClearSpells = function(self)
            for _, cat in ipairs(self) do
                cat.cost = 0
                wipe(cat.spells)
            end
        end
    }
end
local categories = makeCategories(headers)
categories:Initialize()

local brokerHeaders = {
    {
        name = wt.L.AVAILABLE_HEADER,
        color = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = AVAILABLE_KEY,
        maxDisplayEntries = 10,
    }, {
        name = wt.L.MISSINGREQS_HEADER,
        color = ORANGE_FONT_COLOR_CODE,
        hideLevel = true,
        key = MISSINGREQS_KEY,
        maxDisplayEntries = 5,
    }, {
        name = wt.L.NEXTLEVEL_HEADER,
        color = COMINGSOON_FONT_COLOR_CODE,
        key = NEXTLEVEL_KEY,
        maxDisplayEntries = 10,
    }, {
        name = wt.L.NOTLEVEL_HEADER,
        color = RED_FONT_COLOR_CODE,
        key = NOTLEVEL_KEY,
        maxDisplayEntries = 5,
    }, {
        name = wt.L.PET_HEADER,
        color = PET_FONT_COLOR_CODE,
        key = PET_KEY,
        maxDisplayEntries = 5,
    }
}
local brokerCategories = makeCategories(brokerHeaders)
brokerCategories:Initialize()

wt.data = {}
wt.brokerData = {}
wt.filter = ''
local function matchesFilter(spellOrItem) 
    if wt.filter == '' then return true end
    return strfind(spellOrItem, wt.filter, 1, true)
end
local warlockPetOrder = {'Imp', 'Voidwalker', 'Succubus', 'Incubus', 'Felhunter'}
local function rebuildData(playerLevel, isLevelUpEvent)
    categories:ClearSpells()
    brokerCategories:ClearSpells()
    wipe(wt.data)
    wipe(wt.brokerData)
    if wt.TomesByLevel then
        for level, tomesAtLevel in pairs(wt.TomesByLevel) do
            for _, tome in ipairs(tomesAtLevel) do
                local itemInfo = wt:ItemInfo(tome.id)
                if itemInfo ~= nil then
                    local key = PET_KEY
                    if wt:IsPetAbilityLearned(tome.id) then
                       key = KNOWN_PET_KEY 
                    elseif ignoreStore:IsIgnored(tome.id) then
                        key = IGNORED_PET_KEY
                    end
                    if matchesFilter(itemInfo.searchText) then
                        categories:Insert(key, itemInfo)
                    end
                    brokerCategories:Insert(key, itemInfo)
                end
            end
        end
    end
    for level, spellsAtLevel in pairs(wt.SpellsByLevel) do
        for _, spell in ipairs(spellsAtLevel) do
            local spellInfo = wt:SpellInfo(spell.id)
            if spellInfo ~= nil then
                local categoryKey

                if (isAbilityKnown(spellInfo.id)) then
                    categoryKey = wt:IsPetAbility(spellInfo.id) and
                                      KNOWN_PET_KEY or KNOWN_KEY
                elseif (ignoreStore:IsIgnored(spellInfo.id)) then
                    categoryKey = wt:IsPetAbility(spellInfo.id) and 
                                      IGNORED_PET_KEY or IGNORED_KEY
                elseif (wt:IsPetAbility(spellInfo.id)) then
                    categoryKey = PET_KEY
                elseif (spell.requiredTalentId ~= nil and
                    not isAbilityKnown(spell.requiredTalentId)) then
                    categoryKey = MISSINGTALENT_KEY
                elseif level > playerLevel then
                    categoryKey = level <= playerLevel + 2 and NEXTLEVEL_KEY or
                                      NOTLEVEL_KEY
                else
                    local hasReqs = true
                    if spell.requiredIds ~= nil then
                        for _, reqId in ipairs(spell.requiredIds) do
                            hasReqs = hasReqs and isAbilityKnown(reqId)
                        end
                    end
                    categoryKey = hasReqs and AVAILABLE_KEY or MISSINGREQS_KEY
                end
                if matchesFilter(spellInfo.searchText) then 
                    categories:Insert(categoryKey, spellInfo)
                end
                brokerCategories:Insert(categoryKey, spellInfo)
            end
        end
    end

    local function byLevelThenName(a, b)
        if a.level == b.level then return a.name < b.name end
        return a.level < b.level
    end
    local function byNameThenLevel(a, b)
        if a.name == b.name then return a.level < b.level end
        return a.name < b.name
    end
    
    local function getSpellLevelColor(spell)
        local effectiveLevel = spell.level
        -- when a player levels up and this is triggered from that event, GetQuestDifficultyColor won't
        -- have the correct player level, it will be off by 1 for whatever reason (just like UnitLevel)
        if isLevelUpEvent then
            effectiveLevel = effectiveLevel - 1
        end
        return GetQuestDifficultyColor(effectiveLevel)
    end
    local function categorySort(category)
        local sortFunc = category.nameSort and byNameThenLevel or byLevelThenName
        sort(category.spells, sortFunc)
    end
    for _, category in ipairs(categories) do
        if #category.spells > 0 then
            tinsert(wt.data, category)
            categorySort(category)
            local totalCost = 0
            if (category.key == PET_KEY and wt.needsBeastTraining()) then
                tinsert(wt.data, {
                    formattedName = ORANGE_FONT_COLOR_CODE ..
                        wt.L.OPEN_BEAST_TRAINING .. FONT_COLOR_CODE_CLOSE,
                    isHeader = true,
                    cost = 0,
                    tooltip = wt.L.CLICK_TO_OPEN,
                    click = function() 
                        if InCombatLockdown() then
                            print(wt.L.OPEN_BEAST_IN_COMBAT)
                        else
                            wt.openBeastTraining()
                        end
                    end
                })
            end
            if WT_ShowLearnedNotice == true and category.key == PET_KEY and wt.currentClass == "WARLOCK" then
                tinsert(wt.data, {
                    formattedName = wt.L.RIGHT_CLICK_LEARNED,
                    isHeader = true,
                    cost = 0,
                    tooltip = wt.L.CLICK_TO_DISMISS,
                    click = function()
                        WT_ShowLearnedNotice = false
                        wt:RebuildData()
                    end
                })
            end
            if category.key == PET_KEY and wt.currentClass == "WARLOCK" then
                -- split by family, then weave sub-headers in
                local byEnglishFamily = {}
                for _, s in ipairs(category.spells) do
                    s.levelColor = getSpellLevelColor(s)
                    -- don't use the alt icon for things in the Pet category
                    s.useAltIcon = false
                    if not byEnglishFamily[s.family] then 
                        byEnglishFamily[s.family] = {localFamily = s.localFamily, cost = 0} 
                    end
                    local familyTable = byEnglishFamily[s.family]
                    tinsert(familyTable, s)
                    familyTable.cost = familyTable.cost + s.cost
                    totalCost = totalCost + s.cost
                end
                for _, englishFamily in ipairs(warlockPetOrder) do
                    local family = byEnglishFamily[englishFamily]
                    if family and #family > 0 then
                        tinsert(wt.data, {
                            formattedName = family.localFamily,
                            isHeader = true,
                            cost = family.cost
                        })
                        for _, s in ipairs(family) do
                            tinsert(wt.data, s)
                        end
                    end
                end
            else
                for _, s in ipairs(category.spells) do
                    s.levelColor = getSpellLevelColor(s)
                    s.hideLevel = category.hideLevel
                    -- warlock succubus/incubus tomes should show the appropriate icon when in the ignored or known categories
                    s.useAltIcon = wt.currentClass == "WARLOCK"
                    totalCost = totalCost + s.cost
                    tinsert(wt.data, s)
                end
            end
            
            category.cost = totalCost
        end
    end
    if #wt.data == 0 and wt.filter ~= '' then
        tinsert(wt.data, {
            formattedName = wt.L.SEARCH_NO_RESULTS,
            isHeader = true,
            cost = 0
        })
    end
    local brokerAvailable = 0
    local brokerComing = 0
    for _, category in ipairs(brokerCategories) do
        if #category.spells > 0 then
            category.costFormat = "%s"
            tinsert(wt.brokerData, category)
            categorySort(category)
            local displayedCost = 0
            local hiddenCost = 0
            local totalCost = 0
            category.displayedSpells = {}
            for _, s in ipairs(category.spells) do
                s.levelColor = getSpellLevelColor(s)
                s.hideLevel = category.hideLevel
                s.costFormat = "%s"
                if #category.displayedSpells < category.maxDisplayEntries then
                    tinsert(category.displayedSpells, s)
                    displayedCost = displayedCost + s.cost
                else
                    hiddenCost = hiddenCost + s.cost
                end
                totalCost = totalCost + s.cost
            end
            category.cost = totalCost
            category.displayed = {cost = displayedCost, costFormat = "%s"}
            category.hidden = {cost = hiddenCost, costFormat = "%s"}
            if category.key == AVAILABLE_KEY then
                brokerAvailable = #category.spells
            end
            if category.key == NEXTLEVEL_KEY then
                brokerComing = #category.spells
            end
        end
    end
    if wt.updateBroker ~= nil then wt.updateBroker(brokerAvailable, brokerComing) end
end
local function rebuildIfNotCached(fromCache)
    if fromCache or wt.MainFrame == nil then return end
    rebuildData(UnitLevel("player"))
end

function wt:RebuildData()
    rebuildData(UnitLevel("player"))
    if (self.MainFrame and self.MainFrame:IsVisible()) then
        self.Update(self.MainFrame, true)
    end
end

function wt.afterPetUpdate()
    WT_NeedsToOpenBeastTraining = false
    wt:RebuildData()
end

function wt.onSpellLearned(name)
    local petAbility = wt:PetAbility(name)
    if petAbility == nil then return end
    if petAbility.subText then
        if wt.learnedPetAbilityMap[petAbility.name] == nil then
            wt.learnedPetAbilityMap[petAbility.name] = {}
        end
        wt.learnedPetAbilityMap[petAbility.name][petAbility.subText] = true
    else
        WT_NeedsToOpenBeastTraining = true
    end
    wt:RebuildData()
end

if wt.TomesByLevel then
    for level, tomesByLevel in pairs(wt.TomesByLevel) do
        for _, tome in ipairs(tomesByLevel) do
            local taughtSpellId = wt.TomeTaughtSpells[tome.itemId]
            if not taughtSpellId then print("NO SPELL ID?", tome.itemId) end
            wt:CacheSpell({
                id = taughtSpellId,
                cost = tome.cost,
            }, level, function(_, spellInfo)
                wt:CacheItem(tome, level, rebuildIfNotCached, spellInfo)
            end)
        end
    end
end
for level, spellsByLevel in pairs(wt.SpellsByLevel) do
    for _, spell in ipairs(spellsByLevel) do
        wt:CacheSpell(spell, level, rebuildIfNotCached)
    end
end

ignoreStore:AddSubscription(function()
    wt:RebuildData()
end)

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == addonName then
        if WT_ShowLearnedNotice == nil then
            WT_ShowLearnedNotice = true
        end
        if WT_ShowIgnoreNotice == nil then
            WT_ShowIgnoreNotice = true
        end
        if WT_IgnoredSpells == nil then
            WT_IgnoredSpells = {}
        end
        ignoreStore:MigrateOrUse(WT_IgnoredSpells)
        if WT_LearnedPetAbilities == nil then
            WT_LearnedPetAbilities = {}
            WT_NeedsToOpenBeastTraining = wt.currentClass == "HUNTER"
        end

        wt.learnedPetAbilityMap = WT_LearnedPetAbilities
        if WT_NeedsToOpenBeastTraining == nil and wt.currentClass == "HUNTER" then
            WT_NeedsToOpenBeastTraining = true
        end
        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_ENTERING_WORLD" then
        local isLogin, isReload = ...
        if isLogin or isReload then
            rebuildData(UnitLevel("player"))
            wt.CreateFrame()
        end
    elseif event == "LEARNED_SPELL_IN_TAB" or event == "PLAYER_LEVEL_UP" then
        local isLevelUp = event == "PLAYER_LEVEL_UP"
        rebuildData(isLevelUp and ... or UnitLevel("player"), isLevelUp)
        if (wt.MainFrame and wt.MainFrame:IsVisible()) then
            wt.Update(wt.MainFrame, true)
        end
    end
end)
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
