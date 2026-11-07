local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")
local QUESTION_MARK = "Interface\\Icons\\INV_Misc_QuestionMark"
local requested = {}

local function spellInfo(id)
    local info = C_Spell.GetSpellInfo(id)
    if not info and not requested[id] then
        requested[id] = true
        C_Spell.RequestLoadSpellData(id)
    end
    return info
end

local function ignoredGroups()
    local groups, byKey, remaining = {}, {}, {}
    for id, ignored in pairs(ignoreStore.ignored or {}) do
        if ignored == true then remaining[id] = true end
    end
    local function insert(key, name, order, row)
        local group = byKey[key]
        if not group then
            group = {key = key, name = name, order = order, items = {}}
            byKey[key], groups[#groups + 1] = group, group
        end
        group.items[#group.items + 1] = row
        remaining[row.id] = nil
    end
    for _, professionID in ipairs(wt.Professions or {}) do
        local skill = C_SkillInfo.GetSkillLineInfoByID(professionID)
        for _, recipe in ipairs((wt.Recipes or {})[professionID] or {}) do
            if remaining[recipe.spell] then
                local info = spellInfo(recipe.spell)
                local rank = recipe.rank and C_Spell.GetSpellSubtext(recipe.spell)
                if recipe.rank and (not rank or rank == "") then rank = wt.L[recipe.rank] or recipe.rank end
                insert(professionID, skill and skill.name or string.format(wt.L.SKILL, professionID), 4, {
                    id = recipe.spell, name = info and info.name or string.format(wt.L.SPELL, recipe.spell),
                    icon = recipe.creates and C_Item.GetItemIconByID(recipe.creates) or info and info.iconID,
                    detail = rank or string.format(wt.L.SKILL, recipe.skill or wt.L.UNKNOWN_SKILL_VALUE),
                })
            end
        end
    end
    for id in pairs(remaining) do
        local cached = (wt.itemInfoCache or {})[id] or (wt.spellInfoCache or {})[id]
        local info = cached or type(id) == "number" and spellInfo(id)
        local detail = info and info.subText or type(id) == "number" and C_Spell.GetSpellSubtext(id) or ""
        local name = info and info.name or (type(id) == "number" and string.format(wt.L.SPELL, id) or tostring(id))
        local row = {id = id, name = wt.stripRankNumeral(name, detail), detail = detail,
            icon = info and (info.icon or info.iconID)}
        if (wt.WeaponSkills or {})[id] then
            insert("weapons", wt.L.WEAPON_SKILLS_HEADER, 2, row)
        elseif (cached and cached.taughtSpell) or wt:IsPetAbility(id) then
            insert("pets", wt.L.PET_HEADER, 3, row)
        elseif cached then
            insert("class", wt.L.LEDGER_CLASS_SPELLS, 1, row)
        else
            insert("other", wt.L.IGNORED_OTHER, 5, row)
        end
    end
    table.sort(groups, function(a, b)
        if a.order ~= b.order then return a.order < b.order end
        return a.name < b.name
    end)
    for _, group in ipairs(groups) do
        table.sort(group.items, function(a, b)
            if a.name ~= b.name then return a.name < b.name end
            if a.detail ~= b.detail then return a.detail < b.detail end
            return tostring(a.id) < tostring(b.id)
        end)
    end
    return groups
end

local function text(parent, font)
    local region = parent:CreateFontString(nil, "OVERLAY", font or "GameFontHighlight")
    region:SetJustifyH("LEFT")
    region:SetWordWrap(false)
    return region
end

local function unignoreButton(parent, caption, width)
    local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    button:SetSize(width, 24)
    button:SetPoint("RIGHT", -8, 0)
    button:SetText(caption)
    return button
end

function wt.CreateIgnoredList(page)
    page.collapsed = {}
    local all = unignoreButton(page, wt.L.UNIGNORE_ALL, 140)
    all:ClearAllPoints()
    all:SetPoint("TOPRIGHT", 0, 0)
    all:SetScript("OnClick", function() ignoreStore:Clear() end)
    page.unignoreAll = all

    local inset = CreateFrame("Frame", nil, page, "InsetFrameTemplate")
    inset:SetPoint("TOPLEFT", 0, -38)
    inset:SetPoint("BOTTOMRIGHT")
    local scroll = CreateFrame("Frame", nil, inset, "WowScrollBoxList")
    page.scrollBox = scroll
    scroll:SetPoint("TOPLEFT", 6, -6)
    scroll:SetPoint("BOTTOMRIGHT", -24, 6)
    local scrollbar = CreateFrame("EventFrame", nil, inset, "MinimalScrollBar")
    scrollbar:SetPoint("TOPLEFT", scroll, "TOPRIGHT", 4, -2)
    scrollbar:SetPoint("BOTTOMLEFT", scroll, "BOTTOMRIGHT", 4, 2)
    local empty = text(scroll)
    empty:SetAllPoints()
    empty:SetJustifyH("CENTER")
    empty:SetJustifyV("MIDDLE")
    empty:SetText(wt.L.IGNORED_EMPTY)
    page.empty = empty

    local function header(button, node)
        local data = node:GetData()
        if not button.unignore then
            button.unignore = unignoreButton(button, wt.L.UNIGNORE_ALL, 140)
            button.CollapseButton:ClearAllPoints()
            button.CollapseButton:SetPoint("LEFT", 8, 0)
            button.ButtonText:ClearAllPoints()
            button.ButtonText:SetPoint("LEFT", button.CollapseButton, "RIGHT", 8, 0)
            button.ButtonText:SetPoint("RIGHT", button.unignore, "LEFT", -12, 0)
        end
        button.ButtonText:SetText(string.format(wt.L.SECTION_COUNT, data.name, #data.items))
        button.CollapseButton:UpdateCollapsedState(node:IsCollapsed())
        button:SetScript("OnClick", function()
            local collapsed = not node:IsCollapsed()
            page.collapsed[data.key] = collapsed
            button.CollapseButton:UpdateCollapsedState(collapsed)
            node:SetCollapsed(collapsed)
        end)
        button.unignore:SetScript("OnClick", function()
            local ids = {}
            for _, item in ipairs(data.items) do ids[#ids + 1] = item.id end
            ignoreStore:UpdateMany(ids, false)
        end)
    end

    local function entry(row, node)
        local data = node:GetData()
        if not row.unignore then
            row.unignore = unignoreButton(row, wt.L.UNIGNORE, 100)
            row.detail = text(row, "GameFontHighlightSmall")
            row.detail:SetPoint("RIGHT", row.unignore, "LEFT", -12, 0)
            row.detail:SetWidth(110)
            row.detail:SetJustifyH("RIGHT")
            row.detail:SetTextColor(0.7, 0.7, 0.7)
            row.icon = row:CreateTexture(nil, "ARTWORK")
            row.icon:SetSize(28, 28)
            row.icon:SetPoint("LEFT", 6, 0)
            row.iconBorder = row:CreateTexture(nil, "OVERLAY")
            row.iconBorder:SetAtlas("Professions-Slot-Frame")
            row.iconBorder:SetPoint("TOPLEFT", row.icon, "TOPLEFT")
            row.iconBorder:SetPoint("BOTTOMRIGHT", row.icon, "BOTTOMRIGHT", 1, -1)
            row.name = text(row)
            row.name:SetPoint("LEFT", row.icon, "RIGHT", 8, 0)
            row.name:SetPoint("RIGHT", row.detail, "LEFT", -12, 0)
            local highlight = row:CreateTexture(nil, "HIGHLIGHT")
            highlight:SetAllPoints()
            highlight:SetColorTexture(1, 1, 1, 0.1)
        end
        row.name:SetText(data.name)
        row.detail:SetText(data.detail)
        row.icon:SetTexture(data.icon or QUESTION_MARK)
        row.unignore:SetScript("OnClick", function() ignoreStore:Update(data.id, false) end)
    end

    local tree = CreateScrollBoxListTreeListView()
    tree:SetElementIndentCalculator(function(node) return node:GetData().items and 0 or 16 end)
    tree:SetElementExtentCalculator(function(_, node) return node:GetData().items and 42 or 36 end)
    tree:SetElementFactory(function(factory, node)
        if node:GetData().items then factory("ListHeaderVisualTemplate", header)
        else factory("Button", entry) end
    end)
    tree:SetElementResetter(function(row)
        row:SetScript("OnClick", nil)
        row.unignore:SetScript("OnClick", nil)
    end)
    ScrollUtil.InitScrollBoxListWithScrollBar(scroll, scrollbar, tree)

    function page:Refresh()
        local groups, provider = ignoredGroups(), CreateTreeDataProvider()
        self.groups = groups
        for _, group in ipairs(groups) do
            local parent = provider:Insert(group)
            for _, item in ipairs(group.items) do parent:Insert(item) end
            parent:SetCollapsed(self.collapsed[group.key] == true, false, true)
        end
        scroll:SetDataProvider(provider, true)
        empty:SetShown(#groups == 0)
        all:SetEnabled(#groups > 0)
    end
    page:SetScript("OnShow", page.Refresh)
    ignoreStore:AddSubscription(function() if page:IsVisible() then page:Refresh() end end)
    page:RegisterEvent("SPELL_DATA_LOAD_RESULT")
    page:RegisterEvent("ITEM_DATA_LOAD_RESULT")
    page:RegisterEvent("SKILL_LINES_CHANGED")
    local queued = false
    page:SetScript("OnEvent", function()
        if queued or not page:IsVisible() then return end
        queued = true
        RunNextFrame(function()
            queued = false
            if page:IsVisible() then page:Refresh() end
        end)
    end)
end
