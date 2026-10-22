local _, wt = ...
local Forever = wt.Forever

function wt.EnableCraftingController(book, page, view, launcher, returnTab, selectedNativeTab, refreshPage)
    -- keep our controls outside the native SmartNavigation tree
    local root = CreateFrame("Frame", "WhatsTrainingCraftingController", UIParent)
    root:Hide()
    root:SetAllPoints(book)
    root:SetFrameStrata("TOOLTIP")
    root:SetFrameLevel(500)
    local scroll, search = view.scrollBox, view.searchBox
    local selectedNode, selectedData, selectedIndex, selectedRow
    local nativeTab, nativeButton, menuNode
    local held, closing, capture = {}, false, false
    local connected, buttonKeys = false, {}
    local stickDirection, stickDelay, stickInterval

    local settings = Forever.createMenu(view, view.GenerateFilterMenu, view)
    settings:SetPoint("TOPRIGHT", view.filterDropdown, "BOTTOMRIGHT", 0, -4)
    local options = Forever.createMenu(view, function(_, menu)
        if menuNode then view:GenerateRowMenu(menuNode, menu) end
    end)
    local positions = Forever.createMenu(view, wt.GenerateProfessionTabMenu, launcher)
    local function menuShown() return settings:IsShown() or options:IsShown() or positions:IsShown() end
    local function hideMenus() settings:Hide(); options:Hide(); positions:Hide() end
    local function icon(parent, key)
        local frame = CreateFrame("Frame", nil, parent, "InputIconTextureFrameTemplate")
        frame.useDropShadow = true
        frame:SetSize(22, 22)
        frame:SetInputKey(key)
        frame:SetPressable()
        frame:EnableMouse(false)
        return frame
    end
    local function entryButton()
        return WT_ProfessionTabPosition == "top" and GAMEPAD_SHOULDER_LEFT or GAMEPAD_SHOULDER_RIGHT
    end
    local function returnButton()
        return WT_ProfessionTabPosition == "top" and GAMEPAD_SHOULDER_RIGHT or GAMEPAD_SHOULDER_LEFT
    end
    local shoulderKey = entryButton()
    local shoulder = icon(launcher, shoulderKey)
    shoulder:SetPoint("TOPRIGHT", launcher.Icon, "TOPRIGHT", 7, 7)
    local positionIcon = icon(launcher, GAMEPAD_FACE_TOP)
    positionIcon:SetPoint("BOTTOMRIGHT", launcher.Icon, "BOTTOMRIGHT", 7, -7)
    local searchIcon = icon(view, GAMEPAD_MENU_LEFT)
    searchIcon:SetPoint("RIGHT", search, "LEFT", -7, 0)
    local settingsIcon = icon(view, GAMEPAD_MENU_RIGHT)
    settingsIcon:SetPoint("RIGHT", view.filterDropdown, "LEFT", -5, 0)
    local pointer = CreateFrame("Frame", nil, view, "SmartNavigationPointerTemplate")
    pointer:SetFrameLevel(view:GetFrameLevel() + 90)
    pointer.IntroAnim:Stop()
    pointer.Icon:SetFrameStrata("TOOLTIP")
    pointer.Icon:SetFrameLevel(pointer:GetFrameLevel() + 1)
    pointer.Icon.Cursor:SetSize(18, 30)
    pointer.Icon.Cursor:ClearAllPoints()
    pointer.Icon.Cursor:SetPoint("RIGHT", pointer.Icon, "CENTER")
    pointer:Hide()
    local footer = CreateFrame("Frame", nil, view)
    footer:SetFrameLevel(view:GetFrameLevel() + 90)
    local backing = footer:CreateTexture(nil, "BACKGROUND")
    backing:SetAllPoints()
    backing:SetColorTexture(0.035, 0.03, 0.02, 1)
    footer:EnableMouse(true)
    local legend = Forever.createInputLegend(footer, {
        { "StandardOneIcon", { GAMEPAD_FACE_BOTTOM }, ACTION_LABEL_SELECT },
        { "StandardOneIcon", { GAMEPAD_FACE_LEFT }, wt.L.GAMEPAD_OPTIONS },
        { "StandardTwoIcon", { GAMEPAD_STICK_LEFT, GAMEPAD_DPAD }, FRAME_ACTION_NAVIGATE },
        { "StandardOneIcon", { GAMEPAD_STICK_RIGHT_PRESS }, PROMPT_TOGGLE_TOOLTIPS },
        { "StandardOneIcon", { GAMEPAD_FACE_RIGHT }, FRAME_ACTION_CLOSE },
    })
    footer:SetPoint("TOPLEFT", book, "BOTTOMLEFT", 0, -9)
    positions:SetFrameLevel(footer:GetFrameLevel() + 10)
    positions:SetPoint("BOTTOMRIGHT", footer, "TOPRIGHT", -10, positions.footer:GetHeight() + 10)

    local function clearSelection()
        if selectedRow then
            selectedRow:UnlockHighlight()
            local leave = selectedRow:GetScript("OnLeave")
            if leave then leave(selectedRow) end
            selectedRow = nil
        end
        pointer:Hide()
    end
    local function showTooltip()
        if selectedRow and selectedRow.data and selectedRow.data.recipe and not GetCVarBool("GamepadDisableTooltips") then
            GameTooltip:SetFrameLevel(view:GetFrameLevel() + 100)
            selectedRow:GetScript("OnEnter")(selectedRow)
        end
    end
    local function selectNode(node, index)
        clearSelection()
        selectedNode, selectedData, selectedIndex = node, node and node:GetData(), index
        if not node then return end
        scroll:ScrollToElementData(node, ScrollBoxConstants.AlignNearest, 0, ScrollBoxConstants.NoScrollInterpolation)
        selectedRow = scroll:FindFrame(node)
        if not selectedRow then return end
        selectedRow:LockHighlight()
        pointer:ClearAllPoints()
        pointer:SetPoint("CENTER", selectedRow, "LEFT", -4, 0)
        pointer:Show()
        showTooltip()
    end
    local function restoreSelection()
        local fallback, fallbackIndex
        for index, node in scroll:EnumerateDataProvider() do
            local data = node:GetData()
            if selectedData and ((data.recipe and selectedData.recipe and data.recipe.spell == selectedData.recipe.spell)
                or (not data.recipe and not selectedData.recipe and data.category == selectedData.category
                    and data.professionID == selectedData.professionID)) then
                return selectNode(node, index)
            end
            if not fallback or index <= (selectedIndex or 1) then fallback, fallbackIndex = node, index end
        end
        selectNode(fallback, fallbackIndex)
    end
    local function move(button)
        if not selectedNode then return restoreSelection() end
        local currentIndex = scroll:FindElementDataIndex(selectedNode)
        if not currentIndex then return restoreSelection() end
        local step = (button == "PADDLEFT" or button == "PADDRIGHT")
            and math.max(1, scroll:GetDataIndexEnd() - scroll:GetDataIndexBegin()) or 1
        if button == "PADDUP" or button == "PADDLEFT" then step = -step end
        local index = math.max(1, math.min(scroll:GetDataProviderSize(), currentIndex + step))
        local node = scroll:FindElementData(index)
        if node then selectNode(node, index) end
    end
    local function toggleMenu(menu)
        stickDirection = nil
        local show = not menu:IsShown()
        hideMenus(); search:ClearFocus()
        menu:SetShown(show)
        if show then clearSelection() else restoreSelection() end
    end
    view.openControllerMenu = function(node)
        if not root:IsShown() then return end
        menuNode = node
        options:ClearAllPoints()
        local row = scroll:FindFrame(node)
        options:SetPoint("TOPLEFT", row or view.filterDropdown, "BOTTOMLEFT", 32, -2)
        options.index = nil
        toggleMenu(options)
    end
    local mouseDown = view.filterDropdown:GetScript("OnMouseDown")
    view.filterDropdown:SetScript("OnMouseDown", function(...)
        if root:IsShown() then toggleMenu(settings)
        elseif mouseDown then mouseDown(...) end
    end)
    search:HookScript("OnEditFocusGained", function()
        if not root:IsShown() then return end
        stickDirection = nil
        hideMenus(); clearSelection()
    end)
    local function returnFromMenu()
        if root:IsShown() and not menuShown() and not search:HasFocus() then restoreSelection() end
    end
    search:HookScript("OnEditFocusLost", returnFromMenu)
    settings:SetScript("OnHide", returnFromMenu)
    options:SetScript("OnHide", returnFromMenu)
    positions:SetScript("OnHide", returnFromMenu)

    local function activeBook()
        return book:IsVisible() and InputUtil.IsGamepadUIEnabled() and SmartNavigation and SmartNavigation:IsShown()
            and SmartNavigation:GetActiveFrame() == book and not book.CraftingPage.RecipeList.SearchBox:HasFocus()
    end
    local function atEdge()
        local tabs = book.TabIndicators
        if not tabs or tabs.isLocked or not tabs.visibleTabs or not tabs.visibleTabs[tabs.currentIndex] then return false end
        local step = entryButton() == GAMEPAD_SHOULDER_LEFT and -1 or 1
        for i = tabs.currentIndex + step, step == -1 and 1 or #tabs.visibleTabs, step do
            if not tabs.visibleTabs[i].isDisabled then return false end
        end
        return true
    end
    local function releaseCapture()
        if capture and not InCombatLockdown() then
            root:EnableGamePadButton(false)
            root:EnableGamePadStick(false)
            capture = false
        end
    end
    root:SetScript("OnHide", function()
        stickDirection, selectedNode, selectedData, selectedIndex = nil, nil, nil, nil
        clearSelection()
        search:ClearFocus()
        hideMenus()
        page:Hide(); returnTab:Hide()
        held, closing = {}, false
        releaseCapture()
    end)
    function root:Sync()
        local available = connected and activeBook() and not InCombatLockdown()
        if not available then
            self:Hide()
            launcher:Hide(); page:Hide(); returnTab:Hide()
            return
        end
        page:SetParent(root)
        launcher:SetParent(UIParent)
        returnTab:SetParent(root)
        root:SetScale(book:GetEffectiveScale() / UIParent:GetEffectiveScale())
        page:SetFrameLevel(root:GetFrameLevel() + 1)
        view:SetFrameStrata("TOOLTIP")
        view:SetFrameLevel(page:GetFrameLevel() + 1000)
        launcher:SetFrameStrata("TOOLTIP")
        launcher:SetFrameLevel(view:GetFrameLevel() + 3)
        returnTab:SetFrameLevel(view:GetFrameLevel() + 3)
        launcher:SetScale(root:GetScale())
        wt.PositionCraftingTab()
        launcher:Show()
        local active = self:IsShown()
        launcher:SetChecked(active)
        local key = entryButton()
        if key ~= shoulderKey then shoulder:SetInputKey(key); shoulderKey = key end
        shoulder:SetShown(atEdge() and not self:IsShown())
        positionIcon:SetShown(active and not positions:IsShown())
        page:SetShown(active)
        returnTab:SetShown(active and nativeTab ~= nil)
        searchIcon:Show(); settingsIcon:Show()
        search:SetWidth(410)
        view.filterDropdown:SetPoint("LEFT", search, "RIGHT", 34, 0)
        view.footer:SetShown(not self:IsShown())
        if active then
            returnTab:ClearAllPoints()
            if nativeTab then
                returnTab:SetPoint("CENTER", nativeTab)
                returnTab.Icon:SetTexture(nativeTab.Icon:GetTexture())
                returnTab.tooltipText = nativeTab.tooltipText
            end
            local nativeFooter = book.BookPage:IsShown() and book.bookPageFooter or book.craftingPageFooter
            local nativeLegend = nativeFooter and nativeFooter.inputLegend
            if nativeLegend then footer:SetPoint("TOPLEFT", nativeLegend, "TOPLEFT") end
            footer:SetSize(math.max(legend:GetWidth(), nativeLegend and nativeLegend:GetWidth() or 0),
                math.max(legend:GetHeight(), nativeLegend and nativeLegend:GetHeight() or 0))
            refreshPage()
        end
    end
    function root:Toggle()
        if self:IsShown() then self:Hide(); return end
        if not connected or not activeBook() or InCombatLockdown() then return end
        nativeTab, nativeButton = selectedNativeTab(), SmartNavigation:GetCurrentButton()
        held, closing = {}, false
        self:EnableGamePadButton(true)
        self:EnableGamePadStick(true)
        capture = true
        self:Show()
        self:Sync()
        restoreSelection()
    end
    function root:OpenPositionMenu()
        if not self:IsShown() or InCombatLockdown() or not connected or not activeBook() then return end
        positions.index = nil
        toggleMenu(positions)
        self:Sync()
    end
    function root:Deactivate()
        self:Hide()
        releaseCapture()
        page:SetParent(book); launcher:SetParent(book); returnTab:SetParent(book)
        view:SetFrameStrata("HIGH")
        launcher:SetFrameStrata(book:GetFrameStrata())
        launcher:SetScale(1)
        searchIcon:Hide(); settingsIcon:Hide(); shoulder:Hide(); positionIcon:Hide()
        search:SetWidth(440)
        view.filterDropdown:SetPoint("LEFT", search, "RIGHT", 4, 0)
        view.footer:Show()
    end
    local function canNavigate()
        return root:IsShown() and not InCombatLockdown() and not closing and not menuShown() and not search:HasFocus()
    end
    root:SetScript("OnGamePadButtonDown", function(_, button)
        if InCombatLockdown() or closing or held[button] then return false end
        held[button] = true
        if (button == "PAD2" or button == returnButton()) and (menuShown() or search:HasFocus()) then
            held[button] = "panel"
            local menu = settings:IsShown() and settings or options:IsShown() and options or positions:IsShown() and positions
            if button == "PAD2" and menu then menu:HandleButton(button)
            else hideMenus(); search:ClearFocus() end
        elseif button == "PAD4" then root:OpenPositionMenu()
        elseif positions:IsShown() then positions:HandleButton(button)
        elseif button == "PADRSTICK" then
            local disable = not GetCVarBool("GamepadDisableTooltips")
            SetCVar("GamepadDisableTooltips", disable)
            if disable then GameTooltip:Hide() else showTooltip() end
        elseif button == "PADFORWARD" then toggleMenu(settings)
        elseif button == "PADBACK" then
            hideMenus()
            if search:HasFocus() then search:ClearFocus() else search:SetFocus() end
        elseif settings:IsShown() then settings:HandleButton(button)
        elseif options:IsShown() then options:HandleButton(button)
        elseif search:HasFocus() then
            if button == "PAD1" then search:ClearFocus()
            elseif button == "PAD3" then search:SetText("") end
        elseif button == "PADDUP" or button == "PADDDOWN" or button == "PADDLEFT" or button == "PADDRIGHT" then
            move(button)
        elseif button == "PAD1" and selectedRow then
            selectedRow:GetScript("OnClick")(selectedRow, "LeftButton")
            restoreSelection()
        elseif button == "PAD3" and selectedNode then view.openControllerMenu(selectedNode) end
        return false
    end)
    root:SetScript("OnGamePadButtonUp", function(_, button)
        if held[button] == true and (button == "PAD2" or button == returnButton()) then closing = true end
        held[button] = nil
        return false
    end)
    root:SetScript("OnGamePadStick", function(_, stick, x, y)
        if stick ~= "Movement" then return false end
        local strength = math.max(math.abs(x), math.abs(y))
        if strength < 0.3 or not canNavigate() then stickDirection = nil; return false end
        local direction
        if math.abs(x) > math.abs(y) then direction = x > 0 and "PADDRIGHT" or "PADDLEFT"
        else direction = y > 0 and "PADDUP" or "PADDDOWN" end
        stickInterval = math.abs(x) > math.abs(y) and 0.25 or 0.15 - math.min(1, (strength - 0.3) / 0.7) * 0.1
        if direction ~= stickDirection then stickDirection, stickDelay = direction, 0.3; move(direction) end
        return false
    end)
    tinsert(UISpecialFrames, root:GetName())

    local observer = CreateFrame("Frame", nil, UIParent)
    local wasDown, wasAtEdge, previousButton = false, false, entryButton()
    local function updateDevice()
        local mapped = C_GamePad and C_GamePad.GetDeviceMappedState and C_GamePad.GetDeviceMappedState()
        connected, buttonKeys = mapped ~= nil, {}
        if mapped then
            for index = 0, mapped.buttonCount - 1 do
                local key = C_GamePad.ButtonIndexToBinding(index)
                if key then buttonKeys[#buttonKeys + 1] = key end
            end
        end
        previousButton = entryButton()
        wasDown, wasAtEdge = IsKeyDown(previousButton) == true, false
    end
    for _, event in ipairs({"GAME_PAD_CONNECTED", "GAME_PAD_DISCONNECTED", "GAME_PAD_CONFIGS_CHANGED", "GAME_PAD_ACTIVE_CHANGED"}) do
        observer:RegisterEvent(event)
    end
    observer:SetScript("OnEvent", updateDevice)
    updateDevice()
    observer:SetScript("OnUpdate", function(_, elapsed)
        if not InputUtil.IsGamepadUIEnabled() then releaseCapture(); return end
        local button = entryButton()
        local down, edge = connected and IsKeyDown(button) == true, atEdge()
        if button ~= previousButton then
            wasDown, wasAtEdge, previousButton = down, false, button
        end
        if root:IsShown() then
            if not activeBook() or not connected or InCombatLockdown() or selectedNativeTab() ~= nativeTab
                or SmartNavigation:GetCurrentButton() ~= nativeButton then root:Hide()
            elseif closing then
                local anyDown = false
                for _, key in ipairs(buttonKeys) do if IsKeyDown(key) then anyDown = true; break end end
                if not anyDown then root:Hide() end
            elseif canNavigate() then
                if not selectedNode or scroll:FindFrame(selectedNode) ~= selectedRow or not selectedRow
                    or selectedRow.data ~= selectedData then restoreSelection() end
                if stickDirection then
                    stickDelay = stickDelay - elapsed
                    if stickDelay <= 0 then move(stickDirection); stickDelay = stickInterval end
                end
            end
        else
            releaseCapture()
            if down and not wasDown and wasAtEdge and edge then root:Toggle() end
        end
        if not canNavigate() then stickDirection = nil end
        wasDown, wasAtEdge = down, edge
        root:Sync()
    end)
    return root
end
