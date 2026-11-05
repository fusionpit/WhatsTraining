local _, wt = ...
local Forever = wt.Forever
local activeMenu, serial = nil, 0

local Description = {}
Description.__index = Description
local function description() return setmetatable({}, Description) end
function Description:AddInitializer(callback)
    self.initializers = self.initializers or {}
    self.initializers[#self.initializers + 1] = callback
end
local function addEntry(entries, entry)
    entries[#entries + 1] = setmetatable(entry, Description)
    return entry
end
function Description:CreateTitle(text) return addEntry(self, {kind = "title", text = text}) end
function Description:CreateDivider() self[#self + 1] = { kind = "divider" } end
function Description:CreateButton(text, action, value)
    return addEntry(self, {text = text, action = action, value = value})
end
function Description:CreateCheckbox(text, isSelected, action, value)
    return addEntry(self, {text = text, radio = false, isSelected = isSelected, action = action, value = value})
end
function Description:CreateRadio(text, isSelected, action, value)
    return addEntry(self, {text = text, radio = true, isSelected = isSelected, action = action, value = value})
end
function Description:CreateIconRow(setting)
    return addEntry(self, {kind = "iconrow", setting = setting})
end

local function createLegend(parent, prompts)
    local legend = InputPromptLegends.CreateInputLegend(parent, "inputLegend")
    legend:SetPoint("TOPLEFT")
    legend:SetFrameLevel(parent:GetFrameLevel() + 1)
    legend.promptContainerFrame:SetFrameLevel(legend:GetFrameLevel() + 1)
    for _, prompt in ipairs(prompts) do
        local frame = legend:GetOrCreatePromptFrameUsingTemplateAndInputs(prompt[1], prompt[2], GAMEPAD_PROMPT_DIVIDER_SLASH)
        frame:SetPromptText(prompt[3])
        frame:EnablePrompt()
    end
    legend:InitializePrompts()
    return legend
end

local Menu = {}
local function mixin(frame) for key, value in pairs(Menu) do frame[key] = value end end

local function acquire(menu, kind, create)
    local pool = menu.pools[kind] or {}
    menu.pools[kind] = pool
    local index = (menu.used[kind] or 0) + 1
    menu.used[kind] = index
    local element = pool[index]
    if not element then
        element = create(menu)
        pool[index] = element
    end
    element:Show()
    return element
end

local function createTitle(menu)
    local frame = CreateFrame("Frame", nil, menu)
    frame:SetHeight(20)
    frame.fontString = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.fontString:SetAllPoints()
    frame.fontString:SetTextColor(1, .82, 0)
    frame.fontString:SetJustifyH("LEFT")
    frame.fontString:SetWordWrap(false)
    return frame
end
function Menu:AddTitle(text)
    local frame = acquire(self, "title", createTitle)
    frame:SetPoint("TOPLEFT", 8, self.y)
    frame:SetPoint("TOPRIGHT", -8, self.y)
    frame.fontString:SetText(text)
    self.width = math.max(self.width, frame.fontString:GetUnboundedStringWidth() + 36)
    self.y = self.y - 20
    return frame
end

local function createDivider(menu)
    local divider = menu:CreateTexture(nil, "ARTWORK")
    divider:SetHeight(13)
    divider:SetTexture("Interface\\Common\\UI-TooltipDivider-Transparent")
    return divider
end
function Menu:AddDivider()
    local divider = acquire(self, "divider", createDivider)
    divider:SetPoint("TOPLEFT", 8, self.y)
    divider:SetPoint("TOPRIGHT", -8, self.y)
    self.y = self.y - 13
end

-- scripts are bound once per pooled button
-- and read the item's current slot
local function optionEnter(item)
    local menu = item.menu
    menu:Select(item.index)
    local root = menu.rootMenu
    root.hoverMenu, root.hoverIndex, root.hoverDelay = menu, item.index, .33
    root.hoverItem, root.mouseNavigation = item, true
end
local function optionLeave(item)
    if not InputUtil.IsGamepadUIEnabled() and not item.menu:HasOpenSubmenu(item.index) then item.focus:Hide() end
end
local function optionClick(item)
    local menu = item.menu
    menu.rootMenu.hoverMenu = nil
    menu:Select(item.index)
    menu:Activate()
end
local function createOption(menu)
    local item = CreateFrame("Button", nil, menu)
    item.menu = menu
    item:SetHeight(20)
    item.focus = item:CreateTexture(nil, "BACKGROUND")
    item.focus:SetAllPoints()
    item.focus:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    item.focus:SetBlendMode("ADD")
    item.text = item:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    item.text:SetHeight(20)
    item.text:SetJustifyH("LEFT")
    item.text:SetWordWrap(false)
    item.text:SetTextColor(1, 1, 1)
    item.fontString = item.text
    item:SetScript("OnEnter", optionEnter)
    item:SetScript("OnLeave", optionLeave)
    item:SetScript("OnClick", optionClick)
    return item
end
function Menu:AddOption(radio, text, isSelected, action, value)
    local item = acquire(self, "option", createOption)
    item.submenuIndex = nil
    if item.submenuArrow then item.submenuArrow:Hide() end
    item:SetPoint("TOPLEFT", 8, self.y)
    item:SetPoint("TOPRIGHT", -8, self.y)
    item.focus:Hide()
    if radio ~= nil then
        item.control = item.control or item:CreateTexture(nil, "ARTWORK")
        item.control:Show()
        item.control:SetAtlas(radio and "common-dropdown-tickradial" or "common-dropdown-ticksquare", true)
        item.control:SetPoint("LEFT", radio and -3 or 0, 0)
        item.check = item.check or item:CreateTexture(nil, "ARTWORK", nil, 1)
        item.check:SetAtlas(radio and "common-dropdown-icon-radialtick-yellow" or "common-dropdown-icon-checkmark-yellow", true)
        item.check:ClearAllPoints()
        if radio then item.check:SetPoint("TOPLEFT", item.control, "TOPLEFT")
        else item.check:SetPoint("CENTER", item.control, "CENTER", 2, 1) end
    elseif item.control then item.control:Hide(); item.check:Hide() end
    item.text:ClearAllPoints()
    if radio == nil then item.text:SetPoint("LEFT")
    else item.text:SetPoint("LEFT", item.control, "RIGHT", radio and 1 or 7, radio and 0 or 1) end
    item.text:SetText(text)
    local textWidth = item.text:GetUnboundedStringWidth()
    item.text:SetWidth(textWidth)
    local controlWidth = radio == nil and 0 or item.control:GetWidth() + (radio and -2 or 7)
    self.width = math.max(self.width, textWidth + controlWidth + 36)
    item.isSelected, item.action, item.value, item.radio = isSelected, action, value, radio
    self.items[#self.items + 1] = item
    item.index = #self.items
    self.y = self.y - 20
    return item
end

local function iconEnter(row)
    row.menu.rootMenu.hoverMenu = nil
    row.menu:Select(row.index)
end
local function createIconRow(menu)
    local row = wt.createIconPicker(menu)
    row.menu = menu
    row.onEnter, row.onLeave, row.onClick = iconEnter, optionLeave, optionClick
    row.focus = row:CreateTexture(nil, "OVERLAY")
    row.focus:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    row.focus:SetBlendMode("ADD")
    return row
end
function Menu:AddIconRow(entry)
    local row = acquire(self, "iconrow", createIconRow)
    row:Setup(entry.setting)
    row:SetPoint("TOPLEFT", 8, self.y - 2)
    row.focus:Hide()
    row.action = function()
        row:Activate()
        return MenuResponse.Refresh
    end
    self.items[#self.items + 1] = row
    row.index = #self.items
    self.width = math.max(self.width, row:GetWidth() + 16)
    self.y = self.y - 36
    return row
end

local function attachFontString(frame)
    frame.extraFontStrings = frame.extraFontStrings or {}
    frame.usedFonts = frame.usedFonts + 1
    local fontString = frame.extraFontStrings[frame.usedFonts]
    if not fontString then
        fontString = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        frame.extraFontStrings[frame.usedFonts] = fontString
    end
    fontString:ClearAllPoints()
    fontString:Show()
    return fontString
end
function Menu:Initialize(frame, entry)
    for _, fontString in ipairs(frame.extraFontStrings or {}) do fontString:Hide() end
    frame.usedFonts = 0
    frame.AttachFontString = attachFontString
    for _, initializer in ipairs(entry.initializers or {}) do
        local desiredWidth = initializer(frame)
        if desiredWidth then self.width = math.max(self.width, desiredWidth + 16) end
    end
end

local function controllerArt(menu)
    if menu.legend then return end
    local legend = createLegend(menu.footer, {
        { "StandardOneIcon", { GAMEPAD_FACE_BOTTOM }, ACTION_LABEL_SELECT },
        { "StandardOneIcon", { GAMEPAD_FACE_RIGHT }, FRAME_ACTION_CLOSE },
    })
    menu.legend = legend
    menu.footer:SetSize(legend:GetWidth(), legend:GetHeight())
    menu.backPrompt = legend:GetOrCreatePromptFrameUsingTemplateAndInputs("StandardOneIcon",
        { GAMEPAD_FACE_RIGHT }, GAMEPAD_PROMPT_DIVIDER_SLASH)
    local pointer = CreateFrame("Frame", nil, menu, "SmartNavigationPointerTemplate")
    pointer.IntroAnim:Stop()
    pointer.Icon:SetFrameStrata("TOOLTIP")
    pointer.Icon:SetFrameLevel(menu:GetFrameLevel() + 2)
    menu.pointer, menu.arrow = pointer, pointer.Icon.Cursor
end

function Menu:GetActiveMenu()
    if self.submenu and self.submenu:IsShown() then return self.submenu:GetActiveMenu() end
    return self
end
function Menu:CloseSubmenu()
    if self.submenu then self.submenu:Hide() end
    self.submenuIndex = nil
end
function Menu:HasOpenSubmenu(index)
    return self.submenuIndex == index and self.submenu ~= nil and self.submenu:IsShown()
end
function Menu:Select(index)
    if self.index then
        local old = self.items[self.index]
        old.focus:Hide()
    end
    local pointer, arrow = self.pointer, self.arrow
    if #self.items == 0 then
        self.index = nil
        if pointer then arrow:Hide(); pointer:Hide() end
        return
    end
    self.index = math.max(1, math.min(#self.items, index))
    local item = self.items[self.index]
    if item.icons then
        item.focus:ClearAllPoints()
        item.focus:SetAllPoints(item.icons[item.focusedIconIndex])
    end
    item.focus:SetShown(InputUtil.IsGamepadUIEnabled() or item:IsMouseOver() or self:HasOpenSubmenu(self.index))
    local focused = InputUtil.IsGamepadUIEnabled() and not (self.submenu and self.submenu:IsShown())
    self.footer:SetShown(focused)
    self.borderFrame:SetShown(focused)
    if not pointer then return end
    pointer:ClearAllPoints()
    -- zero offset from SmartNavigation's 32px frame
    pointer:SetPoint("LEFT", item, "LEFT", -32, 0)
    pointer:SetShown(focused)
    arrow:SetShown(InputUtil.IsGamepadUIEnabled())
end
function Menu:Refresh()
    for _, item in ipairs(self.items) do
        if item.check then item.check:SetShown(item.isSelected and item.isSelected(item.value) == true or false) end
    end
end
function Menu:OpenSubmenu(index)
    local item = self.items[index]
    if not item or not item.submenuIndex then self:CloseSubmenu(); return end
    if self.submenuIndex == index and self.submenu and self.submenu:IsShown() then return end
    self:CloseSubmenu()
    self.submenuIndex = index
    if not self.submenu then
        self.submenu = Forever.createMenu(self, function(_, entries)
            local source = self.items[self.submenuIndex]
            for _, entry in ipairs(source and source.entry or {}) do entries[#entries + 1] = entry end
        end, nil, self.rootMenu)
        self.submenu.parentMenu = self
    end
    local child = self.submenu
    child:Rebuild(1)
    child:ClearAllPoints()
    local right = (item:GetRight() + child:GetWidth() + 18) * child:GetEffectiveScale()
    child.opensLeft = self.opensLeft or right > UIParent:GetRight() * UIParent:GetEffectiveScale()
    if child.opensLeft then child:SetPoint("TOPRIGHT", item, "TOPLEFT", -8, 8)
    else child:SetPoint("TOPLEFT", item, "TOPRIGHT", 8, 8) end
    child:Show()
    self:Select(index)
end
function Menu:Activate()
    local item = self.items[self.index]
    if not item then return end
    if item.submenuIndex then
        self:OpenSubmenu(self.index)
    else self:CloseSubmenu() end
    if not item.action then return end
    local response = item.action(item.value)
    if not response then
        response = item.radio == false and MenuResponse.Refresh or item.submenuIndex and MenuResponse.Open or MenuResponse.CloseAll
    end
    if response == MenuResponse.Close then self:Hide()
    elseif response == MenuResponse.CloseAll then self.rootMenu:Hide()
    elseif response == MenuResponse.Refresh then self.rootMenu:Rebuild() end
end
function Menu:Back()
    self:Hide()
    if self.parentMenu then self.parentMenu:Select(self.parentMenu.submenuIndex or 1) end
end
function Menu:HandleButton(button)
    if not self:IsShown() then return false end
    self.rootMenu.hoverMenu, self.rootMenu.mouseNavigation = nil, false
    local leaf = self:GetActiveMenu()
    if leaf ~= self then return leaf:HandleButton(button) end
    local row = self.items[self.index or 0]
    if row and row.icons and (button == "PADDLEFT" or button == "PADDRIGHT") then
        row.focusedIconIndex = math.max(1, math.min(#row.icons, row.focusedIconIndex + (button == "PADDLEFT" and -1 or 1)))
        self:Select(self.index)
        return true
    end
    if button == "PADDUP" then self:Select((self.index or 1) - 1)
    elseif button == "PADDDOWN" then self:Select((self.index or 1) + 1)
    elseif button == "PAD1" then self:Activate()
    elseif button == "PAD2" or button == "PADDLEFT" then self:Back()
    elseif button == "PADDRIGHT" then
        local item = self.items[self.index]
        if item and item.submenuIndex then self:Activate() end
    else return false end
    return true
end
function Menu:Rebuild(selection)
    local index = selection or self.index or 1
    local value
    if not selection then value = self.items[index] and self.items[index].value end
    for kind, pool in pairs(self.pools) do
        self.used[kind] = 0
        for _, element in ipairs(pool) do element:Hide() end
    end
    self.items, self.index, self.y, self.width = {}, nil, -8, 50 + 16
    local entries = description()
    self.generator(self.rootMenu.owner, entries)
    for entryIndex, entry in ipairs(entries) do
        if entry.kind == "title" then self:Initialize(self:AddTitle(entry.text), entry)
        elseif entry.kind == "divider" then self:AddDivider()
        elseif entry.kind == "iconrow" then self:AddIconRow(entry)
        else
            local item = self:AddOption(entry.radio, entry.text, entry.isSelected, entry.action, entry.value)
            item.entry = entry
            self:Initialize(item, entry)
            if #entry > 0 then
                item.submenuIndex = entryIndex
                item.submenuArrow = item.submenuArrow or item:CreateTexture(nil, "ARTWORK")
                item.submenuArrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
                item.submenuArrow:SetPoint("RIGHT")
                item.submenuArrow:SetSize(16, 16)
                item.submenuArrow:Show()
                self.width = math.max(self.width, item.text:GetUnboundedStringWidth() + 52)
            end
        end
    end
    if self.legend then
        self.backPrompt:SetPromptText(self.parentMenu and BACK or FRAME_ACTION_CLOSE)
        self.legend:InitializePrompts()
        self.footer:SetSize(self.legend:GetWidth(), self.legend:GetHeight())
    end
    self:SetWidth(self.width)
    self:SetHeight(-self.y + 15)
    if value ~= nil then
        for i, item in ipairs(self.items) do if item.value == value then index = i; break end end
    end
    self:Refresh()
    local childItem = self.items[self.submenuIndex or 0]
    if self.submenu and self.submenu:IsShown() then
        if childItem and #childItem.entry > 0 then self.submenu:Rebuild()
        else self:CloseSubmenu() end
    end
    self:Select(index)
end
function Menu:ContainsMouse()
    if self:IsMouseOver() or (self.footer:IsShown() and self.footer:IsMouseOver()) then return true end
    return self.submenu and self.submenu:IsShown() and self.submenu:ContainsMouse() or false
end

local function updateCapture(menu)
    if menu.rootMenu ~= menu or InCombatLockdown() then return end
    local capture = menu:IsShown() and menu.gamepad and not menu.forwardedInput or false
    if (menu.capturingInput or false) ~= capture then
        menu:EnableGamePadButton(capture)
        menu.capturingInput = capture
    end
end
local function onShow(menu)
    menu.gamepad = InputUtil.IsGamepadUIEnabled()
    if menu.gamepad then controllerArt(menu) end
    menu.borderFrame:SetShown(menu.gamepad)
    menu.footer:SetShown(menu.gamepad)
    if menu.rootMenu == menu then
        if activeMenu and activeMenu ~= menu then activeMenu:Hide() end
        activeMenu = menu
    end
    menu:CloseSubmenu()
    menu:Rebuild()
    updateCapture(menu)
end
local function onHide(menu)
    menu:CloseSubmenu()
    menu.hoverMenu = nil
    if activeMenu == menu then activeMenu = nil end
    updateCapture(menu)
    if menu.parentMenu then menu.parentMenu:Select(menu.parentMenu.index or 1) end
    if menu.contextMenu then
        -- per-open controller state ends with the open
        local callback = menu.closeCallback
        menu.forwardedInput, menu.closeCallback = nil, nil
        if callback then callback(menu) end
    end
end
local function onEvent(menu, event)
    if event == "PLAYER_REGEN_ENABLED" then
        updateCapture(menu)
    elseif event == "PLAYER_REGEN_DISABLED" then menu:Hide()
    -- a dropdown's owner toggles it on its own click
    elseif menu:IsShown() and not menu:ContainsMouse()
        and not (menu.owner and not menu.contextMenu and menu.owner:IsMouseOver()) then menu:Hide() end
end
local function onGamePadButtonDown(menu, button)
    menu:HandleButton(button)
    return false
end
local function onUpdate(menu, elapsed)
    local owner = menu.owner
    if not menu:GetParent():IsVisible() or (owner and not owner:IsVisible())
        or menu.gamepad ~= InputUtil.IsGamepadUIEnabled() then menu:Hide(); return end
    if menu.hoverMenu then
        menu.hoverDelay = menu.hoverDelay - elapsed
        if menu.hoverDelay <= 0 then
            local panel, index = menu.hoverMenu, menu.hoverIndex
            menu.hoverMenu = nil
            if panel:IsShown() and menu.hoverItem:IsMouseOver() then panel:OpenSubmenu(index) end
        end
    end
    if menu.mouseNavigation and menu.submenu and menu.submenu:IsShown() and not menu:ContainsMouse() then
        menu.outsideDelay = (menu.outsideDelay or .33) - elapsed
        if menu.outsideDelay <= 0 then menu:CloseSubmenu(); menu:Select(menu.index or 1) end
    else menu.outsideDelay = nil end
end

-- own the frames/input and never enter Blizzard's menu manager or focus tree
-- layout behavior follows Blizzard_Menu in the Forever client
-- owner and generator are plain fields so one frame can serve many owners
function Forever.createMenu(parent, generator, owner, rootMenu)
    serial = serial + 1
    local name = not rootMenu and "WhatsTrainingMenu" .. serial or nil
    local menu = CreateFrame("Frame", name, parent)
    mixin(menu)
    menu:Hide()
    menu.rootMenu = rootMenu or menu
    menu.owner, menu.generator = owner, generator
    menu.pools, menu.used, menu.items = {}, {}, {}
    menu.y, menu.width = -8, 50 + 16
    if name then tinsert(UISpecialFrames, name) end
    menu:SetFrameStrata("TOOLTIP")
    menu:SetFrameLevel(parent:GetFrameLevel() + 80)
    menu:SetClampedToScreen(true)
    menu.backing = menu:CreateTexture(nil, "BACKGROUND")
    menu.backing:SetPoint("TOPLEFT", -10, 3)
    menu.backing:SetPoint("BOTTOMRIGHT", 10, -3)
    menu.backing:SetAtlas("common-dropdown-bg")
    menu.backing:SetAlpha(0.925)
    menu.borderFrame = CreateFrame("Frame", nil, menu)
    menu.borderFrame:SetPoint("TOPLEFT", -18, 13)
    menu.borderFrame:SetPoint("BOTTOMRIGHT", 17, -7)
    menu.border = menu.borderFrame:CreateTexture(nil, "OVERLAY")
    menu.border:SetScale(0.5)
    menu.border:SetAllPoints()
    menu.border:SetAtlas("gamepad-menuproxy-focus-prototype")
    menu.border:SetVertexColor(1, 0.9, 0.4)
    menu:EnableMouse(true)
    menu:EnableMouseWheel(true)
    menu:SetScript("OnMouseWheel", function() end)
    menu.footer = CreateFrame("Frame", nil, menu)
    menu.footer:SetPoint("TOPLEFT", menu, "BOTTOMLEFT")
    if InputUtil.IsGamepadUIEnabled() then controllerArt(menu) end
    menu:Rebuild()
    menu:SetScript("OnShow", onShow)
    menu:SetScript("OnHide", onHide)
    if not rootMenu then
        menu:RegisterEvent("GLOBAL_MOUSE_DOWN")
        menu:RegisterEvent("PLAYER_REGEN_ENABLED")
        menu:RegisterEvent("PLAYER_REGEN_DISABLED")
        menu:SetScript("OnEvent", onEvent)
        menu:SetScript("OnGamePadButtonDown", onGamePadButtonDown)
        menu:SetScript("OnUpdate", onUpdate)
    end
    return menu
end

-- one popup for every pooled row and header, re-anchored on each open
-- gamepad controllers pass input, lasting one open:
-- forwardedInput relays buttons through HandleButton
-- onHide fires once when the open ends
local contextMenu
function Forever.contextMenu() return contextMenu end
function Forever.openContextMenu(owner, generator, input)
    local menu = contextMenu
    if not menu then
        menu = Forever.createMenu(UIParent, generator, owner)
        menu.contextMenu = true
        contextMenu = menu
    end
    if menu:IsShown() and menu.owner ~= owner then menu:Hide() end
    menu.owner, menu.generator = owner, generator
    menu.forwardedInput, menu.closeCallback = input and input.forwardedInput, input and input.onHide
    menu:SetFrameLevel(owner:GetFrameLevel() + 80)
    menu:SetScale(owner:GetEffectiveScale() / UIParent:GetEffectiveScale())
    menu:ClearAllPoints()
    if InputUtil.IsGamepadUIEnabled() then
        menu:SetPoint("TOPLEFT", owner, "BOTTOMLEFT", 0, -2)
    else
        local x, y = GetCursorPosition()
        local scale = menu:GetEffectiveScale()
        menu:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale, y / scale)
    end
    if menu:IsShown() then menu:Rebuild(1); updateCapture(menu)
    else
        -- OnShow builds
        -- drop the last generator's items
        menu.items, menu.index = {}, nil
        menu:Show()
    end
    return menu
end

-- plain Buttons: no DropdownButton scripts, mixins or templates
function Forever.createDropdown(parent, name, filter)
    local button = CreateFrame("Button", name, parent)
    button:SetSize(filter and 108 or 15, filter and 18 or 16)
    if not filter then
        local normal = button:CreateTexture(nil, "ARTWORK")
        normal:SetAtlas("common-dropdown-a-button", true)
        normal:SetPoint("CENTER")
        button:SetNormalTexture(normal)
        local pushed = button:CreateTexture(nil, "ARTWORK")
        pushed:SetAtlas("common-dropdown-a-button-pressed", true)
        pushed:SetPoint("CENTER")
        button:SetPushedTexture(pushed)
        local highlight = button:CreateTexture(nil, "HIGHLIGHT")
        highlight:SetAtlas("common-dropdown-a-button", true)
        highlight:SetPoint("CENTER")
        highlight:SetAlpha(.4)
        button:SetHighlightTexture(highlight, "ADD")
    end
    if filter then
        button.Background = button:CreateTexture(nil, "BACKGROUND")
        button.Background:SetAtlas("common-dropdown-b-button")
        button.Background:SetPoint("TOPLEFT", -4, 4)
        button.Background:SetPoint("BOTTOMRIGHT", 4, -4)
        button.Text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.Text:SetPoint("CENTER")
        button.Text:SetText(FILTER)
        button.ResetButton = CreateFrame("Button", nil, button, "UIResetButtonTemplate")
        button.ResetButton:SetPoint("CENTER", button, "TOPRIGHT", -3, 0)
        button.ResetButton:Hide()
        button.ResetButton:SetScript("OnClick", function() if button.defaultCallback then button.defaultCallback() end end)
        button:SetScript("OnEnter", function() button.Background:SetAtlas("common-dropdown-b-button-hover") end)
        button:SetScript("OnLeave", function() button.Background:SetAtlas("common-dropdown-b-button") end)
        button:SetScript("OnMouseDown", function() button.Background:SetAtlas("common-dropdown-b-button-pressed") end)
        button:SetScript("OnMouseUp", function() button.Background:SetAtlas("common-dropdown-b-button-hover") end)
    end
    function button:SetIsDefaultCallback(callback) self.isDefaultCallback = callback end
    function button:SetDefaultCallback(callback) self.defaultCallback = callback end
    function button:ValidateResetState()
        if self.ResetButton and self.isDefaultCallback then self.ResetButton:SetShown(not self.isDefaultCallback()) end
    end
    function button:GenerateMenu()
        self:ValidateResetState()
        if self.popup and self.popup:IsShown() then self.popup:Rebuild() end
    end
    function button:SetupMenu(callback) self.generator = callback; self:GenerateMenu() end
    function button:GetMenu()
        if not self.popup then
            self.popup = Forever.createMenu(self, function(_, entries) self.generator(self, entries) end, self)
            self.popup:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -4)
        end
        return self.popup
    end
    function button:OpenMenu()
        local popup = self:GetMenu()
        popup:SetShown(not popup:IsShown())
    end
    button:SetScript("OnClick", function(self) self:OpenMenu() end)
    button:SetScript("OnHide", function(self) if self.popup then self.popup:Hide() end end)
    return button
end

Forever.createInputLegend = createLegend
