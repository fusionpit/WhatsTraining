local _, wt = ...

local function floatingFrame()
    local frame = wt.FloatingFrame
    if not frame then
        frame = CreateFrame("Frame", "WhatsTrainingFloatingFrame", UIParent, "UIPanelDialogTemplate")
        wt.FloatingFrame = frame
        frame:SetSize(384, 512)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("HIGH")
        frame:SetMovable(true)
        frame:SetClampedToScreen(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
        frame.Title:SetText(wt.L.TAB_TEXT)
        frame.maxRows, frame.scrollStep = 27, 16
        wt.CreateCompactFrame(frame)
        frame.searchBox:ClearAllPoints()
        frame.searchBox:SetPoint("TOPLEFT", 20, -28)
        -- Leave room for the weapon toggle and grouping button / hunter notice.
        frame.searchBox:SetWidth(290)
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
SlashCmdList.WHATSTRAINING = function()
    local frame = floatingFrame()
    frame:SetShown(not frame:IsShown())
end

-- Broker opens this window, not the spellbook as that taints a whoooole lotta things
function wt.Open(toWeapons)
    wt.showingWeaponSkills = toWeapons == true
    local frame = floatingFrame()
    if frame:IsShown() then wt:ApplyFilter() else frame:Show() end
end
