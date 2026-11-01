local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")
local professions, sourceNames = wt.Professions, wt.RecipeSourceNames
local professionLess = wt.ProfessionLess

local sourceTypes, usedSources = {}, {}
for _, recipes in pairs(wt.Recipes) do
    for _, recipe in ipairs(recipes) do
        for _, source in ipairs(wt.GetRecipeSources(recipe)) do usedSources[source] = true end
    end
end
for _, source in ipairs({"trainer", "vendor", "quest", "drop", "crafted", "world_object", "discovery"}) do
    if usedSources[source] then tinsert(sourceTypes, source) end
end
local defaultSources = {trainer = true, vendor = true, quest = true}

local function updateProfessionSelections(self)
    self.hasProfession = false
    for _, id in ipairs(professions) do
        if C_SkillInfo.GetSkillLineInfoByID(id) then
            self.hasProfession = true
            if self.selectedProfessions[id] == nil then self.selectedProfessions[id] = true end
        else
            self.selectedProfessions[id] = nil
        end
    end
end

local function buildFilterMenu(view, menu)
    if not view.scoped then
        local professionMenu = menu:CreateButton(wt.L.PROFESSIONS)
        local function setProfessions(checked)
            for _, id in ipairs(professions) do
                if C_SkillInfo.GetSkillLineInfoByID(id) then view.selectedProfessions[id] = checked end
            end
            view:Filter(true)
            return MenuResponse.Refresh
        end
        professionMenu:CreateButton(CHECK_ALL, setProfessions, true)
        professionMenu:CreateButton(UNCHECK_ALL, setProfessions, false)
        local function professionSelected(id) return view.selectedProfessions[id] end
        local function toggleProfession(id)
            view.selectedProfessions[id] = not professionSelected(id)
            view:Filter(true)
            return MenuResponse.Refresh
        end
        local choices = {}
        for _, id in ipairs(professions) do
            local skill = C_SkillInfo.GetSkillLineInfoByID(id)
            if skill then tinsert(choices, {id = id, profession = skill.name}) end
        end
        table.sort(choices, professionLess)
        for _, choice in ipairs(choices) do
            professionMenu:CreateCheckbox(choice.profession, professionSelected, toggleProfession, choice.id)
        end
    end

    local sourceMenu = menu:CreateButton(wt.L.SOURCES)
    local function setSources(checked)
        for _, source in ipairs(sourceTypes) do view.selectedSources[source] = checked end
        view:Filter(true)
        return MenuResponse.Refresh
    end
    sourceMenu:CreateButton(CHECK_ALL, setSources, true)
    sourceMenu:CreateButton(UNCHECK_ALL, setSources, false)
    local function sourceSelected(source) return view.selectedSources[source] end
    local function toggleSource(source)
        view.selectedSources[source] = not sourceSelected(source)
        view:Filter(true)
        return MenuResponse.Refresh
    end
    for _, source in ipairs(sourceTypes) do
        sourceMenu:CreateCheckbox(sourceNames[source], sourceSelected, toggleSource, source)
    end

    local function selected(key) return view.settings[key] ~= false end
    local function toggle(key)
        view.settings[key] = not selected(key)
        view:Filter(true)
        return MenuResponse.Refresh
    end
    menu:CreateCheckbox(wt.L.SHOW_REPUTATION_RECIPES, selected, toggle, "showReputationRecipes")
    if wt.gameVersion == "forever" then
        menu:CreateCheckbox(string.format(wt.L.SHOW_MERCHANTS_FAVOR_RECIPES, wt.L.MERCHANTS_FAVOR),
            selected, toggle, "showMerchantsFavorRecipes")
    end
    menu:CreateCheckbox(wt.L.SHOW_OTHER_FACTION_RECIPES, selected, toggle, "showOtherFactionRecipes")
end

local function setupFilterDropdown(view, dropdown)
    dropdown:SetIsDefaultCallback(function()
        if not view.scoped then
            for _, id in ipairs(professions) do
                if C_SkillInfo.GetSkillLineInfoByID(id) and not view.selectedProfessions[id] then return false end
            end
        end
        for _, source in ipairs(sourceTypes) do
            if (view.selectedSources[source] or false) ~= (defaultSources[source] or false) then return false end
        end
        return not view.settings.showReputationRecipes and not view.settings.showMerchantsFavorRecipes
            and not view.settings.showOtherFactionRecipes
    end)
    dropdown:SetDefaultCallback(function()
        if not view.scoped then
            for _, id in ipairs(professions) do
                if C_SkillInfo.GetSkillLineInfoByID(id) then view.selectedProfessions[id] = true end
            end
        end
        for _, source in ipairs(sourceTypes) do view.selectedSources[source] = defaultSources[source] or false end
        view.settings.showReputationRecipes = false
        view.settings.showMerchantsFavorRecipes = false
        view.settings.showOtherFactionRecipes = false
        view:Filter(true)
        dropdown:GenerateMenu()
    end)
    dropdown:SetupMenu(function(_, menu) buildFilterMenu(view, menu) end)
end

local function matches(view, data, query)
    if not view.settings.showOtherFactionRecipes and data.otherFactionSource then return false end
    if view.settings.showReputationRecipes == false and data.reputationRequirement then return false end
    if view.settings.showMerchantsFavorRecipes == false and (data.recipe.merchantFavor or 0) > 0 then return false end
    return wt.RowMatches(data, query, view.selectedSources)
end

wt.UpdateRecipeProfessionSelections = updateProfessionSelections
wt.GenerateRecipeFilterMenu = buildFilterMenu
wt.SetupRecipeFilter = setupFilterDropdown
wt.RecipeMatchesFilters = matches

function wt.GenerateRecipeRowMenu(data, menu, setAllCollapsed)
    menu:CreateTitle(data.recipe and data.name or data.profession or wt.RecipeCategories[data.category].label)
    if data.recipe then
        menu:CreateCheckbox(wt.L.IGNORED_HEADER, function() return ignoreStore:IsIgnored(data.recipe.spell) end,
            function()
                PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
                ignoreStore:Flip(data.recipe.spell)
                return MenuResponse.Close
            end)
        return
    end
    if not data.profession and setAllCollapsed then
        menu:CreateButton(wt.L.COLLAPSE_ALL, function() return setAllCollapsed(true) end)
        menu:CreateButton(wt.L.EXPAND_ALL, function() return setAllCollapsed(false) end)
    end
    menu:CreateButton(data.category == wt.RecipeCategory.IGNORED and wt.L.UNIGNORE_ALL or wt.L.IGNORE_ALL, function()
        local ids = {}
        for _, item in ipairs(data.items) do tinsert(ids, item.recipe.spell) end
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        ignoreStore:UpdateMany(ids, data.category ~= wt.RecipeCategory.IGNORED)
        return MenuResponse.Close
    end)
end

local function insertLink(link)
    if not link then return end
    local window = ChatEdit_GetActiveWindow()
    if window then window:Insert(link)
    else ChatFrame_OpenChat(link) end
end

function wt.LinkRecipe(recipe)
    local itemID
    if IsControlKeyDown() then
        itemID = recipe.teach
        if not itemID then
            insertLink(C_Spell.GetSpellLink(recipe.spell))
            return
        end
    elseif IsShiftKeyDown() then
        itemID = recipe.creates
    end
    if itemID then
        local item = Item:CreateFromItemID(itemID)
        item:ContinueOnItemLoad(function() insertLink(item:GetItemLink()) end)
    end
end
