local _, wt = ...

local _G = _G
local GetCoinTextureString = GetCoinTextureString
local GetMoney = GetMoney
local GetFileIDFromPath = GetFileIDFromPath
local GetSpellInfo = GetSpellInfo
local GetQuestDifficultyColor = GetQuestDifficultyColor
local IsSpellKnown = IsSpellKnown
local UnitLevel = UnitLevel
local UnitFactionGroup = UnitFactionGroup
local FauxScrollFrame_Update = FauxScrollFrame_Update
local FauxScrollFrame_GetOffset = FauxScrollFrame_GetOffset
local FauxScrollFrame_OnVerticalScroll = FauxScrollFrame_OnVerticalScroll
local CreateFrame = CreateFrame
local tinsert = tinsert
local format = format
local hooksecurefunc = hooksecurefunc
local foreach = foreach
local foreachi = foreachi
local wipe = wipe
local sort = sort
local select = select
local ipairs = ipairs
local pairs = pairs
local Spell = Spell
local MAX_SKILLLINE_TABS = MAX_SKILLLINE_TABS
local GREEN_FONT_COLOR_CODE = GREEN_FONT_COLOR_CODE
local ORANGE_FONT_COLOR_CODE = ORANGE_FONT_COLOR_CODE
local RED_FONT_COLOR_CODE = RED_FONT_COLOR_CODE
local LIGHTYELLOW_FONT_COLOR_CODE = LIGHTYELLOW_FONT_COLOR_CODE
local GRAY_FONT_COLOR_CODE = GRAY_FONT_COLOR_CODE
local FONT_COLOR_CODE_CLOSE = FONT_COLOR_CODE_CLOSE
local HIGHLIGHT_FONT_COLOR_CODE = HIGHLIGHT_FONT_COLOR_CODE
local PARENS_TEMPLATE = PARENS_TEMPLATE

local MAX_ROWS = 22
local ROW_HEIGHT = 14
local HIGHLIGHT_TEXTURE_FILEID = GetFileIDFromPath("Interface\\AddOns\\WhatsTraining\\highlight")
local LEFT_BG_TEXTURE_FILEID = GetFileIDFromPath("Interface\\AddOns\\WhatsTraining\\left")
local RIGHT_BG_TEXTURE_FILEID = GetFileIDFromPath("Interface\\AddOns\\WhatsTraining\\right")
local TAB_TEXTURE_FILEID = GetFileIDFromPath("Interface\\Icons\\INV_Misc_QuestionMark")
local AVAILABLE_KEY = "available"
local MISSINGREQS_KEY = "missingReqs"
local NEXTLEVEL_KEY = "nextLevel"
local NOTLEVEL_KEY = "notLevel"
local IGNORED_KEY = "ignored"
local KNOWN_KEY = "known"
local COMINGSOON_FONT_COLOR_CODE = "|cff82c5ff"

local spellInfoCache = {}
-- done has params spell, cacheHit
local function getSpellInfo(spellId, done)
    if (spellInfoCache[spellId] ~= nil) then
        done(spellInfoCache[spellId], true)
        return
    end
    local spell = Spell:CreateFromSpellID(spellId)
    spell:ContinueOnSpellLoad(
        function()
            if (spellInfoCache[spell:GetSpellID()] ~= nil) then
                done(spellInfoCache[spellId], true)
                return
            end
            spellInfoCache[spell:GetSpellID()] = {
                id = spell:GetSpellID(),
                name = spell:GetSpellName(),
                subText = spell:GetSpellSubtext(),
                icon = select(3, GetSpellInfo(spell:GetSpellID()))
            }
            done(spellInfoCache[spell:GetSpellID()], false)
        end
    )
end

local function isIgnoredByCTP(spellId)
    return wt.ctpDb ~= nil and wt.ctpDb[spellId]
end

local categories = {
    {
        name = wt.L.AVAILABLE_HEADER,
        spells = {},
        color = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        isHeader = true,
        key = AVAILABLE_KEY
    },
    {
        name = wt.L.MISSINGREQS_HEADER,
        spells = {},
        color = ORANGE_FONT_COLOR_CODE,
        hideLevel = true,
        isHeader = true,
        key = MISSINGREQS_KEY
    },
    {
        name = wt.L.NEXTLEVEL_HEADER,
        spells = {},
        color = COMINGSOON_FONT_COLOR_CODE,
        isHeader = true,
        key = NEXTLEVEL_KEY
    },
    {
        name = wt.L.NOTLEVEL_HEADER,
        spells = {},
        color = RED_FONT_COLOR_CODE,
        isHeader = true,
        key = NOTLEVEL_KEY
    },
    {
        name = wt.L.IGNORED_HEADER,
        spells = {},
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        isHeader = true,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        key = IGNORED_KEY
    },
    {
        name = wt.L.KNOWN_HEADER,
        spells = {},
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        isHeader = true,
        key = KNOWN_KEY
    },
    _spellsByCategoryKey = {},
    Insert = function(self, key, spellInfo)
        tinsert(self._spellsByCategoryKey[key], spellInfo)
    end
}
foreachi(categories, function(_, cat)
    categories._spellsByCategoryKey[cat.key] = cat.spells
end)

local spells = {}
local function rebuildSpells(playerLevel)
    foreachi(
        categories,
        function(_, c)
            c.cost = 0
            wipe(c.spells)
        end
    )
    wipe(spells)
    for level, spellsAtLevel in pairs(wt.SpellsByLevel) do
        for _, spell in ipairs(spellsAtLevel) do
            local spellInfo = spellInfoCache[spell.id]
            if (spellInfo ~= nil) then
                local categoryKey
                spellInfo.level = level
                spellInfo.cost = spell.cost
                if (IsSpellKnown(spell.id)) then
                    categoryKey = KNOWN_KEY
                elseif (isIgnoredByCTP(spellInfo.id)) then
                    categoryKey = IGNORED_KEY
                elseif (level > playerLevel) then
                    categoryKey = level <= playerLevel + 2 and NEXTLEVEL_KEY or NOTLEVEL_KEY
                else
                    local hasReqs = true
                    if (spell.requiredIds ~= nil) then
                        for j = 1, #spell.requiredIds do
                            local reqId = spell.requiredIds[j]
                            hasReqs = hasReqs and IsSpellKnown(reqId)
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

    local function sorter(a, b)
        if (a.level == b.level) then
            return a.name < b.name
        end
        return a.level < b.level
    end
    for _, category in ipairs(categories) do
        if (#category.spells > 0) then
            tinsert(spells, category)
            sort(category.spells, sorter)
            local totalCost = 0
            for _, s in ipairs(category.spells) do
                s.hideLevel = category.hideLevel
                totalCost = totalCost + s.cost
                tinsert(spells, s)
            end
            category.cost = totalCost
        end
    end
end
local function rebuildIfNotCached(_, fromCache)
    if (fromCache or wt.MainFrame == nil) then
        return
    end
    rebuildSpells(UnitLevel("player"))
end

local _, _, playerRace = UnitRace("player")
local function raceMatches(spell)
    if (spell.race == nil and spell.races == nil) then
        return true
    end
    if (spell.races == nil) then
        return spell.race == playerRace
    end
    return spell.races[1] == playerRace or spell.races[2] == playerRace
end
local playerFaction = UnitFactionGroup("player")
for _, spellsByLevel in pairs(wt.SpellsByLevel) do
    for _, spell in ipairs(spellsByLevel) do
        local forThisFaction = spell.faction == nil or spell.faction == playerFaction
        local forThisRace = raceMatches(spell)
        if (forThisFaction and forThisRace) then
            getSpellInfo(spell.id, rebuildIfNotCached)
        end
    end
end
rebuildSpells(UnitLevel("player"))

local tooltip = CreateFrame("GameTooltip", "WhatsTrainingTooltip", UIParent, "GameTooltipTemplate")
function wt.SetTooltip(spellInfo)
    if (spellInfo.id) then
        tooltip:SetSpellByID(spellInfo.id)
    else
        tooltip:ClearLines()
    end
    local coloredCoinString = GetCoinTextureString(spellInfo.cost)
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
        row.header:SetText(format("%s%s%s", spell.color, spell.name, FONT_COLOR_CODE_CLOSE))
        row:SetID(0)
        row.highlight:SetTexture(nil)
    elseif (spell ~= nil) then
        row.header:Hide()
        row.isHeader = false
        row.highlight:SetTexture(HIGHLIGHT_TEXTURE_FILEID)
        row.spell:Show()
        row.spell.label:SetText(spell.name)
        if (spell.subText and spell.subText ~= "") then
            row.spell.subLabel:SetText(format(PARENS_TEMPLATE, spell.subText))
        else
            row.spell.subLabel:SetText("")
        end
        if (not spell.hideLevel) then
            row.spell.level:Show()
            row.spell.level:SetText(format(wt.L.LEVEL_FORMAT, spell.level))
            local color = GetQuestDifficultyColor(spell.level)
            row.spell.level:SetTextColor(color.r, color.g, color.b)
        else
            row.spell.level:Hide()
        end
        row:SetID(spell.id)
        row.spell.icon:SetTexture(spell.icon)
    end
    row.currentSpell = spell
    if (tooltip:IsOwned(row)) then
        wt.SetTooltip(spell)
    end
    row:Show()
end

local lastOffset = -1
function wt.Update(frame, forceUpdate)
    local scrollBar = frame.scrollBar
    FauxScrollFrame_Update(scrollBar, #spells, MAX_ROWS, ROW_HEIGHT, nil, nil, nil, nil, nil, nil, true)
    local offset = FauxScrollFrame_GetOffset(scrollBar)
    if (offset == lastOffset and not forceUpdate) then return end
    for i = 1, MAX_ROWS do
        local spellIndex = i + offset
        local spell = spells[spellIndex]
        local row = _G[frame:GetName() .. "Row" .. i]
        wt.SetRowSpell(row, spell)
    end
    lastOffset = offset
end

local hasFrameShown = false
function wt.CreateFrame()
    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", SpellBookFrame)
    mainFrame:SetPoint("TOPLEFT", "SpellBookFrame", "TOPLEFT", 0, 0)
    mainFrame:SetPoint("BOTTOMRIGHT", "SpellBookFrame", "BOTTOMRIGHT", 0, 0)
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
    mainFrame:SetFrameStrata("HIGH")
    mainFrame:Hide()

    hooksecurefunc(
        "SpellBookFrame_UpdateSkillLineTabs",
        function()
            local skillLineTab = _G["SpellBookSkillLineTab" .. MAX_SKILLLINE_TABS - 1]
            skillLineTab:SetNormalTexture(TAB_TEXTURE_FILEID)
            skillLineTab.tooltip = wt.L.TAB_TEXT
            skillLineTab:Show()
            if (SpellBookFrame.selectedSkillLine == MAX_SKILLLINE_TABS - 1) then
                skillLineTab:SetChecked(true)
                mainFrame:Show()
                for i = 1, MAX_SKILLLINE_TABS do
                    _G["SpellBookSkillLineTab" .. i]:SetFrameStrata("HIGH")
                end
            else
                skillLineTab:SetChecked(false)
                mainFrame:Hide()
                for i = 1, MAX_SKILLLINE_TABS do
                    _G["SpellBookSkillLineTab" .. i]:SetFrameStrata("MEDIUM")
                end
            end
        end
    )

    local scrollBar = CreateFrame("ScrollFrame", "$parentScrollBar", mainFrame, "FauxScrollFrameTemplate")
    scrollBar:SetPoint("TOPLEFT", 0, -76)
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
    local lastRow = nil
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
        spell:SetPoint("LEFT", "WhatsTrainingFrameRow" .. i, "LEFT")
        spell:SetPoint("TOP", "WhatsTrainingFrameRow" .. i, "TOP")
        spell:SetPoint("BOTTOM", "WhatsTrainingFrameRow" .. i, "BOTTOM")

        local spellIcon = spell:CreateTexture(nil, "OVERLAY")
        spellIcon:SetPoint("TOPLEFT", spell:GetName())
        spellIcon:SetPoint("BOTTOMLEFT", spell:GetName())
        local iconWidth = ROW_HEIGHT
        spellIcon:SetWidth(iconWidth)
        local spellLabel = spell:CreateFontString("$parentLabel", "OVERLAY", "GameFontNormal")
        spellLabel:SetPoint("TOPLEFT", spell:GetName(), "TOPLEFT", iconWidth + 4, 0)
        spellLabel:SetPoint("BOTTOM", spell:GetName())
        spellLabel:SetJustifyV("MIDDLE")
        local spellSublabel = spell:CreateFontString("$parentSubLabel", "OVERLAY", "NewSubSpellFont")
        spellSublabel:SetPoint("TOPLEFT", spellLabel:GetName(), "TOPRIGHT", 2, 0)
        spellSublabel:SetPoint("BOTTOM", spellLabel:GetName())
        spellSublabel:SetJustifyV("MIDDLE")
        local spellLevelLabel = spell:CreateFontString("$parentLevelLabel", "OVERLAY", "GameFontWhite")
        spellLevelLabel:SetPoint("TOPRIGHT", spell:GetName(), -4, 0)
        spellLevelLabel:SetPoint("BOTTOMLEFT", spellSublabel:GetName(), "BOTTOMRIGHT")
        spellLevelLabel:SetJustifyH("RIGHT")
        spellLevelLabel:SetJustifyV("MIDDLE")

        local headerLabel = row:CreateFontString("$HeaderLabel", "OVERLAY", "GameFontWhite")
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

        if (lastRow == nil) then
            row:SetPoint("TOPLEFT", mainFrame, 26, -78)
        else
            row:SetPoint("TOPLEFT", rows[i - 1], "BOTTOMLEFT", 0, -2)
        end
        row:SetPoint("RIGHT", scrollBar)
        lastRow = row

        rawset(rows, i, row)
    end
    wt.MainFrame = mainFrame
end

local function hookCTP()
    wt.ctpDb = ClassTrainerPlusDBPC
    hooksecurefunc(
        "CTP_UpdateService",
        function()
            rebuildSpells(UnitLevel("player"))
        end
    )
end

if (CTP_UpdateService) then
    hookCTP()
end

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript(
    "OnEvent",
    function(self, event, ...)
        if (event == "ADDON_LOADED" and ... == "ClassTrainerPlus") then
            hookCTP()
            self:UnregisterEvent("ADDON_LOADED")
        elseif (event == "PLAYER_ENTERING_WORLD") then
            local isLogin, isReload = ...
            if (isLogin or isReload) then
                rebuildSpells(UnitLevel("player"))
                wt.CreateFrame()
            end
        elseif (event == "LEARNED_SPELL_IN_TAB" or event == "PLAYER_LEVEL_UP") then
            rebuildSpells(event == "PLAYER_LEVEL_UP" and ... or UnitLevel("player"))
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
