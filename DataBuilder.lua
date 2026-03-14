local addonName, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

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

local function getSpellLevelColor(spell, isLevelUpEvent)
    local effectiveLevel = spell.level
    -- when a player levels up and this is triggered from that event, GetQuestDifficultyColor won't
    -- have the correct player level, it will be off by 1 for whatever reason (just like UnitLevel)
    if isLevelUpEvent then
        effectiveLevel = effectiveLevel - 1
    end
    return GetQuestDifficultyColor(effectiveLevel)
end

local function categorizeGroup(spellGroup, levelGroup, playerLevel)
    for _, spell in ipairs(spellGroup) do
        local spellInfo = wt:SpellInfo(spell.id)
        if spellInfo ~= nil then
            local categoryKey

            if (wt.isAbilityKnown(spellInfo.id)) then
                categoryKey = wt:IsPetAbility(spellInfo.id) and wt.KNOWN_PET_KEY or wt.KNOWN_KEY
            elseif (ignoreStore:IsIgnored(spellInfo.id)) then
                categoryKey = wt:IsPetAbility(spellInfo.id) and wt.IGNORED_PET_KEY or wt.IGNORED_KEY
            elseif (wt:IsPetAbility(spellInfo.id)) then
                categoryKey = wt.PET_KEY
            elseif (spell.requiredTalentId ~= nil and not wt.isAbilityKnown(spell.requiredTalentId)) then
                categoryKey = wt.MISSINGTALENT_KEY
            elseif levelGroup > playerLevel then
                categoryKey = levelGroup <= playerLevel + 2 and wt.NEXTLEVEL_KEY or wt.NOTLEVEL_KEY
            else
                local hasReqs = true
                if spell.requiredIds ~= nil then
                    for _, reqId in ipairs(spell.requiredIds) do
                        hasReqs = hasReqs and wt.isAbilityKnown(reqId)
                    end
                end
                categoryKey = hasReqs and wt.AVAILABLE_KEY or wt.MISSINGREQS_KEY
            end
            
            if categoryKey ~= nil then
                wt.categories:Insert(categoryKey, spellInfo)
                wt.brokerCategories:Insert(categoryKey, spellInfo)
            end
        end
    end
end

local function categorizeTomes()
    if not wt.TomesByLevel then return end
    for level, tomesAtLevel in pairs(wt.TomesByLevel) do
        for _, tome in ipairs(tomesAtLevel) do
            local itemInfo = wt:ItemInfo(tome.id)
            if itemInfo ~= nil then
                local key = wt.PET_KEY
                if wt:IsPetAbilityLearned(tome.id) then
                    key = wt.KNOWN_PET_KEY 
                elseif ignoreStore:IsIgnored(tome.id) then
                    key = wt.IGNORED_PET_KEY
                end
                wt.categories:Insert(key, itemInfo)
                wt.brokerCategories:Insert(key, itemInfo)
            end
        end
    end
end

local function categorizeWeaponSkills(playerLevel)
    if not wt.WeaponSkills then return end
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
                
                if (wt.isAbilityKnown(spellInfo.id)) then
                    categoryKey = wt.WEAPON_KNOWN_KEY
                elseif (ignoreStore:IsIgnored(spellInfo.id)) then
                    categoryKey = wt.WEAPON_IGNORED_KEY
                elseif reqLevel > playerLevel then
                    categoryKey = reqLevel <= playerLevel + 2 and wt.WEAPON_NEXTLEVEL_KEY or wt.WEAPON_NOTLEVEL_KEY
                else
                    categoryKey = wt.WEAPON_AVAILABLE_KEY
                end
                
                if categoryKey ~= nil then
                    spellInfo.level = reqLevel
                    spellInfo.weaponOrder = weaponData.orderIndex
                    spellInfo.altTooltipType = "weapon"
                    local englishFaction = UnitFactionGroup("player")
                    if weaponData.trainers and weaponData.trainers[englishFaction] then
                        spellInfo.trainerZones = weaponData[englishFaction .. "TrainerZones"]
                        spellInfo.formattedTrainerZones = weaponData[englishFaction .. "FormattedTrainerZones"]
                    end

                    wt.categories:Insert(categoryKey, spellInfo)
                    wt.brokerCategories:Insert(categoryKey, spellInfo)
                    tinsert(wt.weaponSkills, spellInfo)
                end
            end
        end
    end
end

local function processCategories(isLevelUpEvent)
    for _, category in ipairs(wt.categories) do
        if #category.spells > 0 then
            categorySort(category)
            local categoryEntry = {
                category = category,
                spells = {},
                totalCost = 0
            }
            
            if category.key == wt.PET_KEY and wt.currentClass == "WARLOCK" then
                -- split by family, then weave sub-headers in
                local byEnglishFamily = {}
                for _, s in ipairs(category.spells) do
                    s.levelColor = getSpellLevelColor(s, isLevelUpEvent)
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
                    s.levelColor = getSpellLevelColor(s, isLevelUpEvent)
                    s.hideLevel = category.hideLevel
                    s.useAltIcon = wt.currentClass == "WARLOCK"
                    categoryEntry.totalCost = categoryEntry.totalCost + s.cost
                    tinsert(categoryEntry.spells, s)
                end
            end
            
            category.cost = categoryEntry.totalCost
            if wt.weaponCategoryKeys[category.key] then
                tinsert(wt.weaponCategoryData, categoryEntry)
            else
                tinsert(wt.spellCategoryData, categoryEntry)
            end
        end
    end
end

local function processBrokerCategories(isLevelUpEvent)
    for _, category in ipairs(wt.brokerCategories) do
        if #category.spells > 0 then
            category.costFormat = "%s"
            categorySort(category)
            local displayedCost = 0
            local hiddenCost = 0
            local totalCost = 0
            category.displayedSpells = {}
            for _, s in ipairs(category.spells) do
                s.levelColor = getSpellLevelColor(s, isLevelUpEvent)
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
            
            if wt.weaponCategoryKeys[category.key] then
                tinsert(wt.brokerWeaponData, category)
            else
                tinsert(wt.brokerSpellData, category)
            end
        end
    end
end

function wt.buildCategorizedData(playerLevel, isLevelUpEvent)
    wt.categories:ClearSpells()
    wt.brokerCategories:ClearSpells()
    wipe(wt.spellCategoryData)
    wipe(wt.weaponCategoryData)
    wipe(wt.brokerSpellData)
    wipe(wt.brokerWeaponData)
    wt.weaponSkills = {}
    
    categorizeTomes()

    for level, spellsAtLevel in pairs(wt.SpellsByLevel) do
        categorizeGroup(spellsAtLevel, level, playerLevel)
    end
    
    categorizeWeaponSkills(playerLevel)

    processCategories(isLevelUpEvent)

    processBrokerCategories(isLevelUpEvent)

    wt.brokerData = wt.showingBrokerWeaponSkills and wt.brokerWeaponData or wt.brokerSpellData

    local brokerAvailable = 0
    local brokerComing = 0
    local availKey = wt.showingBrokerWeaponSkills and wt.WEAPON_AVAILABLE_KEY or wt.AVAILABLE_KEY
    local nextKey = wt.showingBrokerWeaponSkills and wt.WEAPON_NEXTLEVEL_KEY or wt.NEXTLEVEL_KEY
    for _, category in ipairs(wt.brokerData) do
        if category.key == availKey then brokerAvailable = #category.spells end
        if category.key == nextKey then brokerComing = #category.spells end
    end

    if wt.updateBroker ~= nil then wt.updateBroker(brokerAvailable, brokerComing, wt.showingBrokerWeaponSkills) end
end

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
            if not (category.key == wt.PET_KEY and wt.currentClass == "WARLOCK") then
                tinsert(resultsList, category)
            end
            
            -- Add special headers for pet category
            if (category.key == wt.PET_KEY and wt.needsBeastTraining()) then
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
            if WT_ShowLearnedNotice == true and category.key == wt.PET_KEY and wt.currentClass == "WARLOCK" then
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

function wt.applyFilter()
    wipe(wt.spellListData)
    wipe(wt.weaponListData)
    
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
