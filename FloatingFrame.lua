local _, wt = ...

local function floatingFrame()
    local frame = wt.FloatingFrame
    if not frame then
        frame = CreateFrame("Frame", "WhatsTrainingFloatingFrame", UIParent, "UIPanelDialogTemplate")
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
        frame.maxRows, frame.scrollStep = 27, 16
        wt.CreateCompactFrame(frame)
        frame.searchBox:ClearAllPoints()
        frame.searchBox:SetPoint("TOPLEFT", 20, -28)
        -- Leave room for the weapon toggle, settings button and hunter notice.
        frame.searchBox:SetWidth(258)
        frame.rows[1]:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -64)
        frame.scrollBar:SetPoint("TOPLEFT", 0, -64)
        frame.scrollBar:SetPoint("BOTTOMRIGHT", -32, 16)
        frame:SetScript("OnShow", function() wt:ApplyFilter() end)
        frame:SetScript("OnHide", function(self)
            self:StopMovingOrSizing()
            self.searchBox:ClearFocus()
            self.groupingPopup:Hide()
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
        if frame:IsShown() then wt:ApplyFilter() else frame:Show() end
    end
end
