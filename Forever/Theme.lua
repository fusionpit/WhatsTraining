local _, wt = ...

local parchment = {
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

function wt.ResolveTheme()
    -- Undocumented API, verified against EUI v9.3:
    -- EllesmereUIBlizzardSkin/EllesmereUIBlizzardSkin.lua:249-261.
    local eui = _G.EllesmereUI
    if type(eui) == "table" and type(eui.GetBlizzWindowStyle) == "function" then
        if eui.GetBlizzWindowStyle("playerspells") ~= "off" then return dark end
    elseif C_AddOns.IsAddOnLoaded("EllesmereUIBlizzardSkin") then
        return dark
    end
    return parchment
end

wt.Theme = parchment
