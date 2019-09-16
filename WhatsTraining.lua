local addonName, wt = ...

local _G = _G
local GetCoinTextureString = GetCoinTextureString
local GetMoney = GetMoney
local GetFileIDFromPath = GetFileIDFromPath
local GetSpellInfo = GetSpellInfo
local GetQuestDifficultyColor = GetQuestDifficultyColor
local IsSpellKnown = IsSpellKnown
local IsPlayerSpell = IsPlayerSpell
local UnitLevel = UnitLevel
local FauxScrollFrame_Update = FauxScrollFrame_Update
local FauxScrollFrame_GetOffset = FauxScrollFrame_GetOffset
local FauxScrollFrame_OnVerticalScroll = FauxScrollFrame_OnVerticalScroll
local CreateFrame = CreateFrame
local tinsert = tinsert
local format = format
local hooksecurefunc = hooksecurefunc
local wipe = wipe
local sort = sort
local select = select
local ipairs = ipairs
local pairs = pairs
local Spell = Spell
local Item = Item
local MAX_SKILLLINE_TABS = MAX_SKILLLINE_TABS
local GREEN_FONT_COLOR_CODE = GREEN_FONT_COLOR_CODE
local ORANGE_FONT_COLOR_CODE = ORANGE_FONT_COLOR_CODE
local RED_FONT_COLOR_CODE = RED_FONT_COLOR_CODE
local LIGHTYELLOW_FONT_COLOR_CODE = LIGHTYELLOW_FONT_COLOR_CODE
local GRAY_FONT_COLOR_CODE = GRAY_FONT_COLOR_CODE
local FONT_COLOR_CODE_CLOSE = FONT_COLOR_CODE_CLOSE
local HIGHLIGHT_FONT_COLOR_CODE = HIGHLIGHT_FONT_COLOR_CODE
local PARENS_TEMPLATE = PARENS_TEMPLATE
local BOOKTYPE_SPELL = BOOKTYPE_SPELL

local MAX_ROWS = 22
local ROW_HEIGHT = 14
local SKILL_LINE_TAB = MAX_SKILLLINE_TABS - 1
local HIGHLIGHT_TEXTURE_FILEID = GetFileIDFromPath("Interface\\AddOns\\WhatsTraining\\highlight")
local LEFT_BG_TEXTURE_FILEID = GetFileIDFromPath("Interface\\AddOns\\WhatsTraining\\left")
local RIGHT_BG_TEXTURE_FILEID = GetFileIDFromPath("Interface\\AddOns\\WhatsTraining\\right")
local TAB_TEXTURE_FILEID = GetFileIDFromPath("Interface\\Icons\\INV_Misc_QuestionMark")
local AVAILABLE_KEY = "available"
local MISSINGREQS_KEY = "missingReqs"
local NEXTLEVEL_KEY = "nextLevel"
local NOTLEVEL_KEY = "notLevel"
local MISSINGTALENT_KEY = "missingTalent"
local IGNORED_KEY = "ignored"
local KNOWN_KEY = "known"
local PET_KEY = "pet"
local COMINGSOON_FONT_COLOR_CODE = "|cff82c5ff"
local MISSINGTALENT_FONT_COLOR_CODE = "|cffffffff"
local PET_FONT_COLOR_CODE = "|cffffffff"

local function isPreviouslyLearnedAbility(spellId)
    if (wt.previousAbilityMap == nil or not wt.previousAbilityMap[spellId]) then
        return false
    end

    if (not wt.previousAbilityMap[spellId]) then
        return false
    end
    local spellIndex, knownIndex = 0, 0
    for i, otherId in ipairs(wt.previousAbilityMap[spellId]) do
        if (otherId == spellId) then
            spellIndex = i
        end
        if (IsSpellKnown(otherId) or IsPlayerSpell(otherId)) then
            knownIndex = i
        end
    end
    return spellIndex <= knownIndex
end


local function isAbilityKnown(spellId)
    if (IsSpellKnown(spellId) or IsPlayerSpell(spellId) or isPreviouslyLearnedAbility(spellId)) then
        return true
    end
end

local spellInfoCache = {}
-- done has param cacheHit
local function getSpellInfo(spell, level, done)
    if (spellInfoCache[spell.id] ~= nil) then
        done(true)
        return
    end
    local si = Spell:CreateFromSpellID(spell.id)
    si:ContinueOnSpellLoad(
        function()
            if (spellInfoCache[spell.id] ~= nil) then
                done(true)
                return
            end
            local subText = si:GetSpellSubtext()
            local formattedSubText = (subText and subText ~= "") and format(PARENS_TEMPLATE, subText) or ""
            spellInfoCache[spell.id] = {
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
            done(false)
        end
    )
end
local itemInfoCache = {}
-- for warlock pet tomes, the name includes the rank
-- however, this will cause overlap with the level text and there's no good way to fix it with setting points
-- instead, strip the rank text out of the name and put it as the subText
local parensPattern = " (%(.+%))"
local function getItemInfo(item, level, done)
    if (itemInfoCache[item.id] ~= nil) then
        done(true)
        return
    end
    local ii = Item:CreateFromItemID(item.id)
    ii:ContinueOnItemLoad(
        function()
            if (itemInfoCache[item.id] ~= nil) then
                done(true)
                return
            end
            local rankText = string.match(ii:GetItemName(), parensPattern)
            itemInfoCache[item.id] = {
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
        end
    )
end

local function isIgnoredByCTP(spellId)
    return wt.ctpDb ~= nil and wt.ctpDb[spellId]
end

local headers = {
    {
        name = wt.L.AVAILABLE_HEADER,
        color = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = AVAILABLE_KEY
    },
    {
        name = wt.L.MISSINGREQS_HEADER,
        color = ORANGE_FONT_COLOR_CODE,
        hideLevel = true,
        key = MISSINGREQS_KEY
    },
    {
        name = wt.L.NEXTLEVEL_HEADER,
        color = COMINGSOON_FONT_COLOR_CODE,
        key = NEXTLEVEL_KEY
    },
    {
        name = wt.L.NOTLEVEL_HEADER,
        color = RED_FONT_COLOR_CODE,
        key = NOTLEVEL_KEY
    },
    {
        name = wt.L.PET_HEADER,
        color = PET_FONT_COLOR_CODE,
        key = PET_KEY
        --nameSort = true
    },
    {
        name = wt.L.MISSINGTALENT_HEADER,
        color = MISSINGTALENT_FONT_COLOR_CODE,
        key = MISSINGTALENT_KEY,
        nameSort = true
    },
    {
        name = wt.L.IGNORED_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        key = IGNORED_KEY,
        nameSort = true
    },
    {
        name = wt.L.KNOWN_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = KNOWN_KEY,
        nameSort = true
    }
}

local categories = {
    _spellsByCategoryKey = {},
    Insert = function(self, key, spellInfo)
        tinsert(self._spellsByCategoryKey[key], spellInfo)
    end,
    Initialize = function(self)
        for _, cat in ipairs(headers) do
            cat.spells = {}
            self._spellsByCategoryKey[cat.key] = cat.spells
            cat.formattedName = cat.color .. cat.name .. FONT_COLOR_CODE_CLOSE
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

local spellsAndHeaders = {}
local function rebuildSpells(playerLevel, isLevelUpEvent)
    categories:ClearSpells()
    wipe(spellsAndHeaders)
    if (wt.TomesByLevel) then
        for _, tomesAtLevel in pairs(wt.TomesByLevel) do
            for _, tome in ipairs(tomesAtLevel) do
                local itemInfo = itemInfoCache[tome.id]
                if (itemInfo ~= nil) then
                    categories:Insert(PET_KEY, itemInfo)
                end
            end
        end
    end
    for level, spellsAtLevel in pairs(wt.SpellsByLevel) do
        for _, spell in ipairs(spellsAtLevel) do
            local spellInfo = spellInfoCache[spell.id]
            if (spellInfo ~= nil) then
                local categoryKey

                if (isAbilityKnown(spellInfo.id)) then
                    categoryKey = KNOWN_KEY
                elseif (isIgnoredByCTP(spellInfo.id)) then
                    categoryKey = IGNORED_KEY
                elseif (wt.IsPetSpell and wt.IsPetSpell(spellInfo.id)) then
                    -- there's no good way to handle pet spells, since IsSpellKnown(id, true) will return true only if the
                    -- current active pet has that spell, and IsSpellKnown(petSpellId) always returns false
                    categoryKey = PET_KEY
                elseif
                    -- talent abilities for non-mana users don't have multiple ranks in the spellbook
                    (spell.requiredTalentId ~= nil and
                        (not IsSpellKnown(spell.requiredTalentId) and not IsPlayerSpell(spell.requiredTalentId) and
                            not isPreviouslyLearnedAbility(spell.requiredTalentId)))
                 then
                    categoryKey = MISSINGTALENT_KEY
                elseif (level > playerLevel) then
                    categoryKey = level <= playerLevel + 2 and NEXTLEVEL_KEY or NOTLEVEL_KEY
                else
                    local hasReqs = true
                    if (spell.requiredIds ~= nil) then
                        for j = 1, #spell.requiredIds do
                            local reqId = spell.requiredIds[j]
                            hasReqs =
                                hasReqs and
                                (IsSpellKnown(reqId) or IsPlayerSpell(reqId) or isPreviouslyLearnedAbility(reqId))
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
        if (a.level == b.level) then
            return a.name < b.name
        end
        return a.level < b.level
    end
    local function byNameThenLevel(a, b)
        if (a.name == b.name) then
            return a.level < b.level
        end
        return a.name < b.name
    end
    for _, category in ipairs(categories) do
        if (#category.spells > 0) then
            tinsert(spellsAndHeaders, category)
            local sortFunc = category.nameSort and byNameThenLevel or byLevelThenName
            sort(category.spells, sortFunc)
            local totalCost = 0
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
                tinsert(spellsAndHeaders, s)
            end
            category.cost = totalCost
        end
    end
    if (wt.MainFrame == nil) then
        return
    end
end
local function rebuildIfNotCached(fromCache)
    if (fromCache or wt.MainFrame == nil) then
        return
    end
    rebuildSpells(UnitLevel("player"))
end

if (wt.TomesByLevel) then
    for level, tomesByLevel in pairs(wt.TomesByLevel) do
        for _, tome in ipairs(tomesByLevel) do
            getItemInfo(tome, level, rebuildIfNotCached)
        end
    end
end
for level, spellsByLevel in pairs(wt.SpellsByLevel) do
    for _, spell in ipairs(spellsByLevel) do
        getSpellInfo(spell, level, rebuildIfNotCached)
    end
end
rebuildSpells(UnitLevel("player"))

local tooltip = CreateFrame("GameTooltip", "WhatsTrainingTooltip", UIParent, "GameTooltipTemplate")
function wt.SetTooltip(spellInfo)
    if (spellInfo.isItem) then
        tooltip:SetItemByID(spellInfo.id)
    elseif (spellInfo.id) then
        tooltip:SetSpellByID(spellInfo.id)
    else
        tooltip:ClearLines()
    end
    local coloredCoinString = spellInfo.formattedCost or GetCoinTextureString(spellInfo.cost)
    if (GetMoney() < spellInfo.cost) then
        coloredCoinString = RED_FONT_COLOR_CODE .. coloredCoinString .. FONT_COLOR_CODE_CLOSE
    end
    local formatString = spellInfo.isHeader and (spellInfo.costFormat or wt.L.TOTALCOST_FORMAT) or wt.L.COST_FORMAT

    tooltip:AddLine(HIGHLIGHT_FONT_COLOR_CODE .. format(formatString, coloredCoinString) .. FONT_COLOR_CODE_CLOSE)
    tooltip:Show()
end

function wt.SetRowSpell(row, spell)
    if (spell == nil) then
        row.currentSpell = nil
        row:Hide()
        return
    elseif (spell.isHeader) then
        row.spell:Hide()
        row.header:Show()
        row.header:SetText(spell.formattedName)
        row:SetID(0)
        row.highlight:SetTexture(nil)
    elseif (spell ~= nil) then
        local rowSpell = row.spell
        row.header:Hide()
        row.isHeader = false
        row.highlight:SetTexture(HIGHLIGHT_TEXTURE_FILEID)
        rowSpell:Show()
        rowSpell.label:SetText(spell.name)
        rowSpell.subLabel:SetText(spell.formattedSubText)
        if (not spell.hideLevel) then
            rowSpell.level:Show()
            rowSpell.level:SetText(spell.formattedLevel)
            local color = spell.levelColor
            rowSpell.level:SetTextColor(color.r, color.g, color.b)
        else
            rowSpell.level:Hide()
        end
        row:SetID(spell.id)
        rowSpell.icon:SetTexture(spell.icon)
    end
    row.currentSpell = spell
    if (tooltip:IsOwned(row)) then
        wt.SetTooltip(spell)
    end
    row:Show()
end

-- When holding down left mouse on the slider knob, it will keep firing update even though
-- the offset hasn't changed so this will help throttle that
local lastOffset = -1
function wt.Update(frame, forceUpdate)
    local scrollBar = frame.scrollBar
    local offset = FauxScrollFrame_GetOffset(scrollBar)
    if (offset == lastOffset and not forceUpdate) then
        return
    end
    for i, row in ipairs(frame.rows) do
        local spellIndex = i + offset
        local spell = spellsAndHeaders[spellIndex]
        wt.SetRowSpell(row, spell)
    end
    FauxScrollFrame_Update(
        wt.MainFrame.scrollBar,
        #spellsAndHeaders,
        MAX_ROWS,
        ROW_HEIGHT,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        true
    )
    lastOffset = offset
end

local hasFrameShown = false
function wt.CreateFrame()
    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", SpellBookFrame)
    mainFrame:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", 0, 0)
    mainFrame:SetPoint("BOTTOMRIGHT", SpellBookFrame, "BOTTOMRIGHT", 0, 0)
    mainFrame:SetFrameStrata("HIGH")
    local left = mainFrame:CreateTexture(nil, "ARTWORK")
    left:SetTexture(LEFT_BG_TEXTURE_FILEID)
    left:SetWidth(256)
    left:SetHeight(512)
    left:SetPoint("TOPLEFT", mainFrame)
    local right = mainFrame:CreateTexture(nil, "ARTWORK")
    right:SetTexture(RIGHT_BG_TEXTURE_FILEID)
    right:SetWidth(128)
    right:SetHeight(512)
    right:SetPoint("TOPRIGHT", mainFrame)
    mainFrame:Hide()

    local skillLineTab = _G["SpellBookSkillLineTab" .. SKILL_LINE_TAB]
    hooksecurefunc(
        "SpellBookFrame_UpdateSkillLineTabs",
        function()
            skillLineTab:SetNormalTexture(TAB_TEXTURE_FILEID)
            skillLineTab.tooltip = wt.L.TAB_TEXT
            skillLineTab:Show()
            if (SpellBookFrame.selectedSkillLine == SKILL_LINE_TAB) then
                skillLineTab:SetChecked(true)
                mainFrame:Show()
            else
                skillLineTab:SetChecked(false)
                mainFrame:Hide()
            end
        end
    )
    hooksecurefunc(
        "SpellBookFrame_Update",
        function()
            if (SpellBookFrame.bookType ~= BOOKTYPE_SPELL) then
                mainFrame:Hide()
            elseif (SpellBookFrame.selectedSkillLine == SKILL_LINE_TAB) then
                mainFrame:Show()
            end
        end
    )

    local scrollBar = CreateFrame("ScrollFrame", "$parentScrollBar", mainFrame, "FauxScrollFrameTemplate")
    scrollBar:SetPoint("TOPLEFT", 0, -75)
    scrollBar:SetPoint("BOTTOMRIGHT", -65, 81)
    scrollBar:SetScript(
        "OnVerticalScroll",
        function(self, offset)
            FauxScrollFrame_OnVerticalScroll(
                self,
                offset,
                ROW_HEIGHT,
                function()
                    wt.Update(mainFrame)
                end
            )
        end
    )
    scrollBar:SetScript(
        "OnShow",
        function()
            if (not hasFrameShown) then
                rebuildSpells(UnitLevel("player"))
                hasFrameShown = true
            end
            wt.Update(mainFrame, true)
        end
    )
    mainFrame.scrollBar = scrollBar

    local rows = {}
    for i = 1, MAX_ROWS do
        local row = CreateFrame("Frame", "$parentRow" .. i, mainFrame)
        row:SetHeight(ROW_HEIGHT)
        row:EnableMouse()
        row:SetScript(
            "OnEnter",
            function(self)
                tooltip:SetOwner(self, "ANCHOR_RIGHT")
                wt.SetTooltip(self.currentSpell)
            end
        )
        row:SetScript(
            "OnLeave",
            function()
                tooltip:Hide()
            end
        )
        local highlight = row:CreateTexture("$parentHighlight", "HIGHLIGHT")
        highlight:SetAllPoints()

        local spell = CreateFrame("Frame", "$parentSpell", row)
        spell:SetPoint("LEFT", row, "LEFT")
        spell:SetPoint("TOP", row, "TOP")
        spell:SetPoint("BOTTOM", row, "BOTTOM")

        local spellIcon = spell:CreateTexture(nil, "OVERLAY")
        spellIcon:SetPoint("TOPLEFT", spell)
        spellIcon:SetPoint("BOTTOMLEFT", spell)
        local iconWidth = ROW_HEIGHT
        spellIcon:SetWidth(iconWidth)
        local spellLabel = spell:CreateFontString("$parentLabel", "OVERLAY", "GameFontNormal")
        spellLabel:SetPoint("TOPLEFT", spell, "TOPLEFT", iconWidth + 4, 0)
        spellLabel:SetPoint("BOTTOM", spell)
        spellLabel:SetJustifyV("MIDDLE")
        spellLabel:SetJustifyH("LEFT")
        local spellSublabel = spell:CreateFontString("$parentSubLabel", "OVERLAY", "NewSubSpellFont")
        spellSublabel:SetJustifyH("LEFT")
        spellSublabel:SetPoint("TOPLEFT", spellLabel, "TOPRIGHT", 2, 0)
        spellSublabel:SetPoint("BOTTOM", spellLabel)
        local spellLevelLabel = spell:CreateFontString("$parentLevelLabel", "OVERLAY", "GameFontWhite")
        spellLevelLabel:SetPoint("TOPRIGHT", spell, -4, 0)
        spellLevelLabel:SetPoint("BOTTOM", spell)
        spellLevelLabel:SetJustifyH("RIGHT")
        spellLevelLabel:SetJustifyV("MIDDLE")
        spellSublabel:SetPoint("RIGHT", spellLevelLabel, "LEFT")
        spellSublabel:SetJustifyV("MIDDLE")

        local headerLabel = row:CreateFontString("$parentHeaderLabel", "OVERLAY", "GameFontWhite")
        headerLabel:SetAllPoints()
        headerLabel:SetJustifyV("MIDDLE")
        headerLabel:SetJustifyH("CENTER")

        spell.label = spellLabel
        spell.subLabel = spellSublabel
        spell.icon = spellIcon
        spell.level = spellLevelLabel
        row.highlight = highlight
        row.header = headerLabel
        row.spell = spell

        if (rows[i - 1] == nil) then
            row:SetPoint("TOPLEFT", mainFrame, 26, -78)
        else
            row:SetPoint("TOPLEFT", rows[i - 1], "BOTTOMLEFT", 0, -2)
        end
        row:SetPoint("RIGHT", scrollBar)

        rawset(rows, i, row)
    end
    mainFrame.rows = rows
    wt.MainFrame = mainFrame
end

if (HookCTPUpdate) then

    wt.ctpDb = ClassTrainerPlusDBPC
    HookCTPUpdate(
        function()
            rebuildSpells(UnitLevel("player"))
        end
    )
end

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript(
    "OnEvent",
    function(self, event, ...)
        if (event == "ADDON_LOADED" and ... == addonName) then
            self:UnregisterEvent("ADDON_LOADED")
        elseif (event == "PLAYER_ENTERING_WORLD") then
            local isLogin, isReload = ...
            if (isLogin or isReload) then
                rebuildSpells(UnitLevel("player"))
                wt.CreateFrame()
            end
        elseif (event == "LEARNED_SPELL_IN_TAB" or event == "PLAYER_LEVEL_UP") then
            local isLevelUp = event == "PLAYER_LEVEL_UP"
            rebuildSpells(isLevelUp and ... or UnitLevel("player"), isLevelUp)
            if (wt.MainFrame and wt.MainFrame:IsVisible()) then
                wt.Update(wt.MainFrame, true)
            end
        end
    end
)
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
