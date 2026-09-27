local addonName, wt = ...
local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local FONT_SIZE = 12
local _, addonTitle = C_AddOns.GetAddOnInfo(addonName)

local plugin
local activeTooltip

local function refreshTooltip()
    local tt = activeTooltip
    if not tt or not tt:IsShown() or not tt.ClearLines then return end
    tt:ClearLines()
    plugin.OnTooltipShow(tt)
    tt:Show()
end

plugin = ldb:NewDataObject(addonName, {
    type = "data source",
    text = addonTitle,
    icon = "Interface\\Icons\\INV_Misc_QuestionMark",
    OnClick = function(_, button)
        if button == "RightButton" then
            wt:ToggleBrokerWeaponSkills()
            refreshTooltip()
            return
        end
        -- wt.Open handles combat itself; Forever's window can open during combat
        if wt.needsBeastTraining() and IsShiftKeyDown() then
            if InCombatLockdown() then
                print(wt.L.OPEN_BEAST_IN_COMBAT)
                return
            end
            wt.openBeastTraining()
        else
            wt.Open(wt.showingBrokerWeaponSkills and true or false)
        end
    end
})
local function formatGreen(text)
    return '|cff19ff19'..text..'|r'
end
local function formatBlue(text)
    return '|cff82c5ff'..text..'|r'
end

local function coins(amount)
    return wt.formatSpellCost({ cost = amount, costFormat = "%s" }, FONT_SIZE)
end
local factionEvents = CreateFrame("Frame")
factionEvents:RegisterEvent("UPDATE_FACTION")
factionEvents:RegisterEvent("PLAYER_PVP_RANK_CHANGED")
factionEvents:SetScript("OnEvent", refreshTooltip)

local OPEN_HINT = formatGreen(wt.gameVersion == "forever" and wt.L.BROKER_CLICK_OPEN_WINDOW or wt.L.BROKER_CLICK_OPEN)
local OPEN_BEAST_TRAINING_HINT = formatGreen(wt.L.BROKER_CLICK_BEAST_TRAIN)
local TOGGLE_SPELLS_HINT = formatGreen(wt.L.BROKER_CLICK_TOGGLE_SPELLS)
local TOGGLE_WEAPONS_HINT = formatGreen(wt.L.BROKER_CLICK_TOGGLE_WEAPONS)
function plugin.OnTooltipShow(tt)
    activeTooltip = tt

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
    local rows, _, best = wt.availablePriceRows()
    local key = wt.priceKey(rows)
    for i, category in ipairs(wt.brokerData) do
        local total, shown = wt.selectedPrice(category.spells, key), wt.selectedPrice(category.displayedSpells, key)
        local header = #category.spells == #category.displayedSpells
            and string.format("%s — %s", category.formattedName, coins(total))
            or string.format("%s — %s", category.formattedName,
                string.format(wt.L.BROKER_HEADER_HIDDEN_FORMAT, coins(shown), coins(total)))
        tt:AddLine(header)

        for _, spell in ipairs(category.displayedSpells) do
            local spellText = string.format("  |T%d:0|t %s — %s", spell.icon,
                spell.formattedFullName or spell.name, coins(wt.selectedPrice(spell, key)))
            if spell.formattedTrainerZones then
                spellText = spellText .. " — " .. spell.formattedTrainerZones
            end
            if spell.hideLevel then
                tt:AddLine(spellText)
            else
                local color = spell.levelColor
                tt:AddDoubleLine(spellText, spell.formattedLevel, nil, nil, nil, color.r, color.g, color.b)
            end

        end
        if #category.spells ~= #category.displayedSpells then
            tt:AddLine(string.format("  "..wt.L.BROKER_HIDDEN_FORMAT,
                #category.spells - #category.displayedSpells,
                coins(total - shown)))
        end
        if i ~= #wt.brokerData then tt:AddLine(" ") end
    end
    if #rows > 0 then
        tt:AddLine(" ")
        for _, row in ipairs(wt.shownRows(rows, key)) do tt:AddLine((wt.priceRowLabel(row, best))) end
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
