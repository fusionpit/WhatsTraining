local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")
local categories = wt.RecipeCategories
local hasSelection, professionLess, Category = wt.HasSelection, wt.ProfessionLess, wt.RecipeCategory

local HEADER_CAP_FRACTION = 8 / 1024
local MERCHANTS_FAVOR_CURRENCY = 3402

local columns = {0, 0.46, 0.75, 1}
local gradients = {}
for i, category in ipairs(categories) do
    local r, g, b = unpack(category.band)
    gradients[i] = {CreateColor(r, g, b, 0.9), CreateColor(r, g, b, 0.9 * (1 - HEADER_CAP_FRACTION)),
        CreateColor(r, g, b, 0)}
end

local function label(parent, font)
    local text = parent:CreateFontString(nil, "OVERLAY", font or "GameFontHighlightSmall")
    text:SetJustifyH("LEFT")
    text:SetWordWrap(false)
    return text
end

local function addSourceZones(tooltip, locations, format)
    local zones, seen = {}, {}
    local faction = UnitFactionGroup("player")
    local function addArea(area)
        local zone = area and area > 0 and C_Map.GetAreaInfo(area)
        if zone and zone ~= "" and not seen[zone] then
            seen[zone] = true
            tinsert(zones, zone)
        end
    end
    for _, location in ipairs(locations or {}) do
        if not location.faction or location.faction == faction then
            addArea(location.area)
            for _, area in ipairs(location.areas or {}) do addArea(area) end
        end
    end
    if #zones > 0 then
        tooltip:AddLine(string.format(format, table.concat(zones, ", ")), 0.8, 0.8, 0.8, true)
    end
end

local function addRecipeTooltip(view, tooltip, tooltipData)
    local row = view.tooltipRow
    if tooltip ~= GameTooltip or not row or not tooltip:IsOwned(row) then return end
    local data = row.data
    if not data or not data.recipe or tooltipData.id ~= data.recipe.spell then return end
    tooltip:AddLine(string.format(wt.L.PROFESSION_SKILL, data.profession, data.requiredSkill or wt.L.UNKNOWN_SKILL),
        1, 0.82, 0)
    tooltip:AddLine(string.format(wt.L.SOURCE, data.source), 1, 1, 1)
    if data.otherFactionSource then
        tooltip:AddLine(string.format(wt.L.OBTAINED_FROM, wt.L[data.otherFactionSource]), 0.8, 0.8, 0.8, true)
    end
    addSourceZones(tooltip, data.recipe.quests, wt.L.QUEST_STARTS_IN)
    addSourceZones(tooltip, data.recipe.vendors, wt.L.SOLD_IN)
    if data.category == Category.MISSING and data.requirement then tooltip:AddLine(data.requirement, 1, 0, 0) end
    if data.reputationRequirement then
        if data.reputationMet then
            tooltip:AddLine(data.reputationRequirement, 0, 1, 0, true)
        else
            tooltip:AddLine(data.reputationRequirement, 1, 0, 0, true)
        end
    end
    if data.recipe.cost then
        tooltip:AddLine(string.format(wt.L.COST_FORMAT, C_CurrencyInfo.GetCoinTextureString(data.recipe.cost)),
            1, 1, 1)
    end
    if data.recipe.merchantFavor then
        local currency = C_CurrencyInfo.GetCurrencyInfo(MERCHANTS_FAVOR_CURRENCY)
        tooltip:AddLine(string.format(wt.L.MERCHANTS_FAVOR_COST, data.recipe.merchantFavor,
            "|TInterface\\Icons\\racial_dwarf_findtreasure:0|t",
            currency and currency.name or wt.L.MERCHANTS_FAVOR), 1, 1, 1)
    end
end

local function hideTooltip(view, row)
    if view.tooltipRow == row then view.tooltipRow = nil end
    if GameTooltip:IsOwned(row) then GameTooltip:Hide() end
end

local function layoutRow(row)
    local data = row.data
    if not data then return end
    local width = row:GetWidth()
    row.cells[1]:SetText(data.name)
    row.cells[2]:SetText(data.skillLabel)
    row.cells[3]:SetText(data.source)
    for j, cell in ipairs(row.cells) do
        local inset = j == 1 and 38 or 4
        cell:ClearAllPoints()
        cell:SetPoint("LEFT", row, "LEFT", width * columns[j] + inset, 0)
        cell:SetWidth(math.max(1, width * (columns[j + 1] - columns[j]) - inset - 4))
    end
end

local function updateSeparator(row, node)
    local siblings = node:GetParent():GetNodes()
    row.separator:SetShown(node ~= siblings[#siblings])
end

local function createRow(view, row)
    row.rankBackground = row:CreateTexture(nil, "BACKGROUND")
    row.rankBackground:SetAllPoints()
    row.icon = row:CreateTexture(nil, "ARTWORK")
    row.icon:SetSize(24, 24)
    row.icon:SetPoint("LEFT", 8, 0)
    -- match ProfessionsButtonTemplate's reagent icon border and anchors
    row.iconBorder = row:CreateTexture(nil, "OVERLAY")
    row.iconBorder:SetAtlas("Professions-Slot-Frame")
    row.iconBorder:SetPoint("TOPLEFT", row.icon, "TOPLEFT")
    row.iconBorder:SetPoint("BOTTOMRIGHT", row.icon, "BOTTOMRIGHT", 1, -1)
    row.cells = {}
    for i = 1, 3 do
        row.cells[i] = label(row)
        row.cells[i]:SetTextColor(1, 1, 1)
    end
    local highlight = row:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetColorTexture(1, 1, 1, 0.06)
    local separator = row:CreateTexture(nil, "BACKGROUND")
    separator:SetPoint("BOTTOMLEFT", 38, 0)
    separator:SetPoint("BOTTOMRIGHT", -4, 0)
    separator:SetHeight(1)
    separator:SetColorTexture(1, 1, 1, 0.08)
    row.separator = separator
    row:SetScript("OnSizeChanged", layoutRow)
    row:SetScript("OnEnter", function(self)
        local data = self.data
        if not data or not data.recipe then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        view.tooltipRow = self
        GameTooltip:SetSpellByID(data.recipe.spell)
    end)
    local function hide(self) hideTooltip(view, self) end
    row:SetScript("OnLeave", hide)
    row:SetScript("OnHide", hide)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end

local function initializeRow(row, node)
    row.data = node:GetData()
    local recipe = row.data.recipe
    local color = categories[row.data.category].text
    row.rankBackground:SetColorTexture(color[1], color[2], color[3], 0.07)
    row.rankBackground:SetShown(recipe.rank and row.data.category <= Category.LATER)
    row.icon:SetTexture(row.data.icon)
    updateSeparator(row, node)
    layoutRow(row)
end

-- returns whether the node changed
-- skipInvalidation lets a batch invalidate once
local function setCollapsed(view, node, isCollapsed, skipInvalidation)
    local data = node:GetData()
    if view.searchBox:GetText() ~= "" then
        view.searchCollapsed[data.key] = isCollapsed
    else
        view.expanded[data.category][data.professionID] = not isCollapsed
    end
    if node:IsCollapsed() == isCollapsed then return false end
    node:SetCollapsed(isCollapsed, false, skipInvalidation)
    return true
end

local function toggleNode(view, button)
    local node = button:GetElementData()
    local isCollapsed = not node:IsCollapsed()
    button:UpdateCollapsedState(isCollapsed)
    setCollapsed(view, node, isCollapsed)
end

local function setAllCollapsed(view, categoryNode, isCollapsed)
    local changed = false
    for _, node in ipairs(categoryNode:GetNodes()) do
        if setCollapsed(view, node, isCollapsed, true) then
            local button = view.scrollBox:FindFrame(node)
            if button then button:UpdateCollapsedState(isCollapsed) end
            changed = true
        end
    end
    PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
    if changed then categoryNode:Invalidate() end
    return MenuResponse.Close
end

local function buildRowMenu(view, node, menu)
    wt.GenerateRecipeRowMenu(node:GetData(), menu, function(isCollapsed)
        return setAllCollapsed(view, node, isCollapsed)
    end)
end

local function rowClick(view, row, button)
    local data = row.data
    if not data then return end
    if button == "RightButton" then
        if view.openControllerMenu and InputUtil.IsGamepadUIEnabled() then
            view.openControllerMenu(row:GetElementData()); return
        end
        wt.Forever.openContextMenu(row, function(_, menu) buildRowMenu(view, row:GetElementData(), menu) end)
    elseif button == "LeftButton" and data.recipe then
        wt.LinkRecipe(data.recipe)
    elseif button == "LeftButton" and data.professionID and not data.recipe then
        toggleNode(view, row)
    end
end

local function indentFor(node)
    local data = node:GetData()
    return data.recipe and 16 or (data.professionID and 8 or 0)
end

local function extentFor(index, node)
    local data = node:GetData()
    -- keep a gap between main sections, even when their professions are collapsed
    if not data.profession then return index == 1 and 28 or 36 end
    return data.recipe and 30 or 28
end

local function layoutProfessionHeader(button)
    local noticeWidth = button.rankNotice:GetStringWidth()
    button.details:SetWidth(button.details:GetStringWidth())
    button.ButtonText:SetWidth(math.min(button.ButtonText:GetStringWidth(),
        math.max(1, button:GetWidth() - button.details:GetStringWidth() - 46
            - (noticeWidth > 0 and noticeWidth + 8 or 0))))
end

local function layoutSectionHeader(button)
    local capWidth = button:GetWidth() * HEADER_CAP_FRACTION
    button.bandCap:SetWidth(capWidth)
    button.band:SetPoint("BOTTOMLEFT", capWidth, 0)
end

local function initializeSectionHeader(button, node)
    local data = node:GetData()
    if not button.mask then
        button.mask = button:CreateMaskTexture()
        button.mask:SetAllPoints(button.bandCap)
        button.mask:SetTexture("Interface\\AddOns\\WhatsTraining\\Forever\\header-mask", "CLAMPTOBLACKADDITIVE",
            "CLAMPTOBLACKADDITIVE")
        button.bandCap:AddMaskTexture(button.mask)
        button:SetScript("OnSizeChanged", layoutSectionHeader)
        button:RegisterForClicks("RightButtonUp")
    end
    layoutSectionHeader(button)
    button.data = data
    local gradient = gradients[data.category]
    button.bandCap:SetGradient("HORIZONTAL", gradient[1], gradient[2])
    button.band:SetGradient("HORIZONTAL", gradient[2], gradient[3])
    button.heading:SetTextColor(unpack(categories[data.category].heading))
    button.heading:SetText(string.format(wt.L.SECTION_COUNT, categories[data.category].label, data.count))
end

local function initializeProfessionHeader(button, node)
    local data = node:GetData()
    if not button.details then
        button.ButtonText:ClearAllPoints()
        button.ButtonText:SetPoint("LEFT", 8, 0)
        button.details = label(button)
        button.details:SetTextColor(1, 0.82, 0)
        button.details:SetPoint("LEFT", button.ButtonText, "RIGHT", 8, 0)
        button.rankNotice = label(button)
        button.rankNotice:SetPoint("LEFT", button.details, "RIGHT", 8, 0)
        button.rankNotice:SetPoint("RIGHT", button.CollapseButton, "LEFT", -4, 0)
        button:SetScript("OnSizeChanged", layoutProfessionHeader)
        button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    end
    button.data = data
    button.RankBar:Hide()
    local count = data.recipeCount > 0
        and string.format(data.recipeCount == 1 and wt.L.RECIPE_COUNT or wt.L.RECIPES_COUNT, data.recipeCount) or ""
    local notice = data.notice or ""
    if data.category == Category.LATER and data.rankCount > 0 then
        notice = "|cffaaaaaa"
            .. string.format(data.rankCount == 1 and wt.L.RANK_COUNT or wt.L.RANKS_COUNT, data.rankCount) .. "|r"
    end
    button:SetHeaderText(data.profession)
    button.details:SetText("|cffaaaaaa" .. count .. "|r")
    button.rankNotice:SetText(notice)
    button.rankNotice:SetTextColor(unpack(categories[data.category].text))
    layoutProfessionHeader(button)
    button:UpdateCollapsedState(node:IsCollapsed())
end

local function updateRetainedRow(row, node)
    local data = node:GetData()
    if not data.profession then
        initializeSectionHeader(row, node)
    elseif not data.recipe then
        initializeProfessionHeader(row, node)
    else
        initializeRow(row, node)
    end
end

local function setupTreeView(view, scrollbar)
    local function onClick(row, button) rowClick(view, row, button) end
    local function sectionHeader(button, node)
        initializeSectionHeader(button, node)
        button:SetScript("OnClick", onClick)
    end
    local function professionHeader(button, node)
        initializeProfessionHeader(button, node)
        button:SetScript("OnClick", onClick)
    end
    local function recipeRow(row, node)
        if not row.cells then createRow(view, row) end
        initializeRow(row, node)
        row:SetScript("OnClick", onClick)
    end
    local treeView = CreateScrollBoxListTreeListView(0, 0, 8, 0, 0, 0)
    treeView:SetElementIndentCalculator(indentFor)
    treeView:SetElementExtentCalculator(extentFor)
    treeView:SetElementFactory(function(factory, node)
        local data = node:GetData()
        if not data.profession then
            factory("WhatsTrainingCraftingSectionHeaderTemplate", sectionHeader)
        elseif not data.recipe then
            factory("ProfessionsRecipeListCategoryTemplate", professionHeader)
        else
            factory("Button", recipeRow)
        end
    end)
    treeView:SetElementResetter(function(row)
        hideTooltip(view, row)
        row.data = nil
        row:SetScript("OnClick", nil)
    end)
    ScrollUtil.InitScrollBoxListWithScrollBar(view.scrollBox, scrollbar, treeView)
end

local function clear(items)
    for i = #items, 1, -1 do items[i] = nil end
end

local function regroup(view)
    for _, category in ipairs(view.categoryNodes) do
        for _, subgroup in ipairs(category:GetData().nodes) do clear(subgroup:GetData().nodes) end
    end
    for _, node in ipairs(view.recipeNodes) do
        local data = node:GetData()
        data.category = ignoreStore:IsIgnored(data.recipe.spell) and Category.IGNORED or data.baseCategory
        local parent = view.categoryNodes[data.category]:GetData().byProfession[data.professionID]
        -- native MoveNode invalidates for every recipe
        node.parent = parent
        tinsert(parent:GetData().nodes, node)
    end
    view.needsIgnoreUpdate = false
end

local function rebuildModel(view)
    local groups = wt.GetRecipeGroups()
    local provider = CreateTreeDataProvider()
    view.provider, view.categoryNodes, view.recipeNodes = provider, {}, {}
    for i in ipairs(categories) do
        view.categoryNodes[i] = provider:Insert({category = i, count = 0, items = {}, nodes = {}, byProfession = {}})
    end
    local function subgroup(category, data)
        local parent = view.categoryNodes[category]
        local inventory = parent:GetData()
        local node = inventory.byProfession[data.professionID]
        if not node then
            node = parent:Insert({category = category, key = category .. ":" .. data.professionID,
                professionID = data.professionID, profession = data.profession, id = data.professionID,
                items = {}, nodes = {}})
            inventory.byProfession[data.professionID] = node
            tinsert(inventory.nodes, node)
        end
        return node
    end
    for _, items in ipairs(groups) do
        for _, data in ipairs(items) do
            local parent = subgroup(data.baseCategory, data)
            subgroup(Category.IGNORED, data)
            tinsert(view.recipeNodes, parent:Insert(data))
        end
    end
    table.sort(view.recipeNodes, function(a, b) return wt.RecipeLess(a:GetData(), b:GetData()) end)
    for _, node in ipairs(view.categoryNodes) do
        table.sort(node:GetData().nodes, function(a, b) return professionLess(a:GetData(), b:GetData()) end)
    end
    regroup(view)
end

local function filter(self, resetScroll)
    self.filterDropdown:ValidateResetState()
    local selected = hasSelection(self.selectedProfessions) and hasSelection(self.selectedSources)
    if selected and self.needsRefresh then
        self.needsRefresh = false
        rebuildModel(self)
    end
    if self.needsIgnoreUpdate and self.recipeNodes then regroup(self) end
    local provider = self.provider or CreateTreeDataProvider()
    self.provider = provider
    local roots = provider:GetRootNode():GetNodes()
    clear(roots)
    if selected then
        local query = strlower(self.searchBox:GetText())
        local searching = query ~= ""
        for _, categoryNode in ipairs(self.categoryNodes) do
            local category = categoryNode:GetData()
            local professionsShown = categoryNode:GetNodes()
            clear(professionsShown)
            clear(category.items)
            for _, node in ipairs(category.nodes) do
                local subgroup = node:GetData()
                local recipesShown = node:GetNodes()
                clear(recipesShown)
                clear(subgroup.items)
                subgroup.recipeCount, subgroup.rankCount = 0, 0
                subgroup.notice = nil
                if self.selectedProfessions[subgroup.id] then
                    for _, recipeNode in ipairs(subgroup.nodes) do
                        local data = recipeNode:GetData()
                        if wt.RecipeMatchesFilters(self, data, query) then
                            tinsert(recipesShown, recipeNode)
                            tinsert(subgroup.items, data)
                            tinsert(category.items, data)
                            if data.recipe.rank then
                                subgroup.rankCount = subgroup.rankCount + 1
                            else
                                subgroup.recipeCount = subgroup.recipeCount + 1
                            end
                            if data.recipe.rank and (category.category == Category.AVAILABLE
                                or category.category == Category.SOON) and not subgroup.notice then
                                subgroup.notice = string.format(
                                    category.category == Category.AVAILABLE and wt.L.RANK_AVAILABLE or wt.L.RANK_SOON,
                                    data.rankName and data.rankName ~= "" and data.rankName or wt.L.RANK_UP)
                            end
                        end
                    end
                end
                if #recipesShown > 0 then
                    tinsert(professionsShown, node)
                    local isExpanded = (searching and not self.searchCollapsed[subgroup.key])
                        or (not searching and self.expanded[category.category][subgroup.id])
                    node:SetCollapsed(not isExpanded, false, true)
                end
            end
            category.count = #category.items
            if #professionsShown > 0 then tinsert(roots, categoryNode) end
        end
    end
    local scroll = self.scrollBox
    if scroll:GetDataProvider() ~= provider then
        scroll:SetDataProvider(provider, not resetScroll)
    else
        provider:Invalidate()
        -- retained rows need the new counts, notices and separators
        scroll:ForEachFrame(updateRetainedRow)
        if resetScroll and scroll:GetScrollPercentage() ~= 0 then scroll:ScrollToBegin() end
    end
    self.empty:SetShown(#roots == 0)
    self.empty:SetText(self.hasProfession == false and wt.L.LEARN_PROFESSION or wt.L.NO_MATCHING_RECIPES)
end

local function refresh(self, resetScroll)
    self.needsRefresh = true
    self:Filter(resetScroll)
end

function wt.CreateRecipeList(page)
    local view = CreateFrame("Frame", "WhatsTrainingCraftingRecipeList", page)
    view.needsRefresh = true
    view.selectedProfessions = WT_Crafting.selectedProfessions
    view.selectedSources = WT_Crafting.selectedSources
    view.settings = WT_Crafting.settings
    if view.settings.showOtherFactionRecipes == nil then view.settings.showOtherFactionRecipes = false end
    view.UpdateProfessionSelections, view.Filter, view.Refresh = wt.UpdateRecipeProfessionSelections, filter, refresh
    view.GenerateFilterMenu = wt.GenerateRecipeFilterMenu
    view.GenerateRowMenu = buildRowMenu
    view:UpdateProfessionSelections()
    view:SetAllPoints()
    view:SetFrameStrata("HIGH")
    local filters = CreateFrame("Frame", nil, view)
    filters:SetSize(552, 20) -- 440 search + 108 filter + native 4px gap
    -- the page starts 24px below the book and the native rank bar at 40px
    filters:SetPoint("TOP", view, "TOP", 0, -16)
    local search = CreateFrame("EditBox", "WhatsTrainingCraftingSearchBox", view, "SearchBoxTemplate")
    view.searchBox = search
    search:SetSize(440, 20)
    search:SetPoint("TOPLEFT", filters, "TOPLEFT")
    search:HookScript("OnHide", function(self) self:ClearFocus() end)
    local dropdown = wt.Forever.createDropdown(view, "WhatsTrainingCraftingFilterDropdown", true)
    view.filterDropdown = dropdown
    dropdown.resizeToText = false
    dropdown:SetSize(108, 18)
    dropdown:SetPoint("LEFT", search, "RIGHT", 4, 0)
    wt.SetupRecipeFilter(view, dropdown)

    local scroll = CreateFrame("Frame", "WhatsTrainingCraftingScrollBox", view, "WowScrollBoxList")
    view.scrollBox = scroll
    scroll:SetPoint("TOPLEFT", 14, -51)
    scroll:SetPoint("BOTTOMRIGHT", -30, 36)
    local scrollbar = CreateFrame("EventFrame", "WhatsTrainingCraftingScrollBar", view, "MinimalScrollBar")
    -- center in the 30px right gutter, clear of the upper corner ornament
    scrollbar:SetPoint("TOP", scroll, "TOPRIGHT", 15, -8)
    scrollbar:SetPoint("BOTTOM", scroll, "BOTTOMRIGHT", 15, 0)
    view.empty = label(view, "GameFontHighlight")
    view.empty:SetAllPoints(scroll)
    view.empty:SetJustifyH("CENTER")
    view.empty:SetJustifyV("MIDDLE")
    view.empty:SetWordWrap(true)
    local footer = label(view, "GameFontNormal")
    view.footer = footer
    footer:SetPoint("BOTTOMLEFT", view, "BOTTOMLEFT", 28, 14)
    footer:SetPoint("BOTTOMRIGHT", view, "BOTTOMRIGHT", -30, 14)
    footer:SetHeight(14)
    footer:SetTextColor(0.7, 0.7, 0.7)
    footer:SetText(wt.L.RECIPE_HINT)

    view.expanded, view.searchCollapsed, view.categoryNodes = WT_Crafting.expandedProfessions, {}, {}
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Spell, function(tooltip, tooltipData)
        addRecipeTooltip(view, tooltip, tooltipData)
    end)
    setupTreeView(view, scrollbar)

    search:HookScript("OnTextChanged", function()
        view.searchCollapsed = {}
        view:Filter(true)
    end)
    ignoreStore:AddSubscription(function()
        view.needsIgnoreUpdate = true
        if view:IsVisible() then view:Filter() end
    end)
    return view
end
