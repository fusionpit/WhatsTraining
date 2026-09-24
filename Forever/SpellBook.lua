local _, wt = ...
local Forever = wt.Forever
local label, hideTooltip, createPage = Forever.label, Forever.hideTooltip, Forever.createPage
local views, updatePage, endsSplit = Forever.views, Forever.updatePage, Forever.endsSplit
local createCategoryBanner, updateBanner = Forever.createCategoryBanner, Forever.updateBanner

local TAB_TEXTURE_FILEID = GetFileIDFromPath("Interface\\Icons\\INV_Misc_QuestionMark")

local function availableCost()
    for _, spell in ipairs(wt.spellListData) do
        if spell.isHeader and spell.key == wt.AVAILABLE_KEY then return spell.cost end
    end
    return 0
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
    mainFrame.total:ClearAllPoints()
    mainFrame.total:SetPoint("TOPRIGHT", mainFrame, "TOPRIGHT", -60, -26)
    mainFrame.total:SetShown(leftView == spells)
    mainFrame.total:SetText(string.format(wt.L.LEDGER_AVAILABLE_TOTAL,
        C_CurrencyInfo.GetCoinTextureString(availableCost())))
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

local function attachForeverSpellBook(mainFrame)
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", function()
        local book = PlayerSpellsFrame.SpellBookFrame
        mainFrame:SetParent(book)
        mainFrame:SetPoint("TOPLEFT", book, "TOPLEFT", 65, -90)
        mainFrame:SetPoint("BOTTOMLEFT", book, "BOTTOMLEFT", 65, 15)
        mainFrame:SetWidth(book.minimizedWidth - 110)

        createPage(mainFrame, book.PagedSpellsFrame.ViewFrames[1])
        mainFrame.total = label(mainFrame, "", "SystemFont_Med3", 0, 0)
        mainFrame.Refresh = refresh
        local weaponPage = CreateFrame("Frame", "$parentWeaponPage", mainFrame)
        mainFrame.weaponPage = weaponPage
        weaponPage:SetPoint("TOPRIGHT", book, "TOPRIGHT", -45, -90)
        weaponPage:SetPoint("BOTTOMRIGHT", book, "BOTTOMRIGHT", -45, 15)
        weaponPage:SetWidth(mainFrame:GetWidth())
        createPage(weaponPage, book.PagedSpellsFrame.ViewFrames[2])
        weaponPage.footer:SetWidth(weaponPage:GetWidth() - 28)
        weaponPage:Hide()
        mainFrame.continues:SetText(wt.L.CONTINUES_RIGHT)
        weaponPage.continues:SetText(wt.L.CONTINUES_NEXT)
        mainFrame.sideBySide = WT_SideBySide

        local controls = CreateFrame("Frame", nil, weaponPage, "PagingControlsHorizontalTemplate")
        mainFrame.pagingControls = controls
        controls:ClearAllPoints()
        controls:SetPoint("BOTTOMRIGHT", book.PagedSpellsFrame.PagingControls, "BOTTOMRIGHT")
        controls.PageText:SetFontObject("SystemFont_Med3")
        controls.PageText:SetTextColor(0.19, 0.12, 0.06)
        controls.spacing = 8
        weaponPage.continues:ClearAllPoints()
        weaponPage.continues:SetPoint("RIGHT", controls, "LEFT", -12, 0)
        controls.prevPageSound, controls.nextPageSound = SOUNDKIT.IG_ABILITY_PAGE_TURN, SOUNDKIT.IG_ABILITY_PAGE_TURN
        function weaponPage:OnPageChanged() mainFrame:Refresh() end
        book:EnableMouseWheel(true)
        book:HookScript("OnMouseWheel", function(_, delta)
            if mainFrame:IsShown() and mainFrame.expanded and not mainFrame.sideBySide then
                controls:OnMouseWheel(delta)
            end
        end)

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

        local search = CreateFrame("EditBox", "$parentSearchBox", mainFrame, "SearchBoxTemplate")
        mainFrame.searchBox = search
        search:SetAllPoints(book.SearchBox)
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

        local dropdown = CreateFrame("DropdownButton", nil, mainFrame, "SpellBookSettingsDropdownTemplate")
        mainFrame.displayDropdown = dropdown
        dropdown:ClearAllPoints()
        dropdown:SetAllPoints(book.SettingsDropdown)
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

        -- keep our launcher outside blizz's pool: `CreateCategoryMixins` releases its tabs
        local button = CreateFrame("Button", "WhatsTrainingSpellBookButton", book.CategoryTabSystem,
                                   "SpellBookCategoryTabTemplate")
        button:Init(0, nil, TAB_TEXTURE_FILEID)
        button:SetPoint("LEFT", book.CategoryTabSystem, "RIGHT", 8, 0)
        local function updateLayout()
            local expanded = not book.isMinimized
            if mainFrame.expanded ~= expanded then
                if expanded then mainFrame.sideBySide = wt.showingWeaponSkills or WT_SideBySide end
                mainFrame.expanded = expanded
                mainFrame.scrollFrame:SetVerticalScroll(0)
                weaponPage.scrollFrame:SetVerticalScroll(0)
            end
        end
        local function selectTraining(selected)
            mainFrame:SetShown(selected)
            if selected then
                updateLayout()
                wt.RefreshUI()
            end
            book.PagedSpellsFrame:SetShown(not selected)
            book.SearchBox:SetShown(not selected)
            book.SettingsDropdown:SetShown(not selected)
            book.SearchPreviewContainer:Hide()
            button:SetTabSelected(selected)
            -- SetTabVisuallySelected writes isSelected, which Blizzard reads when
            -- reusing tabs in SetSquareMode. Keep that state untainted for combat.
            for _, tab in ipairs(book.CategoryTabSystem.tabs) do
                local active = not selected and tab:IsSelected()
                tab.SquareBackground:SetShown(not active)
                tab.SquareBackgroundActive:SetShown(active)
                tab.SquareBackgroundActiveGlow:SetShown(active)
                tab:SetEnabled(not active and not tab:IsForceDisabled())
            end
        end
        mainFrame.selectTraining = selectTraining
        button:SetScript("OnClick", function()
            if InCombatLockdown() then
                print(wt.L.BROKER_OPEN_IN_COMBAT)
                return
            end
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            selectTraining(true)
        end)
        button:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(wt.L.TAB_TEXT)
            GameTooltip:Show()
        end)
        button:SetScript("OnLeave", hideTooltip)
        button:SetScript("OnHide", hideTooltip)

        -- the stock calculation only reserves space for Blizzard's category tabs
        hooksecurefunc(book, "ResizeSearchBox", function()
            local left, right = button:GetRight(), book.SearchBox:GetRight()
            if left and right then
                book.SearchBox:SetWidth(math.max(1, math.min(300, right - left - 10)))
            end
        end)
        hooksecurefunc(book.CategoryTabSystem, "SetTab", function() selectTraining(false) end)
        hooksecurefunc(book, "SelectNextTab", function() selectTraining(false) end)
        hooksecurefunc(book, "SetMinimized", function()
            updateLayout()
            if mainFrame:IsShown() then selectTraining(true) end
        end)
        hooksecurefunc(book, "UpdateAllSpellData", function()
            if mainFrame:IsShown() then selectTraining(true) end
        end)
        book:HookScript("OnShow", function()
            book:ResizeSearchBox()
            if mainFrame:IsShown() then selectTraining(true) end
        end)
        book:ResizeSearchBox()
    end)
end

function wt.CreateFrame()
    if wt.MainFrame then return end
    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", UIParent)
    wt.MainFrame = mainFrame
    mainFrame:Hide()
    function wt.Open(toWeapons)
        if InCombatLockdown() then
            print(wt.L.BROKER_OPEN_IN_COMBAT)
            return
        end
        wt.showingWeaponSkills = toWeapons == true
        wt.applyFilter()
        securecallfunction(PlayerSpellsUtil.OpenToSpellBookTab)
        if mainFrame.selectTraining then mainFrame.selectTraining(true) end
    end
    attachForeverSpellBook(mainFrame)
end
