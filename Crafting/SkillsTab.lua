local _, wt = ...

local function attach()
    local skills = SkillFrame
    -- Keep the native controls together so skill updates cannot show them over our page
    local children = {skills:GetChildren()}
    local native = CreateFrame("Frame", nil, skills)
    native:SetAllPoints()
    for _, child in ipairs(children) do
        if child ~= SkillFrameCancelButton and child ~= SkillFrameExpandButtonFrame then child:SetParent(native) end
    end
    local page = CreateFrame("Frame", "WhatsTrainingCraftingSkillsPage", skills)
    page:SetPoint("TOPLEFT", 20, -76)
    page:SetPoint("BOTTOMRIGHT", skills, "TOPLEFT", 344, -405)
    page:EnableMouse(true)
    page:EnableMouseWheel(true)
    page:SetScript("OnMouseWheel", function() end)
    local background = page:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0, 0, 0, 1)
    page.recipeList = wt.CreateSkillsRecipeList(page)

    local all = SkillFrameCollapseAllButton
    local back = CreateFrame("Button", "WhatsTrainingCraftingSkillsTab1", SkillFrameExpandButtonFrame,
        "SkillLabelTemplate")
    back:SetAllPoints(all)
    back:SetText(all:GetText())
    back:SetNormalFontObject("GameFontNormal")
    back:SetHighlightFontObject("GameFontHighlight")
    back:SetNormalTexture("Interface\\MoneyFrame\\Arrow-Left-Up")
    local arrow = back:GetNormalTexture()
    arrow:ClearAllPoints()
    arrow:SetPoint("LEFT", 3, -2)
    local tab = CreateFrame("Button", "WhatsTrainingCraftingSkillsTab2", skills, "TabButtonTemplate")
    tab:SetText(wt.L.PROFESSIONS)
    PanelTemplates_TabResize(tab, 0, 140)
    tab:SetPoint("TOPLEFT", SkillFrameExpandButtonFrame, "TOPRIGHT", 4, 6)

    local function selectTab(professions)
        professions = professions and WT_EnableProfessions ~= false
        native:SetShown(not professions)
        page:SetShown(professions)
        all:SetShown(not professions)
        back:SetShown(professions)
        tab:SetShown(WT_EnableProfessions ~= false)
        if professions then PanelTemplates_SelectTab(tab)
        else PanelTemplates_DeselectTab(tab) end
    end
    back:SetScript("OnClick", function()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
        selectTab(false)
    end)
    tab:SetScript("OnClick", function()
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
        selectTab(true)
    end)
    EventRegistry:RegisterCallback("WhatsTraining.ProfessionsChanged", function() selectTab(false) end, page)
    selectTab(false)
end

EventUtil.ContinueOnAddOnLoaded("Blizzard_UIPanels_Game", attach)
