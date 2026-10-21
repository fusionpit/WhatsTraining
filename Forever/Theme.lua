local _, wt = ...

local parchment = {
    backing = {0.10, 0.07, 0.035},
    body = {0.19, 0.12, 0.06},
    strong = {0.08, 0.04, 0.02},
    dim = {0.4, 0.4, 0.4},
    available = {0.10, 0.38, 0.05},
    nextLevel = {0.08, 0.22, 0.50},
    groupUnavailable = {0.30, 0.10, 0.05},
    levelUnavailable = {0.45, 0.09, 0.04},
    weaponUnavailable = {0.55, 0.12, 0.05},
    clear = {0.30, 0.19, 0.08, 0},
    separator = {0.30, 0.19, 0.08, 0.18},
    rule = {0.30, 0.19, 0.08, 0.35},
    block = {0.30, 0.19, 0.08, 0.25},
    highlight = {1, 0.85, 0.50, 0.06},
    cityBacking = {0.2, 0.12, 0.04, 0.08},
    shadow = {0, 0, 0, 1},
    white = {1, 1, 1, 1},
    tooltipText = {0.8, 0.8, 0.8},
    tooltipHint = {1, 0.82, 0.3},
    tooltipWaypoint = {GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b},
    sectionColors = {
        available = {0.12, 0.24, 0.08, 0.65, 1, 0.40},
        missingReqs = {0.32, 0.15, 0.03, 1, 0.82, 0.30},
        nextLevel = {0.08, 0.18, 0.29, 0.55, 0.84, 1},
        notLevel = {0.30, 0.07, 0.04, 1, 0.55, 0.45},
        weaponAvailable = {0.12, 0.24, 0.08, 0.65, 1, 0.40},
        weaponNextLevel = {0.08, 0.18, 0.29, 0.55, 0.84, 1},
        weaponNotLevel = {0.30, 0.07, 0.04, 1, 0.55, 0.45},
        weaponKnown = {0.20, 0.17, 0.12, 0.75, 0.75, 0.75},
    },
    otherSection = {0.20, 0.17, 0.12, 0.85, 0.80, 0.65},
    weaponGroup = {0.20, 0.12, 0.04, 1, 0.82, 0.3},
}

local dark = {
    backing = {0.05, 0.05, 0.05},
    headerText = {0.95, 0.90, 0.80},
    body = {0.9, 0.9, 0.9},
    strong = {1, 1, 1},
    dim = {0.5, 0.5, 0.5},
    available = {0.65, 1, 0.40},
    nextLevel = {0.55, 0.84, 1},
    groupUnavailable = {1, 0.55, 0.45},
    levelUnavailable = {1, 0.55, 0.45},
    weaponUnavailable = {1, 0.55, 0.45},
    clear = {1, 1, 1, 0},
    separator = {1, 1, 1, 0.09},
    rule = {1, 1, 1, 0.175},
    block = {1, 1, 1, 0.125},
    highlight = {1, 1, 1, 0.06},
    cityBacking = {1, 1, 1, 0.08},
    shadow = parchment.shadow,
    white = parchment.white,
    tooltipText = parchment.tooltipText,
    tooltipHint = parchment.tooltipHint,
    tooltipWaypoint = parchment.tooltipWaypoint,
    sectionColors = parchment.sectionColors,
    otherSection = parchment.otherSection,
    weaponGroup = parchment.weaponGroup,
}

local style = "off"
function wt.ResolveTheme()
    -- EllesmereUI v9.6.1: use this window's style, not the third-party majority.
    local eui = _G.EllesmereUI
    if type(eui) == "table" and type(eui.GetBlizzWindowStyle) == "function" then
        style = eui.GetBlizzWindowStyle("playerspells")
    else
        style = C_AddOns.IsAddOnLoaded("EllesmereUIBlizzardSkin") and "eui" or "off"
    end
    if style == "off" then return parchment end
    local db = _G.EllesmereUIDB
    local color = style == "modern" and db and db.blizzWindowModernDefault or {}
    dark.backing[1], dark.backing[2], dark.backing[3] = color.r or 0.067, color.g or 0.067, color.b or 0.067
    return dark
end

-- window supplies the full background's geometry
function wt.PaintBackground(frame, window)
    local skinned = wt.Theme == dark and window ~= nil
    local textured = skinned and style ~= "modern"
    local r, g, b = unpack(wt.Theme.backing)
    frame.backing:SetColorTexture(r, g, b, 1)
    frame.art:Show()
    for _, page in ipairs({frame.whole, frame.left, frame.right}) do page:SetAlpha(skinned and 0.1 or 1) end
    if skinned and not frame.shell then
        frame.shell = frame.art:CreateTexture(nil, "BACKGROUND", nil, -8)
        frame.shell:SetTexture("Interface\\AddOns\\EllesmereUI\\media\\modern_blizz.png")
        frame.shell:SetAllPoints(window)
        frame.shade = frame.art:CreateTexture(nil, "BACKGROUND", nil, -7)
        frame.shade:SetColorTexture(0, 0, 0, 0.62)
        frame.shade:SetAllPoints(window)
        frame.titleBar = frame.art:CreateTexture(nil, "BACKGROUND", nil, -5)
        frame.titleBar:SetColorTexture(0, 0, 0, 0.5)
        frame.titleBar:SetPoint("TOPLEFT", window, "TOPLEFT")
        frame.titleBar:SetPoint("TOPRIGHT", window, "TOPRIGHT")
        frame.titleBar:SetHeight(25)
    end
    if frame.shell then
        frame.shell:SetShown(textured)
        frame.shade:SetShown(textured)
        frame.titleBar:SetShown(skinned)
    end
    if textured then
        -- EUI WindowEngine.CoverFit: crop the full window
        local width, height = window:GetSize()
        local left, right, top, bottom = 0.25, 1, 0, 0.75
        if width and height and width > 0 and height > 0 then
            local aspect, nativeAspect = width / height, 561 / 433
            if aspect > nativeAspect then
                local trim = (0.75 - 0.75 * nativeAspect / aspect) / 2
                top, bottom = trim, 0.75 - trim
            else
                local trim = (0.75 - 0.75 * aspect / nativeAspect) / 2
                left, right = 0.25 + trim, 1 - trim
            end
        end
        frame.shell:SetTexCoord(left, right, top, bottom)
    end
end

wt.Theme = parchment
