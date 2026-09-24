local _, wt = ...

wt.Forever = {}
local Forever = wt.Forever

local ROW_HEIGHT = 28
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

local function wholeBlocks(groups)
    local blocks = {}
    for i, group in ipairs(groups) do blocks[i] = {group = group, first = 1, last = #group.spells} end
    return blocks
end

local function ledgerSpan(item, first, rowHeight)
    if not item.isHeader then return 0, rowHeight or ROW_HEIGHT end
    return first and 0 or 8, ROW_HEIGHT + 4
end

-- split the class spell display into halves of `pageHeight` px, two halves per page
local function paginateLedger(data, pageHeight)
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
        local gap, height = ledgerSpan(s, #half == 0)
        -- a header needs room for itself and one row
        local needed = s.isHeader and height + ROW_HEIGHT or height
        if #half > 0 and y + gap + needed > pageHeight then
            tinsert(halves, half)
            half, y, gap = {}, 0, 0
            if not s.isHeader then
                local continued = header(category, wt.L.CONTINUED)
                tinsert(half, continued)
                y = select(2, ledgerSpan(continued, true))
            end
        end
        if s.isHeader then category = s end
        tinsert(half, s.isHeader and header(s, counts[s] > 0 and counts[s]) or s)
        y = y + gap + height
    end
    tinsert(halves, half)
    return halves
end

-- level halves are block lists for renderLevels. a group that does not fit moves whole to the
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

local function endsSplit(blocks)
    local block = blocks[#blocks]
    return block ~= nil and block.last ~= nil and block.last < #block.group.spells
end

Forever.ROW_HEIGHT = ROW_HEIGHT
Forever.COLS, Forever.CELL, Forever.GROUP_HEADER, Forever.GROUP_GAP = COLS, CELL, GROUP_HEADER, GROUP_GAP
Forever.buildGroups = buildGroups
Forever.wholeBlocks = wholeBlocks
Forever.ledgerSpan = ledgerSpan
Forever.paginateLedger = paginateLedger
Forever.paginateLevels = paginateLevels
Forever.endsSplit = endsSplit
