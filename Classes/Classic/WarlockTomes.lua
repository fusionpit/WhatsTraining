local _, wt = ...
if wt.currentClass ~= "WARLOCK" then return end

local LCT = LibStub("LibBabble-CreatureType-3.0"):GetLookupTable()
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local SUCCUBUS_ICON = 136220
local SUCCUBUS_KEY_FORMAT = "SUC:%d"
local INCUBUS_ICON = 4352492
local INCUBUS_KEY_FORMAT = "INC:%d"

wt.TomesByLevel = {
    [4] = {{itemId = 16321, cost = 100, family = "Imp"}},
    [8] = {{itemId = 16302, cost = 100, family = "Imp"}},
    [12] = {{itemId = 16331, cost = 600, family = "Imp"}},
    [14] = {{itemId = 16322, cost = 900, family = "Imp"}, {itemId = 16326, cost = 900, family = "Imp"}},
    [16] = {{itemId = 16351, cost = 1200, family = "Voidwalker"}},
    [18] = {{itemId = 16316, cost = 1500, family = "Imp"}, {itemId = 16357, cost = 1500, family = "Voidwalker"}},
    [20] = {{itemId = 16346, cost = 2000, family = "Voidwalker"}},
    [22] = {{id = "SUC:16375", itemId = 16375, cost = 2500, family = "Succubus"}, {id = "INC:16375", itemId = 16375, cost = 2500, family = "Incubus"}},
    [24] = {{itemId = 16327, cost = 3000, family = "Imp"}, {itemId = 16352, cost = 3000, family = "Voidwalker"}, {itemId = 16363, cost = 3000, family = "Voidwalker"}},
    [26] = {{itemId = 16323, cost = 4000, family = "Imp"}, {itemId = 16358, cost = 4000, family = "Voidwalker"}, {id = "SUC:16379", itemId = 16379, cost = 4000, family = "Succubus"}, {id = "INC:16379", itemId = 16379, cost = 4000, family = "Incubus"}},
    [28] = {{itemId = 16317, cost = 5000, family = "Imp"}, {id = "SUC:16368", itemId = 16368, cost = 5000, family = "Succubus"}, {id = "INC:16368", itemId = 16368, cost = 5000, family = "Incubus"}},
    [30] = {{itemId = 16347, cost = 6000, family = "Voidwalker"}},
    [32] = {{itemId = 16353, cost = 7000, family = "Voidwalker"}, {id = "SUC:16380", itemId = 16380, cost = 7000, family = "Succubus"}, {id = "INC:16380", itemId = 16380, cost = 7000, family = "Incubus"}, {itemId = 16384, cost = 7000, family = "Felhunter"}},
    [34] = {{itemId = 16328, cost = 8000, family = "Imp"}, {itemId = 16359, cost = 8000, family = "Voidwalker"}, {id = "SUC:16376", itemId = 16376, cost = 8000, family = "Succubus"}, {id = "INC:16376", itemId = 16376, cost = 8000, family = "Incubus"}},
    [36] = {{itemId = 16364, cost = 9000, family = "Voidwalker"}, {id = "SUC:16371", itemId = 16371, cost = 9000, family = "Succubus"}, {id = "INC:16371", itemId = 16371, cost = 9000, family = "Incubus"}, {itemId = 16388, cost = 9000, family = "Felhunter"}},
    [38] = {{itemId = 16318, cost = 10000, family = "Imp"}, {itemId = 16324, cost = 10000, family = "Imp"}, {itemId = 16381, cost = 10000, family = "Felhunter"}},
    [40] = {{itemId = 16348, cost = 11000, family = "Voidwalker"}, {itemId = 16354, cost = 11000, family = "Voidwalker"}, {itemId = 16385, cost = 11000, family = "Felhunter"}},
    [42] = {{itemId = 16360, cost = 11000, family = "Voidwalker"}, {itemId = 16390, cost = 11000, family = "Felhunter"}},
    [44] = {{itemId = 16329, cost = 12000, family = "Imp"}, {id = "SUC:16372", itemId = 16372, cost = 12000, family = "Succubus"}, {id = "INC:16372", itemId = 16372, cost = 12000, family = "Incubus"}},
    [46] = {{id = "SUC:16377", itemId = 16377, cost = 13000, family = "Succubus"}, {id = "INC:16377", itemId = 16377, cost = 13000, family = "Incubus"}, {itemId = 16382, cost = 13000, family = "Felhunter"}},
    [48] = {{itemId = 16319, cost = 14000, family = "Imp"}, {itemId = 16355, cost = 14000, family = "Voidwalker"}, {itemId = 16365, cost = 14000, family = "Voidwalker"}, {itemId = 16386, cost = 14000, family = "Felhunter"}},
    [50] = {{itemId = 16325, cost = 15000, family = "Imp"}, {itemId = 16349, cost = 15000, family = "Voidwalker"}, {itemId = 16361, cost = 15000, family = "Voidwalker"}},
    [52] = {{id = "SUC:16373", itemId = 16373, cost = 18000, family = "Succubus"}, {id = "INC:16373", itemId = 16373, cost = 18000, family = "Incubus"}, {itemId = 16389, cost = 18000, family = "Felhunter"}},
    [54] = {{itemId = 16330, cost = 20000, family = "Imp"}, {itemId = 16383, cost = 20000, family = "Felhunter"}},
    [56] = {{itemId = 16356, cost = 22000, family = "Voidwalker"}, {itemId = 16387, cost = 22000, family = "Felhunter"}},
    [58] = {{itemId = 16320, cost = 24000, family = "Imp"}, {itemId = 16362, cost = 24000, family = "Voidwalker"}, {id = "SUC:16378", itemId = 16378, cost = 24000, family = "Succubus"}, {id = "INC:16378", itemId = 16378, cost = 24000, family = "Incubus"}},
    [60] = {{itemId = 16350, cost = 26000, family = "Voidwalker"}, {itemId = 16366, cost = 26000, family = "Voidwalker"}, {id = "SUC:16374", itemId = 16374, cost = 26000, family = "Succubus"}, {id = "INC:16374", itemId = 16374, cost = 26000, family = "Incubus"}},    
}
wt.TomeTaughtSpells = {
    [16321] = 6307,
    [16302] = 7799,
    [16331] = 4511,
    [16322] = 7804,
    [16326] = 2947,
    [16351] = 7812,
    [16316] = 7800,
    [16357] = 17767,
    [16346] = 7809,
    [16375] = 6360,
    [16327] = 8316,
    [16352] = 19438,
    [16363] = 17735,
    [16323] = 7805,
    [16358] = 17850,
    [16379] = 6358,
    [16317] = 7801,
    [16368] = 7815,
    [16347] = 7810,
    [16353] = 19440,
    [16380] = 7870,
    [16384] = 19478,
    [16328] = 8317,
    [16359] = 17851,
    [16376] = 7813,
    [16364] = 17750,
    [16371] = 7816,
    [16388] = 19244,
    [16318] = 7802,
    [16324] = 11766,
    [16381] = 19731,
    [16348] = 7811,
    [16354] = 19441,
    [16385] = 19655,
    [16360] = 17852,
    [16390] = 19480,
    [16329] = 11770,
    [16372] = 11778,
    [16377] = 11784,
    [16382] = 19734,
    [16319] = 11762,
    [16355] = 19442,
    [16365] = 17751,
    [16386] = 19656,
    [16325] = 11767,
    [16349] = 11774,
    [16361] = 17853,
    [16373] = 11779,
    [16389] = 19647,
    [16330] = 11771,
    [16383] = 19736,
    [16356] = 19443,
    [16387] = 19660,
    [16320] = 11763,
    [16362] = 17854,
    [16378] = 11785,
    [16350] = 11775,
    [16374] = 11780,
    [16366] = 17752,
}
local tomes = {}
-- everything but Incubus, which does not have an entry in LibCreatureType
local families = {}
wt.TomeIds = {}
-- Succubus and Incubus share tomes, but you need to buy them twice to train both
wt.SayaadTomes = {}
for _, tomesByLevel in pairs(wt.TomesByLevel) do
    for _, tome in ipairs(tomesByLevel) do 
        if not tome.id then
            tome.id = tome.itemId
        else
            wt.SayaadTomes[tome.itemId] = true
        end
        wt.TomeIds[tome.itemId] = true 
        tomes[tome.id] = tome
        if tome.family == 'Succubus' then
            tome.altIcon = SUCCUBUS_ICON
        end
        if tome.family == 'Incubus' then
            tome.altIcon = INCUBUS_ICON
            tome.localFamily = wt.L.INCUBUS
        else
            local localFamily = LCT[tome.family]
            tome.localFamily = localFamily
            families[localFamily] = tome.family
        end
    end
end

local scan = CreateFrame("GameTooltip", "WTWarlockTomeScanningTooltip", nil,
                            "GameTooltipTemplate")
scan:SetOwner(UIParent, "ANCHOR_NONE")
local requiresLevelPattern = SPELL_REQUIRED_FORM .. '?'
local function isKnown(merchantIndex)
    scan:ClearLines()
    local link = GetMerchantItemLink(merchantIndex)
    if not link then return false end
    scan:SetHyperlink(link)
    local lines = scan:NumLines()
    for i = lines, 1, -1 do
        local text =
            _G['WTWarlockTomeScanningTooltipTextLeft' .. i]:GetText()
        -- the "Requires Level x" line is above the "Already Known" line
        -- we can stop searching when we hit it
        if (string.match(text, requiresLevelPattern)) then
            return false
        end
        if text == ITEM_SPELL_KNOWN then return true end
    end
    return false
end

local DEMON = LCT["Demon"]
local function currentEnglishPet()
    if not IsPetActive() then return nil end
    if UnitCreatureType("pet") ~= DEMON then return nil end
    local family = families[UnitCreatureFamily("pet")]
    -- LCT does not have Incubus, so assume any nil for family is incubus
    return family or "Incubus"
end

local function matchesCurrentPet(itemId, engPet)
    local tomeKey = nil
    if wt.SayaadTomes[itemId] then
        local keyFormat = engPet == "Succubus" and SUCCUBUS_KEY_FORMAT or INCUBUS_KEY_FORMAT
        tomeKey = string.format(keyFormat, itemId)
    elseif wt.TomeIds[itemId] then
        tomeKey = itemId
    end
    if tomeKey == nil then return false end
    local tome = tomes[tomeKey]
    return tome and engPet == tome.family
end
local function status(key)
    if wt.learnedPetAbilityMap[key] then
        return ITEM_SPELL_KNOWN
    elseif ignoreStore:IsIgnored(key) then
        return wt.L.IGNORED_HEADER
    end
    return nil
end
local function spaced(a, b)
    return string.format("%s %s", a, b)
end
local function coloredStatusTip(key)
    local tome = tomes[key]
    if not tome then return nil end
    if wt.learnedPetAbilityMap[key] then
        return RED_FONT_COLOR:WrapTextInColorCode(spaced(tome.localFamily, ITEM_SPELL_KNOWN))
    elseif ignoreStore:IsIgnored(key) then
        return LIGHTYELLOW_FONT_COLOR:WrapTextInColorCode(spaced(tome.localFamily, wt.L.IGNORED_HEADER))
    end
    return WHITE_FONT_COLOR:WrapTextInColorCode(spaced(tome.localFamily, wt.L.NOT_KNOWN))
end
local function sayaadKeys(itemId)
    local succubusKey = string.format(SUCCUBUS_KEY_FORMAT, itemId)
    local incubusKey = string.format(INCUBUS_KEY_FORMAT, itemId)
    return succubusKey, incubusKey
end
local function colorItem(merchantButton, slotR, slotG, slotB, itemButton, texR, texG, texB)
    SetItemButtonNameFrameVertexColor(merchantButton, slotR, slotG, slotB)
    SetItemButtonSlotVertexColor(merchantButton, slotR, slotG, slotB)
    SetItemButtonTextureVertexColor(itemButton, texR, texG, texB)
    SetItemButtonNormalTextureVertexColor(itemButton, texR, texG, texB)
end
local function colorKnown(merchantButton, itemButton)
    colorItem(
        merchantButton, 0.5, 0, 0,
        itemButton, 0.5, 0, 0
    )
end
local function colorIgnored(merchantButton, itemButton)
    colorItem(
        merchantButton, 0.55, 0.55, 0,
        itemButton, 0.45, 0.45, 0
    )
end

local tomeSpellTooltip = CreateFrame("GameTooltip", "WhatsTrainingSayaadTomeTooltip", UIParent, "GameTooltipTemplate")

local ICON_SIZE = 16
local function createIcon(sayaad, textureId, parent, point)
    local icon = parent:CreateTexture(nil, "OVERLAY")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint(point, parent)
    icon:SetTexture(textureId)
    icon:Show()

    return icon
end
local iconFrames = {}
for i = 1, MERCHANT_ITEMS_PER_PAGE do
    local itemFrame = _G["MerchantItem"..i]
    local parent = CreateFrame("Frame", "WTSayaadIcons"..i, itemFrame)
    parent:SetFrameStrata("TOOLTIP")
    parent:SetSize(ICON_SIZE*2+2, ICON_SIZE)
    parent:SetPoint("BOTTOMRIGHT", itemFrame, "BOTTOMRIGHT", -6, 0)
    parent:SetScript("OnEnter", function(self)
        if not self.tooltip then return end
        tomeSpellTooltip:SetOwner(self, "ANCHOR_NONE")
        tomeSpellTooltip:SetPoint("BOTTOMLEFT", self, "TOPRIGHT")
        tomeSpellTooltip:ClearLines()
        tomeSpellTooltip:SetText(self.tooltip)
        tomeSpellTooltip:Show()
    end)
    parent:SetScript("OnLeave", function()
        tomeSpellTooltip:Hide()
    end)
    local succubusIcon = createIcon("Succubus", SUCCUBUS_ICON, parent, "LEFT")
    local incubusIcon = createIcon("Incubus", INCUBUS_ICON, parent, "RIGHT")
    iconFrames[i] = {
        Hide = function()
            parent:Hide()
            parent.tooltip = nil
            succubusIcon:SetVertexColor(1, 1, 1)
            incubusIcon:SetVertexColor(1, 1, 1)
        end, 
        Show = function(self, succubusKnown, succubusTip, incubusKnown, incubusTip)
            parent:Show()
            parent.tooltip = succubusTip..' \124 '..incubusTip
            self:showIcon(succubusIcon, succubusKnown)
            self:showIcon(incubusIcon, incubusKnown)
        end,
        showIcon = function(self, icon, known)
            if known == true then
                icon:SetVertexColor(0.5, 0, 0)
            elseif known == false then
                icon:SetVertexColor(0.55, 0.55, 0)
            else
                icon:SetVertexColor(1, 1, 1)
            end
        end
    }
end
local tomeMerchantIds = {
    [5520] = true,
    [5753] = true,
    [1277] = true,
    [6027] = true,
    [6374] = true,
    [6373] = true,
    [6376] = true,
    [1280] = true,
    [5749] = true,
    [5750] = true,
    [6382] = true,
    [5815] = true,
    [6328] = true
}
local function updateMerchantFrame()
    if IsAddOnLoaded('GrimoireKeeper') then return end
    local guid = UnitGUID("npc")
    if guid == nil then return end
    local npcId = select(6, strsplit("-", guid))
    if npcId == nil then return end
    npcId = tonumber(npcId)
    if not tomeMerchantIds[npcId] then return end

    local numMerchantItems = GetMerchantNumItems()
    local engPet = currentEnglishPet()
    for i = 1, MERCHANT_ITEMS_PER_PAGE do
        local iconFrame = iconFrames[i]
        iconFrame:Hide()
        local index = ((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i
        local itemButton = _G["MerchantItem" .. i .. "ItemButton"]
        local merchantButton = _G["MerchantItem" .. i]
        if index <= numMerchantItems then
            local merchantItemID = GetMerchantItemID(index)
            if wt.SayaadTomes[merchantItemID] then
                local petMatches = matchesCurrentPet(merchantItemID, engPet)
                local succubusKey, incubusKey = sayaadKeys(merchantItemID)
                if wt.learnedPetAbilityMap[succubusKey] ~= true and petMatches and engPet == "Succubus" and isKnown(index) then
                    wt.learnedPetAbilityMap[succubusKey] = true
                elseif wt.learnedPetAbilityMap[incubusKey] ~= true and petMatches and engPet == "Incubus" and isKnown(index) then
                    wt.learnedPetAbilityMap[incubusKey] = true
                end
                local succubusKnown = wt.learnedPetAbilityMap[succubusKey]
                local succubusIgnored = ignoreStore:IsIgnored(succubusKey)
                local incubusKnown = wt.learnedPetAbilityMap[incubusKey]
                local incubusIgnored = ignoreStore:IsIgnored(incubusKey)
                local eitherKnown = succubusKnown or incubusKnown
                local eitherIgnored = succubusIgnored or incubusIgnored

                local succubusState = nil
                if succubusKnown then succubusState = true elseif succubusIgnored then succubusState = false end
                local incubusState = nil
                if incubusKnown then incubusState = true elseif incubusIgnored then incubusState = false end

                if succubusKnown and incubusKnown then
                    -- both are known
                    colorKnown(merchantButton, itemButton)
                elseif succubusIgnored and incubusIgnored and not eitherKnown then
                    -- both are ignored
                    colorIgnored(merchantButton, itemButton)
                elseif (succubusKnown and incubusIgnored) or (succubusIgnored and incubusKnown) then
                    -- one is known and the other is ignored
                    colorKnown(merchantButton, itemButton)
                elseif (succubusKnown and engPet == "Succubus") or (incubusKnown and engPet == "Incubus") then
                    -- the current pet is known, but the other is unknown
                    colorItem(
                        merchantButton, 0.75, 0, 0,
                        itemButton, 0.75, 0, 0
                    )
                end
                local succubusKey, incubusKey = sayaadKeys(merchantItemID)
                local succubusTip = coloredStatusTip(succubusKey)
                local incubusTip = coloredStatusTip(incubusKey)
                iconFrame:Show(succubusState, succubusTip, incubusState, incubusTip)
            elseif wt.TomeIds[merchantItemID] then
                if wt.learnedPetAbilityMap[merchantItemID] ~= true then
                    local petMatches = matchesCurrentPet(merchantItemID, engPet)
                    if petMatches and isKnown(index) then
                        wt.learnedPetAbilityMap[merchantItemID] = true
                    end
                end
                if wt.learnedPetAbilityMap[merchantItemID] then
                    colorKnown(merchantButton, itemButton)
                elseif ignoreStore:IsIgnored(merchantItemID) then
                    colorIgnored(merchantButton, itemButton)
                end
            end
        end
    end
end
hooksecurefunc("MerchantFrame_UpdateMerchantInfo", updateMerchantFrame)

local tomeSpellTooltip = CreateFrame("GameTooltip", "WhatsTrainingTomeSpellTooltip", UIParent, "GameTooltipTemplate")
local function showSecondaryTooltip(tt, itemId)
    local taughtSpell = wt.TomeTaughtSpells[itemId]
    if not taughtSpell then return end
    tomeSpellTooltip:SetOwner(tt, "ANCHOR_NONE")
    tomeSpellTooltip:SetPoint("TOPLEFT", tt, "TOPRIGHT")
    tomeSpellTooltip:ClearLines()
    tomeSpellTooltip:SetSpellByID(taughtSpell)
end
hooksecurefunc(GameTooltip, "SetMerchantItem", function(tt, index)
    local merchantItemID = GetMerchantItemID(index)
    if not wt.TomeIds[merchantItemID] then return end
    if wt.SayaadTomes[merchantItemID] then
        local succubusKey, incubusKey = sayaadKeys(merchantItemID)
        local succubusTip = coloredStatusTip(succubusKey)
        local incubusTip = coloredStatusTip(incubusKey)
        tt:AddDoubleLine(succubusTip, incubusTip)
    else
        if wt.learnedPetAbilityMap[merchantItemID] then 
            tt:AddLine(RED_FONT_COLOR:WrapTextInColorCode(spaced(tomes[merchantItemID].localFamily, status(merchantItemID))))
        elseif ignoreStore:IsIgnored(merchantItemID) then
            tt:AddLine(LIGHTYELLOW_FONT_COLOR:WrapTextInColorCode(spaced(tomes[merchantItemID].localFamily, status(merchantItemID))))
        end
    end
    showSecondaryTooltip(tt, merchantItemID)
end)
hooksecurefunc(GameTooltip, "Hide", function()
    tomeSpellTooltip:Hide()
end)
