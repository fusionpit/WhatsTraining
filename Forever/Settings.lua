local _, wt = ...
local Forever = wt.Forever

local function resetScroll(weapons)
    local main = wt.MainFrame
    local page = main and weapons and main.expanded and main.weaponPage or main
    if page and page.scrollFrame then page.scrollFrame:SetVerticalScroll(0) end
end

function wt.SetSpellDisplay(value)
    WT_SpellDisplay = value
    resetScroll()
    wt.RefreshUI()
end

function wt.SetWeaponGrouping(value)
    WT_WeaponGrouping = value
    resetScroll(true)
    wt:ApplyFilter()
end

function wt.SetShowKnownWeaponSkills(value)
    WT_ShowKnownWeaponSkills = value
    resetScroll(true)
    wt:ApplyFilter()
end

function wt.SetHideWeaponSkillSwitcher(value)
    WT_HideWeaponSkillSwitcher = value
    wt.RefreshUI()
end

function wt.SetSideBySide(value)
    WT_SideBySide = value
    if wt.MainFrame then wt.MainFrame.sideBySide = value end
    wt.RefreshUI()
end

function wt.SetScrollTwoPages(value)
    local controls = wt.MainFrame and wt.MainFrame.pagingControls
    local page = controls and controls:GetCurrentPage() or 1
    WT_ScrollTwoPages = value
    wt.RefreshUI()
    if controls then controls:SetCurrentPage(value and math.ceil(page / 2) or page * 2 - 1) end
end

local function label(parent, text, font, x, y)
    local region = parent:CreateFontString(nil, "OVERLAY", font or "GameFontHighlight")
    region:SetPoint("TOPLEFT", x, y)
    region:SetJustifyH("LEFT")
    region:SetText(text)
    return region
end

local ROW_SPACING, SECTION_SPACING, HEADING_SPACING = 34, 14, 28
local LABEL_X, CONTROL_X = 14, 360

local function nextRow(page)
    local y = page.nextY
    page.nextY = y - ROW_SPACING
    return y
end

local function rowLabel(page, text, y)
    local region = label(page, text, nil, LABEL_X, y)
    region:SetSize(CONTROL_X - LABEL_X - 20, 32)
    region:SetJustifyV("MIDDLE")
    region:SetWordWrap(true)
    return region
end

local function heading(page, text)
    local y = page.nextY and page.nextY - SECTION_SPACING or 0
    page.nextY = y - HEADING_SPACING
    return label(page, text, "GameFontNormalLarge", 0, y)
end

local function addRowHover(page, control, y)
    control:SetPoint("TOPLEFT", CONTROL_X, y - (32 - control:GetHeight()) / 2)
    local row = CreateFrame("Frame", nil, page)
    row:SetPoint("TOPLEFT", 4, y)
    row:SetPoint("TOPRIGHT", -5, y)
    row:SetHeight(32)
    row:SetFrameLevel(page:GetFrameLevel())
    row:EnableMouse(true)
    row:SetMouseClickEnabled(false)
    row.highlight = page:CreateTexture(nil, "BACKGROUND")
    row.highlight:SetAllPoints(row)
    row.highlight:SetColorTexture(1, 1, 1, 0.1)
    row.highlight:Hide()
    local function enter() row.highlight:Show() end
    local function update() row.highlight:SetShown(row:IsMouseOver()) end
    row:SetScript("OnEnter", enter)
    row:SetScript("OnLeave", update)
    row:SetScript("OnShow", update)
    row:SetScript("OnHide", function() row.highlight:Hide() end)
    for _, target in ipairs(control.icons or {control}) do
        target:HookScript("OnEnter", enter)
        target:HookScript("OnLeave", update)
    end
    control.hoverRow = row
end

local function checkbox(page, text, get, set)
    local y = nextRow(page)
    local check = CreateFrame("CheckButton", nil, page, "MinimalCheckboxTemplate")
    check:SetSize(30, 29)
    check.Text = rowLabel(page, text, y)
    check:SetHitRectInsets(LABEL_X - CONTROL_X, 0, -1.5, -1.5)
    check:SetScript("OnShow", function() check:SetChecked(get()) end)
    check:SetScript("OnClick", function()
        local checked = check:GetChecked() == true
        set(checked)
        PlaySound(checked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
    end)
    addRowHover(page, check, y)
    return check
end

local function dropdown(page, text, getText, generate)
    local y = nextRow(page)
    rowLabel(page, text, y)
    local button = Forever.createDropdown(page)
    button:SetSize(210, 26)
    for _, texture in ipairs({button:GetNormalTexture(), button:GetPushedTexture(), button:GetHighlightTexture()}) do
        texture:ClearAllPoints()
        texture:SetPoint("RIGHT", 1, -3)
    end
    local background = button:CreateTexture(nil, "BACKGROUND")
    background:SetAtlas("common-dropdown-textholder")
    background:SetPoint("TOPLEFT", -8, 7)
    background:SetPoint("BOTTOMRIGHT", 8, -9)
    local textRegion = button:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    textRegion:SetPoint("LEFT", 10, 0)
    textRegion:SetPoint("RIGHT", -28, 0)
    textRegion:SetJustifyH("LEFT")
    textRegion:SetWordWrap(false)
    local function update() textRegion:SetText(getText()) end
    button:SetupMenu(generate)
    button:HookScript("OnShow", update)
    button:GetMenu():HookScript("OnHide", update)
    update()
    addRowHover(page, button, y)
    return button
end

local function choices(page, text, options, get, set)
    return dropdown(page, text, function()
        for _, option in ipairs(options) do if option[2] == get() then return option[1] end end
        return options[1][1]
    end, function(_, menu)
        for _, option in ipairs(options) do
            menu:CreateRadio(option[1], function(value) return get() == value end, set, option[2])
        end
    end)
end

local function displayPage(page)
    heading(page, wt.L.LEDGER_CLASS_SPELLS)
    choices(page, wt.L.SETTINGS_DISPLAY,
        {{wt.L.DISPLAY_LEVELS, "levels"}, {wt.L.GROUP_LIST, "ledger"}},
        function() return WT_SpellDisplay end, wt.SetSpellDisplay)
    dropdown(page, wt.L.PRICE_MENU_DISCOUNT, function()
        if WT_PriceFaction == "none" then return wt.L.PRICE_NONE end
        if type(WT_PriceFaction) == "number" then
            for _, row in ipairs(wt.availablePriceRows()) do
                if row.key == WT_PriceFaction then return row.name end
            end
        end
        return wt.L.PRICE_AUTO
    end, wt.discountMenuGenerator)
    checkbox(page, wt.L.ENABLE_TRAIN_ALL, function() return WT_TrainAll == true end,
        function(enabled) WT_TrainAll = enabled end)
    heading(page, wt.L.WEAPON_SKILLS_HEADER)
    choices(page, wt.L.SETTINGS_DISPLAY,
        {{wt.L.GROUP_BY_ZONE, "zone"}, {wt.L.GROUP_BY_WEAPON_SKILL, "weaponskill"}, {wt.L.GROUP_LIST, "list"}},
        function() return WT_WeaponGrouping end, wt.SetWeaponGrouping)
    checkbox(page, wt.L.LEDGER_SHOW_KNOWN,
        function() return WT_ShowKnownWeaponSkills end, wt.SetShowKnownWeaponSkills)
    checkbox(page, wt.L.HIDE_WEAPON_SKILL_SWITCHER,
        function() return WT_HideWeaponSkillSwitcher end, wt.SetHideWeaponSkillSwitcher)
    heading(page, wt.L.SETTINGS_EXPANDED_SPELLBOOK)
    checkbox(page, wt.L.LEDGER_SIDE_BY_SIDE, function() return WT_SideBySide end, wt.SetSideBySide)
    checkbox(page, wt.L.SCROLL_TWO_PAGES, function() return WT_ScrollTwoPages ~= false end, wt.SetScrollTwoPages)
end

local function iconPicker(page, setting)
    local y = nextRow(page)
    rowLabel(page, wt.L.SETTINGS_ICON, y)
    local picker = wt.createIconPicker(page)
    picker:Setup(setting)
    picker:SetScript("OnShow", function() picker:Refresh() end)
    setting.onChanged(function() picker:Refresh() end)
    addRowHover(page, picker, y)
end

local function tabsPage(page)
    heading(page, wt.L.SETTINGS_SPELLBOOK)
    iconPicker(page, wt.SpellbookIcon)
    heading(page, wt.L.SETTINGS_PROFESSION)
    dropdown(page, wt.L.GAMEPAD_TAB_POSITION, function()
        if WT_ProfessionTabPosition == "top" then return wt.L.PROFESSION_TAB_TOP end
        if WT_ProfessionTabPosition == "bottom" then return wt.L.PROFESSION_TAB_BOTTOM end
        return wt.L.PROFESSION_TAB_RIGHT
    end, wt.GenerateProfessionTabPositionMenu)
    iconPicker(page, wt.ProfessionIcon)
    checkbox(page, wt.L.HIDE_PROFESSION_TAB, function() return WT_HideProfessionTab == true end,
        function(hidden) wt.MoveProfessionTab(hidden and "hide" or "show") end)
    heading(page, wt.L.SETTINGS_MINIMAP)
    checkbox(page, wt.L.HIDE_MINIMAP_ICON, function() return WT_Minimap and WT_Minimap.hide == true end,
        function(hidden) wt.SetMinimapHidden(hidden) end)
end

local function waypointsPage(page)
    heading(page, wt.L.SETTINGS_WAYPOINTS)
    dropdown(page, wt.L.SETTINGS_PROVIDER, function()
        local provider = wt.activeWaypointProvider()
        return provider and provider.name or wt.L.SETTINGS_NO_WAYPOINT_PROVIDER
    end, function(_, menu)
        for _, provider in ipairs(wt.waypointProviders()) do
            menu:CreateRadio(provider.name, function(id)
                local active = wt.activeWaypointProvider()
                return active and active.id == id
            end, wt.setWaypointProvider, provider.id)
        end
    end)
end

local function ignoredPage(page)
    heading(page, wt.L.IGNORED_HEADER)
    wt.CreateIgnoredList(page)
end

local function createSettings()
    local frame = CreateFrame("Frame", "WhatsTrainingSettings", UIParent, "SettingsFrameTemplate")
    wt.SettingsFrame = frame
    frame:Hide()
    frame:SetSize(880, 520)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetToplevel(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame.NineSlice.Text:SetText(wt.L.TITLE .. " " .. wt.L.GAMEPAD_OPTIONS)
    frame.NineSlice.Text:SetJustifyH("CENTER")
    frame.ClosePanelButton:SetScript("OnClick", function() frame:Hide() end)
    tinsert(UISpecialFrames, frame:GetName())

    local divider = frame:CreateTexture(nil, "ARTWORK")
    divider:SetColorTexture(0.5, 0.5, 0.5, 0.6)
    divider:SetWidth(1)
    divider:SetPoint("TOPLEFT", 218, -56)
    divider:SetPoint("BOTTOMLEFT", 218, 48)

    frame.pages, frame.tabs = {}, {}
    function frame:UpdateCategories()
        local hasProvider = #wt.waypointProviders() > 0
        local row = 0
        for _, tab in ipairs(self.tabs) do
            local shown = tab ~= self.waypointsTab or hasProvider
            tab:SetShown(shown)
            if shown then
                tab:SetPoint("TOPLEFT", 22, -58 - row * 30)
                row = row + 1
            end
        end
    end
    function frame:SelectPage(index)
        if not self.tabs[index]:IsShown() then index = 1 end
        self.selectedPage = index
        for i, page in ipairs(self.pages) do
            page:Hide()
            self.tabs[i].selected:SetShown(i == index)
        end
        self.pages[index]:Show()
    end
    for index, section in ipairs({
        {wt.L.SETTINGS_DISPLAY_PRICES, displayPage},
        {wt.L.SETTINGS_ICONS_TABS, tabsPage}, {wt.L.SETTINGS_WAYPOINTS, waypointsPage},
        {wt.L.IGNORED_HEADER, ignoredPage},
    }) do
        local page = CreateFrame("Frame", nil, frame)
        page:SetPoint("TOPLEFT", 242, -64)
        page:SetPoint("BOTTOMRIGHT", -24, 56)
        page:Hide()
        section[2](page)
        frame.pages[index] = page
        local tab = CreateFrame("Button", nil, frame)
        tab:SetSize(190, 30)
        tab:SetPoint("TOPLEFT", 22, -58 - (index - 1) * 30)
        tab.selected = tab:CreateTexture(nil, "BACKGROUND")
        tab.selected:SetAtlas("Options_List_Active")
        tab.selected:SetAllPoints()
        local highlight = tab:CreateTexture(nil, "HIGHLIGHT")
        highlight:SetAtlas("Options_List_Hover")
        highlight:SetAllPoints()
        label(tab, section[1], "GameFontHighlight", 10, -8)
        tab:SetScript("OnClick", function() frame:SelectPage(index) end)
        frame.tabs[index] = tab
        if section[2] == waypointsPage then frame.waypointsTab = tab end
    end
    local done = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    done:SetSize(96, 22)
    done:SetPoint("BOTTOMRIGHT", -16, 16)
    done:SetText(DONE)
    done:SetScript("OnClick", function() frame:Hide() end)
    frame:SetScript("OnHide", frame.StopMovingOrSizing)
    return frame
end

function wt.OpenSettings(page)
    local frame = wt.SettingsFrame or createSettings()
    -- the controller spellbook lives in TOOLTIP strata
    frame:SetFrameStrata(wt.ControllerFrame and wt.ControllerFrame:IsShown() and "TOOLTIP" or "DIALOG")
    frame:SetFrameLevel(600)
    frame:UpdateCategories()
    frame:SelectPage(page or frame.selectedPage or 1)
    frame:Show()
    frame:Raise()
end
