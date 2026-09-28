local _, wt = ...
local Forever = wt.Forever
local label, hideTooltip, createPage = Forever.label, Forever.hideTooltip, Forever.createPage
local views, updatePage, endsSplit = Forever.views, Forever.updatePage, Forever.endsSplit
local createCategoryBanner, updateBanner = Forever.createCategoryBanner, Forever.updateBanner

-- All of this to avoid writing to anything Blizzard owns.

local skin = {
    icon = "Interface\\Icons\\INV_Misc_QuestionMark",
    tab = "spellbook-Tab-Frame-C60",
    tabActive = "spellbook-Tab-Frame-Glow-C60",
    tabGlow = "spellbook-Tab-Frame-glow-gradient-C60",
    pageLeft = "spellbook-Page-Left-C60",
    pageRight = "spellbook-Page-Right-C60",
}
-- the tab row, search box and settings dropdown sit in the book's top 60px
local HEADER_HEIGHT = 60
-- Camelot's Blizzard_SpellBookTemplates.xml: the native views are 680 wide, 95 below the book's top, at
-- 85 from its left and 50 from its right. Each ledger page is a 696-wide column around one of them.
local PAGE_WIDTH, PAGE_TOP, PAGE_BOTTOM = 696, -90, 15

local book, root, launcher, attic, returnTab, active, shownTab, queued
local covers = {}

local function makeTab(name, parent)
    local button = CreateFrame("Button", name, parent)
    button:SetSize(44, 32)
    -- shrink to simulate native template mask
    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetSize(34, 33)
    button.icon:SetPoint("BOTTOM", -1, 0)
    button.icon:SetTexture(skin.icon)
    local function frameArt(atlas, y)
        local texture = button:CreateTexture(nil, "ARTWORK", nil, 1)
        texture:SetAtlas(atlas, true)
        texture:SetPoint("BOTTOM", 0, y)
        return texture
    end
    button.normal = frameArt(skin.tab, 1)
    button.active = frameArt(skin.tabActive, 1)
    button.glow = frameArt(skin.tabGlow, 0)
    return button
end

local function selectTab(button, selected)
    button.normal:SetShown(not selected)
    button.active:SetShown(selected)
    button.glow:SetShown(selected)
end

local function refresh(mainFrame)
    updateBanner(mainFrame)
    local expanded, weaponPage = mainFrame.expanded, mainFrame.weaponPage
    local dual = expanded and not mainFrame.sideBySide
    mainFrame.title:SetText(expanded and wt.L.LEDGER_CLASS_SPELLS or "What's Training?")
    weaponPage.title:SetText(dual and wt.L.LEDGER_MORE_SPELLS or wt.L.WEAPON_SKILLS_HEADER)
    mainFrame.titleBackplate:SetWidth(math.min(mainFrame.header:GetWidth() + 85,
        math.max(416, mainFrame.title:GetStringWidth() * 2.5)))
    weaponPage.titleBackplate:SetWidth(math.min(weaponPage.header:GetWidth() + 85,
        math.max(416, weaponPage.title:GetStringWidth() * 2.5)))
    weaponPage:SetShown(expanded)
    weaponPage.footer:SetShown(not dual)
    mainFrame.pagingControls:SetShown(dual)
    mainFrame.continues:SetShown(false)
    weaponPage.continues:SetShown(false)
    local spells, weapons = views[WT_SpellDisplay], views[WT_WeaponGrouping]
    local leftView = not expanded and wt.showingWeaponSkills and weapons or spells
    mainFrame.total:GetParent():SetShown(leftView == spells)
    local rows, base = wt.availablePriceRows()
    local price = wt.priceIn(wt.priceKey(rows), rows, base)
    mainFrame.total:SetText(string.format(wt.L.LEDGER_AVAILABLE_TOTAL, C_CurrencyInfo.GetCoinTextureString(price)))
    if not dual then
        updatePage(mainFrame, leftView, leftView.Items())
        if expanded then updatePage(weaponPage, weapons, weapons.Items()) end
        return
    end
    local halves = spells.Paginate(mainFrame:GetHeight() + spells.top - (spells.reserve or 0) - 30)
    local controls = mainFrame.pagingControls
    controls:SetMaxPages(math.ceil(#halves / 2))
    local page = controls:GetCurrentPage()
    local left, right = halves[page * 2 - 1] or {}, halves[page * 2] or {}
    updatePage(mainFrame, spells, left, true)
    updatePage(weaponPage, spells, right, true)
    weaponPage.empty:Hide()
    mainFrame.continues:SetShown(endsSplit(left))
    weaponPage.continues:SetShown(endsSplit(right))
end

local function wheel(_, delta)
    local mainFrame = wt.MainFrame
    if mainFrame.expanded and not mainFrame.sideBySide then
        return mainFrame.pagingControls:OnMouseWheel(delta)
    end
    local x = GetCursorPosition() / root:GetEffectiveScale()
    local page = mainFrame.expanded and x > root:GetCenter() and mainFrame.weaponPage or mainFrame
    local scroll = page.scrollFrame
    local handler = scroll:GetScript("OnMouseWheel")
    if handler then handler(scroll, delta) end
end

--  mouse-eating rect
local function cover()
    local frame = CreateFrame("Frame", nil, root)
    frame:SetClipsChildren(true)
    frame:EnableMouse(true)
    frame:EnableMouseWheel(true)
    frame:SetScript("OnMouseWheel", wheel)
    frame.backing = frame:CreateTexture(nil, "BACKGROUND")
    frame.backing:SetAllPoints()
    frame.art = CreateFrame("Frame", nil, frame)
    frame.art:SetAllPoints(root)
    local function page(atlas, from, to)
        local texture = frame.art:CreateTexture(nil, "BACKGROUND")
        texture:SetAtlas(atlas)
        texture:SetPoint("TOPLEFT", root, from)
        texture:SetPoint("BOTTOMRIGHT", root, to)
        return texture
    end
    frame.whole = page(skin.pageRight, "TOPLEFT", "BOTTOMRIGHT")
    frame.left = page(skin.pageLeft, "TOPLEFT", "BOTTOM")
    frame.right = page(skin.pageRight, "TOP", "BOTTOMRIGHT")
    covers[#covers + 1] = frame
    return frame
end

function wt.ApplyTheme()
    for _, frame in ipairs(covers) do
        frame.backing:SetColorTexture(unpack(wt.Theme.backing))
        frame.art:SetShown(wt.Theme.pageArt == true)
    end
end

local function sync()
    local tabs = book.CategoryTabSystem
    local gamepad = InputUtil.IsGamepadUIEnabled()
    -- compare IDs instead of trusting hooks
    if gamepad or tabs.selectedTabID ~= shownTab or book.SearchBox:HasFocus()
        or book.SearchPreviewContainer:IsShown() then
        active = false
    end
    if gamepad or not book:IsVisible() then
        root:Hide()
        launcher:Hide()
        return
    end

    local scale = book:GetEffectiveScale() / PlayerSpellsFrame:GetEffectiveScale()
    local strata, level = PlayerSpellsFrame:GetFrameStrata(), PlayerSpellsFrame.NineSlice:GetFrameLevel() - 10
    for _, frame in ipairs({root, launcher}) do
        frame:SetScale(scale)
        frame:SetFrameStrata(strata)
        frame:SetFrameLevel(level)
    end
    launcher:SetFrameLevel(level + 5)
    returnTab:SetFrameLevel(level + 5)
    local mainFrame = wt.MainFrame
    mainFrame:SetFrameLevel(level + 2)

    -- the launcher needs 8 + 44px before the native search box
    local searchLeft, tabsRight = book.SearchBox:GetLeft(), tabs:GetRight()
    local bookmark = searchLeft and tabsRight and searchLeft - tabsRight < 52 or false
    if launcher.bookmark ~= bookmark then
        launcher.bookmark = bookmark
        launcher:ClearAllPoints()
        if bookmark then
            launcher:SetPoint("BOTTOMLEFT", book, "TOPRIGHT", 0, tabs:GetBottom() - book:GetTop())
        else
            launcher:SetPoint("LEFT", tabs, "RIGHT", 8, 0)
        end
        attic:SetPoint("LEFT", bookmark and tabs or launcher, "RIGHT")
    end

    selectTab(launcher, active)
    launcher:Show()
    if not active then return root:Hide() end

    local expanded = not book.isMinimized
    local relayout = mainFrame.expanded ~= expanded
    if relayout then
        if expanded then mainFrame.sideBySide = wt.showingWeaponSkills or WT_SideBySide end
        mainFrame.expanded = expanded
        mainFrame.scrollFrame:SetVerticalScroll(0)
        mainFrame.weaponPage.scrollFrame:SetVerticalScroll(0)
    end
    local opening = not root:IsShown() or not mainFrame:IsShown()

    for _, frame in ipairs(covers) do
        frame.whole:SetShown(book.isMinimized)
        frame.left:SetShown(not book.isMinimized)
        frame.right:SetShown(not book.isMinimized)
    end
    -- pool rebuilds can replace the selected button, so read it fresh
    local native = tabs.selectedTabID and tabs:GetTabButton(tabs.selectedTabID)
    returnTab:SetShown(native ~= nil)
    if native then
        returnTab:ClearAllPoints()
        returnTab:SetPoint("CENTER", native)
        returnTab.icon:SetTexture(native.Icon:GetTexture())
    end
    mainFrame:Show()
    root:Show()
    -- ResizeSearchBox's rule, measured from whatever sits left of the search box
    local search = mainFrame.searchBox
    local left, right = (launcher.bookmark and tabs or launcher):GetRight(), search:GetRight()
    if left and right then search:SetWidth(math.max(1, math.min(300, right - left - 10))) end
    if relayout or opening then wt.RefreshUI() end
end

-- defer to make UpdateSize order not matter
local function deferredSync()
    queued = false
    sync()
end

local function request()
    if queued then return end
    queued = true
    RunNextFrame(deferredSync)
end

-- built once the theme resolves
local function createLedger(mainFrame)
    createPage(mainFrame, 20)
    mainFrame.total = label(mainFrame, "", "SystemFont_Med3", 0, 0)
    local totalHover = CreateFrame("Frame", nil, mainFrame)
    mainFrame.total:SetParent(totalHover)
    totalHover:SetAllPoints(mainFrame.total)
    totalHover:SetHitRectInsets(0, -12, 0, 0)
    totalHover:EnableMouse(true)
    local function showBreakdown()
        local spells, header = wt.availableSpells()
        if not header then return end
        GameTooltip:SetOwner(totalHover, "ANCHOR_RIGHT")
        wt.addPricingBlock(GameTooltip, header, spells)
        GameTooltip:Show()
    end
    totalHover:SetScript("OnEnter", showBreakdown)
    totalHover:SetScript("OnLeave", hideTooltip)
    totalHover:SetScript("OnHide", hideTooltip)
    totalHover:SetScript("OnMouseUp", function(_, button)
        if button == "RightButton" then MenuUtil.CreateContextMenu(totalHover, wt.priceMenuGenerator) end
    end)
    local arrow = CreateFrame("DropdownButton", nil, totalHover)
    mainFrame.priceDropdown = arrow
    arrow:SetSize(16, 16)
    arrow:SetNormalTexture("Interface\\Buttons\\Arrow-Down-Up")
    arrow:SetPushedTexture("Interface\\Buttons\\Arrow-Down-Down")
    arrow:SetHighlightTexture("Interface\\Buttons\\Arrow-Down-Up", "ADD")
    arrow:GetHighlightTexture():SetAlpha(0.4)
    -- the glyph fills only the top half of the 16px texture, so the text centres 4px above the button centre
    arrow:SetPoint("TOPRIGHT", mainFrame.header.Border, "TOPRIGHT", 0, 15)
    mainFrame.total:ClearAllPoints()
    mainFrame.total:SetPoint("RIGHT", arrow, "LEFT", -2, 4)
    arrow:SetMenuAnchor(AnchorUtil.CreateAnchor("TOPRIGHT", arrow, "BOTTOMRIGHT", 0, -2))
    arrow:SetupMenu(wt.priceMenuGenerator)
    arrow:HookScript("OnEnter", showBreakdown)
    arrow:HookScript("OnLeave", function() hideTooltip(totalHover) end)
    -- rep standings and PvP rank change the discounted total
    totalHover:RegisterEvent("UPDATE_FACTION")
    totalHover:RegisterEvent("PLAYER_PVP_RANK_CHANGED")
    totalHover:SetScript("OnEvent", wt.RefreshUI)
    mainFrame.Refresh = refresh

    local weaponPage = CreateFrame("Frame", "$parentWeaponPage", mainFrame)
    mainFrame.weaponPage = weaponPage
    weaponPage:SetPoint("TOPRIGHT", root, "TOPRIGHT", -45, PAGE_TOP)
    weaponPage:SetPoint("BOTTOMRIGHT", root, "BOTTOMRIGHT", -45, PAGE_BOTTOM)
    weaponPage:SetWidth(PAGE_WIDTH)
    createPage(weaponPage, 11)
    weaponPage.footer:SetWidth(weaponPage:GetWidth() - 28)
    weaponPage:Hide()
    mainFrame.continues:SetText(wt.L.CONTINUES_RIGHT)
    weaponPage.continues:SetText(wt.L.CONTINUES_NEXT)
    mainFrame.sideBySide = WT_SideBySide

    local controls = CreateFrame("Frame", nil, weaponPage, "PagingControlsHorizontalTemplate")
    mainFrame.pagingControls = controls
    controls:ClearAllPoints()
    controls:SetPoint("BOTTOMRIGHT", root, "BOTTOMRIGHT", -75, 40)
    controls.PageText:SetFontObject("SystemFont_Med3")
    controls.PageText:SetTextColor(unpack(wt.Theme.body))
    controls.spacing = 8
    weaponPage.continues:ClearAllPoints()
    weaponPage.continues:SetPoint("RIGHT", controls, "LEFT", -12, 0)
    controls.prevPageSound, controls.nextPageSound = SOUNDKIT.IG_ABILITY_PAGE_TURN, SOUNDKIT.IG_ABILITY_PAGE_TURN
    function weaponPage:OnPageChanged() mainFrame:Refresh() end

    local function selectView(weapons)
        if mainFrame.expanded then
            if mainFrame.sideBySide ~= weapons then
                mainFrame.sideBySide = weapons
                mainFrame:Refresh()
            end
        elseif wt.showingWeaponSkills ~= weapons then
            mainFrame.scrollFrame:SetVerticalScroll(0)
            wt:ToggleWeaponSkills()
        end
    end
    mainFrame.categoryBanner = createCategoryBanner(mainFrame, selectView)

    local dropdown = CreateFrame("DropdownButton", nil, mainFrame, "SpellBookSettingsDropdownTemplate")
    mainFrame.displayDropdown = dropdown
    dropdown:ClearAllPoints()
    dropdown:SetPoint("TOPRIGHT", root, "TOPRIGHT", -30, -27)
    local function rescroll()
        (mainFrame.expanded and weaponPage or mainFrame).scrollFrame:SetVerticalScroll(0)
    end
    local function isStyle(style) return WT_SpellDisplay == style end
    local function setStyle(style)
        WT_SpellDisplay = style
        mainFrame.scrollFrame:SetVerticalScroll(0)
        wt.RefreshUI()
    end
    local function isGrouping(mode) return WT_WeaponGrouping == mode end
    local function setGrouping(mode)
        WT_WeaponGrouping = mode
        rescroll()
        wt:ApplyFilter()
    end
    local function showsKnown() return WT_ShowKnownWeaponSkills end
    local function toggleKnown()
        WT_ShowKnownWeaponSkills = not WT_ShowKnownWeaponSkills
        rescroll()
        wt:ApplyFilter()
    end
    local function isSideBySide() return WT_SideBySide end
    local function toggleSideBySide()
        WT_SideBySide = not WT_SideBySide
        mainFrame.sideBySide = WT_SideBySide
        mainFrame:Refresh()
    end
    dropdown:SetupMenu(function(_, rootDescription)
        rootDescription:CreateTitle(wt.L.LEDGER_OPT_CLASS_HEADER)
        rootDescription:CreateRadio(wt.L.DISPLAY_LEVELS, isStyle, setStyle, "levels")
        rootDescription:CreateRadio(wt.L.GROUP_LIST, isStyle, setStyle, "ledger")
        rootDescription:CreateCheckbox(wt.L.LEDGER_SIDE_BY_SIDE, isSideBySide, toggleSideBySide)
        rootDescription:CreateDivider()
        rootDescription:CreateTitle(wt.L.GROUPING_OPTIONS_TITLE)
        rootDescription:CreateRadio(wt.L.GROUP_BY_ZONE, isGrouping, setGrouping, "zone")
        rootDescription:CreateRadio(wt.L.GROUP_BY_WEAPON_SKILL, isGrouping, setGrouping, "weaponskill")
        rootDescription:CreateRadio(wt.L.GROUP_LIST, isGrouping, setGrouping, "list")
        rootDescription:CreateCheckbox(wt.L.LEDGER_SHOW_KNOWN, showsKnown, toggleKnown)
    end)

    -- sync sets search box width
    local search = CreateFrame("EditBox", "$parentSearchBox", mainFrame, "SearchBoxTemplate")
    mainFrame.searchBox = search
    search:SetSize(300, 30)
    search:SetPoint("RIGHT", dropdown, "LEFT", -5, 4)
    search:SetText(wt.filter)
    search:HookScript("OnHide", function(self) self:ClearFocus() end)
    search:HookScript("OnTextChanged", function(self)
        local filter = strlower(self:GetText())
        mainFrame.scrollFrame:SetVerticalScroll(0)
        weaponPage.scrollFrame:SetVerticalScroll(0)
        controls:SetCurrentPage(1)
        if filter == wt.filter then return end
        wt.filter = filter
        wt:ApplyFilter()
    end)
end

local function attachForeverSpellBook()
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", function()
        book = PlayerSpellsFrame.SpellBookFrame
        root:SetParent(PlayerSpellsFrame)
        launcher:SetParent(PlayerSpellsFrame)
        root:SetAllPoints(book)
        wt.Theme = wt.ResolveTheme()
        wt.ApplyTheme()
        createLedger(wt.MainFrame)
        -- hooksecurefunc misbehaves while taintLog > 0 in the current client build
        -- Tab clicks, SelectNextTab and UpdateAllSpellData all end in OnPagedSpellsUpdate, which fires DisplayedSpellsChanged
        -- SetMinimized resizes the book.
        for _, event in ipairs({"SpellBookFrame.Show", "SpellBookFrame.Hide", "SpellBookFrame.DisplayedSpellsChanged"}) do
            EventRegistry:RegisterCallback("PlayerSpellsFrame." .. event, request, root)
        end
        EventRegistry:RegisterCallback("SpellSearchBox.FocusedGained", request, root)
        EventRegistry:RegisterCallback("SpellSearchPreview.FocusedGained", request, root)
        book:HookScript("OnSizeChanged", request)
        -- minimize hides and re-shows the panel in one stack
        book:HookScript("OnShow", function()
            sync()
            request()
        end)
        book:HookScript("OnHide", sync)
        launcher:RegisterEvent("UI_SCALE_CHANGED")
        launcher:RegisterEvent("DISPLAY_SIZE_CHANGED")
        launcher:SetScript("OnEvent", request)
    end)
end

function wt.CreateFrame()
    if wt.MainFrame then return end
    root = CreateFrame("Frame", "WhatsTrainingOverlay", UIParent)
    root:Hide()
    local content = cover()
    content:SetPoint("TOPLEFT", root, "TOPLEFT", 0, -HEADER_HEIGHT)
    content:SetPoint("BOTTOMRIGHT", root, "BOTTOMRIGHT")

    launcher = makeTab("WhatsTrainingLauncher", UIParent)
    launcher:Hide()
    launcher:SetScript("OnClick", function()
        active = not active
        if active then
            shownTab = book.CategoryTabSystem.selectedTabID
            PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN)
        end
        sync()
    end)
    launcher:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(wt.L.TAB_TEXT)
        GameTooltip:Show()
    end)
    launcher:SetScript("OnLeave", hideTooltip)
    launcher:SetScript("OnHide", hideTooltip)

    -- covers the search box, settings dropdown and gamepad glyphs, left anchorned by sync
    attic = cover()
    attic:SetPoint("TOP", root, "TOP")
    attic:SetPoint("BOTTOM", content, "TOP")
    attic:SetPoint("RIGHT", root, "RIGHT")

    -- sits over the native selected tab, which still glows underneath, on a parchment slice
    returnTab = makeTab(nil, root)
    root.returnTab = returnTab
    selectTab(returnTab, false)
    cover():SetAllPoints(returnTab)
    returnTab:SetScript("OnClick", function()
        active = false
        sync()
    end)

    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", root)
    wt.MainFrame = mainFrame
    mainFrame:Hide()
    mainFrame:SetPoint("TOPLEFT", root, "TOPLEFT", 65, PAGE_TOP)
    mainFrame:SetPoint("BOTTOMLEFT", root, "BOTTOMLEFT", 65, PAGE_BOTTOM)
    mainFrame:SetWidth(PAGE_WIDTH)

    attachForeverSpellBook()
end
