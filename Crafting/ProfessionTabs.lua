local _, wt = ...

local function attach(prefix, getSkillName)
    local book = _G[prefix .. "Frame"]
    local native = CreateFrame("Frame", nil, book)
    native:SetAllPoints()

    local page = CreateFrame("Frame", "WhatsTraining" .. prefix .. "Page", book)
    page:Hide()
    page:SetPoint("TOPLEFT", 20, -70)
    page:SetPoint("BOTTOMRIGHT", book, "TOPLEFT", 344, -405)
    page:EnableMouse(true)
    page:EnableMouseWheel(true)
    page:SetScript("OnMouseWheel", function() end)
    local background = page:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0, 0, 0, 1)
    local view = wt.CreateSkillsRecipeList(page, true)
    page.recipeList = view
    local active, tabs = false, {}

    local function sync()
        if not book:IsVisible() then return end
        -- recipe addons can add price labels after Blizzard's frame has loaded
        for _, child in ipairs({book:GetChildren()}) do
            if child ~= native and child ~= page and child ~= tabs[1] and child ~= tabs[2]
                and child ~= _G[prefix .. "RankFrame"] and child ~= _G[prefix .. "FrameCloseButton"]
                and child ~= _G[prefix .. "CancelButton"] then child:SetParent(native) end
        end
        local name = getSkillName()
        local id
        for _, profession in ipairs(wt.Professions) do
            local skill = C_SkillInfo.GetSkillLineInfoByID(profession)
            local smelting = profession == 186 and C_Spell.GetSpellInfo(2656)
            if skill and (skill.name == name or smelting and smelting.name == name) then id = profession; break end
        end
        local changed = view.professionID ~= id
        view.professionID = id
        if changed then
            view.searchBox:SetText("")
            view.searchCollapsed = {}
            view.scroll.offset = 0
            view.scroll.ScrollBar:SetValue(0)
        end
        if not id then active = false end -- CraftFrame also hosts Beast Training
        local wasShown = page:IsVisible()
        native:SetShown(not active)
        page:SetShown(active)
        for index, tab in ipairs(tabs) do
            tab:SetShown(id ~= nil)
            if active == (index == 2) then PanelTemplates_SelectTab(tab)
            else PanelTemplates_DeselectTab(tab) end
        end
        if active and changed and wasShown then view:Refresh() end
    end

    for index, text in ipairs({wt.L.RECIPES_TAB, wt.L.TITLE}) do
        local tab = CreateFrame("Button", "WhatsTraining" .. prefix .. "Tab" .. index, book,
            "CharacterFrameTabButtonTemplate")
        tabs[index] = tab
        tab:SetText(text)
        local function resize() PanelTemplates_TabResize(tab, 0, index == 1 and 100 or 160) end
        tab:SetScript("OnShow", resize)
        tab:SetScript("OnEvent", resize)
        resize()
        if index == 1 then tab:SetPoint("TOPLEFT", book, "TOPLEFT", 22, -434)
        else tab:SetPoint("LEFT", tabs[1], "RIGHT", -16, 0) end
        tab:SetScript("OnClick", function()
            active = index == 2
            PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
            sync()
        end)
    end
    book:HookScript("OnShow", sync)
    book:HookScript("OnEvent", sync)
    sync()
end

EventUtil.ContinueOnAddOnLoaded("Blizzard_TradeSkillUI", function() attach("TradeSkill", GetTradeSkillLine) end)
EventUtil.ContinueOnAddOnLoaded("Blizzard_CraftUI", function() attach("Craft", GetCraftDisplaySkillLine) end)
