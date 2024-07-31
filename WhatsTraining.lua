local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local AVAILABLE_KEY = "available"
local MISSINGREQS_KEY = "missingReqs"
local NEXTLEVEL_KEY = "nextLevel"
local NOTLEVEL_KEY = "notLevel"
local MISSINGTALENT_KEY = "missingTalent"
local IGNORED_KEY = "ignored"
local KNOWN_KEY = "known"
local KNOWN_PET_KEY = "knownPet"
local PET_KEY = "pet"
local COMINGSOON_FONT_COLOR_CODE = "|cff82c5ff"
local MISSINGTALENT_FONT_COLOR_CODE = "|cffffffff"
local PET_FONT_COLOR_CODE = "|cffffffff"

local function isPreviouslyLearnedAbility(spellId)
  if (WT.overriddenSpellsMap == nil or not WT.overriddenSpellsMap[spellId]) then
    return false
  end

  local spellIndex, knownIndex = 0, 0
  for i, otherId in ipairs(WT.overriddenSpellsMap[spellId]) do
    if (otherId == spellId) then spellIndex = i end
    if (IsSpellKnown(otherId) or IsPlayerSpell(otherId)) then
      knownIndex = i
    end
  end
  return spellIndex <= knownIndex
end

local function isAbilityKnown(spellId)
  if (IsSpellKnown(spellId) or IsPlayerSpell(spellId) or
        isPreviouslyLearnedAbility(spellId)) then
    return true
  end
  if (not WT:IsPetAbility(spellId)) then return false end
  local info = WT:SpellInfo(spellId)

  if (info.subText == nil or WT.learnedPetAbilityMap[info.name] == nil) then
    return false
  end

  return WT.learnedPetAbilityMap[info.name][info.subText]
end

local headers = { {
  name = WT.L.AVAILABLE_HEADER,
  color = GREEN_FONT_COLOR_CODE,
  hideLevel = true,
  key = AVAILABLE_KEY
}, {
  name = WT.L.MISSINGREQS_HEADER,
  color = ORANGE_FONT_COLOR_CODE,
  hideLevel = true,
  key = MISSINGREQS_KEY
}, {
  name = WT.L.NEXTLEVEL_HEADER,
  color = COMINGSOON_FONT_COLOR_CODE,
  key = NEXTLEVEL_KEY
}, {
  name = WT.L.NOTLEVEL_HEADER,
  color = RED_FONT_COLOR_CODE,
  key = NOTLEVEL_KEY
}, {
  name = WT.L.PET_HEADER,
  color = PET_FONT_COLOR_CODE,
  key = PET_KEY
}, {
  name = WT.L.MISSINGTALENT_HEADER,
  color = MISSINGTALENT_FONT_COLOR_CODE,
  key = MISSINGTALENT_KEY,
  nameSort = true
}, {
  name = WT.L.IGNORED_HEADER,
  color = LIGHTYELLOW_FONT_COLOR_CODE,
  costFormat = WT.L.TOTALSAVINGS_FORMAT,
  key = IGNORED_KEY,
  nameSort = true
}, {
  name = WT.L.KNOWN_HEADER,
  color = GRAY_FONT_COLOR_CODE,
  hideLevel = true,
  key = KNOWN_KEY,
  nameSort = true
}, {
  name = WT.L.KNOWN_PET_HEADER,
  color = GRAY_FONT_COLOR_CODE,
  hideLevel = true,
  key = KNOWN_PET_KEY,
  nameSort = true
} }

local categories = {
  _spellsByCategoryKey = {},
  Insert = function(self, key, spellInfo)
    tinsert(self._spellsByCategoryKey[key], spellInfo)
  end,
  Initialize = function(self)
    for _, cat in ipairs(headers) do
      cat.spells = {}
      self._spellsByCategoryKey[cat.key] = cat.spells
      -- cat.formattedName = cat.color .. cat.name .. FONT_COLOR_CODE_CLOSE
      cat.formattedName = cat.name .. FONT_COLOR_CODE_CLOSE
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
categories:Initialize()

WT.data = {}
local function rebuildData(playerLevel, isLevelUpEvent)
  categories:ClearSpells()
  wipe(WT.data)
  if (WT.TomesByLevel) then
    for _, tomesAtLevel in pairs(WT.TomesByLevel) do
      for _, tome in ipairs(tomesAtLevel) do
        local itemInfo = WT:ItemInfo(tome.id)
        if (itemInfo ~= nil) then
          local key = WT.learnedPetAbilityMap[tome.id] and
              KNOWN_PET_KEY or PET_KEY
          if ignoreStore:IsIgnored(tome.id) then
            key = IGNORED_KEY
          end
          categories:Insert(key, itemInfo)
        end
      end
    end
  end
  for level, spellsAtLevel in pairs(WT.SpellsByLevel) do
    for _, spell in ipairs(spellsAtLevel) do
      local spellInfo = WT:SpellInfo(spell.id)
      if (spellInfo ~= nil) then
        local categoryKey

        if (isAbilityKnown(spellInfo.id)) then
          categoryKey = WT:IsPetAbility(spellInfo.id) and
              KNOWN_PET_KEY or KNOWN_KEY
        elseif (ignoreStore:IsIgnored(spellInfo.id)) then
          categoryKey = IGNORED_KEY
        elseif (WT:IsPetAbility(spellInfo.id)) then
          categoryKey = PET_KEY
        elseif (spell.requiredTalentId ~= nil and
              not isAbilityKnown(spell.requiredTalentId)) then
          categoryKey = MISSINGTALENT_KEY
        elseif (level > playerLevel) then
          categoryKey = level <= playerLevel + 2 and NEXTLEVEL_KEY or
              NOTLEVEL_KEY
        else
          local hasReqs = true
          if (spell.requiredIds ~= nil) then
            for _, reqId in ipairs(spell.requiredIds) do
              hasReqs = hasReqs and isAbilityKnown(reqId)
            end
          end
          categoryKey = hasReqs and AVAILABLE_KEY or MISSINGREQS_KEY
        end
        if (categoryKey ~= nil) then
          categories:Insert(categoryKey, spellInfo)
        end
      end
    end
  end

  local function byLevelThenName(a, b)
    if (a.level == b.level) then return a.name < b.name end
    return a.level < b.level
  end
  local function byNameThenLevel(a, b)
    if (a.name == b.name) then return a.level < b.level end
    return a.name < b.name
  end
  if WT_ShowIgnoreNotice == true then
    tinsert(WT.data, {
      formattedName = WT.L.NEW_IGNORE_FEATURE,
      isHeader = true,
      cost = 0,
      tooltip = WT.L.CLICK_TO_DISMISS,
      click = function()
        WT_ShowIgnoreNotice = false
        WT:RebuildData()
      end
    })
  end
  for _, category in ipairs(categories) do
    local totalCategorySpells = TableLength(category.spells)
    if (totalCategorySpells > 0) then
      tinsert(WT.data, category)
      local sortFunc = category.nameSort and byNameThenLevel or
          byLevelThenName
      sort(category.spells, sortFunc)
      local totalCost = 0
      if (category.key == PET_KEY and WT_NeedsToOpenBeastTraining == true) then
        tinsert(WT.data, {
          formattedName = ORANGE_FONT_COLOR_CODE ..
              WT.L.OPEN_BEAST_TRAINING .. FONT_COLOR_CODE_CLOSE,
          isHeader = true,
          cost = 0,
          tooltip = WT.L.CLICK_TO_OPEN,
          click = function() CastSpellByID(5149) end
        })
      end
      if (WT_ShowLearnedNotice == true and category.key == PET_KEY and WT.currentClass == "WARLOCK") then
        tinsert(WT.data, {
          formattedName = WT.L.RIGHT_CLICK_LEARNED,
          isHeader = true,
          cost = 0,
          tooltip = WT.L.CLICK_TO_DISMISS,
          click = function()
            WT_ShowLearnedNotice = false
            WT:RebuildData()
          end
        })
      end
      for _, s in ipairs(category.spells) do
        local effectiveLevel = s.level
        -- when a player levels up and this is triggered from that event, GetQuestDifficultyColor won't
        -- have the correct player level, it will be off by 1 for whatever reason (just like UnitLevel)
        if (isLevelUpEvent) then
          effectiveLevel = effectiveLevel - 1
        end
        s.levelColor = GetQuestDifficultyColor(effectiveLevel)
        s.hideLevel = category.hideLevel
        totalCost = totalCost + s.cost
        tinsert(WT.data, s)
      end
      category.cost = totalCost
    end
  end
  if (WT.MainFrame == nil) then return end
end
local function rebuildIfNotCached(fromCache)
  if (fromCache or WT.MainFrame == nil) then return end
  rebuildData(UnitLevel("player"))
end

function WT:RebuildData()
  rebuildData(UnitLevel("player"))
  if (self.MainFrame and self.MainFrame:IsVisible()) then
    self.Update(self.MainFrame, true)
  end
end

function WT.afterPetUpdate()
  WT_NeedsToOpenBeastTraining = false
  WT:RebuildData()
end

function WT.onSpellLearned(name)
  local petAbility = WT:PetAbility(name)
  if (petAbility == nil) then return end
  if (petAbility.subText) then
    if (WT.learnedPetAbilityMap[petAbility.name] == nil) then
      WT.learnedPetAbilityMap[petAbility.name] = {}
    end
    WT.learnedPetAbilityMap[petAbility.name][petAbility.subText] = true
  else
    WT_NeedsToOpenBeastTraining = true
  end
  WT:RebuildData()
end

if (WT.TomesByLevel) then
  for level, tomesByLevel in pairs(WT.TomesByLevel) do
    for _, tome in ipairs(tomesByLevel) do
      WT:CacheItem(tome, level, rebuildIfNotCached)
    end
  end
end
for level, spellsByLevel in pairs(WT.SpellsByLevel) do
  for _, spell in ipairs(spellsByLevel) do
    DEFAULT_CHAT_FRAME:AddMessage(spell.id)
    -- WT:CacheSpell(spell, level, rebuildIfNotCached)
  end
end

ignoreStore:AddSubscription(function()
  WT:RebuildData()
end)

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript("OnEvent", function(self, event, other)
  if (event == "ADDON_LOADED" and other == addonName) then
    if (WT_ShowLearnedNotice == nil) then
      WT_ShowLearnedNotice = true
    end
    if (WT_ShowIgnoreNotice == nil) then
      WT_ShowIgnoreNotice = true
    end
    if (WT_IgnoredSpells == nil) then
      WT_IgnoredSpells = {}
    end
    ignoreStore:MigrateOrUse(WT_IgnoredSpells)
    -- WT.ignoredSpells = WT_IgnoredSpells
    if (WT_LearnedPetAbilities == nil) then
      WT_LearnedPetAbilities = {}
      WT_NeedsToOpenBeastTraining = WT.currentClass == "HUNTER"
    end

    WT.learnedPetAbilityMap = WT_LearnedPetAbilities
    if (WT_NeedsToOpenBeastTraining == nil and WT.currentClass == "HUNTER") then
      WT_NeedsToOpenBeastTraining = true
    end
    self:UnregisterEvent("ADDON_LOADED")
  elseif (event == "PLAYER_ENTERING_WORLD") then
    local isLogin, isReload = other
    if (isLogin or isReload) then
      rebuildData(UnitLevel("player"))
      WT.CreateFrame()
    end
  elseif (event == "LEARNED_SPELL_IN_TAB" or event == "PLAYER_LEVEL_UP") then
    local isLevelUp = event == "PLAYER_LEVEL_UP"
    rebuildData(isLevelUp and other or UnitLevel("player"), isLevelUp)
    if (WT.MainFrame and WT.MainFrame:IsVisible()) then
      WT.Update(WT.MainFrame, true)
    end
  end
end)
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")

-- if (WT.currentClass == "WARLOCK") then
--     local scan = CreateFrame("GameTooltip", "WTWarlockTomeScanningTooltip", nil,
--                              "GameTooltipTemplate")
--     scan:SetOwner(UIParent, "ANCHOR_NONE")
--     local requiresLevelPattern = SPELL_REQUIRED_FORM .. '?'
--     local function isKnown(merchantIndex)
--         scan:ClearLines()
--         local link = GetMerchantItemLink(merchantIndex)
--         if (not link) then return false end
--         scan:SetHyperlink(link)
--         local lines = scan:NumLines()
--         for i = lines, 1, -1 do
--             local text =
--                 _G['WTWarlockTomeScanningTooltipTextLeft' .. i]:GetText()
--             -- the "Requires Level x" line is above the "Already Known" line
--             -- we can stop searching when we hit it
--             if (string.match(text, requiresLevelPattern)) then
--                 return false
--             end
--             if (text == ITEM_SPELL_KNOWN) then return true end
--         end
--         return false
--     end

--     local tomeMerchantIds = {
--         [5520] = true,
--         [5753] = true,
--         [1277] = true,
--         [6027] = true,
--         [6374] = true,
--         [6373] = true,
--         [6376] = true,
--         [1280] = true,
--         [5749] = true,
--         [5750] = true,
--         [6382] = true,
--         [5815] = true,
--         [6328] = true
--     }
--     local function updateMerchantFrame()
--         if (IsAddOnLoaded('GrimoireKeeper')) then return end
--         local guid = UnitGUID("npc")
--         if (guid == nil) then return end
--         local npcId = select(6, strsplit("-", guid))
--         if (npcId == nil) then return end
--         npcId = tonumber(npcId)
--         if (not tomeMerchantIds[npcId]) then return end

--         local numMerchantItems = GetMerchantNumItems();
--         for i = 1, MERCHANT_ITEMS_PER_PAGE do
--             local index =
--                 (((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i);
--             local itemButton = _G["MerchantItem" .. i .. "ItemButton"];
--             local merchantButton = _G["MerchantItem" .. i];
--             if (index <= numMerchantItems) then
--                 local merchantItemID = GetMerchantItemID(index)
--                 if (WT.TomeIds[merchantItemID]) then
--                     if (WT.learnedPetAbilityMap[merchantItemID] == nil) then
--                         if (isKnown(index)) then
--                             WT.learnedPetAbilityMap[merchantItemID] = true
--                         end
--                     end
--                 end
--                 if (WT.learnedPetAbilityMap[merchantItemID]) then
--                     SetItemButtonNameFrameVertexColor(merchantButton, 0.5, 0, 0);
--                     SetItemButtonSlotVertexColor(merchantButton, 0.5, 0, 0);
--                     SetItemButtonTextureVertexColor(itemButton, 0.5, 0, 0);
--                     SetItemButtonNormalTextureVertexColor(itemButton, 0.5, 0, 0);
--                 end
--             end

--         end
--     end
--     hooksecurefunc("MerchantFrame_UpdateMerchantInfo", updateMerchantFrame)
-- end

-- if (WT.currentClass == "HUNTER") then
--     local petAbilityUpdateFrame = CreateFrame("Frame")
--     petAbilityUpdateFrame:SetScript("OnEvent", function()
--         -- Beast training should always have at least one craft, and
--         -- display skill line should always return nil for beast training
--         local numCrafts = GetNumCrafts()
--         if (numCrafts == 0 or GetCraftDisplaySkillLine()) then return end
--         for i = 1, numCrafts do
--             local name, rank = GetCraftInfo(i)
--             if (WT.learnedPetAbilityMap[name] == nil) then
--                 WT.learnedPetAbilityMap[name] = {}
--             end
--             -- some locales may not provide a rank, need more investigation
--             if (rank ~= nil) then
--                 WT.learnedPetAbilityMap[name][rank] = true
--             end
--         end
--         WT.afterPetUpdate()
--     end)
--     petAbilityUpdateFrame:RegisterEvent("CRAFT_UPDATE")
--     petAbilityUpdateFrame:RegisterEvent("SPELLS_CHANGED")

--     local learnedSpellMatchPattern = string.gsub(ERR_LEARN_SPELL_S, "%%s",
--                                                  "(.+)")
--     local petChatParserFrame = CreateFrame("Frame")
--     petChatParserFrame:SetScript("OnEvent", function(_, _, ...)
--         local matchedSpellName = string.match(select(1, ...),
--                                               learnedSpellMatchPattern)
--         if (matchedSpellName ~= nil) then
--             WT.onSpellLearned(matchedSpellName)
--         end
--     end)
--     petChatParserFrame:RegisterEvent("CHAT_MSG_SYSTEM")
-- end