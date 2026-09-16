local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local BOOKTYPE_SPELL = BOOKTYPE_SPELL

local MAX_ROWS = 22
local ROW_HEIGHT = 14
local INDENT_STEP = ROW_HEIGHT + 4
local NPC_LOCATION_FORMAT = "%s (%.1f, %.1f)"
local SKILL_LINE_TAB = MAX_SKILLLINE_TABS - 1
local HIGHLIGHT_TEXTURE_FILEID = GetFileIDFromPath(
                                     "Interface\\AddOns\\WhatsTraining\\highlight")
local LEFT_BG_TEXTURE_FILEID = GetFileIDFromPath(
                                   "Interface\\AddOns\\WhatsTraining\\left")
local RIGHT_BG_TEXTURE_FILEID = GetFileIDFromPath(
                                    "Interface\\AddOns\\WhatsTraining\\right")
local TAB_TEXTURE_FILEID = GetFileIDFromPath(
                               "Interface\\Icons\\INV_Misc_QuestionMark")

local tooltip = CreateFrame("GameTooltip", "WhatsTrainingTooltip", UIParent,
                            "GameTooltipTemplate")

local function setNpcTooltip(npcInfo)
    tooltip:ClearLines()
    tooltip:AddLine(npcInfo.masterName or npcInfo.name, 1, 1, 1)
    local zoneName = npcInfo.zoneName or (npcInfo.zone and C_Map.GetAreaInfo(npcInfo.zone))
    if zoneName and npcInfo.x and npcInfo.y then
        tooltip:AddLine(format(NPC_LOCATION_FORMAT, zoneName, npcInfo.x, npcInfo.y), 0.8, 0.8, 0.8)
    elseif zoneName then
        tooltip:AddLine(zoneName, 0.8, 0.8, 0.8)
    end
    if wt.canSetWaypoint(npcInfo) then
        tooltip:AddLine(wt.L.CLICK_TO_WAYPOINT, GREEN_FONT_COLOR.r,
                        GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
    end
    tooltip:Show()
end

local function setTooltip(spellInfo)
    if spellInfo.npc then
        setNpcTooltip(spellInfo)
        return
    end
    if spellInfo.altTooltipType == "weapon" then
        tooltip:ClearLines()
        tooltip:AddLine(spellInfo.name, 1, 1, 1)
    elseif spellInfo.tooltipType == "item" then
        tooltip:SetSpellByID(spellInfo.tooltipId)
        tooltip:AddLine(spellInfo.formattedFullName, 1, 1, 1)
    elseif spellInfo.tooltipType == "spell" then
        tooltip:SetSpellByID(spellInfo.tooltipId)
    else
        tooltip:ClearLines()
    end
    if spellInfo.cost and spellInfo.cost > 0 then
        tooltip:AddLine(wt.formatSpellCost(spellInfo))
    end
    if spellInfo.tooltip then tooltip:AddLine(spellInfo.tooltip) end
    if spellInfo.formattedTrainerZones then
        tooltip:AddLine(string.format(wt.L.TRAINED_IN, spellInfo.formattedTrainerZones),
                        0.8, 0.8, 0.8)
    end
    if spellInfo.altTooltipType == "weapon" and wt.isAbilityKnown(spellInfo.id) then
        tooltip:AddLine(ITEM_SPELL_KNOWN, RED_FONT_COLOR.r, RED_FONT_COLOR.g,
                        RED_FONT_COLOR.b)
    end
    tooltip:Show()
end

local function setRowSpell(row, spell)
    if spell == nil then
        row.currentSpell = nil
        row:Hide()
        return
    elseif spell.isHeader then
        row.spell:Hide()
        row.header:Show()
        row:SetID(0)
        row.highlight:SetTexture(spell.npc and HIGHLIGHT_TEXTURE_FILEID or nil)
        if spell.indent ~= nil then
            row.header:SetText(spell.name)
            row.header:ClearAllPoints()
            row.header:SetPoint("LEFT", row, "LEFT", spell.indent * INDENT_STEP, 0)
            row.header:SetPoint("RIGHT", row, "RIGHT")
            row.header:SetPoint("TOP", row)
            row.header:SetPoint("BOTTOM", row)
            row.header:SetJustifyH("LEFT")
            if spell.indent == 1 then
                row.header:SetTextColor(LIGHTYELLOW_FONT_COLOR.r, LIGHTYELLOW_FONT_COLOR.g, LIGHTYELLOW_FONT_COLOR.b)
            else
                row.header:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
            end
        else
            -- Reset centered/full-width in case this reused row last held a grouped header.
            row.header:SetText(spell.formattedName)
            row.header:ClearAllPoints()
            row.header:SetAllPoints()
            row.header:SetJustifyH("CENTER")
            row.header:SetTextColor(1, 1, 1)
        end
    else
        local rowSpell = row.spell
        row.header:Hide()
        row.isHeader = false
        row.highlight:SetTexture(HIGHLIGHT_TEXTURE_FILEID)
        rowSpell:Show()
        local indentPx = (spell.indent or 0) * INDENT_STEP
        rowSpell.icon:ClearAllPoints()
        rowSpell.icon:SetPoint("TOPLEFT", rowSpell, "TOPLEFT", indentPx, 0)
        rowSpell.icon:SetPoint("BOTTOMLEFT", rowSpell, "BOTTOMLEFT", indentPx, 0)
        rowSpell.label:ClearAllPoints()
        rowSpell.label:SetPoint("TOPLEFT", rowSpell, "TOPLEFT", indentPx + ROW_HEIGHT + 4, 0)
        rowSpell.label:SetPoint("BOTTOM", rowSpell)
        rowSpell.label:SetText(spell.name)
        if spell.isKnown then
            rowSpell.label:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
        else
            rowSpell.label:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
        end
        rowSpell.subLabel:SetText(spell.formattedSubText)
        if not spell.hideLevel then
            rowSpell.level:Show()
            rowSpell.level:SetText(spell.formattedLevel)
            local color = spell.levelColor
            rowSpell.level:SetTextColor(color.r, color.g, color.b)
        else
            rowSpell.level:Hide()
            rowSpell.level:SetText("")
        end
        row:SetID(spell.itemId or spell.id)
        rowSpell.icon:SetTexture(spell.useAltIcon and spell.altIcon or spell.icon)
    end
    if spell.click then
        row:SetScript("OnClick", spell.click)
    elseif not spell.isHeader then
        row:SetScript("OnClick", function(_, button)
            if button == "LeftButton" and IsShiftKeyDown() then
                local link = spell.link
                if spell.taughtSpell then
                    link = link..' '..spell.taughtSpell.link
                end
                local window = ChatEdit_GetActiveWindow()
                if window then
                    window:Insert(link)
                else
                    ChatFrame_OpenChat(link)
                end
            end
            if not wt.ClickHook then return end
            if button == "RightButton" then
                wt.ClickHook(spell, function()
                    wt:RebuildData()
                end, row)
            end
        end)
    elseif spell.npc then
        row:SetScript("OnClick", function(_, button)
            if not wt.canSetWaypoint(spell) then return end
            if button == "RightButton" then
                wt.NpcClickHook(spell, row)
            else
                PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
                wt.setWaypoint(spell)
            end
        end)
    else
        row:SetScript("OnClick", nil)
    end

    if not spell.isHeader and spell.indent == nil and spell.trainerZones and #spell.trainerZones > 0 then
        local lastFrame = row
        local point = "TOPRIGHT"
        local relativePoint = "TOPRIGHT"
        local xOffset = -4

        local n = #spell.trainerZones
        for j = 1, n do
            local zoneData = spell.trainerZones[n - j + 1]  -- reverse: leftmost icon = first in array
            local f = row.zoneIcons[j]
            if f then
                f:ClearAllPoints()
                f:SetPoint(point, lastFrame, relativePoint, xOffset, 0)
                f.icon:SetTexture(zoneData.icon)
                f.zoneId = zoneData.id
                f:Show()
                lastFrame = f
                point = "RIGHT"
                relativePoint = "LEFT"
                xOffset = -2
            end
        end
        for j = #spell.trainerZones + 1, wt.NumCityIcons do
            row.zoneIcons[j]:Hide()
        end

        row.spell.level:ClearAllPoints()
        row.spell.level:SetPoint("RIGHT", lastFrame, "LEFT", -2, 0)
        row.spell.level:SetPoint("TOP", row)
        row.spell.level:SetPoint("BOTTOM", row)
    else
        if row.zoneIcons then
            for _, f in ipairs(row.zoneIcons) do f:Hide() end
        end
        if not spell.isHeader then
            row.spell.level:ClearAllPoints()
            row.spell.level:SetPoint("TOPRIGHT", row.spell, -4, 0)
            row.spell.level:SetPoint("BOTTOM", row.spell)
        end
    end

    row.currentSpell = spell
    if (tooltip:IsOwned(row)) then setTooltip(spell) end
    row:Show()
end

-- When holding down left mouse on the slider knob, it will keep firing update even though
-- the offset hasn't changed so this will help throttle that
local lastOffset = -1
function wt.Update(frame, forceUpdate)
    frame.noticeButton:SetShown(not wt.showingWeaponSkills and wt.needsBeastTraining())
    local scrollBar = frame.scrollBar
    local offset = FauxScrollFrame_GetOffset(scrollBar)
    if offset == lastOffset and not forceUpdate then return end
    for i, row in ipairs(frame.rows) do
        local spellIndex = i + offset
        local spell = wt.data[spellIndex]
        setRowSpell(row, spell)
    end
    FauxScrollFrame_Update(frame.scrollBar, #wt.data, MAX_ROWS,
                           ROW_HEIGHT, nil, nil, nil, nil, nil, nil, true)
    lastOffset = offset
end
function wt.UpdateToggleIcon(frame)
    if not frame or not frame.weaponSkillToggleButton then return end
    local icon
    if wt.showingWeaponSkills then
        icon = "Interface\\Icons\\INV_Misc_Book_09"
    else
        local _, class = UnitClass("player")
        if class == "HUNTER" then
            icon = GetInventoryItemTexture("player", 18) -- Ranged
        end
        if not icon then
            icon = GetInventoryItemTexture("player", 16) -- Main Hand
        end
        if not icon then
            icon = "Interface\\Icons\\INV_Weapon_ShortBlade_04" -- Dagger fallback
        end
    end
    frame.weaponSkillToggleButton:SetIcon(icon)
end

function wt.UpdateGroupingButton(frame)
    if not frame or not frame.groupingButton then return end
    if wt.showingWeaponSkills then
        frame.groupingButton:Show()
    else
        frame.groupingButton:Hide()
        if frame.groupingPopup then frame.groupingPopup:Hide() end
    end
end

local function createWeaponSkillsButton()
    local button = CreateFrame("Button", "WhatsTrainingSkillsButton", SkillFrame, "SquareIconButtonTemplate")
    button:SetSize(18, 18)
    button.Icon:SetSize(12, 12)
    button:SetIcon(TAB_TEXTURE_FILEID)
    button:SetScript("OnClick", function()
        if InCombatLockdown() then
            print(wt.L.BROKER_OPEN_IN_COMBAT)
            return
        end
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        wt.Open(true)
    end)
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(wt.L.TAB_TEXT)
        GameTooltip:AddLine(wt.L.SHOW_WEAPONS, 1, 1, 1)
        GameTooltip:Show()
    end)
    local function hideTooltip(self)
        if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
    end
    button:SetScript("OnLeave", hideTooltip)
    button:SetScript("OnHide", hideTooltip)

    local function updateButton()
        for i = 1, SKILLS_TO_DISPLAY do
            local header = _G["SkillTypeLabel" .. i]
            if header:IsShown() and header:GetText() == wt.L.WEAPON_SKILLS_HEADER then
                button:SetParent(header)
                button:ClearAllPoints()
                button:SetPoint("LEFT", header:GetFontString(), "RIGHT", 4, 0)
                button:Show()
                return
            end
        end
        button:Hide()
    end
    hooksecurefunc("SkillFrame_UpdateSkills", updateButton)
    updateButton()
end

function wt.CreateFrame()
    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", SpellBookFrame)
    wt.MainFrame = mainFrame
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
    local search = CreateFrame("EditBox", "$parentSearchBox", mainFrame, "SearchBoxTemplate")
    search:SetWidth(124)
    search:SetHeight(32)
    search:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 81, -34)
    search:SetScript("OnTextChanged", function (self)
        SearchBoxTemplate_OnTextChanged(self)
        local oldFilter = wt.filter
        wt.filter = strlower(self:GetText())
        if wt.filter ~= oldFilter then wt:ApplyFilter() end
    end)

    local toggleButton = CreateFrame("Button", "$parentWeaponSkillToggle", mainFrame, "SquareIconButtonTemplate")
    toggleButton:SetSize(32, 32)
    toggleButton:SetPoint("LEFT", search, "RIGHT", 0, -1)
    toggleButton:SetScript("OnClick", function(self)
        wt:ToggleWeaponSkills()
        if GameTooltip:IsOwned(self) then
            local onEnter = self:GetScript("OnEnter")
            if onEnter ~= nil then
                onEnter(self)
            end
        end
    end)
    toggleButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(wt.showingWeaponSkills and wt.L.SHOW_SPELLS or wt.L.SHOW_WEAPONS)
        GameTooltip:Show()
    end)
    toggleButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
    mainFrame.weaponSkillToggleButton = toggleButton

    local noticeButton = CreateFrame("Button", "$parentNoticeButton", mainFrame, "UIPanelInfoButton")
    noticeButton:SetPoint("LEFT", toggleButton, "RIGHT", 4, 0)
    noticeButton:Hide()
    noticeButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(wt.L.OPEN_BEAST_TRAINING, 1, 1, 1, 1, true)
        GameTooltip:AddLine(wt.L.CLICK_TO_OPEN,
                            GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, true)
        GameTooltip:Show()
    end)
    local function hideNoticeTooltip(self)
        if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
    end
    noticeButton:SetScript("OnLeave", hideNoticeTooltip)
    noticeButton:SetScript("OnHide", hideNoticeTooltip)
    noticeButton:SetScript("OnClick", function()
        if wt.needsBeastTraining() then
            if InCombatLockdown() then
                print(wt.L.OPEN_BEAST_IN_COMBAT)
            else
                wt.openBeastTraining()
            end
        end
    end)
    mainFrame.noticeButton = noticeButton

    local groupingButton = CreateFrame("Button", "$parentGroupingButton", mainFrame, "SquareIconButtonTemplate")
    groupingButton:SetSize(32, 32)
    groupingButton:SetPoint("LEFT", toggleButton, "RIGHT", -4, 0)
    groupingButton:SetIcon("Interface\\Worldmap\\Gear_64Grey.blp")
    groupingButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(wt.L.GROUPING_OPTIONS)
        GameTooltip:Show()
    end)
    groupingButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
    mainFrame.groupingButton = groupingButton

    local popup = CreateFrame("Frame", "$parentGroupingPopup", mainFrame, "BackdropTemplate")
    popup:SetSize(200, 132)
    popup:SetPoint("TOPLEFT", groupingButton, "BOTTOMLEFT", 0, -2)
    popup:SetFrameStrata("DIALOG")
    popup:SetBackdrop(BACKDROP_DIALOG_32_32)
    popup:EnableMouse(true)
    popup:Hide()
    mainFrame.groupingPopup = popup

    local title = popup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", popup, "TOPLEFT", 16, -14)
    title:SetText(wt.L.GROUPING_OPTIONS_TITLE)

    local radioDefs = {
        { mode = "zone",        label = wt.L.GROUP_BY_ZONE },
        { mode = "weaponskill", label = wt.L.GROUP_BY_WEAPON_SKILL },
        { mode = "list",        label = wt.L.GROUP_LIST },
    }
    popup.radios = {}
    local prev
    for i, def in ipairs(radioDefs) do
        local radio = CreateFrame("CheckButton", "$parentRadio" .. i, popup, "UIRadioButtonTemplate")
        if prev then
            radio:SetPoint("TOPLEFT", prev, "BOTTOMLEFT", 0, -6)
        else
            radio:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
        end
        local text = radio.text or radio.Text or _G[radio:GetName() .. "Text"]
        if text then
            text:SetFontObject("GameFontNormalSmall")
            text:SetText(def.label)
            text:SetPoint("LEFT", radio, "RIGHT", 2, 0)
        end
        radio.mode = def.mode
        radio:SetScript("OnClick", function(self)
            WT_WeaponGrouping = self.mode
            for _, r in ipairs(popup.radios) do
                r:SetChecked(r.mode == self.mode)
            end
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            wt.applyFilter()
            wt.Update(mainFrame, true)
        end)
        tinsert(popup.radios, radio)
        prev = radio
    end

    local doneButton = CreateFrame("Button", "$parentDone", popup, "UIPanelButtonTemplate")
    doneButton:SetSize(80, 22)
    doneButton:SetPoint("BOTTOMRIGHT", popup, "BOTTOMRIGHT", -12, 10)
    doneButton:SetText(DONE)
    doneButton:SetScript("OnClick", function() popup:Hide() end)

    popup:SetScript("OnShow", function(self)
        local mode = WT_WeaponGrouping or "zone"
        for _, r in ipairs(self.radios) do
            r:SetChecked(r.mode == mode)
        end
    end)

    groupingButton:SetScript("OnClick", function()
        if popup:IsShown() then popup:Hide() else popup:Show() end
    end)


    mainFrame:Hide()

    -- Fix for Season of Discovery's Shaman 'Way of the Earth' rune
    -- When this rune is engraved, it constantly causes a `SPELLS_CHANGED` event
    -- That event will keep switching the tab back to the first non-general tab when fired
    local deferredPriorTabSelection = SpellBookFrame.selectedSkillLine
    SpellBookFrame:HookScript("OnEvent", function(_, event)
        if event == "SPELLS_CHANGED"
            and deferredPriorTabSelection == SKILL_LINE_TAB
            and SpellBookFrame.selectedSkillLine ~= SKILL_LINE_TAB
        then
            local inCombat = InCombatLockdown()
            if not inCombat and SpellBookFrame:IsVisible() then
                -- out of combat can directly update the spell book
                SpellBookFrame.selectedSkillLine = SKILL_LINE_TAB
                SpellBookFrame:Update()
            elseif inCombat and SpellBookFrame:IsVisible() then
                -- in combat manually update the tab selection, then update the selected tab variable in the next frame
                for i = 1, MAX_SKILLLINE_TABS do
                    _G["SpellBookSkillLineTab" .. i]:SetChecked(i == SKILL_LINE_TAB)
                end
                -- the SpellBookFrame code will try to disable the actual buttons if the selected
                -- skill line is out of range. the SpellButton..n buttons are protected in combat,
                -- and setting this in the same frame will cause an lua error
                RunNextFrame(function() SpellBookFrame.selectedSkillLine = SKILL_LINE_TAB end)
                mainFrame:Show()
            end
        end
    end)
    function wt.Open(toWeapons)
        if wt.showingWeaponSkills ~= toWeapons then
            wt.showingWeaponSkills = toWeapons
            wt.applyFilter()
            wt.UpdateToggleIcon(wt.MainFrame)
            wt.UpdateGroupingButton(wt.MainFrame)
            wt.Update(wt.MainFrame, true)
        end
        SpellBookFrame.selectedSkillLine = SKILL_LINE_TAB
        if SpellBookFrame:IsVisible() then
            SpellBookFrame:Update()
        else
            ToggleSpellBook("spell")
        end
    end

    local skillLineTab = _G["SpellBookSkillLineTab" .. SKILL_LINE_TAB]
    hooksecurefunc(SpellBookFrame, "UpdateSkillLineTabs", function()
        skillLineTab:SetNormalTexture(TAB_TEXTURE_FILEID)
        skillLineTab.tooltip = wt.L.TAB_TEXT
        skillLineTab:Show()
        if SpellBookFrame.selectedSkillLine == SKILL_LINE_TAB then
            skillLineTab:SetChecked(true)
            mainFrame:Show()
            ShowAllSpellRanksCheckbox:Hide()
        else
            skillLineTab:SetChecked(false)
            mainFrame:Hide()
            local _, class = UnitClass("player")
            if class ~= "ROGUE" and class ~= "WARRIOR" then
                ShowAllSpellRanksCheckbox:Show()
            end
        end
    end)
    hooksecurefunc(SpellBookFrame, "Update", function()
        if SpellBookFrame.bookType ~= BOOKTYPE_SPELL then
            mainFrame:Hide()
        elseif SpellBookFrame.selectedSkillLine == SKILL_LINE_TAB then
            mainFrame:Show()
        end
        RunNextFrame(function()
            deferredPriorTabSelection = SpellBookFrame.selectedSkillLine
        end)
    end)

    local scrollBar = CreateFrame("ScrollFrame", "$parentScrollBar", mainFrame,
                                  "FauxScrollFrameTemplate")
    scrollBar:SetPoint("TOPLEFT", 0, -75)
    scrollBar:SetPoint("BOTTOMRIGHT", -65, 81)
    scrollBar:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, ROW_HEIGHT,
                                         function() wt.Update(mainFrame) end)
    end)
    scrollBar:SetScript("OnShow", function()
        wt.UpdateToggleIcon(mainFrame)
        wt.UpdateGroupingButton(mainFrame)
        wt.Update(mainFrame, true)
    end)
    mainFrame.scrollBar = scrollBar

    local rows = {}
    for i = 1, MAX_ROWS do
        local row = CreateFrame("Button", "$parentRow" .. i, mainFrame)
        row:SetHeight(ROW_HEIGHT)
        row:EnableMouse(true)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        row:SetScript("OnEnter", function(self)
            tooltip:SetOwner(self, "ANCHOR_RIGHT")
            setTooltip(self.currentSpell)
        end)
        row:SetScript("OnLeave", function() tooltip:Hide() end)

        local highlight = row:CreateTexture("$parentHighlight", "HIGHLIGHT")
        highlight:SetAllPoints()

        local spell = CreateFrame("Frame", "$parentSpell", row)
        spell:SetPoint("LEFT", row, "LEFT")
        spell:SetPoint("TOP", row, "TOP")
        spell:SetPoint("BOTTOM", row, "BOTTOM")
        spell:SetPoint("RIGHT", row, "RIGHT")

        local spellIcon = spell:CreateTexture(nil, "OVERLAY")
        spellIcon:SetPoint("TOPLEFT", spell)
        spellIcon:SetPoint("BOTTOMLEFT", spell)
        local iconWidth = ROW_HEIGHT
        spellIcon:SetWidth(iconWidth)
        local spellLabel = spell:CreateFontString("$parentLabel", "OVERLAY",
                                                  "GameFontNormal")
        spellLabel:SetPoint("TOPLEFT", spell, "TOPLEFT", iconWidth + 4, 0)
        spellLabel:SetPoint("BOTTOM", spell)
        spellLabel:SetJustifyV("MIDDLE")
        spellLabel:SetJustifyH("LEFT")
        local spellSublabel = spell:CreateFontString("$parentSubLabel",
                                                     "OVERLAY",
                                                     "NewSubSpellFont")
        spellSublabel:SetJustifyH("LEFT")
        spellSublabel:SetPoint("TOPLEFT", spellLabel, "TOPRIGHT", 2, 0)
        spellSublabel:SetPoint("BOTTOM", spellLabel)
        local spellLevelLabel = spell:CreateFontString("$parentLevelLabel",
                                                       "OVERLAY",
                                                       "GameFontWhite")
        spellLevelLabel:SetPoint("TOPRIGHT", spell, -4, 0)
        spellLevelLabel:SetPoint("BOTTOM", spell)
        spellLevelLabel:SetJustifyH("RIGHT")
        spellLevelLabel:SetJustifyV("MIDDLE")
        spellSublabel:SetPoint("RIGHT", spellLevelLabel, "LEFT")
        spellSublabel:SetJustifyV("MIDDLE")

        local headerLabel = row:CreateFontString("$parentHeaderLabel",
                                                 "OVERLAY", "GameFontWhite")
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

        row.zoneIcons = {}
        for _ = 1, wt.NumCityIcons do
            local zoneFrame = CreateFrame("Frame", nil, row)
            zoneFrame:SetSize(ROW_HEIGHT, ROW_HEIGHT)
            zoneFrame.icon = zoneFrame:CreateTexture(nil, "OVERLAY")
            zoneFrame.icon:SetAllPoints()
            zoneFrame:EnableMouse(false)
            zoneFrame:Hide()
            tinsert(row.zoneIcons, zoneFrame)
        end

        if rows[i - 1] == nil then
            row:SetPoint("TOPLEFT", mainFrame, 26, -78)
        else
            row:SetPoint("TOPLEFT", rows[i - 1], "BOTTOMLEFT", 0, -2)
        end
        row:SetPoint("RIGHT", scrollBar)

        rawset(rows, i, row)
    end
    mainFrame.rows = rows
    createWeaponSkillsButton()
end

local function addIgnoreLines(rootDescription, config)
    rootDescription:CreateTitle(config.title)
    rootDescription:CreateCheckbox(wt.L.IGNORED_TT, function() return config.isIgnored end, function()
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        ignoreStore:Flip(config.id)
        config.afterClick()
        return MenuResponse.Close
    end)

    local allRanks = wt:AllRanks(config.id)
    if allRanks and #allRanks > 1 then
        local allIgnored = true
        for _, id in ipairs(allRanks) do
            allIgnored = allIgnored and ignoreStore:IsIgnored(id)
        end
        rootDescription:CreateCheckbox(wt.L.IGNORE_ALL_TT, function() return allIgnored end, function ()
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            ignoreStore:UpdateMany(allRanks, not allIgnored)
            config.afterClick()
            return MenuResponse.Close
        end)
    end
end

wt.NpcClickHook = function(spell, row)
    if not wt.canSetWaypoint(spell) then return end
    PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
    MenuUtil.CreateContextMenu(row, function(_, rootDescription)
        rootDescription:CreateTitle(spell.masterName or spell.name)
        rootDescription:CreateButton(wt.L.WAYPOINT_SET, function()
            wt.setWaypoint(spell)
            return MenuResponse.Close
        end)
    end)
end

wt.ClickHook = function(spell, afterClick, row)
    if not wt.TomeIds or not wt.TomeIds[spell.itemId or spell.id] then
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        local isIgnored = ignoreStore:IsIgnored(spell.id)
        MenuUtil.CreateContextMenu(row, function(_, rootDescription)
            addIgnoreLines(rootDescription, {
                title = spell.formattedFullName,
                isIgnored = isIgnored,
                id = spell.id,
                afterClick = afterClick
            })
        end)

        return
    end

    local checked = wt:IsPetAbilityLearned(spell.id)
    PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
    local isIgnored = ignoreStore:IsIgnored(spell.id)
    MenuUtil.CreateContextMenu(row, function(_, rootDescription)
        if wt.SayaadTomes[spell.itemId] then
            rootDescription:CreateTitle(string.format("%s — %s", wt.L.TOME_HEADER, spell.localFamily))
        else
            rootDescription:CreateTitle(wt.L.TOME_HEADER)
        end
        rootDescription:CreateCheckbox(wt.L.TOME_LEARNED, function() return checked end, function()
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            wt:SetPetAbilityStatus(spell.id, not checked)
            afterClick()
            return MenuResponse.Close
        end)
        addIgnoreLines(rootDescription, {
            title = spell.formattedFullName,
            isIgnored = isIgnored,
            id = spell.id,
            afterClick = afterClick
        })
    end)
end
