local _, wt = ...
local TAB_TEXTURE_FILEID = GetFileIDFromPath("Interface\\Icons\\INV_Misc_QuestionMark")

local ROW_HEIGHT = 28
local WEAPON_HEADING_HEIGHT = 24
local TRAINER_ROW_HEIGHT = 20
local sectionColors = {
    available = {0.12, 0.24, 0.08, 0.65, 1, 0.40},
    missingReqs = {0.32, 0.15, 0.03, 1, 0.82, 0.30},
    nextLevel = {0.08, 0.18, 0.29, 0.55, 0.84, 1},
    notLevel = {0.30, 0.07, 0.04, 1, 0.55, 0.45},
    weaponAvailable = {0.12, 0.24, 0.08, 0.65, 1, 0.40},
    weaponNextLevel = {0.08, 0.18, 0.29, 0.55, 0.84, 1},
    weaponNotLevel = {0.30, 0.07, 0.04, 1, 0.55, 0.45},
    weaponKnown = {0.20, 0.17, 0.12, 0.75, 0.75, 0.75},
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

local function chromeButton(parent, text, width, onClick)
    local button = CreateFrame("Button", nil, parent, "UIMenuButtonStretchTemplate")
    button:SetSize(width, 26)
    button:SetText(text)
    local highlight = button:GetHighlightTexture()
    highlight:SetColorTexture(1, 0.65, 0.15, 0.22)
    highlight:SetBlendMode("BLEND")
    highlight:ClearAllPoints()
    highlight:SetPoint("TOPLEFT", 5, -5)
    highlight:SetPoint("BOTTOMRIGHT", -5, 5)
    button:SetScript("OnClick", function(self)
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        onClick(self)
    end)
    return button
end

local function selectButton(button, selected)
    button:SetNormalFontObject(selected and "GameFontNormalSmall" or "GameFontHighlightSmall")
    button:SetHighlightFontObject(selected and "GameFontNormalSmall" or "GameFontHighlightSmall")
    if selected then button:LockHighlight() else button:UnlockHighlight() end
end

local function weaponStatus(spell)
    local isKnown = spell.isKnown
    if isKnown == nil then isKnown = wt.isAbilityKnown(spell.id) end
    if isKnown then return wt.L.LEDGER_WEAPON_KNOWN, 0.4, 0.4, 0.4 end
    if wt.weaponIgnoredIds[spell.id] then return wt.L.IGNORED_TT, 0.4, 0.4, 0.4 end
    if not spell.hideLevel then return spell.formattedLevel, 0.55, 0.12, 0.05 end
    return wt.L.LEDGER_WEAPON_AVAILABLE, 0.1, 0.38, 0.05
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
        if not spell or (spell.isHeader and not spell.npc) then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if spell.npc then
            GameTooltip:SetText(spell.masterName or spell.name)
            GameTooltip:AddLine(string.format("%s (%.1f, %.1f)", spell.zoneName, spell.x, spell.y), 0.8, 0.8, 0.8)
        elseif spell.altTooltipType == "weapon" then
            GameTooltip:SetText(spell.name)
            if spell.formattedTrainerZones then
                GameTooltip:AddLine(string.format(wt.L.TRAINED_IN, spell.formattedTrainerZones), 0.8, 0.8, 0.8, true)
            end
            if not wt.isAbilityKnown(spell.id) then GameTooltip:AddLine(wt.formatSpellCost(spell)) end
            GameTooltip:AddLine((weaponStatus(spell)), 1, 0.82, 0.3)
        else
            GameTooltip:SetSpellByID(spell.tooltipId or spell.id)
            GameTooltip:AddLine(wt.formatSpellCost(spell))
            if self.category.key == wt.MISSINGREQS_KEY or self.category.key == wt.MISSINGTALENT_KEY then
                GameTooltip:AddLine(self.category.name, 1, 0.82, 0.30)
            end
        end
        GameTooltip:Show()
    end)
    row:SetScript("OnLeave", hideTooltip)
    row:SetScript("OnHide", hideTooltip)
    row:SetScript("OnClick", function(self, button)
        if self.weaponRow then self = self.weaponRow end
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

local function createCityIcon(parent)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(24, 24)
    local background = frame:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0.2, 0.12, 0.04, 0.08)
    frame.icon = frame:CreateTexture(nil, "ARTWORK")
    frame.icon:SetAllPoints()
    frame.border = frame:CreateTexture(nil, "OVERLAY")
    frame.border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
    frame.border:SetPoint("CENTER")
    frame.border:SetSize(40, 40)
    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(self.city.name)
        if self.spell then
            for _, trainer in ipairs(wt.WeaponSkills[self.spell.id].trainers[wt.playerFaction]) do
                if trainer.zone == self.city.id then
                    GameTooltip:AddLine(string.format("%s (%.1f, %.1f)", trainer.name, trainer.x, trainer.y), 0.8, 0.8, 0.8)
                end
            end
        end
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", hideTooltip)
    frame:SetScript("OnHide", hideTooltip)
    return frame
end

local function setCityIcon(frame, city, spell, available)
    hideTooltip(frame)
    frame.city, frame.spell = city, spell
    frame.icon:SetTexture(city.icon)
    frame.icon:SetShown(available)
    frame.border:SetAlpha(available and 1 or 0.2)
    frame:EnableMouse(available)
    frame:Show()
end

local function updateWeaponGroups(mainFrame, data, byWeapon)
    local width = mainFrame.content:GetWidth()
    local columnWidth, skillHeight = (width - 24) / 2, 42
    local weaponRow
    local function getRow(index, spell)
        local row = mainFrame.weaponRows[index]
        if not row then
            row = createRow(mainFrame.content, mainFrame.rankX, mainFrame.levelX)
            row.separator:ClearAllPoints()
            row.separator:SetPoint("TOPLEFT", 8, 0)
            row.separator:SetPoint("TOPRIGHT", -8, 0)
            mainFrame.weaponRows[index] = row
        end
        hideTooltip(row)
        row.weaponRow = byWeapon and spell.npc and weaponRow or nil
        row.spell = spell
        row:SetFrameLevel(mainFrame.content:GetFrameLevel() + (spell.npc and 2 or 1))
        row:SetHitRectInsets(row.weaponRow and 52 or 0, 0, 0, 0)
        local highlight = row:GetHighlightTexture()
        highlight:ClearAllPoints()
        if row.weaponRow then
            highlight:SetPoint("TOPLEFT", row, "TOPLEFT", 52, 0)
            highlight:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", 0, 0)
        else
            highlight:SetAllPoints(row)
        end
        row:ClearAllPoints()
        row.icon:ClearAllPoints()
        row.icon:SetPoint("TOPLEFT", 8, byWeapon and -2 or -3)
        row.icon:SetSize(byWeapon and 40 or 32, byWeapon and 40 or 32)
        row.iconBorder:SetSize(byWeapon and 64 or 52, byWeapon and 64 or 52)
        row.name:ClearAllPoints()
        row.name:SetPoint("TOPLEFT", byWeapon and 56 or 48, byWeapon and -5 or -3)
        row.name:SetWidth(byWeapon and width - 200 or columnWidth - 56)
        if byWeapon then
            row.name:SetTextColor(0.08, 0.04, 0.02)
        else
            row.name:SetTextColor(0.19, 0.12, 0.06)
        end
        row.rank:ClearAllPoints()
        if byWeapon then
            row.rank:SetPoint("TOPRIGHT", -8, -5)
        else
            row.rank:SetPoint("TOPLEFT", 48, -21)
        end
        row.rank:SetWidth(byWeapon and 128 or columnWidth - 56)
        row.rank:SetJustifyH(byWeapon and "RIGHT" or "LEFT")
        row.heading:ClearAllPoints()
        row.heading:SetPoint("TOPLEFT", byWeapon and spell.npc and 68 or 8, 0)
        row.heading:SetPoint("BOTTOMRIGHT", -8, 0)
        row.heading:SetShown(spell.isHeader == true)
        row.icon:SetShown(not spell.isHeader)
        row.iconBorder:SetShown(not spell.isHeader)
        row.name:SetShown(not spell.isHeader)
        row.rank:SetShown(not spell.isHeader)
        row.level:Hide()
        row.separator:SetShown(byWeapon and not spell.isHeader)
        row.band:ClearAllPoints()
        if byWeapon and not spell.isHeader then
            row.band:SetPoint("TOPLEFT", row, "TOPLEFT", 52, 0)
            row.band:SetPoint("TOPRIGHT")
            row.band:SetHeight(WEAPON_HEADING_HEIGHT)
        else
            row.band:SetAllPoints()
        end
        row.band:SetShown((spell.isHeader and not spell.npc) or (byWeapon and not spell.isHeader))
        row:EnableMouse(not spell.isHeader or spell.npc ~= nil)
        row:Show()
        return row
    end

    local i, y = 1, 0
    while i <= #data do
        local spell = data[i]
        if spell.isHeader then
            local row = getRow(i, spell)
            if i > 1 and not spell.npc then y = y + 10 end
            row:SetPoint("TOPLEFT", mainFrame.content, "TOPLEFT", 0, -y)
            local height = spell.npc and TRAINER_ROW_HEIGHT or ROW_HEIGHT
            row:SetSize(width, height)
            row.heading:SetText(spell.name or spell.formattedName)
            if spell.npc then
                row.heading:SetTextColor(0.19, 0.12, 0.06)
                row.heading:SetShadowOffset(0, 0)
            else
                row.heading:SetTextColor(1, 0.82, 0.3)
                row.heading:SetShadowOffset(1, -1)
                row.band:SetGradient("HORIZONTAL", CreateColor(0.20, 0.12, 0.04, 0.9),
                    CreateColor(0.20, 0.12, 0.04, 0.25))
            end
            y = y + height + (byWeapon and not spell.npc and 4 or 0)
            i = i + 1
        elseif byWeapon then
            local row = getRow(i, spell)
            weaponRow = row
            if i > 1 then y = y + 6 end
            local trainerCount = 0
            while data[i + trainerCount + 1] and data[i + trainerCount + 1].npc do
                trainerCount = trainerCount + 1
            end
            local height = trainerCount > 0 and WEAPON_HEADING_HEIGHT or 40
            row:SetPoint("TOPLEFT", mainFrame.content, "TOPLEFT", 0, -y)
            -- Trainer names have their own hover targets above the full skill block.
            row:SetSize(width, height + trainerCount * TRAINER_ROW_HEIGHT)
            row.icon:SetTexture(spell.icon)
            row.name:SetText(spell.name)
            local status, r, g, b = weaponStatus(spell)
            row.rank:SetText(status)
            row.rank:SetTextColor(r, g, b)
            row.band:SetGradient("HORIZONTAL", CreateColor(0.3, 0.19, 0.08, 0.25),
                CreateColor(0.3, 0.19, 0.08, 0))
            y = y + height
            i = i + 1
        else
            local last = i
            while data[last + 1] and not data[last + 1].isHeader do last = last + 1 end
            local rowsPerColumn = math.ceil((last - i + 1) / 2)
            for index = i, last do
                local skill = data[index]
                local row = getRow(index, skill)
                local offset = index - i
                row:SetPoint("TOPLEFT", mainFrame.content, "TOPLEFT",
                    16 + math.floor(offset / rowsPerColumn) * columnWidth, -y - (offset % rowsPerColumn) * skillHeight)
                row:SetSize(columnWidth, skillHeight)
                row.icon:SetTexture(skill.icon)
                row.name:SetText(skill.name)
                local status, r, g, b = weaponStatus(skill)
                row.rank:SetText(status)
                row.rank:SetTextColor(r, g, b)
            end
            y = y + rowsPerColumn * skillHeight
            i = last + 1
        end
    end
    for index = #data + 1, #mainFrame.weaponRows do
        mainFrame.weaponRows[index].spell = nil
        mainFrame.weaponRows[index]:Hide()
    end
    return y
end

local function updatePage(mainFrame, weapons)
    wt.UpdateGroupingButton(mainFrame, weapons)
    mainFrame.character:SetText(string.format("%s • %s", UnitClass("player"),
        weapons and wt.L.WEAPON_SKILLS_HEADER or
        string.format(wt.L.LEVEL_FORMAT, wt.playerLevel or UnitLevel("player"))))
    mainFrame.total:SetShown(not weapons)
    mainFrame.columns:SetShown(not weapons)
    local cityView = weapons and WT_WeaponGrouping == "zone"
    local skillView = weapons and WT_WeaponGrouping == "weaponskill"
    local listView = weapons and WT_WeaponGrouping == "list"
    mainFrame.scrollFrame:Show()
    mainFrame.scrollFrame:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 0, listView and -134 or -103)
    mainFrame.listColumns:SetShown(listView)
    mainFrame.footer:SetText(listView and wt.L.LEDGER_WEAPON_LIST_HINT or
        weapons and wt.L.LEDGER_WEAPON_HINT or wt.L.LEDGER_HINT)
    local y, availableCost, category, headingRow = 0, 0
    local data = listView and wt.weaponListData or weapons and {} or wt.spellListData
    local hasListSkills = false
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
        row:SetHeight(listView and not isHeader and 32 or ROW_HEIGHT)
        row.icon:ClearAllPoints()
        row.icon:SetPoint("TOPLEFT", 8, listView and -4 or -2)
        row.name:ClearAllPoints()
        row.name:SetPoint("TOPLEFT", 38, listView and -8 or -5)
        row.name:SetWidth((listView and mainFrame.cityX or mainFrame.rankX) - 46)
        row.name:SetTextColor(0.19, 0.12, 0.06)
        if row.cityIcons then
            for _, icon in ipairs(row.cityIcons) do hideTooltip(icon); icon:Hide() end
        end
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
            if not listView then
                headingRow.heading:SetText(string.format("%s - %d",
                    category.name or category.formattedName, headingRow.count))
            end
            row.icon:SetTexture(spell.useAltIcon and spell.altIcon or spell.icon)
            row.name:SetText(spell.name)
            row.rank:SetText(spell.subText or "")
            row.level:SetText(spell.hideLevel and "—" or spell.formattedLevel)
            if category.key == wt.NOTLEVEL_KEY or category.key == wt.WEAPON_NOTLEVEL_KEY then
                row.level:SetTextColor(0.45, 0.09, 0.04)
            else
                row.level:SetTextColor(0.19, 0.12, 0.06)
            end
            if category.key == wt.AVAILABLE_KEY then availableCost = availableCost + spell.cost end
            if listView then
                hasListSkills = true
                row.rank:Hide()
                row.level:SetShown(not spell.hideLevel)
                if category.key == wt.WEAPON_KNOWN_KEY then row.name:SetTextColor(0.4, 0.4, 0.4) end
                row.cityIcons = row.cityIcons or {}
                for index, city in ipairs(wt.weaponSkeleton) do
                    local icon = row.cityIcons[index]
                    if not icon then
                        icon = createCityIcon(row)
                        icon:SetPoint("TOPLEFT", mainFrame.cityX + (index - 1) * 34, -4)
                        row.cityIcons[index] = icon
                    end
                    local available = false
                    for _, zone in ipairs(spell.trainerZones or {}) do
                        if zone.id == city.id then available = true; break end
                    end
                    setCityIcon(icon, city, spell, available)
                end
            end
        end
        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", mainFrame.content, "TOPLEFT", 0, -y)
        row:SetPoint("TOPRIGHT", mainFrame.content, "TOPRIGHT", 0, -y)
        row:Show()
        y = y + row:GetHeight() + (isHeader and 4 or 0)
    end
    for i = #data + 1, #mainFrame.rows do
        mainFrame.rows[i].spell = nil
        mainFrame.rows[i]:Hide()
    end
    mainFrame.total:SetText(string.format(wt.L.LEDGER_AVAILABLE_TOTAL,
        C_CurrencyInfo.GetCoinTextureString(availableCost)))
    local weaponData = cityView and wt.weaponGroupedData or skillView and wt.weaponSkillGroupedData or {}
    local weaponHeight = updateWeaponGroups(mainFrame, weaponData, skillView)
    if cityView or skillView then y = weaponHeight end
    mainFrame.cityLegend:SetShown(listView and hasListSkills)
    if listView and hasListSkills then
        mainFrame.cityLegend:ClearAllPoints()
        mainFrame.cityLegend:SetPoint("TOPLEFT", mainFrame.content, "TOPLEFT", 8, -y - 12)
        local entryWidth = (mainFrame.content:GetWidth() - 16) / #wt.weaponSkeleton
        for index, city in ipairs(wt.weaponSkeleton) do
            local entry = mainFrame.cityLegend.entries[index]
            if not entry then
                entry = createCityIcon(mainFrame.cityLegend)
                entry.name = label(entry, "", "SystemFont_Med3", 32, -5)
                mainFrame.cityLegend.entries[index] = entry
            end
            entry:ClearAllPoints()
            entry:SetPoint("TOPLEFT", (index - 1) * entryWidth, 0)
            entry.name:SetWidth(entryWidth - 36)
            entry.name:SetWordWrap(false)
            entry.name:SetText(city.name)
            setCityIcon(entry, city, nil, true)
        end
        y = y + 48
    end
    mainFrame.empty:SetText(weapons and wt.L.LEDGER_WEAPON_EMPTY or wt.L.LEDGER_EMPTY)
    mainFrame.empty:ClearAllPoints()
    mainFrame.empty:SetPoint("TOPLEFT", 8, listView and -144 or -112)
    mainFrame.empty:SetShown(((not weapons or listView) and #data == 0) or ((cityView or skillView) and #weaponData == 0))
    mainFrame.content:SetHeight(math.max(1, y))
    local scroll = mainFrame.scrollFrame
    scroll:UpdateScrollChildRect()
    scroll:SetVerticalScroll(math.min(scroll:GetVerticalScroll(), math.max(0, y - scroll:GetHeight())))
end

function wt.UpdateToggleIcon(mainFrame)
    if not mainFrame or not mainFrame.classSpellsButton then return end
    selectButton(mainFrame.classSpellsButton, not wt.showingWeaponSkills)
    selectButton(mainFrame.weaponSkillsButton, wt.showingWeaponSkills)
end

function wt.Update(mainFrame)
    if not mainFrame or not mainFrame.rows then return end
    wt.UpdateToggleIcon(mainFrame)
    mainFrame.title:SetText(mainFrame.expanded and wt.L.LEDGER_CLASS_SPELLS or "What's Training?")
    mainFrame.classSpellsButton:SetShown(not mainFrame.expanded)
    mainFrame.weaponSkillsButton:SetShown(not mainFrame.expanded)
    mainFrame.footer:SetWidth(mainFrame:GetWidth() - (mainFrame.expanded and 28 or 280))
    updatePage(mainFrame, not mainFrame.expanded and wt.showingWeaponSkills)
    mainFrame.weaponPage:SetShown(mainFrame.expanded)
    if mainFrame.expanded then updatePage(mainFrame.weaponPage, true) end
end

function wt.UpdateGroupingButton(mainFrame, weapons)
    if not mainFrame or not mainFrame.weaponControls then return end
    if weapons == nil then weapons = not mainFrame.expanded and wt.showingWeaponSkills end
    mainFrame.weaponControls:SetShown(weapons)
    for mode, button in pairs(mainFrame.groupingButtons) do
        selectButton(button, mode == WT_WeaponGrouping)
    end
    mainFrame.showKnown:SetChecked(WT_ShowKnownWeaponSkills)
end

local function createPage(mainFrame)
    mainFrame.title = label(mainFrame, "What's Training?", "SystemFont_Huge2", 8, 0)
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
    mainFrame.columns = CreateFrame("Frame", nil, mainFrame)
    mainFrame.columns:SetAllPoints()
    label(mainFrame.columns, wt.L.LEDGER_SPELL, "SystemFont_Med3", 38, -78)
    label(mainFrame.columns, wt.L.LEDGER_RANK, "SystemFont_Med3", rankX, -78)
    label(mainFrame.columns, wt.L.LEDGER_REQUIRED_LEVEL, "SystemFont_Med3", levelX, -78)
    local footer = label(mainFrame, wt.L.LEDGER_HINT, "GameFontNormalSmall", 0, 0)
    mainFrame.footer = footer
    footer:ClearAllPoints()
    footer:SetPoint("LEFT", mainFrame, "BOTTOMLEFT", 8, 15)
    footer:SetWidth(mainFrame:GetWidth() - 280)
    mainFrame.empty = label(mainFrame, wt.L.LEDGER_EMPTY, "SystemFont_Med3", 8, -112)

    local controls = CreateFrame("Frame", nil, mainFrame)
    mainFrame.weaponControls = controls
    controls:SetPoint("TOPLEFT", 8, -72)
    controls:SetPoint("TOPRIGHT", -20, -72)
    controls:SetHeight(26)
    local groupLabel = label(controls, wt.L.LEDGER_GROUP_BY, "SystemFont_Med3", 0, -6)
    mainFrame.groupingButtons = {}
    local previous = groupLabel
    for _, option in ipairs({
        {"zone", wt.L.LEDGER_GROUP_CITY},
        {"weaponskill", wt.L.LEDGER_GROUP_WEAPON},
        {"list", wt.L.GROUP_LIST},
    }) do
        local mode = option[1]
        local button = chromeButton(controls, option[2], 76, function()
            WT_WeaponGrouping = mode
            mainFrame.scrollFrame:SetVerticalScroll(0)
            wt:ApplyFilter()
        end)
        button:SetPoint("LEFT", previous, "RIGHT", previous == groupLabel and 8 or 2, 0)
        mainFrame.groupingButtons[mode] = button
        previous = button
    end
    local showKnown = CreateFrame("CheckButton", nil, controls, "UICheckButtonTemplate")
    mainFrame.showKnown = showKnown
    showKnown:SetSize(26, 26)
    showKnown.Text:SetText(wt.L.LEDGER_SHOW_KNOWN)
    showKnown.Text:SetTextColor(0.19, 0.12, 0.06)
    showKnown:SetPoint("RIGHT", controls, "RIGHT", -showKnown.Text:GetStringWidth(), 0)
    showKnown:SetHitRectInsets(0, -showKnown.Text:GetStringWidth(), 0, 0)
    showKnown:SetScript("OnClick", function(self)
        WT_ShowKnownWeaponSkills = self:GetChecked()
        mainFrame.scrollFrame:SetVerticalScroll(0)
        wt:ApplyFilter()
    end)

    local scroll = CreateFrame("ScrollFrame", "$parentScrollFrame", mainFrame, "ScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 0, -103)
    scroll:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -20, 30)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetWidth(mainFrame:GetWidth() - 20)
    scroll:SetScrollChild(content)
    mainFrame.scrollFrame = scroll
    mainFrame.content, mainFrame.rows, mainFrame.weaponRows = content, {}, {}
    mainFrame.cityX = math.floor(content:GetWidth() * 0.56)
    mainFrame.listColumns = CreateFrame("Frame", nil, mainFrame)
    mainFrame.listColumns:SetAllPoints()
    label(mainFrame.listColumns, wt.L.LEDGER_WEAPON_SKILL, "SystemFont_Med3", 8, -110)
    label(mainFrame.listColumns, wt.L.LEDGER_TRAINED_IN, "SystemFont_Med3", mainFrame.cityX, -110)
    mainFrame.cityLegend = CreateFrame("Frame", nil, content)
    mainFrame.cityLegend:SetSize(content:GetWidth() - 16, 24)
    mainFrame.cityLegend.entries = {}
end

local function attachForeverSpellBook(mainFrame)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", function()
        local book = PlayerSpellsFrame.SpellBookFrame
        mainFrame:SetParent(book)
        mainFrame:SetPoint("TOPLEFT", book, "TOPLEFT", 65, -90)
        mainFrame:SetPoint("BOTTOMLEFT", book, "BOTTOMLEFT", 65, 15)
        mainFrame:SetWidth(book.minimizedWidth - 110)

        createPage(mainFrame)
        local weaponPage = CreateFrame("Frame", "$parentWeaponPage", mainFrame)
        mainFrame.weaponPage = weaponPage
        weaponPage:SetPoint("TOPRIGHT", book, "TOPRIGHT", -45, -90)
        weaponPage:SetPoint("BOTTOMRIGHT", book, "BOTTOMRIGHT", -45, 15)
        weaponPage:SetWidth(mainFrame:GetWidth())
        createPage(weaponPage)
        weaponPage.title:SetText(wt.L.WEAPON_SKILLS_HEADER)
        weaponPage.footer:SetWidth(weaponPage:GetWidth() - 28)
        weaponPage:Hide()

        local function selectView(weapons)
            if wt.showingWeaponSkills == weapons then return end
            mainFrame.scrollFrame:SetVerticalScroll(0)
            wt:ToggleWeaponSkills()
        end
        mainFrame.weaponSkillsButton = chromeButton(mainFrame, wt.L.WEAPON_SKILLS_HEADER, 120,
            function() selectView(true) end)
        mainFrame.weaponSkillsButton:SetPoint("RIGHT", mainFrame, "BOTTOMRIGHT", -20, 15)
        mainFrame.classSpellsButton = chromeButton(mainFrame, wt.L.LEDGER_CLASS_SPELLS, 120,
            function() selectView(false) end)
        mainFrame.classSpellsButton:SetPoint("RIGHT", mainFrame.weaponSkillsButton, "LEFT", -2, 0)

        local search = CreateFrame("EditBox", "$parentSearchBox", mainFrame, "SearchBoxTemplate")
        mainFrame.searchBox = search
        search:SetAllPoints(book.SearchBox)
        search:SetText(wt.filter)
        search:HookScript("OnHide", function(self) self:ClearFocus() end)
        search:HookScript("OnTextChanged", function(self)
            local filter = strlower(self:GetText())
            if filter == wt.filter then return end
            wt.filter = filter
            mainFrame.scrollFrame:SetVerticalScroll(0)
            weaponPage.scrollFrame:SetVerticalScroll(0)
            wt:ApplyFilter()
        end)

        -- keep our launcher outside blizz's pool: `CreateCategoryMixins` releases its tabs
        local button = CreateFrame("Button", "WhatsTrainingSpellBookButton", book.CategoryTabSystem,
                                   "SpellBookCategoryTabTemplate")
        button:Init(0, nil, TAB_TEXTURE_FILEID)
        button:SetPoint("LEFT", book.CategoryTabSystem, "RIGHT", 8, 0)
        local function updateLayout()
            local expanded = not book.isMinimized
            if mainFrame.expanded ~= expanded then
                mainFrame.expanded = expanded
                mainFrame.scrollFrame:SetVerticalScroll(0)
                weaponPage.scrollFrame:SetVerticalScroll(0)
                wt.applyFilter()
            end
        end
        local function selectTraining(selected)
            if selected then
                updateLayout()
                wt.Update(mainFrame)
            end
            mainFrame:SetShown(selected)
            book.PagedSpellsFrame:SetShown(not selected)
            book.SearchBox:SetShown(not selected)
            book.SettingsDropdown:SetShown(not selected)
            book.SearchPreviewContainer:Hide()
            button:SetTabSelected(selected)
            -- SetTabVisuallySelected writes isSelected, which Blizzard reads when
            -- reusing tabs in SetSquareMode. Keep that state untainted for combat.
            for _, tab in ipairs(book.CategoryTabSystem.tabs) do
                local active = not selected and tab:IsSelected()
                tab.SquareBackground:SetShown(not active)
                tab.SquareBackgroundActive:SetShown(active)
                tab.SquareBackgroundActiveGlow:SetShown(active)
                tab:SetEnabled(not active and not tab:IsForceDisabled())
            end
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
        hooksecurefunc(book, "SetMinimized", function()
            updateLayout()
            if mainFrame:IsShown() then selectTraining(true) end
        end)
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
    function wt.Open(toWeapons)
        if InCombatLockdown() then
            print(wt.L.BROKER_OPEN_IN_COMBAT)
            return
        end
        wt.showingWeaponSkills = toWeapons == true
        wt.applyFilter()
        securecallfunction(PlayerSpellsUtil.OpenToSpellBookTab)
        if mainFrame.selectTraining then mainFrame.selectTraining(true) end
    end
    attachForeverSpellBook(mainFrame)
end
