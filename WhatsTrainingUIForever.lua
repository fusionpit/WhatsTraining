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
            if wt.canSetWaypoint(spell) then
                GameTooltip:AddLine(wt.L.CLICK_TO_WAYPOINT, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
            end
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
        local trainer = self.spell
        if button == "LeftButton" and not IsShiftKeyDown() and trainer and trainer.npc
            and wt.canSetWaypoint(trainer) then
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            wt.setWaypoint(trainer)
            return
        end
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

-- Levels: spells as icon cells, grouped per level for upcoming spells and per category otherwise.
local COLS, CELL, GROUP_HEADER, GROUP_GAP = 3, 44, 42, 8

local function buildGroups(data)
    local groups, group, category = {}, nil, nil
    for _, spell in ipairs(data) do
        if spell.isHeader then
            category, group = spell, nil
        else
            local level = (category.key == wt.NEXTLEVEL_KEY or category.key == wt.NOTLEVEL_KEY) and spell.level or nil
            if not group or group.level ~= level then
                group = {category = category, level = level, spells = {}}
                tinsert(groups, group)
            end
            tinsert(group.spells, spell)
        end
    end
    return groups
end

local function groupTitle(group)
    local key = group.category.key
    if key == wt.AVAILABLE_KEY then return wt.L.AVAILABLE_HEADER, 0.10, 0.38, 0.05 end
    if key == wt.NEXTLEVEL_KEY then
        return string.format(wt.L.LEVEL_FORMAT, group.level) .. " • " .. wt.L.NEXTLEVEL_HEADER, 0.08, 0.22, 0.50
    end
    if key == wt.NOTLEVEL_KEY then return string.format(wt.L.LEVEL_FORMAT, group.level), 0.30, 0.10, 0.05 end
    return group.category.name or group.category.formattedName, 0.30, 0.10, 0.05
end

local function createGroupHeader(parent)
    local header = CreateFrame("Frame", nil, parent)
    header:SetHeight(GROUP_HEADER)
    header.rule = header:CreateTexture(nil, "BACKGROUND")
    header.rule:SetColorTexture(0.30, 0.19, 0.08, 0.35)
    header.rule:SetPoint("TOPLEFT", 8, 0)
    header.rule:SetPoint("TOPRIGHT", -8, 0)
    header.rule:SetHeight(1)
    header.title = label(header, "", "SystemFont_Large", 8, -12)
    header.count = label(header, "", "SystemFont_Med3", 0, 0)
    header.count:ClearAllPoints()
    header.count:SetPoint("BOTTOMLEFT", header.title, "BOTTOMRIGHT", 0, 0)
    return header
end

local function createCell(mainFrame)
    local cell = createRow(mainFrame.levels, mainFrame.rankX, mainFrame.levelX)
    for _, region in ipairs({cell.band, cell.heading, cell.level, cell.separator}) do region:Hide() end
    cell.icon:ClearAllPoints()
    cell.icon:SetPoint("TOPLEFT", 4, -2)
    cell.icon:SetSize(36, 36)
    cell.iconBorder:SetSize(58, 58)
    cell.name:ClearAllPoints()
    cell.name:SetPoint("TOPLEFT", 48, -3)
    cell.rank:ClearAllPoints()
    cell.rank:SetPoint("TOPLEFT", 48, -21)
    cell.rank:SetFontObject("SystemFont_Med1")
    return cell
end

local function wholeBlocks(groups)
    local blocks = {}
    for i, group in ipairs(groups) do blocks[i] = {group = group, first = 1, last = #group.spells} end
    return blocks
end

-- lays out blocks ({group, first, last} slices of a group's spells) and returns the content height
local function updateLevels(mainFrame, blocks)
    local levels, y, cellIndex = mainFrame.levels, 0, 0
    local width = (levels:GetWidth() - 32) / COLS
    for i, block in ipairs(blocks) do
        local group, first, last = block.group, block.first, block.last
        local header = mainFrame.groupHeaders[i]
        if not header then
            header = createGroupHeader(levels)
            mainFrame.groupHeaders[i] = header
        end
        local total = #group.spells
        local rows = math.ceil((last - first + 1) / COLS)
        header:SetPoint("TOPLEFT", levels, "TOPLEFT", 0, -y)
        header:SetPoint("TOPRIGHT", levels, "TOPRIGHT", 0, -y)
        header.rule:SetShown(i > 1)
        local title, r, g, b = groupTitle(group)
        header.title:SetText(first > 1 and title .. " " .. wt.L.CONTINUED or title)
        header.title:SetTextColor(r, g, b)
        local count
        if first == 1 and last == total then
            count = string.format(total == 1 and wt.L.LEVELS_SPELL_COUNT or wt.L.LEVELS_SPELLS_COUNT, total)
        elseif first == last then
            count = string.format(wt.L.LEVELS_SPLIT_ONE, first, total)
        else
            count = string.format(wt.L.LEVELS_SPLIT_COUNT, first, last, total)
        end
        header.count:SetText(" • " .. count)
        header:Show()
        y = y + GROUP_HEADER
        for index = first, last do
            local spell = group.spells[index]
            cellIndex = cellIndex + 1
            local cell = mainFrame.cells[cellIndex]
            if not cell then
                cell = createCell(mainFrame)
                mainFrame.cells[cellIndex] = cell
            end
            hideTooltip(cell)
            local offset = index - first
            cell.spell, cell.category = spell, group.category
            cell:ClearAllPoints()
            cell:SetPoint("TOPLEFT", levels, "TOPLEFT", 16 + (offset % COLS) * width,
                -y - math.floor(offset / COLS) * CELL)
            cell:SetSize(width - 4, CELL - 4)
            cell.icon:SetTexture(spell.useAltIcon and spell.altIcon or spell.icon)
            cell.name:SetWidth(width - 56)
            cell.name:SetText(spell.name)
            cell.rank:SetWidth(width - 56)
            local subText = spell.subText or ""
            if not group.level and not group.category.hideLevel then
                subText = (subText ~= "" and subText .. " • " or "") .. spell.formattedLevel
            end
            cell.rank:SetText(subText)
            cell:Show()
        end
        y = y + rows * CELL + GROUP_GAP
    end
    for i = #blocks + 1, #mainFrame.groupHeaders do mainFrame.groupHeaders[i]:Hide() end
    for i = cellIndex + 1, #mainFrame.cells do
        mainFrame.cells[i].spell = nil
        mainFrame.cells[i]:Hide()
    end
    levels:SetHeight(math.max(1, y))
    return y
end

-- expanded paging: split the class spell display into halves of `height` px, two halves per page
local function paginateLedger(data, height)
    local counts, category = {}, nil
    for _, s in ipairs(data) do
        if s.isHeader then category, counts[s] = s, 0 else counts[category] = counts[category] + 1 end
    end
    local function header(cat, suffix)
        local name = cat.name or cat.formattedName
        return setmetatable({label = suffix and name .. " • " .. suffix or name}, {__index = cat})
    end
    local halves, half, y = {}, {}, 0
    for _, s in ipairs(data) do
        -- mirrors updatePage's spacing: 8 above a header, 4 below it
        local gap = s.isHeader and #half > 0 and 8 or 0
        local needed = s.isHeader and ROW_HEIGHT * 2 + 4 or ROW_HEIGHT
        if #half > 0 and y + gap + needed > height then
            tinsert(halves, half)
            half, y, gap = {}, 0, 0
            if not s.isHeader then
                tinsert(half, header(category, wt.L.CONTINUED))
                y = ROW_HEIGHT + 4
            end
        end
        if s.isHeader then category = s end
        tinsert(half, s.isHeader and header(s, counts[s] > 0 and counts[s]) or s)
        y = y + gap + (s.isHeader and ROW_HEIGHT + 4 or ROW_HEIGHT)
    end
    tinsert(halves, half)
    return halves
end

-- level halves are block lists for updateLevels. a group that does not fit moves whole to the
-- next half unless that would leave more than MAX_WASTE of this half empty. then it splits.
local MAX_WASTE = 0.4
local function paginateLevels(groups, height)
    local halves, half, y = {}, {}, 0
    local maxRows = math.floor((height - GROUP_HEADER) / CELL)
    for _, group in ipairs(groups) do
        local first, total = 1, #group.spells
        while first <= total do
            local rowsLeft = math.floor((height - y - GROUP_HEADER) / CELL)
            local rowsNeeded = math.ceil((total - first + 1) / COLS)
            if #half > 0 and rowsNeeded > rowsLeft and (rowsLeft < 1
                or (rowsNeeded <= maxRows and (height - y) / height <= MAX_WASTE)) then
                tinsert(halves, half)
                half, y, rowsLeft = {}, 0, maxRows
            end
            local rows = math.max(1, math.min(rowsNeeded, rowsLeft))
            local last = math.min(total, first + rows * COLS - 1)
            tinsert(half, {group = group, first = first, last = last})
            y = y + GROUP_HEADER + rows * CELL + GROUP_GAP
            first = last + 1
        end
    end
    tinsert(halves, half)
    return halves
end

local function paginate(mainFrame)
    local levels = WT_SpellDisplay == "levels"
    -- the content area updatePage anchors: top offset per display, 30 above the bottom;
    -- levels also keep a line free for the "Continues on ..." note
    local height = mainFrame:GetHeight() - (levels and 72 + 12 or 103) - 30
    if levels then return paginateLevels(buildGroups(wt.spellListData), height) end
    return paginateLedger(wt.spellListData, height)
end

local function endsSplit(blocks)
    local block = blocks[#blocks]
    return block ~= nil and block.last ~= nil and block.last < #block.group.spells
end

local function levelRange(blocks)
    local lo, hi
    for _, block in ipairs(blocks) do
        local level = block.group and block.group.level
        if level then lo, hi = math.min(lo or level, level), math.max(hi or level, level) end
    end
    return lo, hi
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

-- pageData: one paginated half (ledger rows or levels blocks) instead of the whole scrolling list
local function updatePage(mainFrame, weapons, pageData)
    mainFrame.character:SetText(string.format("%s • %s", UnitClass("player"),
        weapons and wt.L.WEAPON_SKILLS_HEADER or
        string.format(wt.L.LEVEL_FORMAT, wt.playerLevel or UnitLevel("player"))))
    mainFrame.total:SetShown(not weapons)
    local levels = not weapons and WT_SpellDisplay == "levels"
    mainFrame.columns:SetShown(not weapons and not levels)
    mainFrame.levels:SetShown(levels)
    local cityView = weapons and WT_WeaponGrouping == "zone"
    local skillView = weapons and WT_WeaponGrouping == "weaponskill"
    local listView = weapons and WT_WeaponGrouping == "list"
    mainFrame.scrollFrame:Show()
    mainFrame.scrollFrame:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 0,
        levels and -72 or listView and -103 or weapons and -84 or -103)
    mainFrame.scrollFrame.ScrollBar:SetShown(not pageData)
    mainFrame.scrollFrame:EnableMouseWheel(not pageData)
    mainFrame.listColumns:SetShown(listView)
    mainFrame.footer:SetText(listView and wt.L.LEDGER_WEAPON_LIST_HINT or
        weapons and wt.L.LEDGER_WEAPON_HINT or wt.L.LEDGER_HINT)
    local y, availableCost, category, headingRow = 0, 0
    for _, spell in ipairs(wt.spellListData) do
        if spell.isHeader and spell.key == wt.AVAILABLE_KEY then availableCost = spell.cost end
    end
    local data = listView and wt.weaponListData or weapons and {} or pageData or wt.spellListData
    local rows = levels and {} or data -- Levels draws cells instead of rows
    local hasListSkills = false
    for i, spell in ipairs(rows) do
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
            row.heading:SetText(spell.label or spell.name or spell.formattedName)
        else
            row.category = category
            headingRow.count = headingRow.count + 1
            if not listView and not category.label then
                headingRow.heading:SetText(string.format("%s • %d",
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
    for i = #rows + 1, #mainFrame.rows do
        mainFrame.rows[i].spell = nil
        mainFrame.rows[i]:Hide()
    end
    if levels then y = updateLevels(mainFrame, pageData or wholeBlocks(buildGroups(data))) end
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
    mainFrame.empty:SetPoint("TOPLEFT", 8, levels and -80 or listView and -112 or weapons and -92 or -112)
    mainFrame.empty:SetShown(((not weapons or listView) and #data == 0) or ((cityView or skillView) and #weaponData == 0))
    mainFrame.content:SetHeight(math.max(1, y))
    local scroll = mainFrame.scrollFrame
    scroll:UpdateScrollChildRect()
    scroll:SetVerticalScroll(math.min(scroll:GetVerticalScroll(), math.max(0, y - scroll:GetHeight())))
end

function wt.UpdateToggleIcon(mainFrame)
    if mainFrame and mainFrame.scrollBar then return wt.CompactUI.UpdateToggleIcon(mainFrame) end
    if not mainFrame or not mainFrame.classSpellsButton then return end
    local weapons = mainFrame.expanded and mainFrame.sideBySide or (not mainFrame.expanded and wt.showingWeaponSkills)
    selectButton(mainFrame.classSpellsButton, not weapons)
    selectButton(mainFrame.weaponSkillsButton, weapons)
end

function wt.Update(mainFrame, forceUpdate)
    if mainFrame and mainFrame.scrollBar then return wt.CompactUI.Update(mainFrame, forceUpdate) end
    if not mainFrame or not mainFrame.rows then return end
    wt.UpdateToggleIcon(mainFrame)
    local expanded, weaponPage = mainFrame.expanded, mainFrame.weaponPage
    local dual = expanded and not mainFrame.sideBySide
    mainFrame.title:SetText(expanded and wt.L.LEDGER_CLASS_SPELLS or "What's Training?")
    weaponPage.title:SetText(dual and wt.L.LEDGER_CLASS_SPELLS .. " " .. wt.L.CONTINUED or wt.L.WEAPON_SKILLS_HEADER)
    weaponPage:SetShown(expanded)
    weaponPage.footer:SetShown(not dual)
    mainFrame.pagingControls:SetShown(dual)
    mainFrame.continues:SetShown(false)
    weaponPage.continues:SetShown(false)
    if not dual then
        updatePage(mainFrame, not expanded and wt.showingWeaponSkills)
        if expanded then updatePage(weaponPage, true) end
        return
    end
    local halves, controls = paginate(mainFrame), mainFrame.pagingControls
    controls:SetMaxPages(math.ceil(#halves / 2)) -- clamping re-enters through OnPageChanged; harmless
    local page = controls:GetCurrentPage()
    local left, right = halves[page * 2 - 1] or {}, halves[page * 2] or {}
    updatePage(mainFrame, false, left)
    updatePage(weaponPage, false, right)
    weaponPage.total:Hide()
    weaponPage.empty:Hide()
    mainFrame.continues:SetShown(endsSplit(left))
    weaponPage.continues:SetShown(endsSplit(right))
    local lo, hi = levelRange(right)
    if lo then weaponPage.character:SetText(string.format(wt.L.LEVELS_RANGE, lo, hi)) end
end

function wt.UpdateGroupingButton(mainFrame)
    if mainFrame and mainFrame.scrollBar then return wt.CompactUI.UpdateGroupingButton(mainFrame) end
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
    mainFrame.continues = label(mainFrame, "", "GameFontNormalSmall", 0, 0)
    mainFrame.continues:ClearAllPoints()
    mainFrame.continues:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -24, 30)
    mainFrame.continues:SetJustifyH("RIGHT")

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
    label(mainFrame.listColumns, wt.L.LEDGER_WEAPON_SKILL, "SystemFont_Med3", 8, -78)
    label(mainFrame.listColumns, wt.L.LEDGER_TRAINED_IN, "SystemFont_Med3", mainFrame.cityX, -78)
    mainFrame.cityLegend = CreateFrame("Frame", nil, content)
    mainFrame.cityLegend:SetSize(content:GetWidth() - 16, 24)
    mainFrame.cityLegend.entries = {}
    mainFrame.levels = CreateFrame("Frame", nil, content)
    mainFrame.levels:SetPoint("TOPLEFT")
    mainFrame.levels:SetWidth(content:GetWidth())
    mainFrame.cells, mainFrame.groupHeaders = {}, {}
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
        weaponPage.footer:SetWidth(weaponPage:GetWidth() - 28)
        weaponPage:Hide()
        mainFrame.continues:SetText(wt.L.CONTINUES_RIGHT)
        weaponPage.continues:SetText(wt.L.CONTINUES_NEXT)
        mainFrame.sideBySide = WT_SideBySide

        local controls = CreateFrame("Frame", nil, weaponPage, "PagingControlsHorizontalTemplate")
        mainFrame.pagingControls = controls
        controls:SetPoint("BOTTOMRIGHT", weaponPage, "BOTTOMRIGHT", -20, 7)
        controls.PageText:SetFontObject("SystemFont_Med3")
        controls.PageText:SetTextColor(0.19, 0.12, 0.06)
        controls.spacing = 8
        weaponPage.continues:ClearAllPoints()
        weaponPage.continues:SetPoint("RIGHT", controls, "LEFT", -12, 0)
        controls.prevPageSound, controls.nextPageSound = SOUNDKIT.IG_ABILITY_PAGE_TURN, SOUNDKIT.IG_ABILITY_PAGE_TURN
        function weaponPage:OnPageChanged() wt.Update(mainFrame) end
        book:EnableMouseWheel(true)
        book:HookScript("OnMouseWheel", function(_, delta)
            if mainFrame:IsShown() and mainFrame.expanded and not mainFrame.sideBySide then
                controls:OnMouseWheel(delta)
            end
        end)

        local function selectView(weapons)
            if mainFrame.expanded then
                if mainFrame.sideBySide ~= weapons then
                    mainFrame.sideBySide = weapons
                    wt:ApplyFilter()
                end
            elseif wt.showingWeaponSkills ~= weapons then
                mainFrame.scrollFrame:SetVerticalScroll(0)
                wt:ToggleWeaponSkills()
            end
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
            mainFrame.scrollFrame:SetVerticalScroll(0)
            weaponPage.scrollFrame:SetVerticalScroll(0)
            controls:SetCurrentPage(1)
            if filter == wt.filter then return end
            wt.filter = filter
            wt:ApplyFilter()
        end)

        local dropdown = CreateFrame("DropdownButton", nil, mainFrame, "SpellBookSettingsDropdownTemplate")
        mainFrame.displayDropdown = dropdown
        dropdown:ClearAllPoints()
        dropdown:SetAllPoints(book.SettingsDropdown)
        local function rescroll()
            (mainFrame.expanded and weaponPage or mainFrame).scrollFrame:SetVerticalScroll(0)
        end
        local function isStyle(style) return WT_SpellDisplay == style end
        local function setStyle(style)
            WT_SpellDisplay = style
            mainFrame.scrollFrame:SetVerticalScroll(0)
            wt.RefreshUI()
        end
        local function isGrouping(mode) return WT_WeaponGrouping == mode end
        local function setGrouping(mode)
            WT_WeaponGrouping = mode
            rescroll()
            wt:ApplyFilter()
        end
        local function showsKnown() return WT_ShowKnownWeaponSkills end
        local function toggleKnown()
            WT_ShowKnownWeaponSkills = not WT_ShowKnownWeaponSkills
            rescroll()
            wt:ApplyFilter()
        end
        local function isSideBySide() return WT_SideBySide end
        local function toggleSideBySide()
            WT_SideBySide = not WT_SideBySide
            mainFrame.sideBySide = WT_SideBySide
            wt:ApplyFilter()
        end
        dropdown:SetupMenu(function(_, rootDescription)
            rootDescription:CreateTitle(wt.L.LEDGER_OPT_CLASS_HEADER)
            rootDescription:CreateRadio(wt.L.DISPLAY_LEVELS, isStyle, setStyle, "levels")
            rootDescription:CreateRadio(wt.L.GROUP_LIST, isStyle, setStyle, "ledger")
            rootDescription:CreateCheckbox(wt.L.LEDGER_SIDE_BY_SIDE, isSideBySide, toggleSideBySide)
            rootDescription:CreateDivider()
            rootDescription:CreateTitle(wt.L.GROUPING_OPTIONS_TITLE)
            rootDescription:CreateRadio(wt.L.GROUP_BY_ZONE, isGrouping, setGrouping, "zone")
            rootDescription:CreateRadio(wt.L.GROUP_BY_WEAPON_SKILL, isGrouping, setGrouping, "weaponskill")
            rootDescription:CreateRadio(wt.L.GROUP_LIST, isGrouping, setGrouping, "list")
            rootDescription:CreateCheckbox(wt.L.LEDGER_SHOW_KNOWN, showsKnown, toggleKnown)
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
            mainFrame:SetShown(selected)
            if selected then
                updateLayout()
                wt.RefreshUI()
            end
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

SLASH_WHATSTRAINING1 = "/wt"
SlashCmdList.WHATSTRAINING = function()
    local frame = wt.FloatingFrame
    if not frame then
        frame = CreateFrame("Frame", "WhatsTrainingFloatingFrame", UIParent, "UIPanelDialogTemplate")
        wt.FloatingFrame = frame
        -- The Classic Era/TBC SpellBookFrame dimensions, independent of any spellbook addon.
        frame:SetSize(384, 512)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("HIGH")
        frame:SetMovable(true)
        frame:SetClampedToScreen(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
        frame.Title:SetText(wt.L.TAB_TEXT)
        frame.maxRows, frame.scrollStep = 27, 16
        wt.CreateCompactFrame(frame)
        frame.searchBox:ClearAllPoints()
        frame.searchBox:SetPoint("TOPLEFT", 20, -28)
        -- Leave room for the weapon toggle and grouping button / hunter notice.
        frame.searchBox:SetWidth(290)
        frame.rows[1]:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -64)
        frame.scrollBar:SetPoint("TOPLEFT", 0, -64)
        frame.scrollBar:SetPoint("BOTTOMRIGHT", -32, 16)
        frame:SetScript("OnShow", function() wt:ApplyFilter() end)
        frame:SetScript("OnHide", function(self)
            self:StopMovingOrSizing()
            self.searchBox:ClearFocus()
            self.groupingPopup:Hide()
        end)
        tinsert(UISpecialFrames, frame:GetName())
    end
    frame:SetShown(not frame:IsShown())
end
