local _, wt = ...
local Forever = wt.Forever

local Description = {}
Description.__index = Description
local function description() return setmetatable({}, Description) end
function Description:CreateTitle(text) self[#self + 1] = { kind = "title", text = text } end
function Description:CreateDivider() self[#self + 1] = { kind = "divider" } end
function Description:CreateButton(text, action, value)
    local children = not action and description() or nil
    self[#self + 1] = { text = text, action = action, value = value, children = children }
    return children
end
function Description:CreateCheckbox(text, isSelected, action, value)
    self[#self + 1] = { text = text, radio = false, isSelected = isSelected, action = action, value = value }
end
function Description:CreateRadio(text, isSelected, action, value)
    self[#self + 1] = { text = text, radio = true, isSelected = isSelected, action = action, value = value }
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

-- Callers anchor the menu and forward input through HandleButton.
-- basically a copy of the default ui's menu creation, tweaked some
function Forever.createMenu(parent, generator, owner)
    local menu = CreateFrame("Frame", nil, parent)
    menu:Hide()
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
    local footer = CreateFrame("Frame", nil, menu)
    menu.footer = footer
    footer:SetPoint("TOPLEFT", menu, "BOTTOMLEFT")
    local legend = createLegend(footer, {
        { "StandardOneIcon", { GAMEPAD_FACE_BOTTOM }, ACTION_LABEL_SELECT },
        { "StandardOneIcon", { GAMEPAD_FACE_RIGHT }, FRAME_ACTION_CLOSE },
    })
    footer:SetSize(legend:GetWidth(), legend:GetHeight())
    local backPrompt = legend:GetOrCreatePromptFrameUsingTemplateAndInputs("StandardOneIcon",
        { GAMEPAD_FACE_RIGHT }, GAMEPAD_PROMPT_DIVIDER_SLASH)
    local width = 50 + 16
    local pointer = CreateFrame("Frame", nil, menu, "SmartNavigationPointerTemplate")
    pointer.IntroAnim:Stop()
    pointer.Icon:SetFrameStrata("TOOLTIP")
    pointer.Icon:SetFrameLevel(menu:GetFrameLevel() + 2)
    local arrow = pointer.Icon.Cursor
    menu.arrow = arrow
    menu.items, menu.path = {}, {}
    local y = -8
    function menu:Select(index)
        if self.index then
            local old = self.items[self.index]
            old.focus:Hide()
        end
        if #self.items == 0 then self.index = nil; arrow:Hide(); pointer:Hide(); return end
        self.index = math.max(1, math.min(#self.items, index))
        local item = self.items[self.index]
        item.focus:Show()
        pointer:ClearAllPoints()
        -- zero offset from SmartNavigation's 32px frame
        pointer:SetPoint("LEFT", item, "LEFT", -32, 0)
        arrow:Show()
        pointer:Show()
    end
    function menu:Refresh()
        for _, item in ipairs(self.items) do
            if item.check then item.check:SetShown(item.isSelected and item.isSelected(item.value) == true or false) end
        end
    end
    function menu:Activate()
        local item = self.items[self.index]
        if not item then return end
        if item.submenuIndex then
            self.path[#self.path + 1] = { entry = item.submenuIndex, index = self.index }
            return self:Rebuild(1)
        end
        if item.action and item.action(item.value) == MenuResponse.Close then self:Hide() else self:Rebuild() end
    end
    function menu:Back()
        local previous = table.remove(self.path)
        if previous then self:Rebuild(previous.index) else self:Hide() end
    end
    function menu:HandleButton(button)
        if not self:IsShown() then return false end
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
    local pools, used = {}, {}
    local function acquire(kind, create)
        local pool = pools[kind] or {}; pools[kind] = pool
        used[kind] = (used[kind] or 0) + 1
        local index = used[kind]
        pool[index] = pool[index] or create()
        pool[index]:Show()
        return pool[index]
    end
    local function title(text)
        local title = acquire("title", function() return menu:CreateFontString(nil, "OVERLAY", "GameFontNormal") end)
        title:SetPoint("TOPLEFT", 8, y)
        title:SetPoint("TOPRIGHT", -8, y)
        title:SetHeight(20)
        title:SetJustifyH("LEFT")
        title:SetWordWrap(false)
        title:SetText(text)
        width = math.max(width, title:GetUnboundedStringWidth() + 36)
        y = y - 20
    end
    local function divider()
        local divider = acquire("divider", function() return menu:CreateTexture(nil, "ARTWORK") end)
        divider:SetPoint("TOPLEFT", 8, y)
        divider:SetPoint("TOPRIGHT", -8, y)
        divider:SetHeight(13)
        divider:SetTexture("Interface\\Common\\UI-TooltipDivider-Transparent")
        y = y - 13
    end
    local function option(radio, text, isSelected, action, value)
        local item = acquire("option", function() return CreateFrame("Button", nil, menu) end)
        item.submenuIndex = nil
        if item.submenuArrow then item.submenuArrow:Hide() end
        item:SetPoint("TOPLEFT", 8, y)
        item:SetPoint("TOPRIGHT", -8, y)
        item.focus = item.focus or item:CreateTexture(nil, "BACKGROUND")
        item.focus:SetAllPoints()
        item.focus:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
        item.focus:SetBlendMode("ADD")
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
            else
                item.check:SetPoint("CENTER", item.control, "CENTER", 2, 1)
            end
        elseif item.control then item.control:Hide(); item.check:Hide() end
        item.text = item.text or item:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        item.text:ClearAllPoints()
        if radio == nil then item.text:SetPoint("LEFT")
        else item.text:SetPoint("LEFT", item.control, "RIGHT", radio and 1 or 7, radio and 0 or 1) end
        item.text:SetHeight(20)
        item.text:SetJustifyH("LEFT")
        item.text:SetWordWrap(false)
        item.text:SetText(text)
        local textWidth = item.text:GetUnboundedStringWidth()
        item.text:SetWidth(textWidth)
        local controlWidth = radio == nil and 0 or item.control:GetWidth() + (radio and -2 or 7)
        width = math.max(width, textWidth + controlWidth + 36)
        item:SetHeight(20)
        item.isSelected, item.action, item.value = isSelected, action, value
        menu.items[#menu.items + 1] = item
        local index = #menu.items
        item:SetScript("OnEnter", function() menu:Select(index) end)
        item:SetScript("OnClick", function() menu:Select(index); menu:Activate() end)
        y = y - 20
        return item
    end
    function menu:Rebuild(selection)
        local index = selection or self.index or 1
        local value
        if not selection then value = self.items[index] and self.items[index].value end
        for kind, pool in pairs(pools) do
            used[kind] = 0
            for _, element in ipairs(pool) do element:Hide() end
        end
        self.items, self.index, y, width = {}, nil, -8, 50 + 16
        local entries = description()
        generator(owner, entries)
        for depth, step in ipairs(self.path) do
            local entry = entries[step.entry]
            if not entry or not entry.children then
                index, value = step.index, nil
                for i = #self.path, depth, -1 do self.path[i] = nil end
                break
            end
            entries = entry.children
        end
        for entryIndex, entry in ipairs(entries) do
            if entry.kind == "title" then title(entry.text)
            elseif entry.kind == "divider" then divider()
            else
                local item = option(entry.radio, entry.text, entry.isSelected, entry.action, entry.value)
                if entry.children then
                    item.submenuIndex = entryIndex
                    item.submenuArrow = item.submenuArrow or item:CreateTexture(nil, "ARTWORK")
                    item.submenuArrow:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
                    item.submenuArrow:SetPoint("RIGHT")
                    item.submenuArrow:SetSize(16, 16)
                    item.submenuArrow:Show()
                    width = math.max(width, item.text:GetUnboundedStringWidth() + 52)
                end
            end
        end
        backPrompt:SetPromptText(#self.path > 0 and BACK or FRAME_ACTION_CLOSE)
        legend:InitializePrompts()
        footer:SetSize(legend:GetWidth(), legend:GetHeight())
        self:SetWidth(width)
        self:SetHeight(-y + 15)
        if value ~= nil then
            for i, item in ipairs(self.items) do if item.value == value then index = i; break end end
        end
        self:Refresh()
        self:Select(index)
    end
    menu:Rebuild()
    menu:SetScript("OnShow", function()
        local selection = menu.path[1] and menu.path[1].index
        menu.path = {}
        menu:Rebuild(selection)
    end)
    return menu
end

Forever.createInputLegend = createLegend
