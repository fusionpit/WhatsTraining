local _, wt = ...
local attached = false

local function attach()
    if WT_EnableProfessions == false or attached or not SkillFrame then return end
    attached = true
    local skills = SkillFrame
    local native = CreateFrame("Frame", nil, skills)
    native:SetAllPoints()
    local nativeLevels = {}
    local page = CreateFrame("Frame", "WhatsTrainingCraftingSkillsPage", skills)
    page:Hide()
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
        if professions then
            -- only group content while our page is open
            for _, child in ipairs({skills:GetChildren()}) do
                if child ~= native and child ~= page and child ~= tab
                    and child ~= skills.backdrop and child ~= skills.shadow and child ~= skills.NineSlice
                    and child ~= skills.TitleContainer and child ~= skills.PortraitContainer
                    and child ~= SkillFrameCancelButton and child ~= SkillFrameExpandButtonFrame then
                    nativeLevels[child] = child:GetFrameLevel() - skills:GetFrameLevel()
                    child:SetParent(native)
                end
            end
        else
            for child, level in pairs(nativeLevels) do
                if child:GetParent() == native then
                    child:SetParent(skills)
                    child:SetFrameLevel(skills:GetFrameLevel() + level)
                end
                nativeLevels[child] = nil
            end
        end
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
EventRegistry:RegisterCallback("WhatsTraining.ProfessionsChanged", attach, wt)
