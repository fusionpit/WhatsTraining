local _, wt = ...
local Forever = wt.Forever
local tooltip = Forever.tooltip
local label, hideTooltip, createPage = Forever.label, Forever.hideTooltip, Forever.createPage
local views, updatePage, endsSplit = Forever.views, Forever.updatePage, Forever.endsSplit
local createCategoryBanner, updateBanner = Forever.createCategoryBanner, Forever.updateBanner

local skin = {
    icon = "Interface\\Icons\\INV_Misc_QuestionMark",
    tab = "spellbook-Tab-Frame-C60",
    tabActive = "spellbook-Tab-Frame-Glow-C60",
    tabGlow = "spellbook-Tab-Frame-glow-gradient-C60",
    pageLeft = "spellbook-Page-Left-C60",
    pageRight = "spellbook-Page-Right-C60",
}
local HEADER_HEIGHT = 60
-- 696px columns surround Camelot's native 680px views.
local PAGE_WIDTH, PAGE_TOP, PAGE_BOTTOM = 696, -90, 15

local book, root, launcher, attic, content, returnTab, previewTab, active, shownTab, queued
local covers = {}

local function makeTab(name, parent)
    local button = CreateFrame("Button", name, parent)
    button:SetSize(44, 32)
    -- shrink the icon to mimic the native mask
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
    local halves = spells.Paginate(mainFrame:GetHeight() + spells.top - (spells.reserve or 0)
        - (wt.ControllerFrame and 45 or 30))
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
    frame:SetFrameLevel(root:GetFrameLevel())
    frame:SetClipsChildren(true)
    frame:EnableMouse(true)
    frame:EnableMouseWheel(true)
    frame:SetScript("OnMouseWheel", wheel)
    frame.backing = frame:CreateTexture(nil, "BACKGROUND")
    frame.backing:SetAllPoints()
    frame.art = CreateFrame("Frame", nil, frame)
    frame.art:SetAllPoints(frame)
    frame.art:SetClipsChildren(true)
    frame.art:SetFrameLevel(frame:GetFrameLevel() + 1)
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
        frame.backing:SetColorTexture(wt.Theme.backing[1], wt.Theme.backing[2], wt.Theme.backing[3], 1)
        frame.art:SetShown(wt.Theme.pageArt == true)
    end
end

local function sync()
    local tabs = book.CategoryTabSystem
    local gamepad = InputUtil.IsGamepadUIEnabled()
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
    -- pool rebuilds can replace the selected button
    local native = tabs.selectedTabID and tabs:GetTabButton(tabs.selectedTabID)
    returnTab:SetShown(native ~= nil)
    if native then
        returnTab:ClearAllPoints()
        returnTab:SetPoint("CENTER", native)
        returnTab.icon:SetTexture(native.Icon:GetTexture())
    end
    mainFrame:Show()
    root:Show()
    -- ,atch the native ResizeSearchBox rule
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

local function createLedger(mainFrame)
    createPage(mainFrame, 20)
    mainFrame.total = label(mainFrame, "", "SystemFont_Med3", 0, 0)
    local totalHover = CreateFrame("Button", nil, mainFrame)
    local highlight = totalHover:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetColorTexture(wt.Theme.highlight[1], wt.Theme.highlight[2], wt.Theme.highlight[3], 0.25)
    totalHover:SetHighlightTexture(highlight, "BLEND")
    mainFrame.total:SetParent(totalHover)
    totalHover:SetAllPoints(mainFrame.total)
    totalHover:SetHitRectInsets(0, -12, 0, 0)
    totalHover:EnableMouse(true)
    local function showBreakdown()
        local spells, header = wt.availableSpells()
        if not header then return end
        tooltip:SetOwner(totalHover, "ANCHOR_RIGHT")
        wt.addPricingBlock(tooltip, header, spells)
        tooltip:Show()
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
    -- the 16px glyph occupies its top half
    arrow:SetPoint("TOPRIGHT", mainFrame.header.Border, "TOPRIGHT", 0, 15)
    mainFrame.total:ClearAllPoints()
    mainFrame.total:SetPoint("RIGHT", arrow, "LEFT", -2, 4)
    arrow:SetMenuAnchor(AnchorUtil.CreateAnchor("TOPRIGHT", arrow, "BOTTOMRIGHT", 0, -2))
    arrow:SetupMenu(wt.priceMenuGenerator)
    arrow:HookScript("OnEnter", showBreakdown)
    arrow:HookScript("OnLeave", function() hideTooltip(totalHover) end)
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
    local function hidesWeaponSwitcher() return WT_HideWeaponSkillSwitcher end
    local function toggleWeaponSwitcher()
        WT_HideWeaponSkillSwitcher = not WT_HideWeaponSkillSwitcher
        wt.RefreshUI()
    end
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
    local function generateSettings(_, rootDescription)
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
        rootDescription:CreateCheckbox(wt.L.HIDE_WEAPON_SKILL_SWITCHER, hidesWeaponSwitcher, toggleWeaponSwitcher)
    end
    mainFrame.generateSettings = generateSettings
    dropdown:SetupMenu(generateSettings)

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
    if InputUtil.IsGamepadUIEnabled() then return end
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", function()
        if InputUtil.IsGamepadUIEnabled() then return end
        book = PlayerSpellsFrame.SpellBookFrame
        root:SetParent(PlayerSpellsFrame)
        launcher:SetParent(PlayerSpellsFrame)
        root:SetAllPoints(book)
        wt.Theme = wt.ResolveTheme()
        wt.ApplyTheme()
        createLedger(wt.MainFrame)
        -- use events: hooksecurefunc misbehaves with taintLog enabled
        for _, event in ipairs({"SpellBookFrame.Show", "SpellBookFrame.Hide", "SpellBookFrame.DisplayedSpellsChanged"}) do
            EventRegistry:RegisterCallback("PlayerSpellsFrame." .. event, request, root)
        end
        EventRegistry:RegisterCallback("SpellSearchBox.FocusedGained", request, root)
        EventRegistry:RegisterCallback("SpellSearchPreview.FocusedGained", request, root)
        book:HookScript("OnSizeChanged", request)
        -- minimize hides and re-shows the panel synchronously
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

local borderPieces = { "TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner",
    "TopEdge", "BottomEdge", "LeftEdge", "RightEdge" }

local function copyControllerBorder(left, bottom)
    local border = PlayerSpellsFrame.NineSlice
    if not border then return end
    for _, frame in ipairs(covers) do
        if not frame.trim then
            frame.trim = CreateFrame("Frame", nil, frame)
            frame.trim:SetAllPoints(frame)
            frame.trim:SetFrameLevel(frame.art:GetFrameLevel())
            frame.trim.pieces = {}
            for _, name in ipairs(borderPieces) do
                frame.trim.pieces[name] = frame.trim:CreateTexture(nil, "OVERLAY")
            end
        end
        -- Border padding must not shrink opaque masks
        for _, name in ipairs(borderPieces) do
            local native, texture = border[name], frame.trim.pieces[name]
            local x, y, width, height
            if native and native:IsShown() then x, y, width, height = native:GetRect() end
            texture:SetShown(x ~= nil and y ~= nil and width ~= nil and height ~= nil)
            if x and y and width and height then
                local atlas = native:GetAtlas()
                if atlas then texture:SetAtlas(atlas) else texture:SetTexture(native:GetTexture()) end
                texture:SetTexCoord(native:GetTexCoord())
                texture:SetHorizTile(native:GetHorizTile())
                texture:SetVertTile(native:GetVertTile())
                texture:SetVertexColor(native:GetVertexColor())
                texture:SetAlpha(native:GetAlpha())
                texture:SetTexelSnappingBias(0)
                texture:SetSnapToPixelGrid(false)
                texture:ClearAllPoints()
                texture:SetPoint("BOTTOMLEFT", root, "BOTTOMLEFT", x - left, y - bottom)
                texture:SetSize(width, height)
            end
        end
    end
end

local function controllerTabPosition(nativeBook)
    local tabs = nativeBook.CategoryTabSystem
    local right = tabs and tabs:GetRight()
    local _, y
    if tabs then _, y = tabs:GetCenter() end
    if not right or not y then return end
    local hint = nativeBook.NextCategoryIcon
    local hintRight = hint and hint:IsShown() and hint:GetRight()
    if hintRight then right = math.max(right, hintRight) end
    local searchLeft = nativeBook.SearchBox:GetLeft()
    -- use an outside bookmark when the toolbar is full
    if searchLeft and right + 52 > searchLeft - 38 then
        right = nativeBook:GetLeft()
        if not right then return end
        right = right + nativeBook:GetWidth()
    end
    return right + 8, y
end

local function updateControllerPreview(nativeBook, canEnter)
    if root:IsShown() or not nativeBook then return previewTab:Hide() end
    local x, y = controllerTabPosition(nativeBook)
    if not x or not y then return previewTab:Hide() end
    previewTab:SetScale(nativeBook:GetEffectiveScale() / UIParent:GetEffectiveScale())
    previewTab:ClearAllPoints()
    previewTab:SetPoint("LEFT", UIParent, "BOTTOMLEFT", x, y)
    previewTab.rbIcon:SetShown(canEnter == true)
    previewTab:Show()
end

local function placeControllerBook(nativeBook)
    local left, bottom = nativeBook:GetLeft(), nativeBook:GetBottom()
    local width, height = nativeBook:GetWidth(), nativeBook:GetHeight()
    if not left or not bottom or width <= 360 or height <= 140 then return false end
    local launcherX, launcherY = controllerTabPosition(nativeBook)
    if not launcherX or not launcherY then return false end
    root:ClearAllPoints()
    root:SetScale(nativeBook:GetEffectiveScale() / UIParent:GetEffectiveScale())
    root:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left, bottom)
    root:SetSize(width, height)
    local tabs = nativeBook.CategoryTabSystem
    local nativeTab = tabs and tabs.selectedTabID and tabs:GetTabButton(tabs.selectedTabID)
    local tabX, tabY
    if nativeTab then tabX, tabY = nativeTab:GetCenter() end
    returnTab:ClearAllPoints()
    if tabX and tabY then
        returnTab:SetPoint("CENTER", root, "BOTTOMLEFT", tabX - left, tabY - bottom)
        returnTab.icon:SetTexture(nativeTab.Icon:GetTexture())
    else
        returnTab:SetPoint("TOPLEFT", root, "TOPLEFT", 70, -26)
        returnTab.icon:SetTexture(skin.icon)
    end
    launcher:ClearAllPoints()
    launcher:SetPoint("LEFT", root, "BOTTOMLEFT", launcherX - left, launcherY - bottom)
    local hint, rbIcon = nativeBook.NextCategoryIcon, root.controllerRBIcon
    local hintX, hintY, hintWidth, hintHeight
    if hint and hint:IsShown() then hintX, hintY, hintWidth, hintHeight = hint:GetRect() end
    rbIcon:SetShown(hintX ~= nil and hintY ~= nil and hintWidth ~= nil and hintHeight ~= nil)
    if hintX and hintY and hintWidth and hintHeight then
        rbIcon:ClearAllPoints()
        rbIcon:SetPoint("BOTTOMLEFT", root, "BOTTOMLEFT", hintX - left, hintY - bottom)
        rbIcon:SetSize(hintWidth, hintHeight)
    end
    attic:SetPoint("LEFT", root, "BOTTOMLEFT", tabs:GetRight() - left + 3, 0)
    local title = PlayerSpellsFrame.TitleContainer
    local titleBottom = title and title:GetBottom()
    local top = titleBottom and math.min(-8, titleBottom - bottom - height - 1) or -8
    attic:SetPoint("TOP", root, "TOP", 0, top)
    local mainFrame = wt.MainFrame
    local searchRight, launcherRight = mainFrame.searchBox:GetRight(), launcher:GetRight()
    if searchRight and launcherRight then
        if launcher:GetLeft() >= root:GetRight() then
            -- outside bookmarks need no toolbar
            launcherRight = math.max(returnTab:GetRight(), rbIcon:IsShown() and rbIcon:GetRight() or tabs:GetRight())
        end
        mainFrame.searchBox:SetWidth(math.max(1, math.min(300, searchRight - launcherRight - 39)))
    end
    local expanded = not nativeBook.isMinimized
    local relayout = mainFrame.expanded ~= expanded or mainFrame.controllerHeight ~= height
    if mainFrame.expanded ~= expanded then mainFrame.sideBySide = wt.showingWeaponSkills or WT_SideBySide end
    mainFrame.expanded, mainFrame.controllerHeight = expanded, height
    for _, frame in ipairs(covers) do
        frame.whole:SetShown(not expanded)
        frame.left:SetShown(expanded)
        frame.right:SetShown(expanded)
    end
    copyControllerBorder(left, bottom)
    if relayout and root:IsShown() then mainFrame:Refresh() end
    return true
end

function wt.CreateFrame()
    if wt.MainFrame then return end
    local controller = InputUtil.IsGamepadUIEnabled()
    root = CreateFrame("Frame", "WhatsTrainingOverlay", UIParent)
    root:Hide()
    content = cover()
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
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
        tooltip:SetText(wt.L.TAB_TEXT)
        tooltip:Show()
    end)
    launcher:SetScript("OnLeave", hideTooltip)
    launcher:SetScript("OnHide", hideTooltip)

    -- cover the toolbar, having sync set the left edge
    attic = cover()
    attic:SetPoint("TOP", root, "TOP")
    attic:SetPoint("BOTTOM", content, "TOP")
    attic:SetPoint("RIGHT", root, "RIGHT")

    -- cover the native selected tab's glow
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

    if controller then
        wt.Theme = wt.ResolveTheme()
        wt.ApplyTheme()
        root:SetFrameStrata("TOOLTIP")
        root:SetFrameLevel(500)
        mainFrame:SetFrameLevel(502)
        EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", function()
            createLedger(mainFrame)
            launcher:SetParent(root)
            launcher:SetFrameLevel(505)
            selectTab(launcher, true)
            launcher:Show()
            returnTab:SetFrameLevel(505)
            launcher:SetScript("OnClick", function() root:Hide() end)
            returnTab:SetScript("OnClick", function() root:Hide() end)
            local rbIcon = CreateFrame("Frame", nil, root, "InputIconTextureFrameTemplate")
            root.controllerRBIcon = rbIcon
            rbIcon.useDropShadow = true
            rbIcon:SetInputKey(GAMEPAD_SHOULDER_RIGHT)
            rbIcon:SetPressable()
            rbIcon:EnableMouse(false)
            rbIcon:SetFrameLevel(505)
            previewTab = makeTab("WhatsTrainingControllerPreview", UIParent)
            root.previewTab = previewTab
            previewTab:Hide()
            previewTab:EnableMouse(true)
            previewTab:SetFrameStrata("HIGH")
            previewTab:SetFrameLevel(505)
            selectTab(previewTab, false)
            local cornerRB = CreateFrame("Frame", nil, previewTab, "InputIconTextureFrameTemplate")
            previewTab.rbIcon = cornerRB
            cornerRB.useDropShadow = true
            cornerRB:SetInputKey(GAMEPAD_SHOULDER_RIGHT)
            cornerRB:SetPressable()
            cornerRB:SetSize(22, 22)
            cornerRB:SetPoint("TOPRIGHT", previewTab.icon, "TOPRIGHT", 7, 7)
            cornerRB:EnableMouse(false)
            cornerRB:Hide()
            mainFrame:Show()
            wt.EnableControllerBook(root, mainFrame, placeControllerBook, updateControllerPreview)
        end)
    else
        attachForeverSpellBook()
    end
end
