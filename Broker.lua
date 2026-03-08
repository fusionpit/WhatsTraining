local addonName, wt = ...
local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local FONT_SIZE = 12
local _, addonTitle = C_AddOns.GetAddOnInfo(addonName)

local plugin 
plugin = ldb:NewDataObject(addonName, {
    type = "data source",
    text = addonTitle,
    icon = "Interface\\Icons\\INV_Misc_QuestionMark",
    OnClick = function(self, button)
        if button == "RightButton" then
            wt:ToggleBrokerWeaponSkills()
            if GameTooltip:IsOwned(self) then
                GameTooltip:ClearLines()
                plugin.OnTooltipShow(GameTooltip)
                GameTooltip:Show()
            end
            return
        end
        local openBeastTraining = wt.needsBeastTraining() and IsShiftKeyDown()
        if InCombatLockdown() then
            print(openBeastTraining and wt.L.OPEN_BEAST_IN_COMBAT or wt.L.BROKER_OPEN_IN_COMBAT)
            return
        end
        if openBeastTraining then
            wt.openBeastTraining()
        else
            wt.Open()
        end
    end
})
local function formatGreen(text)
    return '|cff19ff19'..text..'|r'
end
local function formatBlue(text)
    return '|cff82c5ff'..text..'|r'
end

local ttShown = false
local OPEN_HINT = formatGreen(wt.L.BROKER_CLICK_OPEN)
local OPEN_BEAST_TRAINING_HINT = formatGreen(wt.L.BROKER_CLICK_BEAST_TRAIN)
local TOGGLE_SPELLS_HINT = formatGreen(wt.L.BROKER_CLICK_TOGGLE_SPELLS)
local TOGGLE_WEAPONS_HINT = formatGreen(wt.L.BROKER_CLICK_TOGGLE_WEAPONS)
function plugin.OnTooltipShow(tt)
    -- if ttShown == false then 
    --     wt:RebuildData() 
    --     ttShown = true
    -- end
    
    tt:AddLine(wt.L.TAB_TEXT)
    tt:AddLine(" ")

    if wt.needsBeastTraining() then
        tt:AddLine(wt.L.OPEN_BEAST_TRAINING)
        tt:AddLine(" ")
    end

    if #wt.brokerData == 0 then
        tt:AddLine(wt.L.BROKER_NOTHING)
        tt:AddLine(" ")
        if wt.needsBeastTraining() then
            tt:AddLine(OPEN_BEAST_TRAINING_HINT)
        end
        local toggleHint = wt.showingBrokerWeaponSkills and TOGGLE_SPELLS_HINT or TOGGLE_WEAPONS_HINT
        tt:AddLine(toggleHint)
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
    if wt.needsBeastTraining() then
        tt:AddLine(OPEN_BEAST_TRAINING_HINT)
    end
    local toggleHint = wt.showingBrokerWeaponSkills and TOGGLE_SPELLS_HINT or TOGGLE_WEAPONS_HINT
    tt:AddLine(toggleHint)
    tt:AddLine(OPEN_HINT)
end

function wt.updateBroker(available, coming, showingWeaponSkills)
    local availHeader = showingWeaponSkills and wt.L.WEAPON_AVAILABLE_HEADER or wt.L.AVAILABLE_HEADER
    local comingHeader = showingWeaponSkills and wt.L.WEAPON_NEXTLEVEL_HEADER or wt.L.NEXTLEVEL_HEADER
    if available > 0 then
        local coloredAvailable = formatGreen(available)
        plugin.text = string.format("%s %s", coloredAvailable, availHeader)
    elseif coming > 0 then
        local coloredComing = formatBlue(coming)
        plugin.text = string.format("%s %s", coloredComing, comingHeader)
    else
        plugin.text = addonTitle
    end
end
