local _, wt = ...
local TAB_TEXTURE_FILEID = GetFileIDFromPath("Interface\\Icons\\INV_Misc_QuestionMark")

local ROW_HEIGHT = 28
local sectionColors = {
    available = {0.12, 0.24, 0.08, 0.65, 1, 0.40},
    missingReqs = {0.32, 0.15, 0.03, 1, 0.82, 0.30},
    nextLevel = {0.08, 0.18, 0.29, 0.55, 0.84, 1},
    notLevel = {0.30, 0.07, 0.04, 1, 0.55, 0.45},
}

local function label(parent, text, font, x, y)
    local value = parent:CreateFontString(nil, "OVERLAY", font)
    value:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    value:SetTextColor(0.19, 0.12, 0.06)
    value:SetJustifyH("LEFT")
    value:SetText(text)
    return value
end

local function hideTooltip(self)
    if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
end

local function createRow(content, rankX, levelX)
    local row = CreateFrame("Button", nil, content)
    row:SetHeight(ROW_HEIGHT)
    row.band = row:CreateTexture(nil, "BACKGROUND")
    row.band:SetAllPoints()
    row.band:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated")
    local mask = row:CreateMaskTexture()
    mask:SetAllPoints(row.band)
    mask:SetTexture("Interface\\AddOns\\WhatsTraining\\header-mask", "CLAMPTOBLACKADDITIVE",
        "CLAMPTOBLACKADDITIVE")
    row.band:AddMaskTexture(mask)
    row.heading = label(row, "", "SystemFont_Med3", 8, -5)
    row.heading:ClearAllPoints()
    row.heading:SetPoint("TOPLEFT", row, "TOPLEFT", 8, 0)
    row.heading:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -8, 0)
    row.heading:SetJustifyV("MIDDLE")
    row.heading:SetShadowColor(0, 0, 0, 1)
    row.heading:SetShadowOffset(1, -1)
    row.icon = row:CreateTexture(nil, "ARTWORK")
    row.icon:SetPoint("TOPLEFT", 8, -2)
    row.icon:SetSize(24, 24)
    row.iconBorder = row:CreateTexture(nil, "OVERLAY")
    row.iconBorder:SetTexture("Interface\\Buttons\\UI-Quickslot2")
    row.iconBorder:SetPoint("CENTER", row.icon, "CENTER")
    row.iconBorder:SetSize(40, 40)
    row.name = label(row, "", "SystemFont_Med3", 38, -5)
    row.name:SetWidth(rankX - 46)
    row.name:SetWordWrap(false)
    row.rank = label(row, "", "SystemFont_Med3", rankX, -5)
    row.rank:SetWidth(levelX - rankX - 8)
    row.rank:SetWordWrap(false)
    row.level = label(row, "", "SystemFont_Med3", levelX, -5)
    row.level:SetWidth(content:GetWidth() - levelX - 8)
    row.level:SetWordWrap(false)
    row.separator = CreateFrame("Frame", nil, row)
    row.separator:SetPoint("BOTTOMLEFT", 38, 0)
    row.separator:SetPoint("BOTTOMRIGHT", -8, 0)
    row.separator:SetHeight(2)

    local clear = CreateColor(0.30, 0.19, 0.08, 0)
    local ink = CreateColor(0.30, 0.19, 0.08, 0.18)
    for i = 1, 2 do
        local half = row.separator:CreateTexture(nil, "BACKGROUND")
        half:SetPoint("BOTTOMLEFT", 0, i - 1)
        half:SetPoint("BOTTOMRIGHT", 0, i - 1)
        half:SetHeight(1)
        half:SetColorTexture(1, 1, 1, 1)
        half:SetGradient("VERTICAL", i == 1 and clear or ink, i == 1 and ink or clear)
        half:SetSnapToPixelGrid(false)
        half:SetTexelSnappingBias(0)
    end
    local highlight = row:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetColorTexture(1, 0.85, 0.50, 0.15)
    row:SetHighlightTexture(highlight)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row:SetScript("OnEnter", function(self)
        local spell = self.spell
        if not spell or spell.isHeader then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetSpellByID(spell.tooltipId or spell.id)
        GameTooltip:AddLine(wt.formatSpellCost(spell))
        if self.category.key == wt.MISSINGREQS_KEY or self.category.key == wt.MISSINGTALENT_KEY then
            GameTooltip:AddLine(self.category.name, 1, 0.82, 0.30)
        end
        GameTooltip:Show()
    end)
    row:SetScript("OnLeave", hideTooltip)
    row:SetScript("OnHide", hideTooltip)
    row:SetScript("OnClick", function(self, button)
        local spell = self.spell
        if not spell or spell.isHeader then return end
        if button == "LeftButton" and IsShiftKeyDown() and spell.link then
            local window = ChatEdit_GetActiveWindow()
            if window then window:Insert(spell.link) else ChatFrame_OpenChat(spell.link) end
        elseif button == "RightButton" and wt.ClickHook then
            wt.ClickHook(spell, function() wt:RebuildData() end, self)
        end
    end)
    return row
end

function wt.Update(mainFrame)
    if not mainFrame or not mainFrame.rows then return end
    mainFrame.character:SetText(string.format("%s • %s", UnitClass("player"),
        string.format(wt.L.LEVEL_FORMAT, wt.playerLevel or UnitLevel("player"))))
    local y, availableCost, category, headingRow = 0, 0
    local data = wt.spellListData
    for i, spell in ipairs(data) do
        local row = mainFrame.rows[i]
        if not row then
            row = createRow(mainFrame.content, mainFrame.rankX, mainFrame.levelX)
            mainFrame.rows[i] = row
        end
        hideTooltip(row)
        row.spell = spell
        local isHeader = spell.isHeader == true
        row.band:SetShown(isHeader)
        row.heading:SetShown(isHeader)
        row.icon:SetShown(not isHeader)
        row.iconBorder:SetShown(not isHeader)
        row.name:SetShown(not isHeader)
        row.rank:SetShown(not isHeader)
        row.level:SetShown(not isHeader)
        row.separator:SetShown(not isHeader and data[i + 1] ~= nil and not data[i + 1].isHeader)
        row:EnableMouse(not isHeader)
        if isHeader then
            if i > 1 then y = y + 8 end
            category, headingRow = spell, row
            row.count = 0
            local color = sectionColors[spell.key] or {0.20, 0.17, 0.12, 0.85, 0.80, 0.65}
            row.band:SetGradient("HORIZONTAL", CreateColor(color[1], color[2], color[3], 0.75),
                CreateColor(color[1], color[2], color[3], 0))
            row.heading:SetTextColor(color[4], color[5], color[6])
            row.heading:SetText(spell.name or spell.formattedName)
        else
            row.category = category
            headingRow.count = headingRow.count + 1
            headingRow.heading:SetText(string.format("%s - %d",
                category.name or category.formattedName, headingRow.count))
            row.icon:SetTexture(spell.useAltIcon and spell.altIcon or spell.icon)
            row.name:SetText(spell.name)
            row.rank:SetText(spell.subText or "")
            row.level:SetText(spell.hideLevel and "—" or spell.formattedLevel)
            if category.key == wt.NOTLEVEL_KEY then
                row.level:SetTextColor(0.45, 0.09, 0.04)
            else
                row.level:SetTextColor(0.19, 0.12, 0.06)
            end
            if category.key == wt.AVAILABLE_KEY then availableCost = availableCost + spell.cost end
        end
        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", mainFrame.content, "TOPLEFT", 0, -y)
        row:SetPoint("TOPRIGHT", mainFrame.content, "TOPRIGHT", 0, -y)
        row:Show()
        y = y + ROW_HEIGHT + (isHeader and 4 or 0)
    end
    for i = #data + 1, #mainFrame.rows do
        mainFrame.rows[i].spell = nil
        mainFrame.rows[i]:Hide()
    end
    mainFrame.total:SetText(string.format(wt.L.LEDGER_AVAILABLE_TOTAL,
        C_CurrencyInfo.GetCoinTextureString(availableCost)))
    mainFrame.empty:SetShown(#data == 0)
    mainFrame.content:SetHeight(math.max(1, y))
    local scroll = mainFrame.scrollFrame
    scroll:UpdateScrollChildRect()
    scroll:SetVerticalScroll(math.min(scroll:GetVerticalScroll(), math.max(0, y - scroll:GetHeight())))
end

function wt.UpdateToggleIcon() end
function wt.UpdateGroupingButton() end

local function attachForeverSpellBook(mainFrame)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", function()
        local book = PlayerSpellsFrame.SpellBookFrame
        mainFrame:SetParent(book)
        mainFrame:SetPoint("TOPLEFT", book, "TOPLEFT", 65, -90)
        mainFrame:SetPoint("BOTTOMLEFT", book, "BOTTOMLEFT", 65, 15)
        mainFrame:SetWidth(book.minimizedWidth - 110)

        label(mainFrame, "What's Training?", "SystemFont_Huge2", 8, 0)
        mainFrame.character = label(mainFrame, "", "SystemFont_Med3", 8, -32)
        local total = label(mainFrame, "", "SystemFont_Med3", 0, 0)
        mainFrame.total = total
        total:ClearAllPoints()
        total:SetPoint("TOPRIGHT", mainFrame, "TOPRIGHT", -20, -32)
        local divider = mainFrame:CreateTexture(nil, "ARTWORK")
        divider:SetAtlas("spellbook-divider")
        divider:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", -15, -58)
        divider:SetPoint("TOPRIGHT", mainFrame, "TOPRIGHT", 0, -58)
        divider:SetHeight(11)

        local rankX, levelX = mainFrame:GetWidth() - 260, mainFrame:GetWidth() - 155
        mainFrame.rankX, mainFrame.levelX = rankX, levelX
        label(mainFrame, wt.L.LEDGER_SPELL, "SystemFont_Med3", 38, -78)
        label(mainFrame, wt.L.LEDGER_RANK, "SystemFont_Med3", rankX, -78)
        label(mainFrame, wt.L.LEDGER_REQUIRED_LEVEL, "SystemFont_Med3", levelX, -78)
        local footer = label(mainFrame, wt.L.LEDGER_HINT, "GameFontNormalSmall", 0, 0)
        footer:ClearAllPoints()
        footer:SetPoint("LEFT", mainFrame, "BOTTOMLEFT", 8, 15)
        mainFrame.count = label(mainFrame, "", "GameFontNormalSmall", 0, 0)
        mainFrame.count:ClearAllPoints()
        mainFrame.count:SetPoint("RIGHT", mainFrame, "BOTTOMRIGHT", -20, 15)
        mainFrame.empty = label(mainFrame, wt.L.LEDGER_EMPTY, "SystemFont_Med3", 8, -112)

        local scroll = CreateFrame("ScrollFrame", "$parentScrollFrame", mainFrame, "ScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 0, -103)
        scroll:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -20, 30)
        local content = CreateFrame("Frame", nil, scroll)
        content:SetWidth(mainFrame:GetWidth() - 20)
        scroll:SetScrollChild(content)
        mainFrame.scrollFrame = scroll
        mainFrame.content, mainFrame.rows = content, {}

        local search = CreateFrame("EditBox", "$parentSearchBox", mainFrame, "SearchBoxTemplate")
        mainFrame.searchBox = search
        search:SetAllPoints(book.SearchBox)
        search:SetText(wt.filter)
        search:HookScript("OnHide", function(self) self:ClearFocus() end)
        search:HookScript("OnTextChanged", function(self)
            local filter = strlower(self:GetText())
            if filter == wt.filter then return end
            wt.filter = filter
            scroll:SetVerticalScroll(0)
            wt:ApplyFilter()
        end)

        -- keep our launcher outside blizz's pool: `CreateCategoryMixins` releases its tabs
        local button = CreateFrame("Button", "WhatsTrainingSpellBookButton", book.CategoryTabSystem,
                                   "SpellBookCategoryTabTemplate")
        button:Init(0, nil, TAB_TEXTURE_FILEID)
        button:SetPoint("LEFT", book.CategoryTabSystem, "RIGHT", 8, 0)
        local function selectTraining(selected)
            if selected then wt.Update(mainFrame) end
            mainFrame:SetShown(selected)
            book.PagedSpellsFrame:SetShown(not selected)
            book.SearchBox:SetShown(not selected)
            book.SettingsDropdown:SetShown(not selected)
            book.SearchPreviewContainer:Hide()
            button:SetTabSelected(selected)
            book.CategoryTabSystem:SetTabVisuallySelected(selected and 0 or book:GetTab())
        end
        mainFrame.selectTraining = selectTraining
        button:SetScript("OnClick", function()
            if InCombatLockdown() then
                print(wt.L.BROKER_OPEN_IN_COMBAT)
                return
            end
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            selectTraining(true)
        end)
        button:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(wt.L.TAB_TEXT)
            GameTooltip:Show()
        end)
        button:SetScript("OnLeave", hideTooltip)
        button:SetScript("OnHide", hideTooltip)

        -- the stock calculation only reserves space for Blizzard's category tabs
        hooksecurefunc(book, "ResizeSearchBox", function()
            local left, right = button:GetRight(), book.SearchBox:GetRight()
            if left and right then
                book.SearchBox:SetWidth(math.max(1, math.min(300, right - left - 10)))
            end
        end)
        hooksecurefunc(book.CategoryTabSystem, "SetTab", function() selectTraining(false) end)
        hooksecurefunc(book, "SelectNextTab", function() selectTraining(false) end)
        hooksecurefunc(book, "UpdateAllSpellData", function()
            if mainFrame:IsShown() then selectTraining(true) end
        end)
        book:HookScript("OnShow", function()
            book:ResizeSearchBox()
            if mainFrame:IsShown() then selectTraining(true) end
        end)
        book:ResizeSearchBox()
    end)
end

function wt.CreateFrame()
    if wt.MainFrame then return end
    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", UIParent)
    wt.MainFrame = mainFrame
    mainFrame:Hide()
    function wt.Open()
        if InCombatLockdown() then
            print(wt.L.BROKER_OPEN_IN_COMBAT)
            return
        end
        PlayerSpellsUtil.OpenToSpellBookTab()
        if mainFrame.selectTraining then mainFrame.selectTraining(true) end
    end
    attachForeverSpellBook(mainFrame)
end
