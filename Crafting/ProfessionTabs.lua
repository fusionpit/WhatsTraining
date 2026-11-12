local _, wt = ...
local attached = {}

local function attach(prefix, getSkillName)
    if WT_EnableProfessions == false or attached[prefix] then return end
    attached[prefix] = true
    local book = _G[prefix .. "Frame"]
    local native = CreateFrame("Frame", nil, book)
    native:SetAllPoints()

    -- follow the native footer vertically, so things like letrix works
    local bounds = CreateFrame("Frame", nil, book)
    bounds:SetPoint("TOPLEFT", 20, -70)
    bounds:SetPoint("BOTTOMRIGHT", _G[prefix .. "CancelButton"], "TOPRIGHT", -1, 6)
    local page = CreateFrame("Frame", "WhatsTraining" .. prefix .. "Page", book)
    page:Hide()
    page:SetPoint("TOPLEFT", bounds, "TOPLEFT")
    page:SetPoint("BOTTOMLEFT", bounds, "BOTTOMLEFT")
    page:SetWidth(324)
    page:EnableMouse(true)
    page:EnableMouseWheel(true)
    page:SetScript("OnMouseWheel", function() end)
    local background = page:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0, 0, 0, 1)
    local view = wt.CreateSkillsRecipeList(page, true)
    page.recipeList = view
    local active, tabs, nativeLevels = false, {}, {}

    local function isTrainingFrame(child)
        return child == native or child == bounds or child == page or child == tabs[1] or child == tabs[2]
    end

    local function isWindowDecoration(child)
        return child == book.backdrop or child == book.shadow or child == book.NineSlice
            or child == book.TitleContainer or child == book.PortraitContainer
    end

    local function isPersistentNativeControl(child)
        return child == _G[prefix .. "RankFrame"] or child == _G[prefix .. "FrameCloseButton"]
            or child == _G[prefix .. "CancelButton"]
    end

    local function sync()
        local enabled = WT_EnableProfessions ~= false
        if enabled and not book:IsVisible() then return end
        local id
        if enabled then
            local name = getSkillName()
            for _, profession in ipairs(wt.Professions) do
                local skill = C_SkillInfo.GetSkillLineInfoByID(profession)
                local smelting = profession == 186 and C_Spell.GetSpellInfo(2656)
                if skill and (skill.name == name or smelting and smelting.name == name) then id = profession; break end
            end
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
        if active then
            -- only group recipe content while our page is open
            for _, child in ipairs({book:GetChildren()}) do
                if not isTrainingFrame(child) and not isWindowDecoration(child) and not isPersistentNativeControl(child) then
                    nativeLevels[child] = child:GetFrameLevel() - book:GetFrameLevel()
                    child:SetParent(native)
                end
            end
        else
            for child, level in pairs(nativeLevels) do
                if child:GetParent() == native then
                    child:SetParent(book)
                    child:SetFrameLevel(book:GetFrameLevel() + level)
                end
                nativeLevels[child] = nil
            end
        end
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
        if index == 1 then tab:SetPoint("TOPLEFT", page, "BOTTOMLEFT", 2, -32)
        else tab:SetPoint("LEFT", tabs[1], "RIGHT", -16, 0) end
        tab:SetScript("OnClick", function()
            active = index == 2
            PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
            sync()
        end)
    end
    book:HookScript("OnShow", sync)
    book:HookScript("OnEvent", sync)
    EventRegistry:RegisterCallback("WhatsTraining.ProfessionsChanged", sync, page)
    sync()
end

EventUtil.ContinueOnAddOnLoaded("Blizzard_TradeSkillUI", function() attach("TradeSkill", GetTradeSkillLine) end)
EventUtil.ContinueOnAddOnLoaded("Blizzard_CraftUI", function() attach("Craft", GetCraftDisplaySkillLine) end)
EventRegistry:RegisterCallback("WhatsTraining.ProfessionsChanged", function()
    if _G.TradeSkillFrame then attach("TradeSkill", GetTradeSkillLine) end
    if _G.CraftFrame then attach("Craft", GetCraftDisplaySkillLine) end
end, attached)
