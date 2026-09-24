local _, wt = ...
local Forever = wt.Forever
local ROW_HEIGHT, COLS, CELL, GROUP_HEADER, GROUP_GAP =
    Forever.ROW_HEIGHT, Forever.COLS, Forever.CELL, Forever.GROUP_HEADER, Forever.GROUP_GAP
local WEAPON_HEADING_HEIGHT, TRAINER_ROW_HEIGHT, SKILL_HEIGHT, CONTENT_RISE =
    Forever.WEAPON_HEADING_HEIGHT, Forever.TRAINER_ROW_HEIGHT, Forever.SKILL_HEIGHT, Forever.CONTENT_RISE
local label, weaponStatus, createCityIcon, setCityIcon =
    Forever.label, Forever.weaponStatus, Forever.createCityIcon, Forever.setCityIcon
local buildGroups, wholeBlocks, ledgerSpan, paginateLedger, paginateLevels =
    Forever.buildGroups, Forever.wholeBlocks, Forever.ledgerSpan, Forever.paginateLedger, Forever.paginateLevels

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
local OTHER_SECTION = {0.20, 0.17, 0.12, 0.85, 0.80, 0.65}
local WEAPON_GROUP = {0.20, 0.12, 0.04, 1, 0.82, 0.3}

local function groupTitle(group)
    local key = group.category.key
    if key == wt.AVAILABLE_KEY then return wt.L.AVAILABLE_HEADER, 0.10, 0.38, 0.05 end
    if key == wt.NEXTLEVEL_KEY then
        return string.format(wt.L.LEVEL_FORMAT, group.level) .. " • " .. wt.L.NEXTLEVEL_HEADER, 0.08, 0.22, 0.50
    end
    if key == wt.NOTLEVEL_KEY then return string.format(wt.L.LEVEL_FORMAT, group.level), 0.30, 0.10, 0.05 end
    return group.category.name or group.category.formattedName, 0.30, 0.10, 0.05
end

-- lays out blocks ({group, first, last} slices of a group's spells) and returns the content height
local function renderLevels(page, blocks)
    local levels, y = page.levels, 0
    local width = (levels:GetWidth() - 32) / COLS
    levels:Show()
    for i, block in ipairs(blocks) do
        local group, first, last = block.group, block.first, block.last
        local header = page.groupHeaders:Acquire()
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
        y = y + GROUP_HEADER
        for index = first, last do
            local spell = group.spells[index]
            local cell = page.cells:Acquire()
            local offset = index - first
            cell.spell, cell.category = spell, group.category
            cell:SetPoint("TOPLEFT", levels, "TOPLEFT", 16 + (offset % COLS) * width,
                -y - math.floor(offset / COLS) * CELL)
            cell.icon:SetTexture(spell.useAltIcon and spell.altIcon or spell.icon)
            cell.name:SetText(spell.name)
            local subText = spell.subText or ""
            if not group.level and not group.category.hideLevel then
                subText = (subText ~= "" and subText .. " • " or "") .. spell.formattedLevel
            end
            cell.rank:SetText(subText)
        end
        y = y + rows * CELL + GROUP_GAP
    end
    levels:SetHeight(math.max(1, y))
    return y
end

local function levelColor(category)
    if category.key == wt.NOTLEVEL_KEY or category.key == wt.WEAPON_NOTLEVEL_KEY then return 0.45, 0.09, 0.04 end
    return 0.19, 0.12, 0.06
end

local function showHeading(page, item, y, color, fromAlpha, toAlpha)
    local heading = page.headings:Acquire()
    heading.spell = item
    heading:SetPoint("TOPLEFT", page.content, "TOPLEFT", 0, -y)
    local capAlpha = fromAlpha + (toAlpha - fromAlpha) * (8 / 1024)
    heading.bandCap:SetGradient("HORIZONTAL", CreateColor(color[1], color[2], color[3], fromAlpha),
        CreateColor(color[1], color[2], color[3], capAlpha))
    heading.band:SetGradient("HORIZONTAL", CreateColor(color[1], color[2], color[3], capAlpha),
        CreateColor(color[1], color[2], color[3], toAlpha))
    heading.heading:SetTextColor(color[4], color[5], color[6])
    heading.heading:SetText(item.label or item.name or item.formattedName)
    return heading
end

local function showSkill(row, skill)
    row.spell = skill
    row.icon:SetTexture(skill.icon)
    row.name:SetText(skill.name)
    local status, r, g, b = weaponStatus(skill)
    row.rank:SetText(status)
    row.rank:SetTextColor(r, g, b)
end

local function showTrainer(pool, page, trainer, y, block)
    local row = pool:Acquire()
    row.spell, row.weaponRow = trainer, block
    -- Trainer names have their own hover targets above the full skill block.
    row:SetFrameLevel(page.content:GetFrameLevel() + 2)
    row:SetPoint("TOPLEFT", page.content, "TOPLEFT", 0, -y)
    row.heading:SetText(trainer.name)
end

-- A render draws one view into a page and returns the content height.
local function renderLedger(page, items)
    page.columns:Show()
    local y, heading, count = 0, nil, 0
    for i, item in ipairs(items) do
        local gap, height = ledgerSpan(item, i == 1)
        y = y + gap
        if item.isHeader then
            heading, count = showHeading(page, item, y, sectionColors[item.key] or OTHER_SECTION, 0.75, 0), 0
        else
            local category = heading.spell
            count = count + 1
            -- paged halves arrive with their header text
            if not category.label then
                heading.heading:SetText(string.format("%s • %d", category.name or category.formattedName, count))
            end
            local row = page.rows:Acquire()
            row.spell, row.category = item, category
            row:SetPoint("TOPLEFT", page.content, "TOPLEFT", 0, -y)
            row.icon:SetTexture(item.useAltIcon and item.altIcon or item.icon)
            row.name:SetText(item.name)
            row.rank:SetText(item.subText or "")
            row.level:SetText(item.hideLevel and "—" or item.formattedLevel)
            row.level:SetTextColor(levelColor(category))
            row.separator:SetShown(items[i + 1] ~= nil and not items[i + 1].isHeader)
        end
        y = y + height
    end
    return y
end

local function renderList(page, items)
    page.listColumns:Show()
    local y, category, hasSkills = 0, nil, false
    for i, item in ipairs(items) do
        local gap, height = ledgerSpan(item, i == 1, 32)
        y = y + gap
        if item.isHeader then
            category = item
            showHeading(page, item, y, sectionColors[item.key] or OTHER_SECTION, 0.75, 0)
        else
            hasSkills = true
            local row = page.listRows:Acquire()
            row.spell, row.category = item, category
            row:SetPoint("TOPLEFT", page.content, "TOPLEFT", 0, -y)
            row.icon:SetTexture(item.useAltIcon and item.altIcon or item.icon)
            row.name:SetText(item.name)
            if category.key == wt.WEAPON_KNOWN_KEY then
                row.name:SetTextColor(0.4, 0.4, 0.4)
            else
                row.name:SetTextColor(0.19, 0.12, 0.06)
            end
            row.level:SetShown(not item.hideLevel)
            row.level:SetText(item.formattedLevel)
            row.level:SetTextColor(levelColor(category))
            row.separator:SetShown(items[i + 1] ~= nil and not items[i + 1].isHeader)
            for index, city in ipairs(wt.weaponSkeleton) do
                local icon = row.cityIcons[index]
                if not icon then
                    icon = createCityIcon(row)
                    icon:SetPoint("TOPLEFT", page.cityX + (index - 1) * 34, -4)
                    row.cityIcons[index] = icon
                end
                local available = false
                for _, zone in ipairs(item.trainerZones or {}) do
                    if zone.id == city.id then available = true; break end
                end
                setCityIcon(icon, city, item, available)
            end
        end
        y = y + height
    end
    if hasSkills then
        local legend = page.cityLegend
        legend:Show()
        legend:SetPoint("TOPLEFT", page.content, "TOPLEFT", 8, -y - 12)
        local entryWidth = (page.content:GetWidth() - 16) / #wt.weaponSkeleton
        for index, city in ipairs(wt.weaponSkeleton) do
            local entry = legend.entries[index]
            if not entry then
                entry = createCityIcon(legend)
                entry:SetPoint("TOPLEFT", (index - 1) * entryWidth, 0)
                entry.name = label(entry, "", "SystemFont_Med3", 32, -5)
                entry.name:SetWidth(entryWidth - 36)
                entry.name:SetWordWrap(false)
                legend.entries[index] = entry
            end
            entry.name:SetText(city.name)
            setCityIcon(entry, city, nil, true)
        end
        y = y + 48
    end
    return y
end

local function renderByCity(page, items)
    local columnWidth = (page.content:GetWidth() - 24) / 2
    local i, y = 1, 0
    while i <= #items do
        local item = items[i]
        if item.npc then
            showTrainer(page.cityTrainers, page, item, y)
            y = y + TRAINER_ROW_HEIGHT
            i = i + 1
        elseif item.isHeader then
            if i > 1 then y = y + 10 end
            showHeading(page, item, y, WEAPON_GROUP, 0.9, 0.25)
            y = y + ROW_HEIGHT
            i = i + 1
        else
            -- a trainer's skills fill the left column top to bottom, then the right
            local last = i
            while items[last + 1] and not items[last + 1].isHeader do last = last + 1 end
            local rowsPerColumn = math.ceil((last - i + 1) / 2)
            for index = i, last do
                local tile, offset = page.tiles:Acquire(), index - i
                tile:SetPoint("TOPLEFT", page.content, "TOPLEFT", 16 + math.floor(offset / rowsPerColumn) * columnWidth,
                    -y - (offset % rowsPerColumn) * SKILL_HEIGHT)
                showSkill(tile, items[index])
            end
            y = y + rowsPerColumn * SKILL_HEIGHT
            i = last + 1
        end
    end
    return y
end

local function renderByWeapon(page, items)
    local y, block = 0, nil
    for i, item in ipairs(items) do
        if item.npc then
            showTrainer(page.skillTrainers, page, item, y, block)
            y = y + TRAINER_ROW_HEIGHT
        elseif item.isHeader then
            if i > 1 then y = y + 10 end
            showHeading(page, item, y, WEAPON_GROUP, 0.9, 0.25)
            y = y + ROW_HEIGHT + 4
        else
            if i > 1 then y = y + 6 end
            local trainers = 0
            while items[i + trainers + 1] and items[i + trainers + 1].npc do trainers = trainers + 1 end
            local height = trainers > 0 and WEAPON_HEADING_HEIGHT or 40
            block = page.blocks:Acquire()
            block:SetPoint("TOPLEFT", page.content, "TOPLEFT", 0, -y)
            block:SetHeight(height + trainers * TRAINER_ROW_HEIGHT)
            showSkill(block, item)
            y = y + height
        end
    end
    return y
end

-- One entry per display style. top: where the scroll area starts. reserve: room a paged half keeps
-- free for the "Continues on ..." note. Items: what the view shows when it isn't paged.
local views = {
    ledger = {top = -103, footer = wt.L.LEDGER_HINT, empty = wt.L.LEDGER_EMPTY, Render = renderLedger,
        Items = function() return wt.spellListData end,
        Paginate = function(height) return paginateLedger(wt.spellListData, height) end},
    levels = {top = -72, reserve = 12, footer = wt.L.LEDGER_HINT, empty = wt.L.LEDGER_EMPTY,
        Render = renderLevels,
        Items = function() return wholeBlocks(buildGroups(wt.spellListData)) end,
        Paginate = function(height) return paginateLevels(buildGroups(wt.spellListData), height) end},
    zone = {top = -84, footer = wt.L.LEDGER_WEAPON_HINT, empty = wt.L.LEDGER_WEAPON_EMPTY,
        Render = renderByCity, Items = function() return wt.weaponGroupedData end},
    weaponskill = {top = -84, footer = wt.L.LEDGER_WEAPON_HINT, empty = wt.L.LEDGER_WEAPON_EMPTY,
        Render = renderByWeapon, Items = function() return wt.weaponSkillGroupedData end},
    list = {top = -103, footer = wt.L.LEDGER_WEAPON_LIST_HINT, empty = wt.L.LEDGER_WEAPON_EMPTY,
        Render = renderList, Items = function() return wt.weaponListData end},
}

-- items: the view's whole list, or one paged half
local function updatePage(page, view, items, paged)
    for _, chrome in ipairs({page.columns, page.listColumns, page.cityLegend, page.levels}) do chrome:Hide() end
    for _, pool in ipairs(page.pools) do pool:ReleaseAll() end
    local scroll = page.scrollFrame
    scroll:SetPoint("TOPLEFT", page, "TOPLEFT", 0, view.top + CONTENT_RISE)
    scroll.ScrollBar:SetShown(not paged)
    scroll:EnableMouseWheel(not paged)
    page.footer:SetText(view.footer)
    -- only Levels can end up empty from a search
    page.empty:SetText(wt.filter ~= "" and wt.L.SEARCH_NO_RESULTS or view.empty)
    page.empty:SetShown(#items == 0)
    local height = view.Render(page, items)
    page.content:SetHeight(math.max(1, height))
    scroll:UpdateScrollChildRect()
    scroll:SetVerticalScroll(math.min(scroll:GetVerticalScroll(), math.max(0, height - scroll:GetHeight())))
end

Forever.views = views
Forever.updatePage = updatePage
