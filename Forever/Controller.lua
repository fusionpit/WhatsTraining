local _, wt = ...
local Forever = wt.Forever
local tooltip = Forever.tooltip

local function navigationHeight(row)
    return row.navigationHeight or row:GetHeight()
end

local function navigationCenter(row)
    local x = row:GetCenter()
    local top = row:GetTop()
    return x, top and top - navigationHeight(row) / 2
end

local function activeBook()
    local root = PlayerSpellsFrame
    local book = root and root.SpellBookFrame
    if book and book:IsVisible() and InputUtil.IsGamepadUIEnabled()
        and SmartNavigation and SmartNavigation:IsShown() and SmartNavigation:GetActiveFrame() == root
        and not book.SearchBox:HasFocus() and not book:IsInSearchResultsMode() and book:GetTab() ~= nil then
        return book
    end
end

function wt.EnableControllerBook(root, mainFrame, place, updatePreview)
    wt.ControllerFrame = root
    mainFrame.continues:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -24, Forever.CONTENT_RISE)
    local settings = Forever.createMenu(root, mainFrame.generateSettings, mainFrame.displayDropdown)
    mainFrame.controllerSettings = settings
    settings:SetPoint("TOPRIGHT", mainFrame.displayDropdown, "BOTTOMRIGHT", 0, -4)
    local total = mainFrame.total:GetParent()
    local prices = Forever.createMenu(root, function(owner, description)
        wt.priceMenuGenerator(owner, description, true)
    end, total)
    mainFrame.controllerPrices = prices
    prices:SetPoint("TOPRIGHT", mainFrame.priceDropdown, "BOTTOMRIGHT", 0, -4)
    local menuSpell
    local spellMenu = Forever.createMenu(root, function(_, description)
        if menuSpell then wt.generateSpellMenu(menuSpell, function() wt:RebuildData() end, description) end
    end)
    mainFrame.controllerSpellMenu = spellMenu
    local function menuShown() return settings:IsShown() or prices:IsShown() or spellMenu:IsShown() end
    local search = mainFrame.searchBox
    local function headerIcon(key)
        local icon = CreateFrame("Frame", nil, mainFrame, "InputIconTextureFrameTemplate")
        icon.useDropShadow = true
        icon:SetSize(22, 22)
        icon:SetInputKey(key)
        icon:SetPressable()
        return icon
    end
    mainFrame.settingsIcon = headerIcon(GAMEPAD_MENU_RIGHT)
    mainFrame.settingsIcon:SetPoint("RIGHT", mainFrame.displayDropdown, "LEFT", -5, 4)
    search:ClearAllPoints()
    search:SetPoint("RIGHT", mainFrame.settingsIcon, "LEFT", -15, 0)
    mainFrame.searchIcon = headerIcon(GAMEPAD_MENU_LEFT)
    mainFrame.searchIcon:SetPoint("RIGHT", search, "LEFT", -7, 0)
    local cursor = CreateFrame("Frame", nil, root)
    cursor:SetAllPoints()
    cursor:SetFrameLevel(root:GetFrameLevel() + 90)
    cursor:EnableMouse(false)
    local pointer = CreateFrame("Frame", nil, cursor, "SmartNavigationPointerTemplate")
    pointer.IntroAnim:Stop()
    pointer.Icon:SetFrameStrata("TOOLTIP")
    pointer.Icon:SetFrameLevel(cursor:GetFrameLevel() + 1)
    local arrow = pointer.Icon.Cursor
    local largeWidth, largeHeight = arrow:GetSize()
    arrow:ClearAllPoints()
    arrow:SetPoint("RIGHT", pointer.Icon, "CENTER")
    pointer:Hide()
    local footer = CreateFrame("Frame", nil, root)
    root.controllerFooter = footer
    footer:SetFrameLevel(root:GetFrameLevel() + 90)
    footer:EnableMouse(true)
    -- cover the native legend
    local backing = footer:CreateTexture(nil, "BACKGROUND")
    backing:SetAllPoints()
    backing:SetColorTexture(0.035, 0.03, 0.02, 1)
    local legend = Forever.createInputLegend(footer, {
        { "StandardOneIcon", { GAMEPAD_FACE_LEFT }, wt.L.GAMEPAD_OPTIONS },
        { "StandardOneIcon", { GAMEPAD_FACE_TOP }, wt.L.GAMEPAD_SWITCH_VIEW },
        { "StandardTwoIcon", { GAMEPAD_STICK_LEFT, GAMEPAD_DPAD }, FRAME_ACTION_NAVIGATE },
        { "StandardOneIcon", { GAMEPAD_STICK_RIGHT_PRESS }, PROMPT_TOGGLE_TOOLTIPS },
        { "StandardOneIcon", { GAMEPAD_FACE_RIGHT }, FRAME_ACTION_CLOSE },
    })
    local panePrompt = legend:GetOrCreatePromptFrameUsingTemplateAndInputs("StandardTwoIcon",
        { GAMEPAD_TRIGGER_LEFT, GAMEPAD_TRIGGER_RIGHT }, GAMEPAD_PROMPT_DIVIDER_SLASH)
    panePrompt:SetPromptText(wt.L.GAMEPAD_SWITCH_PANE)
    panePrompt:EnablePrompt()
    panePrompt:Hide()
    local groupPrompt = legend:GetOrCreatePromptFrameUsingTemplateAndInputs("StandardOneIcon",
        { GAMEPAD_FACE_BOTTOM }, GAMEPAD_PROMPT_DIVIDER_SLASH)
    groupPrompt:EnablePrompt()
    groupPrompt:Hide()
    local selected, selectedPage, subgrid
    local groupPromptText
    local promptWidth, promptHeight = legend:GetWidth(), legend:GetHeight()
    local function placeCover(book)
        if not place(book) then return false end
        local sideBySide = mainFrame.expanded and mainFrame.sideBySide or false
        local header = selected and selected.navigationHeader
        local grouped = header and #header.navigationChildren > 0 or false
        local groupText = subgrid and wt.L.GAMEPAD_LEAVE_GROUP or wt.L.GAMEPAD_ENTER_GROUP
        if panePrompt:IsShown() ~= sideBySide or groupPrompt:IsShown() ~= grouped or groupPromptText ~= groupText then
            panePrompt:SetShown(sideBySide)
            groupPrompt:SetShown(grouped)
            groupPrompt:SetPromptText(groupText)
            groupPromptText = groupText
            legend:InitializePrompts()
            promptWidth, promptHeight = legend:GetWidth(), legend:GetHeight()
        end
        local nativeFooter = PlayerSpellsFrame.spellsFrameFooter
        local nativeLegend = nativeFooter and nativeFooter.inputLegend
        local left, bottom
        if nativeLegend then left, bottom = nativeLegend:GetLeft(), nativeLegend:GetBottom() end
        footer:ClearAllPoints()
        if left and bottom then
            footer:SetScale(nativeLegend:GetEffectiveScale() / root:GetEffectiveScale())
            footer:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left, bottom)
            footer:SetSize(math.max(nativeLegend:GetWidth(), promptWidth), math.max(nativeLegend:GetHeight(), promptHeight))
        else
            -- native legend may still lack geometry
            footer:SetScale(1)
            footer:SetPoint("TOPLEFT", root, "BOTTOMLEFT", 0, -9)
            footer:SetSize(promptWidth, promptHeight)
        end
        legend:SetSize(footer:GetSize())
        legend.promptContainerFrame:SetSize(footer:GetSize())
        return true
    end
    local function showSelectedTooltip()
        if selected and not GetCVarBool("GamepadDisableTooltips") then
            tooltip:SetFrameLevel(root:GetFrameLevel() + 100)
            selected:GetScript("OnEnter")(selected)
        end
    end
    local function clearSelection()
        if selected then
            selected:UnlockHighlight()
            selected:GetScript("OnLeave")(selected)
            selected = nil
        end
        pointer:Hide()
    end
    local function validateGroup()
        if not subgrid then return end
        local header, spell = subgrid.header, subgrid.header.spell
        local old = subgrid.spell
        if not header:IsVisible() or header.navigationHeader ~= header or not spell
            or spell.id ~= old.id or spell.npc ~= old.npc or spell.key ~= old.key or spell.level ~= old.level
            or not header.navigationChildren or #header.navigationChildren == 0 then subgrid = nil end
    end
    local pages = { mainFrame, mainFrame.weaponPage }
    local candidates, candidateRecords, sortRows = {}, {}, {}
    local function addButton(index, row, page)
        local entry = candidateRecords[index]
        if not entry then entry = {}; candidateRecords[index] = entry end
        entry.row, entry.page = row, page
        candidates[index] = entry
    end
    local function buttons()
        validateGroup()
        -- callers finish using these buffers before selection callbacks can refresh the book
        for i = 1, #sortRows do sortRows[i] = nil end
        local count = 0
        for _, page in ipairs(pages) do
            if page:IsVisible() then
                for _, pool in ipairs(page.pools) do
                    for _, row in ipairs(pool) do
                        local spell = row.spell
                        local header = row.navigationHeader
                        local eligible
                        if subgrid and page == subgrid.page then
                            eligible = header == subgrid.header and row ~= header
                        elseif header then eligible = row == header
                        else eligible = spell and (not spell.isHeader or spell.npc or (spell.cost or 0) > 0) end
                        if row:IsShown() and spell and eligible then
                            count = count + 1
                            addButton(count, row, page)
                        end
                    end
                end
            end
        end
        if total:IsVisible() and not subgrid then
            count = count + 1
            addButton(count, total, mainFrame)
        end
        for i = count + 1, #candidates do
            candidates[i].row, candidates[i].page = nil, nil
            candidates[i] = nil
        end
        return candidates
    end
    local function selectButton(row, page)
        clearSelection()
        if not row then return end
        if subgrid and (page ~= subgrid.page or row.navigationHeader ~= subgrid.header or row == subgrid.header) then
            subgrid = nil
        end
        selected, selectedPage = row, page
        if row ~= total then
            local scroll = page.scrollFrame
            local top = page.content:GetTop() - row:GetTop()
            local offset, height = scroll:GetVerticalScroll(), scroll:GetHeight()
            if top < offset then offset = top
            elseif top + navigationHeight(row) > offset + height then offset = top + navigationHeight(row) - height end
            scroll:SetVerticalScroll(math.max(0, math.min(offset, math.max(0, page.content:GetHeight() - height))))
        end
        row:LockHighlight()
        local largeIcon = row.largeCursor and row.icon:IsShown()
        arrow:SetSize(largeIcon and largeWidth or 18, largeIcon and largeHeight or 30)
        arrow:SetScale(largeIcon and 0.8 or 1)
        pointer:ClearAllPoints()
        if largeIcon then
            -- match the native cursor's 32px frame and 10px inset
            pointer:SetPoint("CENTER", row.icon, "LEFT", 10 - 32 + largeWidth * 0.8, 0)
        else pointer:SetPoint("CENTER", row, "TOPLEFT", -4, -navigationHeight(row) / 2) end
        pointer:Show()
        showSelectedTooltip()
    end
    local function toggleGroup()
        validateGroup()
        if subgrid then
            local group = subgrid
            subgrid = nil
            return selectButton(group.header, group.page)
        end
        local header = selected and selected.navigationHeader
        if header ~= selected or not header or #header.navigationChildren == 0 then return end
        subgrid = { header = header, spell = header.spell, page = selectedPage }
        local first
        for _, row in ipairs(header.navigationChildren) do
            if row:IsShown() and (not first or row:GetTop() > first:GetTop()
                or (row:GetTop() == first:GetTop() and row:GetLeft() < first:GetLeft())) then first = row end
        end
        if first then selectButton(first, selectedPage) else subgrid = nil end
    end
    local function restoreSelection(spell, position, preferredPage)
        if spell == total and total:IsVisible() then return selectButton(total, mainFrame) end
        local first, match
        for _, entry in ipairs(buttons()) do
            local x, y = navigationCenter(entry.row)
            local scroll = entry.page.scrollFrame
            local visible = not position or (x and y and entry.page == position.page
                and entry.row:GetTop() <= scroll:GetTop()
                and entry.row:GetTop() - navigationHeight(entry.row) >= scroll:GetBottom())
            if x and y and entry.row ~= total and visible
                and (not preferredPage or not preferredPage:IsVisible() or entry.page == preferredPage) then
                if position then
                    local score = math.abs(entry.row:GetTop() - scroll:GetTop() - position.top)
                        + math.abs(x - entry.page:GetLeft() - position.x) * 3
                    if not first or score < first.score then
                        entry.score = score
                        first = entry
                    end
                elseif not first or y > first.y or (y == first.y and x < first.x) then
                    entry.x, entry.y = x, y
                    first = entry
                end
                if entry.row.spell == spell then match = entry end
            end
        end
        local entry = match or first
        selectButton(entry and entry.row, entry and entry.page)
    end
    local refresh = mainFrame.Refresh
    function mainFrame:Refresh()
        local spell = selected == total and total or selected and selected.spell
        local groupPage = subgrid and subgrid.page
        clearSelection()
        -- reserve space for page buttons
        local bottom = Forever.CONTENT_RISE + (self.expanded and not self.sideBySide and 45 or 0)
        for _, page in ipairs({ self, self.weaponPage }) do
            page.scrollFrame:SetPoint("BOTTOMRIGHT", page, "BOTTOMRIGHT", -20, bottom)
        end
        refresh(self)
        self.footer:Hide()
        self.weaponPage.footer:Hide()
        if root:IsShown() and not menuShown() and not search:HasFocus() then restoreSelection(spell, nil, groupPage) end
        if prices:IsShown() then
            if total:IsVisible() then prices:Rebuild() else prices:Hide() end
        end
    end
    local paneSelections = {}
    local function switchPane(page)
        if selected and selectedPage == page then return end
        if selected then paneSelections[selectedPage] = { row = selected, spell = selected.spell, group = subgrid } end
        local remembered = paneSelections[page]
        local previousGroup = subgrid
        subgrid = remembered and remembered.group
        local scroll = page.scrollFrame
        local y = selected and select(2, navigationCenter(selected)) or scroll:GetTop()
        local best, bestScore
        for _, entry in ipairs(buttons()) do
            if entry.page == page and remembered and entry.row == remembered.row and entry.row.spell == remembered.spell then
                return selectButton(entry.row, entry.page)
            end
            if entry.page == page and entry.row ~= total and entry.row:GetTop() <= scroll:GetTop()
                and entry.row:GetTop() - navigationHeight(entry.row) >= scroll:GetBottom() then
                local _, nextY = navigationCenter(entry.row)
                if nextY then
                    local score = math.abs(nextY - y)
                    if not bestScore or score < bestScore then best, bestScore = entry, score end
                end
            end
        end
        if best then selectButton(best.row, best.page) else subgrid = previousGroup end
    end
    local function readingOrder(a, b)
        if a.row == total or b.row == total then return a.row == total and b.row ~= total end
        if a.top ~= b.top then return a.top > b.top end
        return a.left < b.left
    end
    local function screenOrder(a, b)
        if a.top ~= b.top then return a.top < b.top end
        return a.distance < b.distance
    end
    local function moveReadingOrder(button)
        local rows = sortRows
        for _, entry in ipairs(buttons()) do
            if entry.page == selectedPage then
                entry.top, entry.left = entry.row:GetTop(), entry.row:GetLeft()
                if entry.top and entry.left then rows[#rows + 1] = entry end
            end
        end
        table.sort(rows, readingOrder)
        for i, entry in ipairs(rows) do
            if entry.row == selected then
                local nextEntry = rows[i + (button == "PADDDOWN" and 1 or -1)]
                if nextEntry then selectButton(nextEntry.row, nextEntry.page) end
                return
            end
        end
    end
    local function move(button)
        if not selected and button == "PADDUP" and total:IsVisible() then return selectButton(total, mainFrame) end
        if not selected then return restoreSelection() end
        if selected == total then
            if button == "PADDDOWN" then restoreSelection() end
            return
        end
        local x, y = navigationCenter(selected)
        if not x or not y then return restoreSelection() end
        local horizontal = button == "PADDLEFT" or button == "PADDRIGHT"
        local direction = (button == "PADDLEFT" or button == "PADDDOWN") and -1 or 1
        if not horizontal and selected.navigationHeader and not subgrid then
            return moveReadingOrder(button)
        end
        local best, bestScore
        if horizontal and not subgrid and (not mainFrame.expanded or mainFrame.sideBySide) then
            local scroll = selectedPage.scrollFrame
            local height, offset = scroll:GetHeight(), scroll:GetVerticalScroll()
            local contentTop, rows = selectedPage.content:GetTop(), sortRows
            for _, entry in ipairs(buttons()) do
                if entry.page == selectedPage and entry.row ~= total then
                    local nextX, nextTop = entry.row:GetCenter(), entry.row:GetTop()
                    if nextX and nextTop then
                        entry.x, entry.top = nextX, contentTop - nextTop
                        entry.bottom = entry.top + navigationHeight(entry.row)
                        entry.distance = math.abs(nextX - x)
                        rows[#rows + 1] = entry
                    end
                end
            end
            if #rows == 0 then return end
            table.sort(rows, screenOrder)
            if direction > 0 then
                -- start the next screen at the clipped row
                best = rows[#rows]
                for _, entry in ipairs(rows) do
                    if entry.bottom > offset + height + 0.01 then best = entry; break end
                end
                offset = best.top
            else
                -- include the clipped top row to align a whole row.
                local bottom = 0
                for _, entry in ipairs(rows) do
                    if entry.top < offset - 0.01 then bottom = math.max(bottom, entry.bottom) end
                end
                local target = math.max(0, bottom - height)
                best = rows[1]
                for _, entry in ipairs(rows) do
                    if entry.top >= target - 0.01 then best = entry; break end
                end
                offset = best == rows[1] and 0 or best.top
            end
            scroll:SetVerticalScroll(math.max(0, math.min(offset, math.max(0, selectedPage.content:GetHeight() - height))))
            selectButton(best.row, best.page)
            return
        end
        for _, entry in ipairs(buttons()) do
            local nextX, nextY = navigationCenter(entry.row)
            if nextX and nextY and entry.row ~= selected and ((horizontal and not subgrid) or entry.page == selectedPage)
                and (entry.row ~= total or not horizontal) then
                local dx, dy = nextX - x, nextY - y
                local along, across = horizontal and dx or dy, horizontal and dy or dx
                local score = along * direction + math.abs(across) * 3
                if along * direction > 1 and (not subgrid or not horizontal or math.abs(dy) < 1)
                    and (not bestScore or score < bestScore) then
                    best, bestScore = entry, score
                end
            end
        end
        if best then
            selectButton(best.row, best.page)
        elseif horizontal and not subgrid and mainFrame.expanded and not mainFrame.sideBySide then
            local controls = mainFrame.pagingControls
            if button == "PADDLEFT" then controls:PreviousPage() else controls:NextPage() end
        end
    end

    local stickDirection, stickDelay, stickInterval
    local menuReturn, spellMenuPosition
    local function toggleMenu(menu)
        stickDirection = nil
        local show = not menu:IsShown()
        local origin = selected == total and total or selected and selected.spell or menuReturn
        settings:Hide()
        prices:Hide()
        spellMenu:Hide()
        search:ClearFocus()
        menuReturn = origin
        menu:SetShown(show)
        if show then clearSelection() end
    end
    mainFrame.displayDropdown:SetScript("OnMouseDown", function() toggleMenu(settings) end)
    local function togglePrices()
        if not prices:IsShown() then selectButton(total, mainFrame) end
        toggleMenu(prices)
    end
    local function openSpellMenu(row)
        spellMenuPosition = { page = selectedPage, x = row:GetCenter() - selectedPage:GetLeft(),
            top = row:GetTop() - selectedPage.scrollFrame:GetTop() }
        menuSpell = row.weaponRow and row.weaponRow.spell or row.spell
        spellMenu:ClearAllPoints()
        spellMenu:SetPoint("TOPLEFT", root, "BOTTOMLEFT", row:GetLeft() - root:GetLeft() + 32,
            row:GetTop() - navigationHeight(row) - root:GetBottom() - 2)
        spellMenu.index = nil
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        toggleMenu(spellMenu)
    end
    mainFrame.priceDropdown:SetScript("OnMouseDown", togglePrices)
    total:SetScript("OnClick", togglePrices)
    total:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    total:SetScript("OnMouseUp", nil) -- disable the native menu handler
    local searchReturn
    search:HookScript("OnEditFocusGained", function()
        searchReturn = selected and selected.spell
        stickDirection = nil
        settings:Hide(); prices:Hide(); spellMenu:Hide(); clearSelection()
    end)
    search:HookScript("OnEditFocusLost", function()
        if root:IsShown() and not menuShown() then restoreSelection(searchReturn) end
    end)
    local function returnFromMenu(menu)
        if root:IsShown() and not menuShown() and not search:HasFocus() then
            -- preserve selection if spell was moved
            restoreSelection(menuReturn, menu == spellMenu and spellMenuPosition or nil)
        end
        if menu == spellMenu then spellMenuPosition = nil end
    end
    settings:SetScript("OnHide", returnFromMenu)
    prices:SetScript("OnHide", returnFromMenu)
    spellMenu:SetScript("OnHide", returnFromMenu)
    local held, closing, capture = {}, false, false
    local connected, buttonKeys = false, {}
    local nativeTab, nativeButton
    local function canNavigateWithStick()
        return root:IsShown() and not InCombatLockdown() and not closing
            and not menuShown() and not search:HasFocus()
    end
    local function releaseCapture()
        if capture and not InCombatLockdown() then
            root:EnableGamePadButton(false)
            root:EnableGamePadStick(false)
            capture = false
        end
    end
    root:SetScript("OnHide", function()
        stickDirection = nil
        subgrid, paneSelections = nil, {}
        clearSelection()
        search:ClearFocus()
        settings:Hide()
        prices:Hide()
        spellMenu:Hide()
        held, closing = {}, false
        releaseCapture()
    end)
    root:SetScript("OnShow", function() wt:ApplyFilter() end)
    local function enterBook(book)
        if root:IsShown() or InCombatLockdown() or not book or not placeCover(book) then return end
        held, closing = {}, false
        nativeTab, nativeButton = book:GetTab(), SmartNavigation:GetCurrentButton()
        root:EnableGamePadButton(true)
        root:EnableGamePadStick(true)
        capture = true
        root:Show()
        updatePreview(nil)
    end
    root.previewTab:SetScript("OnClick", function()
        if root.previewTab:IsVisible() and connected then enterBook(activeBook()) end
    end)
    root:SetScript("OnGamePadButtonDown", function(_, button)
        if InCombatLockdown() or closing or held[button] then return false end
        held[button] = true
        if (button == "PAD2" or button == "PADLSHOULDER") and (menuShown() or search:HasFocus()) then
            held[button] = "panel" -- keep the book open on release
            settings:Hide()
            prices:Hide()
            spellMenu:Hide()
            search:ClearFocus()
        elseif button == "PADRSTICK" then
            local disable = not GetCVarBool("GamepadDisableTooltips")
            SetCVar("GamepadDisableTooltips", disable)
            if disable then
                tooltip:Hide()
            else
                showSelectedTooltip()
            end
        elseif button == "PADFORWARD" then
            toggleMenu(settings)
        elseif button == "PADBACK" then
            settings:Hide()
            prices:Hide()
            spellMenu:Hide()
            if search:HasFocus() then search:ClearFocus() else search:SetFocus() end
        elseif settings:IsShown() then
            settings:HandleButton(button)
        elseif prices:IsShown() then
            prices:HandleButton(button)
        elseif spellMenu:IsShown() then
            spellMenu:HandleButton(button)
        elseif search:HasFocus() then
            if button == "PAD1" then search:ClearFocus()
            elseif button == "PAD3" then search:SetText("") end
        elseif (button == "PADLTRIGGER" or button == "PADRTRIGGER") and mainFrame.expanded and mainFrame.sideBySide then
            stickDirection = nil
            switchPane(button == "PADLTRIGGER" and mainFrame or mainFrame.weaponPage)
        elseif button == "PAD1" then
            stickDirection = nil
            toggleGroup()
        elseif button == "PADDUP" or button == "PADDDOWN" or button == "PADDLEFT" or button == "PADDRIGHT" then
            move(button)
        elseif button == "PAD3" and selected then
            if selected.spell and not selected.spell.isHeader and not selected.spell.npc then openSpellMenu(selected)
            else selected:GetScript("OnClick")(selected, "LeftButton") end
        elseif button == "PAD4" then
            mainFrame.categoryBanner:GetScript("OnClick")(mainFrame.categoryBanner)
        end
        return false
    end)
    root:SetScript("OnGamePadButtonUp", function(_, button)
        if held[button] == true and (button == "PAD2" or button == "PADLSHOULDER") then closing = true end
        held[button] = nil
        return false
    end)
    root:SetScript("OnGamePadStick", function(_, stick, x, y)
        if stick ~= "Movement" then return false end
        local strength = math.max(math.abs(x), math.abs(y))
        if strength < 0.3 or not canNavigateWithStick() then
            stickDirection = nil
            return false
        end
        local direction
        if math.abs(x) > math.abs(y) then direction = x > 0 and "PADDRIGHT" or "PADDLEFT"
        else direction = y > 0 and "PADDUP" or "PADDDOWN" end
        stickInterval = 0.15 - math.min(1, (strength - 0.3) / 0.7) * 0.1
        if math.abs(x) > math.abs(y) and not subgrid and (not mainFrame.expanded or mainFrame.sideBySide) then
            stickInterval = 0.25 -- slow down screen jumps
        end
        if direction ~= stickDirection then
            stickDirection, stickDelay = direction, 0.3
            move(direction)
        end
        return false
    end)
    root:SetScript("OnUpdate", function(_, elapsed)
        if not canNavigateWithStick() then stickDirection = nil end
        if not stickDirection then return end
        stickDelay = stickDelay - elapsed
        if stickDelay <= 0 then
            move(stickDirection)
            -- one repeat per frame prevents jumps
            stickDelay = stickInterval
        end
    end)
    tinsert(UISpecialFrames, root:GetName())

    local wasDown, wasAtEnd = false, false
    local observer = CreateFrame("Frame", nil, UIParent)
    local function updateDevice()
        -- snapshot only on device changes
        local mapped = C_GamePad and C_GamePad.GetDeviceMappedState and C_GamePad.GetDeviceMappedState()
        connected, buttonKeys = mapped ~= nil, {}
        if mapped then
            for index = 0, mapped.buttonCount - 1 do
                local key = C_GamePad.ButtonIndexToBinding(index)
                if key then buttonKeys[#buttonKeys + 1] = key end
            end
        end
        wasDown, wasAtEnd = IsKeyDown("PADRSHOULDER") == true, false
    end
    observer:RegisterEvent("GAME_PAD_CONNECTED")
    observer:RegisterEvent("GAME_PAD_DISCONNECTED")
    observer:RegisterEvent("GAME_PAD_CONFIGS_CHANGED")
    observer:RegisterEvent("GAME_PAD_ACTIVE_CHANGED")
    observer:SetScript("OnEvent", updateDevice)
    updateDevice()
    -- observe entry without capturing native input
    observer:SetScript("OnUpdate", function()
        local down = connected and IsKeyDown("PADRSHOULDER") == true
        local book = activeBook()
        local controls = book and book.PagedSpellsFrame.PagingControls
        local atEnd = connected and book and not book:GetNextCategoryMixin(true)
            and controls:GetCurrentPage() == controls:GetMaxPages() or false
        if root:IsShown() then
            if InCombatLockdown() or not connected or not book or not placeCover(book) then
                root:Hide()
            elseif book:GetTab() ~= nativeTab or SmartNavigation:GetCurrentButton() ~= nativeButton then
                root:Hide()
            elseif closing then
                local anyDown = false
                for _, key in ipairs(buttonKeys) do
                    if IsKeyDown(key) then anyDown = true; break end
                end
                if not anyDown then root:Hide() end
            elseif selected and (not selected:IsVisible() or (selected ~= total and not selected.spell)
                or not selectedPage:IsVisible()) then
                restoreSelection()
            end
        else
            releaseCapture() -- Defer protected cleanup until combat ends.
            if down and not wasDown and wasAtEnd and atEnd then enterBook(book) end
        end
        -- may need to use button events if we miss short taps
        wasDown, wasAtEnd = down, atEnd
        updatePreview(connected and book, atEnd and not InCombatLockdown())
    end)
end
