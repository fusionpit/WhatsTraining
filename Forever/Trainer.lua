local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")
-- own tooltip: the ignored lines use a smaller font
local tooltip = CreateFrame("GameTooltip", "WhatsTrainingTrainerTooltip", UIParent, "GameTooltipTemplate")
local button, confirmation, pending, timeout

local function isClassTrainer()
    return WT_TrainAll == true and ClassTrainerFrame and ClassTrainerFrame:IsVisible() and not InCombatLockdown()
        and not IsTradeskillTrainer() and C_Trainer.GetTrainerType() == Enum.TrainerType.General
end

local function services()
    local available, ignored, ignoredByName, cost = {}, {}, {}, 0
    local step = GetTrainerServiceStepIndex()
    for index = 1, GetNumTrainerServices() do
        local name, serviceType, _, _, rank = GetTrainerServiceInfo(index)
        if name and serviceType == "available" and index ~= step then
            local data = C_TooltipInfo.GetTrainerService(index)
            if data and data.type == Enum.TooltipDataType.Spell and data.id then
                if ignoreStore:IsIgnored(data.id) then
                    if not wt.isAbilityKnown(data.id) then
                        name = wt.stripRankNumeral(name, rank)
                        local group = ignoredByName[name]
                        if not group then
                            group = {name = name, rank = rank, count = 0}
                            ignoredByName[name] = group
                            ignored[#ignored + 1] = group
                        end
                        group.count = group.count + 1
                    end
                else
                    local serviceCost, isProfession = GetTrainerServiceCost(index)
                    -- professions need the native slot check and popup
                    if not isProfession then
                        available[#available + 1] = {index = index, id = data.id, cost = serviceCost}
                        cost = cost + serviceCost
                    end
                end
            end
        end
    end
    return available, cost, ignored
end

local function hideTooltip()
    if tooltip:IsOwned(button) then tooltip:Hide() end
end

local function addIgnoredLine(text)
    tooltip:AddLine(text, 1, 1, 1, false, 10)
    tooltip:GetLeftLine(tooltip:NumLines()):SetFontObject("GameFontHighlightSmall")
end

local function showTooltip()
    if confirmation and confirmation:IsShown() then return end
    local available, cost, ignored = services()
    local money = GetMoneyString(cost)
    if GetMoney() < cost then money = RED_FONT_COLOR:WrapTextInColorCode(money) end
    tooltip:SetOwner(button, "ANCHOR_RIGHT")
    tooltip:SetText(string.format(wt.L.TRAIN_ALL_FORMAT, #available, money))
    if #ignored > 0 then
        tooltip:AddLine(" ")
        tooltip:AddLine(wt.L.TRAINER_IGNORED_HEADER, 1, 1, 1)
        -- keep the list under half the screen
        local screenHeight = UIParent:GetHeight() * UIParent:GetEffectiveScale() / tooltip:GetEffectiveScale()
        local limit = math.max(2, math.min(10, math.floor((screenHeight / 2 - 64) / 16)))
        local shown = #ignored > limit and limit - 1 or #ignored
        for index = 1, shown do
            local group = ignored[index]
            local text = group.name
            if group.count > 1 then
                text = string.format(wt.L.TRAINER_IGNORED_RANKS_FORMAT, group.count, group.name)
            elseif group.rank and group.rank ~= "" then
                text = string.format(wt.L.NAME_WITH_RANK, group.name, group.rank)
            end
            addIgnoredLine(text)
        end
        if shown < #ignored then
            addIgnoredLine(string.format(wt.L.TRAINER_IGNORED_MORE_FORMAT, #ignored - shown))
        end
    elseif not ignoreStore:HasIgnored() then
        -- nothing ignored anywhere yet: point out that ignoring shapes this button
        tooltip:AddLine(wt.L.TRAIN_ALL_IGNORE_HINT, 0.6, 0.6, 0.6, true)
        tooltip:GetLeftLine(tooltip:NumLines()):SetFontObject("GameFontHighlightSmall")
    end
    tooltip:Show()
end

local function recordLearned()
    if not pending then return false end
    local used = {}
    for index = 1, GetNumTrainerServices() do
        local _, serviceType = GetTrainerServiceInfo(index)
        if serviceType == "used" then
            local data = C_TooltipInfo.GetTrainerService(index)
            if data and data.type == Enum.TooltipDataType.Spell and data.id then used[data.id] = true end
        end
    end
    local progressed = false
    for id, cost in pairs(pending.costs) do
        if used[id] or wt.isAbilityKnown(id) then
            pending.costs[id] = nil
            pending.learned = pending.learned + 1
            pending.cost = pending.cost + cost
            progressed = true
        end
    end
    return progressed
end

local function finishTraining()
    if not pending then return end
    recordLearned()
    local finished = pending
    pending = nil
    if timeout then timeout:Cancel(); timeout = nil end
    if finished.learned > 0 then
        print(string.format(wt.L.TRAIN_LEARNED_FORMAT, finished.learned, GetMoneyString(finished.cost)))
    end
end

local function refresh()
    if not isClassTrainer() then button:Hide(); return end
    -- skip the rescan on each TRAINER_UPDATE of the batch
    if pending then button:SetEnabled(false)
    else
        local available, cost = services()
        button:SetEnabled(#available > 0 and GetMoney() >= cost)
    end
    if button:IsShown() and (button:IsMouseOver() or button.controllerActive) then showTooltip() end
end

local function startTimeout()
    if timeout then timeout:Cancel() end
    timeout = C_Timer.NewTimer(5, function() finishTraining(); refresh() end)
end

local function purchaseAll(confirmed)
    if pending or not isClassTrainer() then return end
    local available, cost = services()
    if #available == 0 or GetMoney() < cost then return end
    -- never purchase a different batch from the one the player confirmed
    if #available ~= #confirmed then return end
    for index, service in ipairs(available) do
        local quoted = confirmed[index]
        if service.id ~= quoted.id or service.index ~= quoted.index or service.cost ~= quoted.cost then return end
    end
    pending = {costs = {}, learned = 0, cost = 0}
    for _, service in ipairs(available) do pending.costs[service.id] = service.cost end
    -- pending blocks a second click
    -- the timeout frees it when a purchase is refused
    startTimeout()
    refresh()
    -- backwards, learned rows may leave the list at once
    for index = #available, 1, -1 do BuyTrainerService(available[index].index) end
end

local function acceptConfirmation()
    local confirmed = confirmation.confirmed
    confirmation:Hide()
    if confirmed then purchaseAll(confirmed) end
end

-- StaticPopupButtonTemplate template registers with TextSizeManager, which taints it in some circumstances
local function createDialogButton(name, parent)
    local button = CreateFrame("Button", name, parent)
    local text = button:CreateFontString(nil, "OVERLAY")
    text:SetPoint("CENTER", 0, 1)
    button:SetFontString(text)
    button:SetNormalFontObject("UserScaledFontGameNormal")
    button:SetDisabledFontObject("UserScaledFontGameDisable")
    button:SetHighlightFontObject("UserScaledFontGameHighlight")
    button:SetNormalTexture("Interface\\Buttons\\UI-DialogBox-Button-Up")
    button:SetPushedTexture("Interface\\Buttons\\UI-DialogBox-Button-Down")
    button:SetDisabledTexture("Interface\\Buttons\\UI-DialogBox-Button-Disabled")
    button:SetHighlightTexture("Interface\\Buttons\\UI-DialogBox-Button-Highlight", "ADD")
    for _, texture in ipairs({button:GetNormalTexture(), button:GetPushedTexture(), button:GetDisabledTexture(), button:GetHighlightTexture()}) do
        texture:SetTexCoord(0, 1, 0, 0.71875)
    end
    return button
end

local function createConfirmation()
    local frame = CreateFrame("Frame", "WhatsTrainingTrainAllConfirmation", UIParent)
    frame:Hide()
    frame:SetFrameStrata("DIALOG")
    frame:SetFrameLevel(600)
    frame:SetPoint("TOP", UIParent, "TOP", 0, -135)
    frame:SetWidth(320)
    frame:SetClampedToScreen(true)
    local background = frame:CreateTexture(nil, "BACKGROUND", nil, -7)
    background:SetAtlas("UI-DialogBox-Background-Dark")
    background:SetPoint("TOPLEFT", 7, -7)
    background:SetPoint("BOTTOMRIGHT", -7, 7)
    local border = frame:CreateTexture(nil, "BACKGROUND", nil, -4)
    border:SetAtlas("UI-DiamondDialogBox-Border")
    border:SetAllPoints()
    frame:EnableMouse(true)
    frame:EnableKeyboard(true)
    frame:SetScript("OnKeyDown", function(self, key)
        if InCombatLockdown() then return end
        self:SetPropagateKeyboardInput(key ~= "ESCAPE")
        if key == "ESCAPE" then self:Hide() end
    end)
    frame:SetScript("OnHide", function(self)
        self.confirmed = nil
        PlaySound(SOUNDKIT.IG_MAINMENU_CLOSE)
    end)
    frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.text:SetPoint("TOP", 0, -16)
    frame.text:SetWidth(290)
    -- native visuals, own handlers
    local accept = createDialogButton("WhatsTrainingTrainAllAccept", frame)
    accept:SetSize(120, 21)
    accept:SetPoint("BOTTOMRIGHT", frame, "BOTTOM", -5, 16)
    accept:SetText(wt.L.TRAIN_ALL)
    accept:SetScript("OnClick", acceptConfirmation)
    local cancel = createDialogButton("WhatsTrainingTrainAllCancel", frame)
    cancel:SetSize(120, 21)
    cancel:SetPoint("BOTTOMLEFT", frame, "BOTTOM", 5, 16)
    cancel:SetText(CANCEL)
    cancel:SetScript("OnClick", function() frame:Hide() end)
    -- reserve the gamepad icon: AddGamepadIconToButton's floor(21 * 0.8) icon plus its 3px gap
    local pad = 20 + 16 + 3
    local width = math.max(120, accept:GetTextWidth() + pad, cancel:GetTextWidth() + pad)
    accept:SetWidth(width)
    cancel:SetWidth(width)
    frame:SetWidth(math.max(320, width * 2 + 10 + 32))
    local acceptIcon = GamepadMode.AddGamepadIconToButton(accept, GAMEPAD_FACE_BOTTOM)
    local cancelIcon = GamepadMode.AddGamepadIconToButton(cancel, GAMEPAD_FACE_RIGHT)
    local function updateIcons()
        local shown = InputUtil.IsGamepadUIEnabled()
        GamepadMode.SetGamepadIconShown(acceptIcon, shown)
        GamepadMode.SetGamepadIconShown(cancelIcon, shown)
    end
    frame:RegisterEvent("INPUT_DEVICE_INTERFACE_TRANSITION")
    frame:SetScript("OnEvent", updateIcons)
    frame:SetScript("OnShow", function()
        updateIcons()
        PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)
    end)
    updateIcons()
    return frame
end

local function trainAll()
    if pending or confirmation:IsShown() or not isClassTrainer() then return end
    local available, cost = services()
    if #available == 0 or GetMoney() < cost then return end
    hideTooltip()
    confirmation.confirmed = available
    confirmation.text:SetText(string.format(wt.L.CONFIRM_TRAIN_ALL_FORMAT, #available, GetMoneyString(cost)))
    confirmation:SetHeight(confirmation.text:GetStringHeight() + 62)
    confirmation:Show()
end

local function createController(observer)
    local root = CreateFrame("Frame", "WhatsTrainingTrainerController", UIParent)
    root:SetFrameStrata("DIALOG")
    root:SetFrameLevel(500)
    root:SetClampedToScreen(true)
    root:EnableMouse(true)
    root:Hide()
    local backing = root:CreateTexture(nil, "BACKGROUND")
    backing:SetAllPoints()
    backing:SetColorTexture(0.035, 0.03, 0.02, 1)
    local legend = wt.Forever.createInputLegend(root, {
        {"StandardOneIcon", {GAMEPAD_FACE_BOTTOM}, TRAIN},
        {"StandardOneIcon", {GAMEPAD_FACE_LEFT}, wt.L.TRAIN_ALL},
        {"StandardOneIcon", {GAMEPAD_FACE_TOP}, RADIAL_LABEL_SPELLBOOK},
        {"StandardOneIcon", {GAMEPAD_FACE_RIGHT}, FRAME_ACTION_CLOSE},
    })
    local selectPrompt = legend:GetOrCreatePromptFrameUsingTemplateAndInputs("StandardOneIcon",
        {GAMEPAD_FACE_BOTTOM}, GAMEPAD_PROMPT_DIVIDER_SLASH)
    local confirmLegend = wt.Forever.createInputLegend(root, {
        {"StandardOneIcon", {GAMEPAD_FACE_BOTTOM}, wt.L.GAMEPAD_HOLD_TRAIN_ALL},
        {"StandardOneIcon", {GAMEPAD_FACE_RIGHT}, FRAME_ACTION_BACK},
    })
    local holdPrompt = confirmLegend:GetOrCreatePromptFrameUsingTemplateAndInputs("StandardOneIcon",
        {GAMEPAD_FACE_BOTTOM}, GAMEPAD_PROMPT_DIVIDER_SLASH)
    holdPrompt:SetIsHoldAction(true)
    confirmLegend:Hide()
    local dialogLegend = wt.Forever.createInputLegend(root, {
        {"StandardOneIcon", {GAMEPAD_FACE_BOTTOM}, wt.L.TRAIN_ALL},
        {"StandardOneIcon", {GAMEPAD_FACE_RIGHT}, CANCEL},
    })
    dialogLegend:Hide()

    local sink = CreateFrame("Button", "WhatsTrainingTrainerControllerSink", root)
    sink:RegisterForClicks("AnyDown", "AnyUp")
    local connected = C_GamePad.GetDeviceMappedState() ~= nil
    local held, draining, bindingMode, holdTimer, selected = {}, false, 0
    local suspended = InCombatLockdown()
    local function focused()
        return connected and not suspended and button:IsVisible() and InputUtil.IsGamepadUIEnabled() and not InCombatLockdown()
            and SmartNavigation and SmartNavigation:IsShown() and SmartNavigation:GetActiveFrame() == ClassTrainerFrame
    end
    local function bind(mode)
        if mode == bindingMode or InCombatLockdown() then return end
        ClearOverrideBindings(root)
        if mode > 0 then SetOverrideBindingClick(root, true, "PAD3", sink:GetName(), "PAD3") end
        if mode == 2 then
            SetOverrideBindingClick(root, true, "PAD1", sink:GetName(), "PAD1")
            SetOverrideBindingClick(root, true, "PAD2", sink:GetName(), "PAD2")
        end
        bindingMode = mode
    end
    local function cancelHold()
        if holdTimer then holdTimer:Cancel(); holdTimer = nil end
        holdPrompt:EndHold()
    end
    local function dismiss()
        cancelHold()
        button.controllerActive = false
        button:UnlockHighlight()
        hideTooltip()
        selected = nil
        -- keep A/B until released so they neither train one spell nor close the trainer
        draining = true
    end
    sink:SetScript("OnClick", function(_, key, down)
        if not focused() then return end
        if not down then
            held[key] = nil
            if key == "PAD1" then cancelHold() end
            return
        end
        if held[key] then return end
        held[key] = true
        if draining then return end
        if confirmation:IsShown() then
            if key == "PAD1" then acceptConfirmation()
            elseif key == "PAD2" then confirmation:Hide() end
        elseif key == "PAD3" then
            if button.controllerActive then dismiss()
            else
                button.controllerActive = true
                selected = SmartNavigation:GetCurrentButton()
                -- an A already held cannot confirm
                held.PAD1 = IsKeyDown("PAD1") == true
                bind(2)
                button:LockHighlight()
                showTooltip()
            end
        elseif button.controllerActive and key == "PAD2" then dismiss()
        elseif button.controllerActive and key == "PAD1" and button:IsEnabled() then
            holdPrompt:BeginHold(0.5) -- same hold as Create All
            holdTimer = C_Timer.NewTimer(0.5, function()
                holdTimer = nil
                local confirm = focused() and button.controllerActive and button:IsEnabled() and IsKeyDown("PAD1")
                    and SmartNavigation:GetCurrentButton() == selected
                dismiss()
                if confirm then trainAll() end
            end)
        end
    end)
    button:HookScript("OnHide", dismiss)
    button:HookScript("OnClick", dismiss)
    confirmation:HookScript("OnShow", function()
        dismiss()
        if focused() then bind(2) end
    end)
    confirmation:HookScript("OnHide", dismiss)

    local selectText, selectEnabled, confirmEnabled, wasFocused
    local function sync()
        if not focused() then
            -- only on losing focus, so a mouse-opened dialog survives while unfocused
            if wasFocused and InputUtil.IsGamepadUIEnabled() then confirmation:Hide() end
            wasFocused = false
            if button.controllerActive or holdTimer then dismiss() end
            held, draining = {}, false
            root:Hide()
            bind(0) -- deferred in combat
            return
        end
        wasFocused = true
        if button.controllerActive and SmartNavigation:GetCurrentButton() ~= selected then dismiss() end
        if draining and not IsKeyDown("PAD1") and not IsKeyDown("PAD2") and not IsKeyDown("PAD3") then
            draining = false
        end
        local confirming = confirmation:IsShown()
        bind((button.controllerActive or draining or confirming) and 2 or 1)
        local active = button.controllerActive == true
        if active and not button:IsEnabled() then cancelHold() end
        local nativeFooter = ClassTrainerFrame.footer and ClassTrainerFrame.footer.inputLegend
        if nativeFooter then
            local left, bottom, width, height = nativeFooter:GetRect()
            if left and bottom then
                local shownLegend = confirming and dialogLegend or active and confirmLegend or legend
                root:SetScale(nativeFooter:GetEffectiveScale() / UIParent:GetEffectiveScale())
                root:ClearAllPoints()
                root:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, bottom + height)
                root:SetSize(math.max(width, shownLegend:GetWidth()), math.max(height, shownLegend:GetHeight()))
            end
        end
        local current = SmartNavigation:GetCurrentButton()
        local category = current and current.buttonContext == "ButtonContext_TrainerUICategory"
        local text = category and PROMPT_TOGGLE_CATEGORY or TRAIN
        local enabled = category or ClassTrainerFrame.TrainButton:IsEnabled()
        if selectText ~= text then selectPrompt:SetPromptText(text); selectText = text end
        if selectEnabled ~= enabled then
            if enabled then selectPrompt:EnablePrompt() else selectPrompt:DisablePrompt() end
            selectEnabled = enabled
        end
        if confirmEnabled ~= button:IsEnabled() then
            if button:IsEnabled() then holdPrompt:EnablePrompt() else holdPrompt:DisablePrompt() end
            confirmEnabled = button:IsEnabled()
        end
        legend:SetShown(not active and not confirming)
        confirmLegend:SetShown(active)
        dialogLegend:SetShown(confirming)
        root:Show()
        if active and not tooltip:IsShown() then showTooltip() end
    end
    root:SetScript("OnEvent", function(_, event)
        if event == "GAME_PAD_DISCONNECTED" then connected = false
        elseif event == "GAME_PAD_CONNECTED" or event == "GAME_PAD_ACTIVE_CHANGED"
            or event == "GAME_PAD_CONFIGS_CHANGED" then connected = C_GamePad.GetDeviceMappedState() ~= nil end
        if event == "PLAYER_REGEN_DISABLED" then
            suspended = true
            dismiss(); root:Hide(); bind(0)
        else
            if event == "PLAYER_REGEN_ENABLED" then suspended = false end
            sync()
        end
    end)
    for _, event in ipairs({"GAME_PAD_CONNECTED", "GAME_PAD_DISCONNECTED", "GAME_PAD_ACTIVE_CHANGED",
        "GAME_PAD_CONFIGS_CHANGED", "INPUT_DEVICE_INTERFACE_TRANSITION", "PLAYER_REGEN_DISABLED",
        "PLAYER_REGEN_ENABLED"}) do root:RegisterEvent(event) end
    observer:HookScript("OnEvent", sync)
    return sync
end

EventUtil.ContinueOnAddOnLoaded("Blizzard_TrainerUI", function()
    -- never parent to, anchor to or change native frames
    confirmation = createConfirmation()
    button = CreateFrame("Button", "WhatsTrainingTrainAllButton", UIParent, "UIPanelButtonTemplate")
    -- the trainer's ScrollBox is HIGH
    button:SetFrameStrata("DIALOG")
    button:SetSize(90, 22)
    button:SetText(wt.L.TRAIN_ALL)
    button:SetMotionScriptsWhileDisabled(true)
    button:SetScript("OnClick", trainAll)
    button:SetScript("OnEnter", showTooltip)
    button:SetScript("OnLeave", function() if not button.controllerActive then hideTooltip() end end)
    button:SetScript("OnHide", function()
        hideTooltip()
        confirmation:Hide()
    end)
    button:Hide()

    -- shown from TRAINER_SHOW to TRAINER_CLOSED
    -- starts shown because the TRAINER_SHOW that loaded Blizzard_TrainerUI is past
    local observer = CreateFrame("Frame")
    observer:SetScript("OnUpdate", function()
        local native = ClassTrainerFrame.TrainButton
        -- InitializeGamepad hides TrainButton
        if not isClassTrainer() then button:Hide(); return end
        local left, bottom, _, height = native:GetRect()
        if not left or not bottom then button:Hide(); return end
        local scale = native:GetEffectiveScale() / UIParent:GetEffectiveScale()
        local level = native:GetFrameLevel() + 1
        if button.x ~= left or button.y ~= bottom or button.height ~= height or button.scale ~= scale then
            button.x, button.y, button.height, button.scale = left, bottom, height, scale
            button:SetScale(scale)
            button:ClearAllPoints()
            button:SetPoint("RIGHT", UIParent, "BOTTOMLEFT", left - 6, bottom + height / 2)
        end
        if button:GetFrameLevel() ~= level then button:SetFrameLevel(level) end
        if not button:IsShown() then refresh(); button:Show() end
    end)
    observer:SetScript("OnEvent", function(_, event)
        if event == "TRAINER_CLOSED" or event == "PLAYER_LEAVING_WORLD" then
            finishTraining()
            button:Hide()
            observer:Hide()
            return
        end
        if event == "TRAINER_SHOW" then observer:Show() end
        if pending and (event == "TRAINER_UPDATE" or event == "SPELLS_CHANGED"
            or event == "LEARNED_SPELL_IN_SKILL_LINE") then
            local progressed = recordLearned()
            if not next(pending.costs) then finishTraining()
            elseif progressed then startTimeout() end
        end
        refresh()
    end)
    for _, event in ipairs({"TRAINER_SHOW", "TRAINER_UPDATE", "TRAINER_CLOSED", "PLAYER_MONEY",
        "TRAINER_SERVICE_INFO_NAME_UPDATE", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED",
        "PLAYER_LEAVING_WORLD", "SPELLS_CHANGED", "LEARNED_SPELL_IN_SKILL_LINE"}) do observer:RegisterEvent(event) end
    ignoreStore:AddSubscription(refresh)
    local syncController
    observer:HookScript("OnUpdate", function()
        if not syncController and InputUtil.IsGamepadUIEnabled() then syncController = createController(observer) end
        if syncController then syncController() end
    end)
    refresh()
end)
