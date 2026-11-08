local _, wt = ...

local function floatingFrame()
    local frame = wt.FloatingFrame
    if not frame then
        frame = CreateFrame("Frame", "WhatsTrainingFloatingFrame", UIParent, "UIPanelDialogTemplate")
        frame:Hide()
        wt.FloatingFrame = frame
        frame:SetSize(384, 512)
        local saved = WT_FloatingFramePoint
        if type(saved) == "table" and type(saved[1]) == "string" then
            frame:SetPoint(saved[1], UIParent, saved[2], tonumber(saved[3]) or 0, tonumber(saved[4]) or 0)
        else
            frame:SetPoint("CENTER")
        end
        frame:SetFrameStrata("HIGH")
        frame:SetMovable(true)
        frame:SetClampedToScreen(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            local point, _, relativePoint, x, y = self:GetPoint()
            WT_FloatingFramePoint = { point, relativePoint, x, y }
        end)
        frame.Title:SetText(wt.L.TAB_TEXT)
        if wt.gameVersion ~= "forever" then
            -- era/anni and forever have differently sized close buttons
            -- blizzard nudges it the same way for GearManagerDialog
            _G[frame:GetName() .. "Close"]:SetPoint("TOPRIGHT", 2.2, 0)
        end
        local spells = CreateFrame("Frame", "$parentSpells", frame)
        frame.spellsPage = spells
        spells:SetAllPoints()
        spells.maxRows, spells.scrollStep = 27, 16
        wt.CreateCompactFrame(spells)
        spells.searchBox:ClearAllPoints()
        spells.searchBox:SetPoint("TOPLEFT", 20, -28)
        -- Leave room for weapons, settings, the hunter notice and professions.
        spells.searchBox:SetWidth(218)
        spells.rows[1]:SetPoint("TOPLEFT", spells, "TOPLEFT", 12, -64)
        spells.scrollBar:SetPoint("TOPLEFT", 0, -64)
        spells.scrollBar:SetPoint("BOTTOMRIGHT", -32, 16)
        spells:SetScript("OnShow", function(self) self:Refresh(true) end)
        spells:SetScript("OnHide", function() spells.groupingPopup:Hide() end)

        local professions = CreateFrame("Frame", "$parentProfessions", frame)
        frame.professionsPage = professions
        professions:Hide()
        -- match compact list's search and header centers
        professions:SetPoint("TOPLEFT", 12, -26)
        professions:SetPoint("BOTTOMRIGHT", -12, 12)
        professions.recipeList = wt.CreateSkillsRecipeList(professions, nil, 24)
        professions.recipeList.scroll:SetPoint("TOPLEFT", 4, -38)
        professions.recipeList.scroll:SetPoint("BOTTOMRIGHT", -20, 4)
        local filters = professions.recipeList.filterDropdown
        filters:ClearAllPoints()
        filters:SetPoint("TOPRIGHT", -40, -8)

        local toggle = CreateFrame("Button", "$parentProfessionToggle", frame, "SquareIconButtonTemplate")
        toggle:SetSize(32, 32)
        toggle:SetPoint("TOPRIGHT", -12, -29)
        function frame:SetProfessionView(shown)
            spells:SetShown(not shown)
            professions:SetShown(shown)
            toggle:SetIcon(shown and "Interface\\Icons\\INV_Misc_Book_09"
                or "Interface\\Icons\\INV_Misc_EngGizmos_19")
        end
        toggle:SetScript("OnClick", function()
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            frame:SetProfessionView(not professions:IsShown())
            toggle:GetScript("OnEnter")(toggle)
        end)
        toggle:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(professions:IsShown() and wt.L.SHOW_SPELLS or wt.L.PROFESSIONS)
            GameTooltip:Show()
        end)
        local function hideTooltip(self)
            if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
        end
        toggle:SetScript("OnLeave", hideTooltip)
        toggle:SetScript("OnHide", hideTooltip)
        frame:SetProfessionView(false)
        frame:SetScript("OnShow", function()
            PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN)
            wt:ApplyFilter()
        end)
        frame:SetScript("OnHide", function(self)
            PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE)
            self:StopMovingOrSizing()
            spells.searchBox:ClearFocus()
            spells.groupingPopup:Hide()
        end)
        tinsert(UISpecialFrames, frame:GetName())
    end
    return frame
end

SLASH_WHATSTRAINING1 = "/wt"
SlashCmdList.WHATSTRAINING = function(message)
    local command, direction = (message or ""):lower():match("^%s*(%S+)%s*(.-)%s*$")
    if (command == "options" or command == "settings") and wt.OpenSettings then
        wt.OpenSettings()
        return
    end
    if command == "professionstab" and wt.MoveProfessionTab then
        wt.MoveProfessionTab(direction)
        return
    end
    local frame = floatingFrame()
    frame:SetShown(not frame:IsShown())
end

-- Forever's broker opens this window, not the spellbook as that taints a whoooole lotta things
-- Era/Anni opens the spellbook tab
if wt.gameVersion == "forever" then
    function wt.Open(toWeapons)
        wt.showingWeaponSkills = toWeapons == true
        local frame = floatingFrame()
        frame:SetProfessionView(false)
        if frame:IsShown() then wt:ApplyFilter() else frame:Show() end
    end
end
