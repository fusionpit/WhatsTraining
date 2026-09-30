local _, wt = ...
local Forever = wt.Forever
local ROW_HEIGHT, COLS, CELL, GROUP_HEADER = Forever.ROW_HEIGHT, Forever.COLS, Forever.CELL, Forever.GROUP_HEADER

local WEAPON_HEADING_HEIGHT = 24
local TRAINER_ROW_HEIGHT = 20
local SKILL_HEIGHT = 42
local CONTENT_RISE = 16
local HEADER_CAP_FRACTION = 8 / 1024

local function label(parent, text, font, x, y)
    local value = parent:CreateFontString(nil, "OVERLAY", font)
    value:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    value:SetTextColor(unpack(wt.Theme.body))
    value:SetJustifyH("LEFT")
    value:SetText(text)
    return value
end

local function hideTooltip(self)
    if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
end

local function categoryScripts(header)
    header:EnableMouse(true)
    header:RegisterForClicks("RightButtonUp")
    header:SetScript("OnEnter", function(self)
        local category = self.spell
        if not category or not category.cost or category.cost <= 0 then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        wt.SetTooltip(GameTooltip, category)
    end)
    header:SetScript("OnLeave", hideTooltip)
    header:SetScript("OnHide", hideTooltip)
    header:SetScript("OnClick", function(self, button)
        if button ~= "RightButton" or not self.spell or self.spell.key ~= wt.AVAILABLE_KEY then return end
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        MenuUtil.CreateContextMenu(self, wt.priceMenuGenerator)
    end)
end

local function weaponStatus(spell)
    local isKnown = spell.isKnown
    if isKnown == nil then isKnown = wt.isAbilityKnown(spell.id) end
    if isKnown then return wt.L.LEDGER_WEAPON_KNOWN, unpack(wt.Theme.dim) end
    if wt.weaponIgnoredIds[spell.id] then return wt.L.IGNORED_TT, unpack(wt.Theme.dim) end
    if not spell.hideLevel then return spell.formattedLevel, unpack(wt.Theme.weaponUnavailable) end
    return wt.L.LEDGER_WEAPON_AVAILABLE, unpack(wt.Theme.available)
end

local function createRow(page, parent)
    parent = parent or page.content
    local rankX, levelX = page.rankX, page.levelX
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(parent:GetWidth(), ROW_HEIGHT)
    row:EnableMouse(true)
    row.band = row:CreateTexture(nil, "BACKGROUND")
    row.band:SetAllPoints()
    row.band:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated")
    row.heading = label(row, "", "SystemFont_Med3", 8, -5)
    row.heading:ClearAllPoints()
    row.heading:SetPoint("TOPLEFT", row, "TOPLEFT", 8, 0)
    row.heading:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -8, 0)
    row.heading:SetJustifyV("MIDDLE")
    row.heading:SetShadowColor(unpack(wt.Theme.shadow))
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
    row.level:SetWidth(parent:GetWidth() - levelX - 8)
    row.level:SetWordWrap(false)
    row.separator = CreateFrame("Frame", nil, row)
    row.separator:SetPoint("BOTTOMLEFT", 38, 0)
    row.separator:SetPoint("BOTTOMRIGHT", -8, 0)
    row.separator:SetHeight(2)

    local clear = CreateColor(unpack(wt.Theme.clear))
    local ink = CreateColor(unpack(wt.Theme.separator))
    for i = 1, 2 do
        local half = row.separator:CreateTexture(nil, "BACKGROUND")
        half:SetPoint("BOTTOMLEFT", 0, i - 1)
        half:SetPoint("BOTTOMRIGHT", 0, i - 1)
        half:SetHeight(1)
        half:SetColorTexture(unpack(wt.Theme.white))
        half:SetGradient("VERTICAL", i == 1 and clear or ink, i == 1 and ink or clear)
        half:SetSnapToPixelGrid(false)
        half:SetTexelSnappingBias(0)
    end
    local highlight = row:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetColorTexture(unpack(wt.Theme.highlight))
    row:SetHighlightTexture(highlight)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row:SetScript("OnEnter", function(self)
        local spell = self.spell
        if not spell or (spell.isHeader and not spell.npc) then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if spell.npc then
            GameTooltip:SetText(spell.masterName or spell.name)
            GameTooltip:AddLine(string.format("%s (%.1f, %.1f)", spell.zoneName, spell.x, spell.y),
                unpack(wt.Theme.tooltipText))
            if wt.canSetWaypoint(spell) then
                GameTooltip:AddLine(wt.L.CLICK_TO_WAYPOINT, unpack(wt.Theme.tooltipWaypoint))
            end
        elseif spell.altTooltipType == "weapon" then
            GameTooltip:SetText(spell.name)
            if spell.formattedTrainerZones then
                local r, g, b = unpack(wt.Theme.tooltipText)
                GameTooltip:AddLine(string.format(wt.L.TRAINED_IN, spell.formattedTrainerZones), r, g, b, true)
            end
            if not wt.isAbilityKnown(spell.id) then wt.addPricingBlock(GameTooltip, spell) end
            GameTooltip:AddLine((weaponStatus(spell)), unpack(wt.Theme.tooltipHint))
        else
            wt.SetSpellTooltip(GameTooltip, spell)
            wt.addPricingBlock(GameTooltip, spell)
            if self.category.key == wt.MISSINGREQS_KEY or self.category.key == wt.MISSINGTALENT_KEY then
                GameTooltip:AddLine(self.category.name, unpack(wt.Theme.tooltipHint))
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
        if button == "LeftButton" and IsShiftKeyDown() then
            wt.InsertLink(spell)
        elseif button == "RightButton" and wt.ClickHook then
            wt.ClickHook(spell, function() wt:RebuildData() end, self)
        end
    end)
    return row
end

-- Pages draw with fixed-shape frames, one pool per kind, so a refresh only fills them in.
local function framePool(page, create)
    local pool, used = {}, 0
    function pool:Acquire()
        used = used + 1
        local frame = self[used] or create()
        self[used] = frame
        frame:Show()
        return frame
    end
    function pool:ReleaseAll()
        for _, frame in ipairs(self) do
            frame.spell = nil
            frame:Hide()
        end
        used = 0
    end
    tinsert(page.pools, pool)
    return pool
end

local function createHeading(page)
    local heading = createRow(page)
    local capWidth = heading:GetWidth() * HEADER_CAP_FRACTION
    heading.band:ClearAllPoints()
    heading.band:SetPoint("TOPLEFT", heading, "TOPLEFT", capWidth, 0)
    heading.band:SetPoint("BOTTOMRIGHT", heading, "BOTTOMRIGHT", 0, 0)
    heading.band:SetTexCoord(HEADER_CAP_FRACTION, 1, 0, 1)
    heading.bandCap = heading:CreateTexture(nil, "BACKGROUND")
    heading.bandCap:SetPoint("TOPLEFT")
    heading.bandCap:SetSize(capWidth, ROW_HEIGHT)
    heading.bandCap:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated")
    heading.bandCap:SetTexCoord(0, HEADER_CAP_FRACTION, 0, 1)
    local mask = heading:CreateMaskTexture()
    mask:SetAllPoints(heading.bandCap)
    mask:SetTexture("Interface\\AddOns\\WhatsTraining\\Forever\\header-mask", "CLAMPTOBLACKADDITIVE",
        "CLAMPTOBLACKADDITIVE")
    heading.bandCap:AddMaskTexture(mask)
    for _, region in ipairs({heading.icon, heading.iconBorder, heading.name, heading.rank, heading.level,
        heading.separator}) do region:Hide() end
    heading:GetHighlightTexture():SetAlpha(0)
    categoryScripts(heading)
    return heading
end

local function createSpellRow(page)
    local row = createRow(page)
    row.band:Hide()
    row.heading:Hide()
    return row
end

local function createListRow(page)
    local row = createSpellRow(page)
    row.rank:Hide()
    row:SetHeight(32)
    row.icon:SetPoint("TOPLEFT", 8, -4)
    row.name:SetPoint("TOPLEFT", 38, -8)
    row.name:SetWidth(page.cityX - 46)
    row.cityIcons = {}
    return row
end

local function createTrainer(page, underSkill)
    local row = createRow(page)
    for _, region in ipairs({row.band, row.icon, row.iconBorder, row.name, row.rank, row.level,
        row.separator}) do region:Hide() end
    row:SetHeight(TRAINER_ROW_HEIGHT)
    row.heading:SetTextColor(unpack(wt.Theme.body))
    row.heading:SetShadowOffset(0, 0)
    if underSkill then
        -- leave the skill's icon column to the skill
        row:SetHitRectInsets(52, 0, 0, 0)
        local highlight = row:GetHighlightTexture()
        highlight:ClearAllPoints()
        highlight:SetPoint("TOPLEFT", row, "TOPLEFT", 52, 0)
        highlight:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", 0, 0)
        row.heading:SetPoint("TOPLEFT", 68, 0)
    end
    return row
end

local function createTile(page)
    local tile = createRow(page)
    for _, region in ipairs({tile.band, tile.heading, tile.level, tile.separator}) do region:Hide() end
    local width = (page.content:GetWidth() - 24) / 2
    tile:SetSize(width, SKILL_HEIGHT)
    tile.icon:SetPoint("TOPLEFT", 8, -3)
    tile.icon:SetSize(32, 32)
    tile.iconBorder:SetSize(52, 52)
    tile.name:SetPoint("TOPLEFT", 48, -3)
    tile.name:SetWidth(width - 56)
    tile.rank:SetPoint("TOPLEFT", 48, -21)
    tile.rank:SetWidth(width - 56)
    return tile
end

local function createBlock(page)
    local block = createRow(page)
    local width = page.content:GetWidth()
    block.heading:Hide()
    block.level:Hide()
    block.band:ClearAllPoints()
    block.band:SetPoint("TOPLEFT", block, "TOPLEFT", 52, 0)
    block.band:SetPoint("TOPRIGHT")
    block.band:SetHeight(WEAPON_HEADING_HEIGHT)
    block.band:SetGradient("HORIZONTAL", CreateColor(unpack(wt.Theme.block)), CreateColor(unpack(wt.Theme.clear)))
    block.icon:SetSize(40, 40)
    block.iconBorder:SetSize(64, 64)
    block.name:SetPoint("TOPLEFT", 56, -5)
    block.name:SetWidth(width - 200)
    block.name:SetTextColor(unpack(wt.Theme.strong))
    block.rank:ClearAllPoints()
    block.rank:SetPoint("TOPRIGHT", -8, -5)
    block.rank:SetWidth(128)
    block.rank:SetJustifyH("RIGHT")
    block.separator:ClearAllPoints()
    block.separator:SetPoint("TOPLEFT", 8, 0)
    block.separator:SetPoint("TOPRIGHT", -8, 0)
    return block
end

local function createGroupHeader(parent)
    local header = CreateFrame("Button", nil, parent)
    header:SetHeight(GROUP_HEADER)
    header.rule = header:CreateTexture(nil, "BACKGROUND")
    header.rule:SetColorTexture(unpack(wt.Theme.rule))
    header.rule:SetPoint("TOPLEFT", 8, 0)
    header.rule:SetPoint("TOPRIGHT", -8, 0)
    header.rule:SetHeight(1)
    header.title = label(header, "", "SystemFont_Large", 8, -12)
    header.count = label(header, "", "SystemFont_Med3", 0, 0)
    header.count:ClearAllPoints()
    header.count:SetPoint("BOTTOMLEFT", header.title, "BOTTOMRIGHT", 0, 0)
    categoryScripts(header)
    return header
end

local function createCell(page)
    local cell = createRow(page, page.levels)
    for _, region in ipairs({cell.band, cell.heading, cell.level, cell.separator}) do region:Hide() end
    local width = (page.levels:GetWidth() - 32) / COLS
    cell:SetSize(width - 4, CELL - 4)
    cell.icon:ClearAllPoints()
    cell.icon:SetPoint("TOPLEFT", 4, -2)
    cell.icon:SetSize(36, 36)
    cell.iconBorder:SetSize(58, 58)
    cell.name:ClearAllPoints()
    cell.name:SetPoint("TOPLEFT", 48, -3)
    cell.name:SetWidth(width - 56)
    cell.rank:ClearAllPoints()
    cell.rank:SetPoint("TOPLEFT", 48, -21)
    cell.rank:SetWidth(width - 56)
    cell.rank:SetFontObject("SystemFont_Med1")
    return cell
end

local function createCityIcon(parent)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(24, 24)
    local background = frame:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(unpack(wt.Theme.cityBacking))
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
                    GameTooltip:AddLine(string.format("%s (%.1f, %.1f)", trainer.name, trainer.x, trainer.y),
                        unpack(wt.Theme.tooltipText))
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

-- headerX: where the native 680-wide spell view starts on this page
local function createPage(page, headerX)
    local header = CreateFrame("Frame", nil, page, "SpellBookHeaderTemplate")
    header:SetWidth(680)
    header:ClearAllPoints()
    header:SetPoint("TOPLEFT", page, "TOPLEFT", headerX, -5)
    page.header = header
    page.title = header.Text
    page.title:SetText("What's Training?")
    page.titleBackplate = header.Backplate
    if wt.Theme.headerText then
        header.Text:SetTextColor(unpack(wt.Theme.headerText))
        header.Backplate:SetAlpha(0)
        header.Border:SetDesaturated(true)
        header.Border:SetBlendMode("ADD")
    end

    local rankX, levelX = page:GetWidth() - 260, page:GetWidth() - 155
    page.rankX, page.levelX = rankX, levelX
    page.columns = CreateFrame("Frame", nil, page)
    page.columns:SetAllPoints()
    label(page.columns, wt.L.LEDGER_SPELL, "SystemFont_Med3", 38, -78 + CONTENT_RISE)
    label(page.columns, wt.L.LEDGER_RANK, "SystemFont_Med3", rankX, -78 + CONTENT_RISE)
    label(page.columns, wt.L.LEDGER_REQUIRED_LEVEL, "SystemFont_Med3", levelX, -78 + CONTENT_RISE)
    local footer = label(page, wt.L.LEDGER_HINT, "GameFontNormal", 0, 0)
    page.footer = footer
    footer:ClearAllPoints()
    footer:SetPoint("LEFT", page, "BOTTOMLEFT", 8, 15 + CONTENT_RISE)
    footer:SetWidth(page:GetWidth() - 28)
    page.continues = label(page, "", "GameFontNormalSmall", 0, 0)
    page.continues:ClearAllPoints()
    page.continues:SetPoint("BOTTOMRIGHT", page, "BOTTOMRIGHT", -24, 30 + CONTENT_RISE)
    page.continues:SetJustifyH("RIGHT")

    local scroll = CreateFrame("ScrollFrame", "$parentScrollFrame", page, "ScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", page, "TOPLEFT", 0, -103 + CONTENT_RISE)
    scroll:SetPoint("BOTTOMRIGHT", page, "BOTTOMRIGHT", -20, 30 + CONTENT_RISE)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetWidth(page:GetWidth() - 20)
    scroll:SetScrollChild(content)
    page.scrollFrame, page.content = scroll, content
    page.empty = label(page, "", "SystemFont_Med3", 0, 0)
    page.empty:ClearAllPoints()
    page.empty:SetPoint("TOPLEFT", scroll, "TOPLEFT", 8, -8)
    page.cityX = math.floor(content:GetWidth() * 0.56)
    page.listColumns = CreateFrame("Frame", nil, page)
    page.listColumns:SetAllPoints()
    label(page.listColumns, wt.L.LEDGER_WEAPON_SKILL, "SystemFont_Med3", 8, -78 + CONTENT_RISE)
    label(page.listColumns, wt.L.LEDGER_TRAINED_IN, "SystemFont_Med3", page.cityX, -78 + CONTENT_RISE)
    page.cityLegend = CreateFrame("Frame", nil, content)
    page.cityLegend:SetSize(content:GetWidth() - 16, 24)
    page.cityLegend.entries = {}
    page.levels = CreateFrame("Frame", nil, content)
    page.levels:SetPoint("TOPLEFT")
    page.levels:SetWidth(content:GetWidth())

    page.pools = {}
    page.headings = framePool(page, function() return createHeading(page) end)
    page.rows = framePool(page, function() return createSpellRow(page) end)
    page.listRows = framePool(page, function() return createListRow(page) end)
    page.cityTrainers = framePool(page, function() return createTrainer(page) end)
    page.skillTrainers = framePool(page, function() return createTrainer(page, true) end)
    page.tiles = framePool(page, function() return createTile(page) end)
    page.blocks = framePool(page, function() return createBlock(page) end)
    page.cells = framePool(page, function() return createCell(page) end)
    page.groupHeaders = framePool(page, function() return createGroupHeader(page.levels) end)
end

Forever.WEAPON_HEADING_HEIGHT = WEAPON_HEADING_HEIGHT
Forever.TRAINER_ROW_HEIGHT = TRAINER_ROW_HEIGHT
Forever.SKILL_HEIGHT = SKILL_HEIGHT
Forever.CONTENT_RISE = CONTENT_RISE
Forever.label = label
Forever.hideTooltip = hideTooltip
Forever.weaponStatus = weaponStatus
Forever.createCityIcon = createCityIcon
Forever.setCityIcon = setCityIcon
Forever.createPage = createPage
