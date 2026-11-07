local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")
local ROW_HEIGHT, ROWS = 18, 16
local categories, Category = wt.RecipeCategories, wt.RecipeCategory
local sourceTextures = {
    trainer = "Interface\\GossipFrame\\TrainerGossipIcon",
    vendor = "Interface\\GossipFrame\\VendorGossipIcon",
    quest = "Interface\\GossipFrame\\AvailableQuestIcon",
    drop = "Interface\\Buttons\\UI-GroupLoot-Dice-Up",
    crafted = "Interface\\Icons\\Trade_BlackSmithing",
    world_object = "Interface\\GossipFrame\\BinderGossipIcon",
    discovery = "Interface\\WorldMap\\WorldMap-MagnifyingGlass",
}

function wt.CreateSkillsRecipeList(page, scoped, maxRows)
    local rowCount = maxRows or ROWS
    local dirty = true
    local prefix = page:GetName()
    local view = CreateFrame("Frame", nil, page)
    view.scoped = scoped
    view:SetAllPoints()
    view.items, view.groups, view.rows = {}, {}, {}
    view.recipeGroups, view.searchCollapsed = {}, {}
    local search = CreateFrame("EditBox", prefix .. "Search", view, "SearchBoxTemplate")
    search:SetHeight(20)
    search:SetPoint("TOPLEFT", 8, -8)
    search:HookScript("OnHide", function(self) self:ClearFocus() end)
    view.searchBox = search
    local dropdown = wt.gameVersion == "forever" and wt.Forever.createDropdown(view, prefix .. "Filter", true)
        or CreateFrame("DropdownButton", prefix .. "Filter", view, "WowStyle1FilterDropdownTemplate")
    dropdown.resizeToText = false
    dropdown:SetSize(90, 20)
    dropdown:SetPoint("TOPRIGHT", -8, -8)
    search:SetPoint("TOPRIGHT", dropdown, "TOPLEFT", -4, 0)
    view.filterDropdown = dropdown
    local scroll = CreateFrame("ScrollFrame", prefix .. "Scroll", view, "FauxScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 4, -36)
    scroll:SetPoint("BOTTOMRIGHT", -26, 4)
    view.scroll = scroll
    local empty = view:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    empty:SetPoint("TOPLEFT", 8, -36)
    empty:SetPoint("BOTTOMRIGHT", -26, 8)
    empty:SetJustifyH("CENTER")
    empty:SetWordWrap(true)
    view.empty = empty

    local function showTooltip(row)
        if not row.data or not row.data.recipe then return end
        GameTooltip:SetOwner(row, "ANCHOR_RIGHT")
        view.tooltipRow = row
        GameTooltip:SetSpellByID(row.data.recipe.spell)
        GameTooltip:Show()
    end

    local function addRecipeTooltip(tooltip, spellID)
        local row = view.tooltipRow
        if not row or not tooltip:IsOwned(row) then return end
        local data = row.data
        if not data or not data.recipe or spellID ~= data.recipe.spell then return end
        tooltip:AddLine(string.format(wt.L.PROFESSION_SKILL, data.profession,
            data.requiredSkill or wt.L.UNKNOWN_SKILL_VALUE), 1, 0.82, 0)
        tooltip:AddLine(string.format(wt.L.SOURCE, data.source), 1, 1, 1)
        if data.category == Category.MISSING and data.requirement then
            tooltip:AddLine(data.requirement, 1, 0, 0, true)
        end
        if data.reputationRequirement then
            tooltip:AddLine(data.reputationRequirement, data.reputationMet and 0 or 1,
                data.reputationMet and 1 or 0, 0, true)
        end
        tooltip:Show()
    end
    if wt.gameVersion == "forever" then
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Spell, function(tooltip, data)
            addRecipeTooltip(tooltip, data.id)
        end)
    else
        GameTooltip:HookScript("OnTooltipSetSpell", function(tooltip)
            local _, spellID = tooltip:GetSpell()
            addRecipeTooltip(tooltip, spellID)
        end)
    end

    function view:Paint()
        local tooltipRow = self.tooltipRow
        local tooltipSpell = tooltipRow and tooltipRow.data and tooltipRow.data.recipe and tooltipRow.data.recipe.spell
        if tooltipRow and not GameTooltip:IsOwned(tooltipRow) then tooltipRow = nil end
        self.tooltipRow = nil
        local offset = FauxScrollFrame_GetOffset(scroll)
        local maxOffset = math.max(0, #self.items - rowCount)
        if offset > maxOffset then
            offset = maxOffset
            scroll.offset = offset
            scroll.ScrollBar:SetValue(offset * ROW_HEIGHT)
        end
        for index, row in ipairs(self.rows) do
            if GameTooltip:IsOwned(row) then GameTooltip:Hide() end
            local data = self.items[index + offset]
            row.data = data
            row:SetShown(data ~= nil)
            if data then
                local recipe, profession = data.recipe, data.items
                local color = categories[data.category].text
                row.rankBackground:SetColorTexture(color[1], color[2], color[3], 0.07)
                row.rankBackground:SetShown(not not (recipe and recipe.rank and data.category <= Category.LATER))
                local notice = profession and data.notice or ""
                if profession and data.category == Category.LATER and data.rankCount > 0 then
                    notice = "|cffaaaaaa" .. string.format(
                        data.rankCount == 1 and wt.L.RANK_COUNT or wt.L.RANKS_COUNT, data.rankCount) .. "|r"
                end
                row.notice:SetText(notice)
                row.notice:SetTextColor(unpack(color))
                local sources = {}
                if recipe then
                    for _, source in ipairs(data.sources) do
                        tinsert(sources, "|T" .. sourceTextures[source] .. ":16:16|t")
                    end
                end
                row.source:SetText(table.concat(sources, " "))
                row.label:ClearAllPoints()
                row.label:SetWidth(0)
                row.label:SetFontObject((recipe or profession) and "GameFontNormalSmall" or "GameFontNormal")
                row.label:SetJustifyH((recipe or profession) and "LEFT" or "CENTER")
                row.label:SetPoint("LEFT", recipe and (self.scoped and 24 or 42) or profession and 22 or 0, 0)
                if recipe then row.label:SetPoint("RIGHT", row.source, "LEFT", -4, 0)
                elseif not profession then row.label:SetPoint("RIGHT", row, "RIGHT", -4, 0) end
                local name = data.name
                if profession then
                    local count = data.recipeCount > 0 and string.format(
                        data.recipeCount == 1 and wt.L.RECIPE_COUNT or wt.L.RECIPES_COUNT, data.recipeCount) or ""
                    name = data.profession .. (count ~= "" and "  |cffaaaaaa" .. count .. "|r" or "")
                end
                row.label:SetText(name)
                if profession then
                    local noticeWidth = row.notice:GetStringWidth()
                    row.label:SetWidth(math.min(row.label:GetStringWidth(), math.max(1,
                        row:GetWidth() - 26 - (noticeWidth > 0 and noticeWidth + 8 or 0))))
                end
                if recipe then row.label:SetTextColor(1, 1, 1)
                elseif profession then row.label:SetTextColor(1, 0.82, 0)
                else row.label:SetTextColor(1, 1, 1) end
                row.skill:SetText(recipe and (data.requiredSkill or wt.L.UNKNOWN_SKILL_VALUE) or "")
                row.skill:SetTextColor(unpack(categories[data.category].text))
                row.icon:SetShown(not not (recipe or profession))
                row.icon:ClearAllPoints()
                row.icon:SetPoint("LEFT", recipe and (self.scoped and 4 or 22) or 2, 0)
                local expanded = profession and (self.query ~= "" and not self.searchCollapsed[data.key]
                    or self.query == "" and self.expanded[data.category][data.id])
                row.icon:SetTexture(recipe and data.icon or (expanded
                    and "Interface\\Buttons\\UI-MinusButton-Up" or "Interface\\Buttons\\UI-PlusButton-Up"))
            end
        end
        FauxScrollFrame_Update(scroll, #self.items, rowCount, ROW_HEIGHT)
        empty:SetShown(#self.items == 0)
        if tooltipRow and tooltipRow:IsVisible() and tooltipRow.data and tooltipRow.data.recipe
            and tooltipRow.data.recipe.spell == tooltipSpell then showTooltip(tooltipRow) end
    end

    function view:Filter(resetScroll)
        self.query = strlower(search:GetText())
        self.groups = {}
        for category, recipes in ipairs(self.recipeGroups) do
            local professions, byID = {}, {}
            self.groups[category] = professions
            for _, recipe in ipairs(recipes) do
                local selected = self.scoped and recipe.professionID == self.professionID
                    or not self.scoped and self.selectedProfessions[recipe.professionID]
                if selected and wt.RecipeMatchesFilters(self, recipe, self.query) then
                    local id = recipe.professionID
                    if not byID[id] then
                        byID[id] = {id = id, profession = recipe.profession, category = category, items = {},
                            key = category .. ":" .. id, recipeCount = 0, rankCount = 0}
                        tinsert(professions, byID[id])
                    end
                    recipe.category = category
                    tinsert(byID[id].items, recipe)
                    local count = recipe.recipe.rank and "rankCount" or "recipeCount"
                    byID[id][count] = byID[id][count] + 1
                    if recipe.recipe.rank and (category == Category.AVAILABLE or category == Category.SOON)
                        and not byID[id].notice then
                        byID[id].notice = string.format(
                            category == Category.AVAILABLE and wt.L.RANK_AVAILABLE or wt.L.RANK_SOON,
                            recipe.rankName and recipe.rankName ~= "" and recipe.rankName or wt.L.RANK_UP)
                    end
                end
            end
            table.sort(professions, wt.ProfessionLess)
        end
        local items = {}
        for category, professions in ipairs(self.groups) do
            if #professions > 0 then
                local count = 0
                for _, profession in ipairs(professions) do count = count + #profession.items end
                local heading = self.scoped and categories[category].label
                    or string.format(wt.L.SECTION_COUNT, categories[category].label, count)
                for _, header in ipairs(wt.categories) do
                    if header.name == categories[category].label then
                        heading = header.color .. heading .. "|r"; break
                    end
                end
                tinsert(items, {category = category, name = heading, count = count})
                for _, profession in ipairs(professions) do
                    if not self.scoped then tinsert(items, profession) end
                    if self.scoped or (self.query ~= "" and not self.searchCollapsed[profession.key])
                        or (self.query == "" and self.expanded[category][profession.id]) then
                        for _, recipe in ipairs(profession.items) do tinsert(items, recipe) end
                    end
                end
            end
        end
        self.items = items
        if resetScroll then
            scroll.offset = 0
            scroll.ScrollBar:SetValue(0)
        end
        self:Paint()
        dropdown:ValidateResetState()
    end

    function view:Refresh()
        dirty = false
        WT_Crafting = WT_Crafting or {}
        WT_Crafting.expandedProfessions = WT_Crafting.expandedProfessions or {{}, {}, {}, {}, {}}
        WT_Crafting.selectedProfessions = WT_Crafting.selectedProfessions or {}
        WT_Crafting.selectedSources = WT_Crafting.selectedSources or {trainer = true, vendor = true, quest = true,
            drop = false, crafted = false, world_object = false}
        WT_Crafting.settings = WT_Crafting.settings or {}
        for _, key in ipairs({"showReputationRecipes", "showMerchantsFavorRecipes", "showOtherFactionRecipes"}) do
            if WT_Crafting.settings[key] == nil then WT_Crafting.settings[key] = false end
        end
        self.expanded = WT_Crafting.expandedProfessions
        local setup = not self.settings
        self.selectedProfessions, self.selectedSources, self.settings = WT_Crafting.selectedProfessions,
            WT_Crafting.selectedSources, WT_Crafting.settings
        wt.UpdateRecipeProfessionSelections(self)
        if setup then wt.SetupRecipeFilter(self, dropdown)
        else dropdown:GenerateMenu() end
        self.recipeGroups = wt.GetRecipeGroups()
        empty:SetText(self.hasProfession and wt.L.NO_MATCHING_RECIPES or wt.L.LEARN_PROFESSION)
        self:Filter()
    end

    for index = 1, rowCount do
        local row = CreateFrame("Button", nil, view)
        view.rows[index] = row
        row:SetHeight(ROW_HEIGHT)
        row:SetPoint("TOPLEFT", 4, -36 - (index - 1) * ROW_HEIGHT)
        row:SetPoint("RIGHT", scroll)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        row.rankBackground = row:CreateTexture(nil, "BACKGROUND")
        row.rankBackground:SetAllPoints()
        row.icon = row:CreateTexture(nil, "ARTWORK")
        row.icon:SetSize(16, 16)
        row.skill = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        row.skill:SetPoint("RIGHT", -2, 0)
        row.skill:SetWidth(24)
        row.skill:SetJustifyH("RIGHT")
        row.source = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        row.source:SetPoint("RIGHT", row.skill, "LEFT", -2, 0)
        row.source:SetWordWrap(false)
        row.label = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        row.label:SetWordWrap(false)
        row.notice = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        row.notice:SetPoint("LEFT", row.label, "RIGHT", 8, 0)
        row.notice:SetPoint("RIGHT", -4, 0)
        row.notice:SetJustifyH("LEFT")
        row.notice:SetWordWrap(false)
        local highlight = row:CreateTexture(nil, "HIGHLIGHT")
        highlight:SetAllPoints()
        highlight:SetColorTexture(1, 1, 1, 0.06)
        row:SetScript("OnClick", function(self, button)
            local data = self.data
            if not data then return end
            if button == "RightButton" then
                local menuData, professions = data, view.groups[data.category]
                if not data.recipe and not data.profession then
                    menuData = {category = data.category, items = {}}
                    for _, profession in ipairs(professions) do
                        for _, recipe in ipairs(profession.items) do tinsert(menuData.items, recipe) end
                    end
                end
                local openMenu = wt.gameVersion == "forever" and wt.Forever.openContextMenu or MenuUtil.CreateContextMenu
                openMenu(self, function(_, menu)
                    wt.GenerateRecipeRowMenu(menuData, menu, not view.scoped and function(isCollapsed)
                        for _, profession in ipairs(professions) do
                            if view.query ~= "" then view.searchCollapsed[profession.key] = isCollapsed
                            else view.expanded[data.category][profession.id] = not isCollapsed end
                        end
                        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
                        view:Filter()
                        return MenuResponse.Close
                    end)
                end)
            elseif button == "LeftButton" and data.recipe then
                wt.LinkRecipe(data.recipe)
            elseif button == "LeftButton" and data.items then
                if view.query ~= "" then view.searchCollapsed[data.key] = not view.searchCollapsed[data.key]
                else view.expanded[data.category][data.id] = not view.expanded[data.category][data.id] end
                view:Filter()
            end
        end)
        row:SetScript("OnEnter", showTooltip)
        local function hide(self)
            if view.tooltipRow == self then view.tooltipRow = nil end
            if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
        end
        row:SetScript("OnLeave", hide)
        row:SetScript("OnHide", hide)
    end
    search:HookScript("OnTextChanged", function()
        view.searchCollapsed = {}
        view:Filter(true)
    end)
    scroll:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, ROW_HEIGHT, function() view:Paint() end)
    end)
    view:EnableMouseWheel(true)
    view:SetScript("OnMouseWheel", function(_, delta)
        local offset = math.max(0, math.min(#view.items - rowCount, FauxScrollFrame_GetOffset(scroll) - delta * 3))
        scroll.ScrollBar:SetValue(offset * ROW_HEIGHT)
    end)

    local queued = false
    local function request()
        dirty = true
        if queued or not view:IsVisible() then return end
        queued = true
        RunNextFrame(function()
            queued = false
            if view:IsVisible() and dirty then view:Refresh() end
        end)
    end
    view:SetScript("OnShow", function()
        if dirty then request() else view:Filter() end
    end)
    for _, event in ipairs({"SKILL_LINES_CHANGED", "SPELLS_CHANGED", "NEW_RECIPE_LEARNED", "PLAYER_LEVEL_UP",
        "UPDATE_FACTION", "SPELL_DATA_LOAD_RESULT"}) do view:RegisterEvent(event) end
    view:SetScript("OnEvent", function(_, event, spellID, success)
        if event == "SPELL_DATA_LOAD_RESULT" and not wt.RecipeSpellDataLoaded(spellID, success) then return end
        request()
    end)
    ignoreStore:AddSubscription(request)
    return view
end
