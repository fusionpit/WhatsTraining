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
local WEAPON_AVAILABLE_KEY = "weaponAvailable"
local WEAPON_NEXTLEVEL_KEY = "weaponNextLevel"
local WEAPON_NOTLEVEL_KEY = "weaponNotLevel"
local WEAPON_KNOWN_KEY = "weaponKnown"
local WEAPON_IGNORED_KEY = "weaponIgnored"
local COMINGSOON_FONT_COLOR_CODE = "|cff82c5ff"
local MISSINGTALENT_FONT_COLOR_CODE = "|cffffffff"
local PET_FONT_COLOR_CODE = "|cffffffff"

local learnedSpellEvent = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and "LEARNED_SPELL_IN_SKILL_LINE" or "LEARNED_SPELL_IN_TAB"

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
        key = AVAILABLE_KEY,
        brokerMaxDisplayEntries = 10
    }, {
        name = wt.L.MISSINGREQS_HEADER,
        color = ORANGE_FONT_COLOR_CODE,
        hideLevel = true,
        key = MISSINGREQS_KEY,
        brokerMaxDisplayEntries = 5
    }, {
        name = wt.L.WEAPON_AVAILABLE_HEADER,
        color = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = WEAPON_AVAILABLE_KEY,
        brokerMaxDisplayEntries = 10,
        weaponSort = true
    }, {
        name = wt.L.NEXTLEVEL_HEADER,
        color = COMINGSOON_FONT_COLOR_CODE,
        key = NEXTLEVEL_KEY,
        brokerMaxDisplayEntries = 10
    }, {
        name = wt.L.WEAPON_NEXTLEVEL_HEADER,
        color = COMINGSOON_FONT_COLOR_CODE,
        key = WEAPON_NEXTLEVEL_KEY,
        brokerMaxDisplayEntries = 10,
        weaponSort = true
    }, {
        name = wt.L.NOTLEVEL_HEADER,
        color = RED_FONT_COLOR_CODE,
        key = NOTLEVEL_KEY,
        brokerMaxDisplayEntries = 5
    }, {
        name = wt.L.WEAPON_NOTLEVEL_HEADER,
        color = RED_FONT_COLOR_CODE,
        key = WEAPON_NOTLEVEL_KEY,
        brokerMaxDisplayEntries = 5,
        weaponSort = true
    }, {
        name = wt.L.PET_HEADER,
        color = PET_FONT_COLOR_CODE,
        key = PET_KEY,
        brokerMaxDisplayEntries = 5
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
        name = wt.L.WEAPON_IGNORED_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        costColor = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = WEAPON_IGNORED_KEY,
        weaponSort = true
    }, {
        name = wt.L.IGNORED_PET_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        costColor = GREEN_FONT_COLOR_CODE,
        key = IGNORED_PET_KEY,
        nameSort = true
    }, {
        name = wt.L.KNOWN_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = KNOWN_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        nameSort = true
    }, {
        name = wt.L.WEAPON_KNOWN_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = WEAPON_KNOWN_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        weaponSort = true
    },{
        name = wt.L.KNOWN_PET_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = KNOWN_PET_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        nameSort = true
    }, 
}
local weaponCategoryKeys = {
    [WEAPON_AVAILABLE_KEY] = true,
    [WEAPON_NEXTLEVEL_KEY] = true,
    [WEAPON_NOTLEVEL_KEY] = true,
    [WEAPON_KNOWN_KEY] = true,
    [WEAPON_IGNORED_KEY] = true
}
local function makeCategories(headersDef, isBroker) 
    return {
        _spellsByCategoryKey = {},
        Insert = function(self, key, spellInfo)
            if self._spellsByCategoryKey[key] ~= nil then tinsert(self._spellsByCategoryKey[key], spellInfo) end
        end,
        Initialize = function(self)
            for _, def in ipairs(headersDef) do
                if not isBroker or def.brokerMaxDisplayEntries then
                    local cat = {}
                    for k, v in pairs(def) do cat[k] = v end
                    if isBroker then
                        cat.maxDisplayEntries = def.brokerMaxDisplayEntries
                    end
                    cat.spells = {}
                    self._spellsByCategoryKey[cat.key] = cat.spells
                    cat.formattedName = cat.color and cat.color .. cat.name .. FONT_COLOR_CODE_CLOSE or cat.name
                    cat.isHeader = true
                    tinsert(self, cat)
                end
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
local categories = makeCategories(headers, false)
categories:Initialize()

local brokerCategories = makeCategories(headers, true)
brokerCategories:Initialize()

wt.data = {}
wt.brokerData = {}
wt.filter = ''

wt.spellCategoryData = {}
wt.weaponCategoryData = {}
wt.spellListData = {}
wt.weaponListData = {}
wt.showingWeaponSkills = false
wt.showingBrokerWeaponSkills = false

wt.brokerSpellData = {}
wt.brokerWeaponData = {}

local function matchesFilter(spellOrItem) 
    if wt.filter == '' then return true end
    return strfind(spellOrItem, wt.filter, 1, true)
end

local function byLevelThenName(a, b)
    if a.level == b.level then return a.name < b.name end
    return a.level < b.level
end
local function byNameThenLevel(a, b)
    if a.name == b.name then return a.level < b.level end
    return a.name < b.name
end
local function byWeaponOrder(a, b)
    local orderA = a.weaponOrder or 999
    local orderB = b.weaponOrder or 999
    if orderA == orderB then
        return byLevelThenName(a, b)
    end
    return orderA < orderB
end

local function categorySort(category)
    local sortFunc = category.nameSort and byNameThenLevel or byLevelThenName
    if category.weaponSort then sortFunc = byWeaponOrder end
    sort(category.spells, sortFunc)
end

-- result is stored in wt.categoryData and wt.brokerData
local function buildCategorizedData(playerLevel, isLevelUpEvent)
    categories:ClearSpells()
    brokerCategories:ClearSpells()
    wipe(wt.spellCategoryData)
    wipe(wt.weaponCategoryData)
    wipe(wt.brokerSpellData)
    wipe(wt.brokerWeaponData)
    wt.weaponSkills = {}
    
    local function getSpellLevelColor(spell)
        local effectiveLevel = spell.level
        -- when a player levels up and this is triggered from that event, GetQuestDifficultyColor won't
        -- have the correct player level, it will be off by 1 for whatever reason (just like UnitLevel)
        if isLevelUpEvent then
            effectiveLevel = effectiveLevel - 1
        end
        return GetQuestDifficultyColor(effectiveLevel)
    end

    -- Categorize tomes
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
                    categories:Insert(key, itemInfo)
                    brokerCategories:Insert(key, itemInfo)
                end
            end
        end
    end
    
    local function categorizeGroup(spellGroup, levelGroup)
        for _, spell in ipairs(spellGroup) do
            local spellInfo = wt:SpellInfo(spell.id)
            if spellInfo ~= nil then
                local categoryKey

                if (isAbilityKnown(spellInfo.id)) then
                    categoryKey = wt:IsPetAbility(spellInfo.id) and KNOWN_PET_KEY or KNOWN_KEY
                elseif (ignoreStore:IsIgnored(spellInfo.id)) then
                    categoryKey = wt:IsPetAbility(spellInfo.id) and IGNORED_PET_KEY or IGNORED_KEY
                elseif (wt:IsPetAbility(spellInfo.id)) then
                    categoryKey = PET_KEY
                elseif (spell.requiredTalentId ~= nil and not isAbilityKnown(spell.requiredTalentId)) then
                    categoryKey = MISSINGTALENT_KEY
                elseif levelGroup > playerLevel then
                    categoryKey = levelGroup <= playerLevel + 2 and NEXTLEVEL_KEY or NOTLEVEL_KEY
                else
                    local hasReqs = true
                    if spell.requiredIds ~= nil then
                        for _, reqId in ipairs(spell.requiredIds) do
                            hasReqs = hasReqs and isAbilityKnown(reqId)
                        end
                    end
                    categoryKey = hasReqs and AVAILABLE_KEY or MISSINGREQS_KEY
                end
                
                if categoryKey ~= nil then
                    categories:Insert(categoryKey, spellInfo)
                    brokerCategories:Insert(categoryKey, spellInfo)
                end
            end
        end
    end

    for level, spellsAtLevel in pairs(wt.SpellsByLevel) do
        categorizeGroup(spellsAtLevel, level)
    end
    
    if wt.WeaponSkills then
        for weaponSpellId, weaponData in pairs(wt.WeaponSkills) do
            local isClassEligible = false
            if weaponData.classes then
                for _, class in ipairs(weaponData.classes) do
                    if class == wt.currentClass then
                        isClassEligible = true
                        break
                    end
                end
            else
                isClassEligible = true
            end
            
            if isClassEligible then
                local spellInfo = wt:SpellInfo(weaponSpellId)
                if spellInfo ~= nil then
                    local categoryKey
                    local reqLevel = weaponData.level or 1
                    
                    if (isAbilityKnown(spellInfo.id)) then
                        categoryKey = WEAPON_KNOWN_KEY
                    elseif (ignoreStore:IsIgnored(spellInfo.id)) then
                        categoryKey = WEAPON_IGNORED_KEY
                    elseif reqLevel > playerLevel then
                        categoryKey = reqLevel <= playerLevel + 2 and WEAPON_NEXTLEVEL_KEY or WEAPON_NOTLEVEL_KEY
                    else
                        categoryKey = WEAPON_AVAILABLE_KEY
                    end
                    
                    if categoryKey ~= nil then
                        spellInfo.level = reqLevel
                        spellInfo.weaponOrder = weaponData.orderIndex
                        local englishFaction = UnitFactionGroup("player")
                        if weaponData.trainers and weaponData.trainers[englishFaction] then
                            local trainerZones = {}
                            local seenZones = {}
                            for _, trainer in ipairs(weaponData.trainers[englishFaction]) do
                                if not seenZones[trainer.zone] then
                                    tinsert(trainerZones, {
                                        id = trainer.zone,
                                        icon = wt.cityIconIds[trainer.zone] or trainer.zoneIcon
                                    })
                                    seenZones[trainer.zone] = true
                                end
                            end
                            spellInfo.trainerZones = trainerZones
                            table.sort(spellInfo.trainerZones, function(a, b)
                                return (C_Map.GetAreaInfo(a.id) or "") < (C_Map.GetAreaInfo(b.id) or "")
                            end)
                        end

                        categories:Insert(categoryKey, spellInfo)
                        brokerCategories:Insert(categoryKey, spellInfo)
                        tinsert(wt.weaponSkills, spellInfo)
                    end
                end
            end
        end
    end

    for _, category in ipairs(categories) do
        if #category.spells > 0 then
            categorySort(category)
            local categoryEntry = {
                category = category,
                spells = {},
                totalCost = 0
            }
            
            if category.key == PET_KEY and wt.currentClass == "WARLOCK" then
                -- split by family, then weave sub-headers in
                local byEnglishFamily = {}
                for _, s in ipairs(category.spells) do
                    s.levelColor = getSpellLevelColor(s)
                    s.useAltIcon = false
                    if not byEnglishFamily[s.family] then 
                        byEnglishFamily[s.family] = {localFamily = s.localFamily, cost = 0, spells = {}} 
                    end
                    local familyTable = byEnglishFamily[s.family]
                    tinsert(familyTable.spells, s)
                    familyTable.cost = familyTable.cost + s.cost
                    categoryEntry.totalCost = categoryEntry.totalCost + s.cost
                end
                categoryEntry.byEnglishFamily = byEnglishFamily
            else
                for _, s in ipairs(category.spells) do
                    s.levelColor = getSpellLevelColor(s)
                    s.hideLevel = category.hideLevel
                    s.useAltIcon = wt.currentClass == "WARLOCK"
                    categoryEntry.totalCost = categoryEntry.totalCost + s.cost
                    tinsert(categoryEntry.spells, s)
                end
            end
            
            category.cost = categoryEntry.totalCost
            if weaponCategoryKeys[category.key] then
                tinsert(wt.weaponCategoryData, categoryEntry)
            else
                tinsert(wt.spellCategoryData, categoryEntry)
            end
        end
    end

    local brokerAvailable = 0
    local brokerComing = 0
    for _, category in ipairs(brokerCategories) do
        if #category.spells > 0 then
            category.costFormat = "%s"
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
            
            if weaponCategoryKeys[category.key] then
                tinsert(wt.brokerWeaponData, category)
            else
                tinsert(wt.brokerSpellData, category)
            end
        end
    end

    wt.brokerData = wt.showingBrokerWeaponSkills and wt.brokerWeaponData or wt.brokerSpellData

    local brokerAvailable = 0
    local brokerComing = 0
    local availKey = wt.showingBrokerWeaponSkills and WEAPON_AVAILABLE_KEY or AVAILABLE_KEY
    local nextKey = wt.showingBrokerWeaponSkills and WEAPON_NEXTLEVEL_KEY or NEXTLEVEL_KEY
    for _, category in ipairs(wt.brokerData) do
        if category.key == availKey then brokerAvailable = #category.spells end
        if category.key == nextKey then brokerComing = #category.spells end
    end

    if wt.updateBroker ~= nil then wt.updateBroker(brokerAvailable, brokerComing, wt.showingBrokerWeaponSkills) end
end

local function applyFilter()
    wipe(wt.spellListData)
    wipe(wt.weaponListData)
    
    local function filterCategoryData(categoryData, resultsList)
        for _, categoryEntry in ipairs(categoryData) do
            local category = categoryEntry.category
            local hasMatchingSpells = false
            local filteredSpells = {}
            local filteredCost = 0
            
            if categoryEntry.byEnglishFamily then
                -- Warlock pet abilities - check by family
                local filteredFamilies = {}
                for englishFamily, familyData in pairs(categoryEntry.byEnglishFamily) do
                    local familySpells = {}
                    local familyCost = 0
                    for _, s in ipairs(familyData.spells) do
                        if matchesFilter(s.searchText) then
                            tinsert(familySpells, s)
                            familyCost = familyCost + s.cost
                            hasMatchingSpells = true
                        end
                    end
                    if #familySpells > 0 then
                        filteredFamilies[englishFamily] = {
                            localFamily = familyData.localFamily,
                            cost = familyCost,
                            spells = familySpells
                        }
                        filteredCost = filteredCost + familyCost
                    end
                end
                if hasMatchingSpells then
                    filteredSpells = filteredFamilies
                end
            else
                -- Normal spells
                for _, s in ipairs(categoryEntry.spells) do
                    if matchesFilter(s.searchText) then
                        tinsert(filteredSpells, s)
                        filteredCost = filteredCost + s.cost
                        hasMatchingSpells = true
                    end
                end
            end
            
            if hasMatchingSpells then
                if not (category.key == PET_KEY and wt.currentClass == "WARLOCK") then
                    tinsert(resultsList, category)
                end
                
                -- Add special headers for pet category
                if (category.key == PET_KEY and wt.needsBeastTraining()) then
                    tinsert(resultsList, {
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
                    tinsert(resultsList, {
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
                
                if categoryEntry.byEnglishFamily then
                    -- Warlock pet abilities with family sub-headers
                    for _, englishFamily in ipairs(wt.WarlockPetOrder) do
                        local family = filteredSpells[englishFamily]
                        if family and #family.spells > 0 then
                            tinsert(resultsList, {
                                formattedName = family.localFamily,
                                isHeader = true,
                                cost = family.cost
                            })
                            for _, s in ipairs(family.spells) do
                                if s.isItem then
                                    local taughtSpellId = wt.TomeTaughtSpells[s.itemId]
                                    if taughtSpellId then 
                                        s.tooltipId = taughtSpellId
                                    else
                                        print('no taught spell found for tome', s.itemId)
                                    end
                                end
                                tinsert(resultsList, s)
                            end
                        end
                    end
                else
                    for _, s in ipairs(filteredSpells) do
                        tinsert(resultsList, s)
                    end
                end
                
                category.cost = filteredCost
            end
        end
    end

    filterCategoryData(wt.spellCategoryData, wt.spellListData)
    filterCategoryData(wt.weaponCategoryData, wt.weaponListData)
    
    wt.data = wt.showingWeaponSkills and wt.weaponListData or wt.spellListData
    
    if #wt.data == 0 and wt.filter ~= '' then
        tinsert(wt.data, {
            formattedName = wt.L.SEARCH_NO_RESULTS,
            isHeader = true,
            cost = 0
        })
    end
end

local function rebuildIfNotCached(fromCache)
    if fromCache or wt.MainFrame == nil then return end
    buildCategorizedData(UnitLevel("player"))
    applyFilter()
end

function wt:RebuildData()
    buildCategorizedData(UnitLevel("player"))
    applyFilter()
    if (self.MainFrame and self.MainFrame:IsVisible()) then
        self.Update(self.MainFrame, true)
    end
end

function wt:ApplyFilter()
    applyFilter()
    if (self.MainFrame and self.MainFrame:IsVisible()) then
        self.Update(self.MainFrame, true)
    end
end

function wt:ToggleWeaponSkills()
    self.showingWeaponSkills = not self.showingWeaponSkills
    self.data = self.showingWeaponSkills and self.weaponListData or self.spellListData
    if self.MainFrame and self.MainFrame:IsVisible() then
        wt.UpdateToggleIcon()
        self.Update(self.MainFrame, true)
    end
end

function wt:ToggleBrokerWeaponSkills()
    self.showingBrokerWeaponSkills = not self.showingBrokerWeaponSkills
    self.brokerData = self.showingBrokerWeaponSkills and self.brokerWeaponData or self.brokerSpellData
    -- Trigger broker icon/text update
    local brokerAvailable = 0
    local brokerComing = 0
    local availKey = self.showingBrokerWeaponSkills and WEAPON_AVAILABLE_KEY or AVAILABLE_KEY
    local nextKey = self.showingBrokerWeaponSkills and WEAPON_NEXTLEVEL_KEY or NEXTLEVEL_KEY
    
    for _, category in ipairs(self.brokerData) do
        if category.key == availKey then brokerAvailable = #category.spells end
        if category.key == nextKey then brokerComing = #category.spells end
    end
    if self.updateBroker ~= nil then self.updateBroker(brokerAvailable, brokerComing, self.showingBrokerWeaponSkills) end
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

for weaponSpellId, weaponData in pairs(wt.WeaponSkills) do
    local reqLevel = weaponData.level or 1
    local spellInfo = {id = weaponSpellId, cost = weaponData.cost or 1000}
    wt:CacheSpell(spellInfo, reqLevel, rebuildIfNotCached)
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
            buildCategorizedData(UnitLevel("player"))
            applyFilter()
            wt.CreateFrame()
        end
    elseif event == learnedSpellEvent or event == "PLAYER_LEVEL_UP" then
        local isLevelUp = event == "PLAYER_LEVEL_UP"
        buildCategorizedData(isLevelUp and ... or UnitLevel("player"), isLevelUp)
        applyFilter()
        if (wt.MainFrame and wt.MainFrame:IsVisible()) then
            wt.Update(wt.MainFrame, true)
        end
    elseif event == "PLAYER_EQUIPMENT_CHANGED" then
        local slot, hasCurrent = ...
        if (slot == 16 or slot == 18) and wt.UpdateToggleIcon then wt.UpdateToggleIcon() end
    end
end)
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent(learnedSpellEvent)
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
