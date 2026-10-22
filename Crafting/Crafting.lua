local _, wt = ...

-- covers the native profession page
local function attach()
    local book = ProfessionsFrame
    if not book.ProfessionsOverviewTab then return end

    local active, selectedTab, queued, controller
    local nativeTabs = {book.ProfessionsOverviewTab}
    for _, tab in ipairs(book.rightProfessionTabs) do
        tinsert(nativeTabs, tab)
    end

    local page = CreateFrame("Frame", "WhatsTrainingCraftingPage", book)
    page:Hide()
    page:SetPoint("TOPLEFT", book, "TOPLEFT", 3, -24)
    page:SetPoint("BOTTOMRIGHT", book, "BOTTOMRIGHT", -3, 3)
    page:EnableMouse(true)
    page:EnableMouseWheel(true)
    page:SetScript("OnMouseWheel", function() end)
    local function paint(container)
        local canvas = CreateFrame("Frame", nil, container)
        canvas:SetAllPoints(page)
        local backing = canvas:CreateTexture(nil, "BACKGROUND")
        backing:SetAllPoints()
        backing:SetColorTexture(0.06, 0.05, 0.04, 1)
        -- the native atlas's first 54px hold the full header and crease
        local header = CreateFrame("Frame", nil, canvas)
        header:SetPoint("TOPLEFT", book, "TOPLEFT", 3, -21)
        header:SetPoint("TOPRIGHT", book, "TOPRIGHT", -3, -21)
        header:SetHeight(54)
        header:SetClipsChildren(true)
        local headerArt = header:CreateTexture(nil, "ARTWORK")
        headerArt:SetAtlas("Profession-Background-Template2", true)
        headerArt:SetPoint("TOPLEFT", header, "TOPLEFT")
        headerArt:SetPoint("TOPRIGHT", header, "TOPRIGHT")
        local art = canvas:CreateTexture(nil, "ARTWORK")
        art:SetAtlas("Profession-Background-Overview")
        art:SetAllPoints()
    end
    paint(page)

    local title = CreateFrame("Frame", "WhatsTrainingCraftingTitle", page)
    title:SetAllPoints(book.TitleContainer)
    title:SetClipsChildren(true)
    local titleCanvas = CreateFrame("Frame", nil, title)
    titleCanvas:SetAllPoints(book.NineSlice.TopEdge)
    local titleBacking = titleCanvas:CreateTexture(nil, "BACKGROUND")
    titleBacking:SetAllPoints()
    titleBacking:SetAtlas(book.NineSlice.TopEdge:GetAtlas())
    titleBacking:SetHorizTile(true)
    title.backing = titleBacking
    title.art = CreateFrame("Frame", nil, titleCanvas)
    title.art:SetAllPoints(titleCanvas)
    title.Text = title.art:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title.Text:SetWordWrap(false)
    title.Text:SetText(wt.L.TITLE)

    local portrait = CreateFrame("Frame", "WhatsTrainingCraftingPortrait", page)
    portrait:SetAllPoints(book.PortraitContainer)
    portrait.Icon = portrait:CreateTexture(nil, "OVERLAY")
    portrait.Icon:SetAllPoints(book.PortraitContainer.portrait)
    portrait.Icon:SetTexture("Interface\\Icons\\INV_SideTab_Professions_c60")
    local mask = portrait:CreateMaskTexture(nil, "OVERLAY")
    mask:SetAllPoints(book.PortraitContainer.CircleMask)
    mask:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    portrait.Icon:AddMaskTexture(mask)

    -- rank bars sit in HIGH strata: cover only their rectangles so the native portrait and border stay above the page
    local content = book.BookPage.ProfessionsContentFrame
    local bars = {book.CraftingPage.RankBar}
    for _, key in ipairs({"PrimaryProfession1", "PrimaryProfession2", "SecondaryProfession1", "SecondaryProfession2",
        "SecondaryProfession3"}) do
        tinsert(bars, content[key].StatusBar)
    end
    for _, bar in ipairs(bars) do
        local cover = CreateFrame("Frame", nil, page)
        -- border and fill extend below the 18px bar frame
        cover:SetPoint("TOPLEFT", bar.Border, "TOPLEFT", -2, 2)
        cover:SetPoint("BOTTOMRIGHT", bar.Border, "BOTTOMRIGHT", 2, -2)
        cover:SetFrameStrata("HIGH")
        cover:SetFrameLevel(bar:GetFrameLevel() + 10)
        cover:SetClipsChildren(true)
        cover:EnableMouse(true)
        paint(cover)
    end

    local function makeTab(name)
        local tab = CreateFrame("Frame", name, book, "LargeSideTabButtonTemplate")
        tab:Hide()
        tab:EnableMouse(true)
        tab:SetFillToInterior(true)
        tab:SetChecked(false)
        tab:HookScript("OnHide", function(self)
            local tooltip = GetAppropriateTooltip()
            if tooltip:IsOwned(self) then tooltip:Hide() end
        end)
        return tab
    end

    local launcher = makeTab("WhatsTrainingCraftingTab")
    launcher.Icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    launcher.tooltipText = wt.L.TAB_TEXT
    local returnTab = makeTab("WhatsTrainingCraftingReturnTab")
    local recipeList = wt.CreateRecipeList(page)

    local function selectedNativeTab()
        local selected
        for _, tab in ipairs(nativeTabs) do
            if tab:IsShown() and tab.SelectedTexture:IsShown() then selected = tab end
        end
        return selected
    end

    local function refreshPage()
        if InputUtil.IsGamepadUIEnabled() then
            title:SetFrameLevel(recipeList:GetFrameLevel() + 1)
            portrait:SetFrameLevel(recipeList:GetFrameLevel() + 1)
        end
        wt.PaintCraftingHeader(title, portrait, book)
        if recipeList.needsRefresh then recipeList:Refresh()
        elseif recipeList.needsIgnoreUpdate then recipeList:Filter() end
    end

    local function sync()
        queued = false
        if InputUtil.IsGamepadUIEnabled() then
            active = false
            if not controller then
                controller = wt.EnableCraftingController(book, page, recipeList, launcher, returnTab,
                    selectedNativeTab, refreshPage)
            end
            controller:Sync()
            return
        end
        if controller then controller:Deactivate() end
        if not book:IsVisible() then
            active = false
            page:Hide()
            launcher:Hide()
            returnTab:Hide()
            return
        end

        local selected = selectedNativeTab()
        if selected ~= selectedTab then active = false end

        local level = book.PortraitContainer:GetFrameLevel() - 10
        page:SetFrameLevel(level)
        recipeList:SetFrameLevel(level + 1000)
        title:SetFrameLevel(book.TitleContainer:GetFrameLevel() + 1)
        portrait:SetFrameLevel(book.PortraitContainer:GetFrameLevel() + 1)
        launcher:SetFrameLevel(level + 1)
        returnTab:SetFrameLevel(level + 1)
        launcher:ClearAllPoints()
        launcher:SetPoint("BOTTOMLEFT", book, "BOTTOMRIGHT", 0, 10)
        launcher:SetChecked(active)
        launcher:Show()
        page:SetShown(active)
        if active then
            refreshPage()
        end

        returnTab:SetShown(active and selected ~= nil)
        if active and selected then
            returnTab:ClearAllPoints()
            returnTab:SetPoint("CENTER", selected)
            returnTab.Icon:SetTexture(selected.Icon:GetTexture())
            returnTab.tooltipText = selected.tooltipText
        end
    end

    local function request()
        if queued then return end
        queued = true
        RunNextFrame(sync)
    end

    local function deactivate()
        active = false
        if controller then controller:Hide() end
        request()
    end

    launcher:SetCustomOnMouseUpHandler(function(_, button, upInside)
        if button ~= "LeftButton" or not upInside then return end
        if InputUtil.IsGamepadUIEnabled() then
            if controller then controller:Toggle() end
            return
        end
        selectedTab = selectedNativeTab()
        active = not active
        sync()
    end)
    local function returnToNative(_, button, upInside)
        if button ~= "LeftButton" or not upInside then return end
        if controller then controller:Hide() end
        active = false
        sync()
    end
    returnTab:SetCustomOnMouseUpHandler(returnToNative)
    for _, tab in ipairs(nativeTabs) do
        tab:HookScript("OnMouseUp", returnToNative)
    end

    EventRegistry:RegisterCallback("ProfessionsFrame.Show", request, launcher)
    EventRegistry:RegisterCallback("ProfessionsFrame.Hide", deactivate, launcher)
    EventRegistry:RegisterCallback("Professions.ProfessionSelected", deactivate, launcher)
    EventRegistry:RegisterCallback("Professions.ShowSelectedCraftingPage", deactivate, launcher)
    book:HookScript("OnSizeChanged", request)
    local function dataChanged()
        recipeList.needsRefresh = true
        request()
    end
    local actions = {
        SKILL_LINES_CHANGED = function()
            recipeList:UpdateProfessionSelections()
            recipeList.filterDropdown:GenerateMenu()
            dataChanged()
        end,
        SPELL_DATA_LOAD_RESULT = function(spellID, success)
            if wt.RecipeSpellDataLoaded(spellID, success) then dataChanged() end
        end,
        UPDATE_FACTION = dataChanged,
        NEW_RECIPE_LEARNED = dataChanged,
        SPELLS_CHANGED = dataChanged,
        PLAYER_LEVEL_UP = dataChanged,
        TRADE_SKILL_SHOW = deactivate,
        UI_SCALE_CHANGED = request,
        GAME_PAD_ACTIVE_CHANGED = request,
    }
    for event in pairs(actions) do
        launcher:RegisterEvent(event)
    end
    launcher:SetScript("OnEvent", function(_, event, ...) actions[event](...) end)
    request()
end

function wt.AttachCrafting()
    EventUtil.ContinueOnAddOnLoaded("Blizzard_Professions", attach)
end
