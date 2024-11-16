local addonName, wt = ...
local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local FONT_SIZE = 12
local _, addonTitle = C_AddOns.GetAddOnInfo(addonName)

local plugin = ldb:NewDataObject(addonName, {
    type = "data source",
    text = addonTitle,
    icon = "Interface\\Icons\\INV_Misc_QuestionMark",
    OnClick = function(_,button) wt.Open() end
})
local function formatGreen(text)
    return '|cff19ff19'..text..'|r'
end
local function formatBlue(text)
    return '|cff82c5ff'..text..'|r'
end

local ttShown = false
local OPEN_HINT = formatGreen(wt.L.BROKEN_CLICK_OPEN)
function plugin.OnTooltipShow(tt)
    if ttShown == false then 
        wt:RebuildData() 
        ttShown = true
    end
    
    tt:AddLine(wt.L.TAB_TEXT)
    tt:AddLine(" ")

    if #wt.brokerData == 0 then
        tt:AddLine(wt.L.BROKER_NOTHING)
        tt:AddLine(" ")
        tt:AddLine(OPEN_HINT)
        return
    end
    for i, category in ipairs(wt.brokerData) do
        local header = #category.spells == #category.displayedSpells
            and string.format("%s — %s", category.formattedName, wt.formatSpellCost(category, FONT_SIZE))
            or string.format("%s — %s", category.formattedName, string.format(wt.L.BROKER_HEADER_HIDDEN_FORMAT, wt.formatSpellCost(category.displayed, FONT_SIZE), wt.formatSpellCost(category, FONT_SIZE)))
        tt:AddLine(header)

        for _, spell in ipairs(category.displayedSpells) do
            local spellText = string.format("  |T%d:0|t %s — %s", spell.icon, spell.formattedFullName or spell.name, wt.formatSpellCost(spell, FONT_SIZE))
            if spell.hideLevel then
                tt:AddLine(spellText)
            else
                local color = spell.levelColor
                tt:AddDoubleLine(spellText, spell.formattedLevel, nil, nil, nil, color.r, color.g, color.b)
            end
            
        end
        if #category.spells ~= #category.displayedSpells then
            tt:AddLine(string.format("  "..wt.L.BROKER_HIDDEN_FORMAT, #category.spells - #category.displayedSpells, wt.formatSpellCost(category.hidden, FONT_SIZE)))
        end
        if i ~= #wt.brokerData then tt:AddLine(" ") end
    end
    tt:AddLine(" ")
    tt:AddLine(OPEN_HINT)
end

function wt.updateBroker(available, coming)
    if available > 0 then
        local coloredAvailable = formatGreen(available)
        plugin.text = string.format("%s %s", coloredAvailable, wt.L.AVAILABLE_HEADER)
    elseif coming > 0 then
        local coloredComing = formatBlue(coming)
        plugin.text = string.format("%s %s", coloredComing, wt.L.NEXTLEVEL_HEADER)
    else
        plugin.text = addonTitle
    end
end
