local _, wt = ...
local Forever = wt.Forever
local BANNER_TOP, CLIP_TOP = 54, 38
-- CharacterSelect.xml faction colors.
local FACTION_COLORS = {
    Alliance = {0.29, 0.33, 0.91},
    Horde = {0.90, 0.05, 0.07},
}

local function showingWeapons(frame)
    if frame.expanded then return frame.sideBySide end
    return wt.showingWeaponSkills
end

local function createCategoryBanner(frame, selectView)
    local clip = CreateFrame("Frame", nil, frame)
    clip:SetSize(60, 130)
    clip:SetClipsChildren(true)
    clip:SetFrameLevel(frame:GetFrameLevel() + 24)
    local banner = CreateFrame("Button", nil, clip)
    banner.clip = clip
    banner:SetFrameLevel(frame:GetFrameLevel() + 25)
    banner:RegisterForClicks("LeftButtonUp")
    banner:SetSize(60, 112)
    banner:SetHitRectInsets(0, 0, 34, 0)

    banner.art = banner:CreateTexture(nil, "BACKGROUND")
    banner.art:SetAllPoints()
    banner.art:SetAtlas("communities-guildbanner-background")

    banner.border = banner:CreateTexture(nil, "BORDER")
    banner.border:SetAllPoints()
    banner.border:SetAtlas("communities-guildbanner-border")
    banner.border:SetVertexColor(0.85, 0.65, 0.32)
    banner.borderGlow = banner:CreateTexture(nil, "OVERLAY")
    banner.borderGlow:SetAllPoints()
    banner.borderGlow:SetAtlas("communities-guildbanner-border")
    banner.borderGlow:SetBlendMode("ADD")
    banner.borderGlow:SetVertexColor(1, 0.8, 0.35)
    banner.borderGlow:SetAlpha(0)
    -- Follows the page-to-cover seam at the upper-right of spellbook-background-evergreen-right.
    banner.pageMask = banner:CreateMaskTexture()
    banner.pageMask:SetTexture("Interface\\AddOns\\WhatsTraining\\Forever\\banner-corner-mask",
        "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    banner.pageMask:SetAllPoints(banner)
    banner.art:AddMaskTexture(banner.pageMask)
    banner.border:AddMaskTexture(banner.pageMask)
    banner.borderGlow:AddMaskTexture(banner.pageMask)
    banner.badgeBackground = banner:CreateTexture(nil, "BORDER")
    banner.badgeBackground:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
    banner.badgeBackground:SetPoint("CENTER", banner, "TOP", 0, -52)
    banner.badgeBackground:SetSize(32, 32)
    banner.icon = banner:CreateTexture(nil, "ARTWORK")
    banner.icon:SetPoint("CENTER", banner.badgeBackground)
    banner.iconMask = banner:CreateMaskTexture()
    banner.iconMask:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask",
        "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    banner.iconMask:SetPoint("CENTER", banner.badgeBackground)
    banner.iconMask:SetSize(32 * 0.78, 32 * 0.78)
    banner.icon:AddMaskTexture(banner.iconMask)
    banner.iconBorder = banner:CreateTexture(nil, "OVERLAY")
    banner.iconBorder:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    banner.iconBorder:SetTexCoord(0, 40 / 64, 0, 40 / 64)
    banner.iconBorder:SetSize(32, 32)
    banner.iconBorder:SetPoint("CENTER", banner.badgeBackground)
    banner.glow = banner:CreateTexture(nil, "OVERLAY", nil, 1)
    banner.glow:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    banner.glow:SetTexCoord(0, 40 / 64, 0, 40 / 64)
    banner.glow:SetAllPoints(banner.iconBorder)
    banner.glow:SetBlendMode("ADD")
    banner.glow:SetVertexColor(1, 0.8, 0.35)
    banner.glow:SetAlpha(0)
    local function updateGlow(self, elapsed)
        local alpha, target = self.glow:GetAlpha(), self.glowTarget
        local step = elapsed * 0.25 / 0.15
        alpha = alpha < target and math.min(target, alpha + step) or math.max(target, alpha - step)
        self.glow:SetAlpha(alpha)
        self.borderGlow:SetAlpha(alpha)
        if alpha == target then self:SetScript("OnUpdate", nil) end
    end
    local function releaseBadge(self)
        self.badgeBackground:SetPoint("CENTER", self, "TOP", 0, -52)
    end
    banner:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" and not InCombatLockdown() then
            self.badgeBackground:SetPoint("CENTER", self, "TOP", 0, -54)
        end
    end)
    banner:SetScript("OnMouseUp", releaseBadge)

    banner:SetScript("OnClick", function()
        if InCombatLockdown() then return end
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        selectView(not showingWeapons(frame))
    end)
    banner:SetScript("OnEnter", function(self)
        self.glowTarget = 0.25
        self:SetScript("OnUpdate", updateGlow)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText(showingWeapons(frame) and wt.L.LEDGER_CLASS_SPELLS or wt.L.WEAPON_SKILLS_HEADER)
        GameTooltip:Show()
    end)
    banner:SetScript("OnLeave", function(self)
        self.glowTarget = 0
        self:SetScript("OnUpdate", updateGlow)
        releaseBadge(self)
        Forever.hideTooltip(self)
    end)
    banner:SetScript("OnHide", function(self)
        self:SetScript("OnUpdate", nil)
        self.glow:SetAlpha(0)
        self.borderGlow:SetAlpha(0)
        releaseBadge(self)
        Forever.hideTooltip(self)
    end)
    return banner
end

local function updateBanner(mainFrame)
    local banner = mainFrame.categoryBanner
    local page = mainFrame.expanded and mainFrame.weaponPage or mainFrame
    banner.clip:ClearAllPoints()
    banner.clip:SetPoint("TOPRIGHT", page, "TOPRIGHT", 16, CLIP_TOP)
    banner:ClearAllPoints()
    banner:SetPoint("TOPRIGHT", banner.clip, "TOPRIGHT", 0, BANNER_TOP - CLIP_TOP)
    if showingWeapons(mainFrame) then
        local color = RAID_CLASS_COLORS[wt.currentClass]
        if color then banner.art:SetVertexColor(color.r, color.g, color.b) end
        banner.icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
        banner.icon:SetTexCoord(0, 1, 0, 1)
        banner.icon:SetSize(32 * 0.7, 32 * 0.7)
    else
        local color = FACTION_COLORS[wt.playerFaction]
        if color then banner.art:SetVertexColor(unpack(color)) end
        banner.icon:SetAtlas("pvptalents-warmode-swords", false, nil, true)
        banner.icon:SetSize(32 * 0.62, 32 * 0.62)
    end
    if GameTooltip:IsOwned(banner) then banner:GetScript("OnEnter")(banner) end
end

Forever.createCategoryBanner = createCategoryBanner
Forever.updateBanner = updateBanner
