local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

wt.ClassicPalette = {
    tooltipTitle = {1, 1, 1},
    tooltipText = {0.8, 0.8, 0.8},
    tooltipHint = {1, 0.82, 0.3},
    tooltipWaypoint = {GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b},
}

function wt.SetSpellTooltip(tooltip, spell)
    tooltip:SetSpellByID(spell.tooltipId or spell.id)
    if spell.tooltipType == "item" then tooltip:AddLine(spell.formattedFullName, 1, 1, 1) end
end

function wt.InsertLink(spell)
    local link = spell.link
    if not link then return end
    if spell.taughtSpell then link = link .. " " .. spell.taughtSpell.link end
    local window = ChatEdit_GetActiveWindow()
    if window then window:Insert(link) else ChatFrame_OpenChat(link) end
end

function wt.weaponStatus(row)
    local isKnown = row.isKnown
    if isKnown == nil then isKnown = wt.isAbilityKnown(row.id) end
    if isKnown then return wt.L.LEDGER_WEAPON_KNOWN, "dim" end
    if wt.weaponIgnoredIds and wt.weaponIgnoredIds[row.id] then return wt.L.IGNORED_TT, "dim" end
    if not row.hideLevel then return row.formattedLevel, "weaponUnavailable" end
    return wt.L.LEDGER_WEAPON_AVAILABLE, "available"
end

function wt.SetTooltip(tooltip, row, palette)
    palette = palette or wt.ClassicPalette
    if row.npc or row.altTooltipType == "weapon" then
        tooltip:ClearLines()
        local title = row.npc and (row.masterName or row.name) or row.name
        if palette.tooltipTitle then
            tooltip:SetText(title, unpack(palette.tooltipTitle))
        else
            tooltip:SetText(title)
        end
    elseif row.tooltipType then
        wt.SetSpellTooltip(tooltip, row)
    else
        tooltip:ClearLines()
    end

    if row.npc then
        local zoneName = row.zoneName or (row.zone and C_Map.GetAreaInfo(row.zone))
        if zoneName then
            if row.x and row.y then zoneName = string.format("%s (%.1f, %.1f)", zoneName, row.x, row.y) end
            tooltip:AddLine(zoneName, unpack(palette.tooltipText))
        end
        if wt.canSetWaypoint(row) then tooltip:AddLine(wt.L.CLICK_TO_WAYPOINT, unpack(palette.tooltipWaypoint)) end
    else
        if row.altTooltipType == "weapon" and row.formattedTrainerZones then
            local r, g, b = unpack(palette.tooltipText)
            tooltip:AddLine(string.format(wt.L.TRAINED_IN, row.formattedTrainerZones), r, g, b, true)
        end
        if row.cost and row.cost > 0 then
            if row.key == wt.AVAILABLE_KEY then
                wt.addPricingBlock(tooltip, row, (wt.availableSpells()))
                tooltip:AddLine(wt.L.PRICE_MENU_HINT, 0.5, 0.5, 0.5)
            elseif row.isHeader and (row.key == wt.NEXTLEVEL_KEY or row.level) then
                wt.addPricingBlock(tooltip, row, row.level and row.spells or (wt.categorySpells(row.key)))
            elseif row.isHeader then
                tooltip:AddLine(wt.formatSpellCost(row))
            else
                wt.addPricingBlock(tooltip, row)
            end
        end
        if row.altTooltipType == "weapon" then
            tooltip:AddLine((wt.weaponStatus(row)), unpack(palette.tooltipHint))
        end
    end
    if row.tooltip then tooltip:AddLine(row.tooltip) end
    tooltip:Show()
    wt.ShowRankComparison(tooltip, tooltip:GetOwner(), wt.knownRankFor(row))
end

function wt.RowClick(frame, row, button)
    if not row then return end
    if row.npc then
        if button == "LeftButton" and not IsShiftKeyDown() and wt.canSetWaypoint(row) then
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            wt.setWaypoint(row)
        end
    elseif row.isHeader then
        if button == "RightButton" and row.key == wt.AVAILABLE_KEY then
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            MenuUtil.CreateContextMenu(frame, wt.priceMenuGenerator)
        end
    elseif button == "LeftButton" and IsShiftKeyDown() then
        wt.InsertLink(row)
    elseif button == "RightButton" then
        wt.ClickHook(row, function() wt:RebuildData() end, frame)
    end
end

local function addIgnoreLines(rootDescription, config)
    rootDescription:CreateTitle(config.title)
    rootDescription:CreateCheckbox(wt.L.IGNORED_TT, function() return config.isIgnored end, function()
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        ignoreStore:Flip(config.id)
        config.afterClick()
        return MenuResponse.Close
    end)

    local allRanks = wt:AllRanks(config.id)
    if allRanks and #allRanks > 1 then
        local allIgnored = true
        for _, id in ipairs(allRanks) do
            allIgnored = allIgnored and ignoreStore:IsIgnored(id)
        end
        rootDescription:CreateCheckbox(wt.L.IGNORE_ALL_TT, function() return allIgnored end, function ()
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            ignoreStore:UpdateMany(allRanks, not allIgnored)
            config.afterClick()
            return MenuResponse.Close
        end)
    end
end

wt.ClickHook = function(spell, afterClick, row)
    if not wt.TomeIds or not wt.TomeIds[spell.itemId or spell.id] then
        PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
        local isIgnored = ignoreStore:IsIgnored(spell.id)
        MenuUtil.CreateContextMenu(row, function(_, rootDescription)
            addIgnoreLines(rootDescription, {
                title = spell.formattedFullName,
                isIgnored = isIgnored,
                id = spell.id,
                afterClick = afterClick
            })
        end)

        return
    end

    local checked = wt:IsPetAbilityLearned(spell.id)
    PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
    local isIgnored = ignoreStore:IsIgnored(spell.id)
    MenuUtil.CreateContextMenu(row, function(_, rootDescription)
        if wt.SayaadTomes[spell.itemId] then
            rootDescription:CreateTitle(string.format("%s — %s", wt.L.TOME_HEADER, spell.localFamily))
        else
            rootDescription:CreateTitle(wt.L.TOME_HEADER)
        end
        rootDescription:CreateCheckbox(wt.L.TOME_LEARNED, function() return checked end, function()
            PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
            wt:SetPetAbilityStatus(spell.id, not checked)
            afterClick()
            return MenuResponse.Close
        end)
        addIgnoreLines(rootDescription, {
            title = spell.formattedFullName,
            isIgnored = isIgnored,
            id = spell.id,
            afterClick = afterClick
        })
    end)
end

