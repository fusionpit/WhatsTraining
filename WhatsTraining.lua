local addonName, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local learnedSpellEvent = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and "LEARNED_SPELL_IN_SKILL_LINE" or "LEARNED_SPELL_IN_TAB"

local function rebuildIfNotCached(fromCache)
    if fromCache or wt.MainFrame == nil then return end
    wt.buildCategorizedData(UnitLevel("player"))
    wt.applyFilter()
end

function wt:RebuildData()
    wt.buildCategorizedData(UnitLevel("player"))
    wt.applyFilter()
    if (self.MainFrame and self.MainFrame:IsVisible()) then
        self.Update(self.MainFrame, true)
    end
end

function wt:ApplyFilter()
    wt.applyFilter()
    if (self.MainFrame and self.MainFrame:IsVisible()) then
        self.Update(self.MainFrame, true)
    end
end

function wt:ToggleWeaponSkills()
    self.showingWeaponSkills = not self.showingWeaponSkills
    self.data = self.showingWeaponSkills and self.weaponListData or self.spellListData
    if self.MainFrame and self.MainFrame:IsVisible() then
        wt.UpdateToggleIcon(self.MainFrame)
        self.Update(self.MainFrame, true)
    end
end

function wt:ToggleBrokerWeaponSkills()
    self.showingBrokerWeaponSkills = not self.showingBrokerWeaponSkills
    self.brokerData = self.showingBrokerWeaponSkills and self.brokerWeaponData or self.brokerSpellData
    -- Trigger broker icon/text update
    local brokerAvailable = 0
    local brokerComing = 0
    local availKey = self.showingBrokerWeaponSkills and wt.WEAPON_AVAILABLE_KEY or wt.AVAILABLE_KEY
    local nextKey = self.showingBrokerWeaponSkills and wt.WEAPON_NEXTLEVEL_KEY or wt.NEXTLEVEL_KEY
    
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
            if wt.buildWeaponTrainerZones then
                wt.buildWeaponTrainerZones()
                wt.buildWeaponTrainerZones = nil
            end
            wt.buildCategorizedData(UnitLevel("player"))
            wt.applyFilter()
            wt.CreateFrame()
        end
    elseif event == learnedSpellEvent or event == "PLAYER_LEVEL_UP" then
        local isLevelUp = event == "PLAYER_LEVEL_UP"
        wt.buildCategorizedData(isLevelUp and ... or UnitLevel("player"), isLevelUp)
        wt.applyFilter()
        if (wt.MainFrame and wt.MainFrame:IsVisible()) then
            wt.Update(wt.MainFrame, true)
        end
    elseif event == "PLAYER_EQUIPMENT_CHANGED" then
        local slot, hasCurrent = ...
        if (slot == 16 or slot == 18) and wt.UpdateToggleIcon and wt.MainFrame then wt.UpdateToggleIcon(wt.MainFrame) end
    elseif event == "SKILL_LINES_CHANGED" then
        wt.buildCategorizedData(UnitLevel("player"))
        wt.applyFilter()
        if (wt.MainFrame and wt.MainFrame:IsVisible()) then
            wt.Update(wt.MainFrame, true)
        end
    end
end)
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent(learnedSpellEvent)
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("SKILL_LINES_CHANGED")
eventFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
