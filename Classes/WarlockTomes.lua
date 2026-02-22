local _, wt = ...
if wt.currentClass ~= "WARLOCK" then return end

local LCT = LibStub("LibBabble-CreatureType-3.0"):GetLookupTable()
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local SUCCUBUS_KEY_FORMAT = "SUC:%d"
local INCUBUS_KEY_FORMAT = "INC:%d"

local tomes = {}
-- everything but Incubus, which does not have an entry in LibCreatureType
local families = {}
local tomesByFamily = {}
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
        tome.altIcon = wt.WarlockAltIcons[tome.family]
        if tome.family == 'Incubus' then
            tome.localFamily = wt.L.INCUBUS
        else
            local localFamily = LCT[tome.family]
            tome.localFamily = localFamily
            families[localFamily] = tome.family
        end
        tome.taughtSpell = wt.TomeTaughtSpells[tome.itemId]
        if not tomesByFamily[tome.family] then
            tomesByFamily[tome.family] = {}
        end
        tinsert(tomesByFamily[tome.family], tome)
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
local function sayaadKeys(itemId)
    local succubusKey = string.format(SUCCUBUS_KEY_FORMAT, itemId)
    local incubusKey = string.format(INCUBUS_KEY_FORMAT, itemId)
    return succubusKey, incubusKey
end
local function checkCurrentPetSpells()
    local pet = currentEnglishPet()
    if not pet then return end
    local familyTomes = tomesByFamily[pet]
    if not familyTomes then return end
    local hasUpdate = false
    for _, tome in ipairs(familyTomes) do
        if IsSpellKnown(tome.taughtSpell, true) then
            if wt.SayaadTomes[tome.itemId] then
                local succubusKey, incubusKey = sayaadKeys(tome.itemId)
                if pet == "Succubus" then
                    local wasUpdated = wt:SetPetAbilityStatus(succubusKey, true)
                    hasUpdate = hasUpdate or wasUpdated
                elseif pet == "Incubus" then
                    local wasUpdated = wt:SetPetAbilityStatus(incubusKey, true)
                    hasUpdate = hasUpdate or wasUpdated
                end
            else
                local wasUpdated = wt:SetPetAbilityStatus(tome.itemId, true)
                hasUpdate = hasUpdate or wasUpdated
            end
        end
    end
    if hasUpdate then
        wt:RebuildData()
    end
end
local events = CreateFrame("Frame")
events:RegisterEvent("PET_DISMISS_START")
events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:SetScript("OnEvent", function(self, event, arg1, ...)
    if event == "PET_DISMISS_START" then
        checkCurrentPetSpells()
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" and arg1 == "player" then
        local spellId = select(2, ...)
        if wt.WarlockPetSummonIds[spellId] then
            C_Timer.After(0.5, checkCurrentPetSpells)
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        RunNextFrame(checkCurrentPetSpells)
    end
end)

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
    if wt:IsPetAbilityLearned(key) then
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
    if wt:IsPetAbilityLearned(key) then
        return RED_FONT_COLOR:WrapTextInColorCode(spaced(tome.localFamily, ITEM_SPELL_KNOWN))
    elseif ignoreStore:IsIgnored(key) then
        return LIGHTYELLOW_FONT_COLOR:WrapTextInColorCode(spaced(tome.localFamily, wt.L.IGNORED_HEADER))
    end
    return WHITE_FONT_COLOR:WrapTextInColorCode(spaced(tome.localFamily, wt.L.NOT_KNOWN))
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

local sayaadTomeSpellTooltip = CreateFrame("GameTooltip", "WhatsTrainingSayaadTomeTooltip", UIParent, "GameTooltipTemplate")

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
        sayaadTomeSpellTooltip:SetOwner(self, "ANCHOR_NONE")
        sayaadTomeSpellTooltip:SetPoint("BOTTOMLEFT", self, "TOPRIGHT")
        sayaadTomeSpellTooltip:ClearLines()
        sayaadTomeSpellTooltip:SetText(self.tooltip)
        sayaadTomeSpellTooltip:Show()
    end)
    parent:SetScript("OnLeave", function()
        sayaadTomeSpellTooltip:Hide()
    end)
    local succubusIcon = createIcon("Succubus", wt.WarlockAltIcons.Succubus, parent, "LEFT")
    local incubusIcon = createIcon("Incubus", wt.WarlockAltIcons.Incubus, parent, "RIGHT")
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
-- scanning for learned pet spells by spell id only returns true for the last trained rank
-- the only way to get all learned tomes automatically is to scan the tooltip for 'Already Known' when a pet is out
local function updateMerchantFrame()
    for _, f in ipairs(iconFrames) do
        f:Hide()
    end
    if wt.IsAddOnLoaded('GrimoireKeeper') then return end
    local guid = UnitGUID("npc")
    if guid == nil then return end
    local npcId = select(6, strsplit("-", guid))
    if npcId == nil then return end
    npcId = tonumber(npcId)
    if not wt.WarlockTomeMerchantIds[npcId] then return end

    local numMerchantItems = GetMerchantNumItems()
    local engPet = currentEnglishPet()
    for i = 1, MERCHANT_ITEMS_PER_PAGE do
        local iconFrame = iconFrames[i]
        local index = ((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i
        local itemButton = _G["MerchantItem" .. i .. "ItemButton"]
        local merchantButton = _G["MerchantItem" .. i]
        local hasUpdate = false
        if index <= numMerchantItems then
            local merchantItemID = GetMerchantItemID(index)
            if wt.SayaadTomes[merchantItemID] then
                local petMatches = matchesCurrentPet(merchantItemID, engPet)
                local succubusKey, incubusKey = sayaadKeys(merchantItemID)
                if not wt:IsPetAbilityLearned(succubusKey) and petMatches and engPet == "Succubus" and isKnown(index) then
                    hasUpdate = hasUpdate or wt:SetPetAbilityStatus(succubusKey, true)
                elseif not wt:IsPetAbilityLearned(incubusKey) and petMatches and engPet == "Incubus" and isKnown(index) then
                    hasUpdate = hasUpdate or wt:SetPetAbilityStatus(incubusKey, true)
                end
                local succubusKnown = wt:IsPetAbilityLearned(succubusKey)
                local succubusIgnored = ignoreStore:IsIgnored(succubusKey)
                local incubusKnown = wt:IsPetAbilityLearned(incubusKey)
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
                if not wt:IsPetAbilityLearned(merchantItemID) then
                    local petMatches = matchesCurrentPet(merchantItemID, engPet)
                    if petMatches and isKnown(index) then
                        hasUpdate = hasUpdate or wt:SetPetAbilityStatus(merchantItemID, true)
                    end
                end
                if wt:IsPetAbilityLearned(merchantItemID) then
                    colorKnown(merchantButton, itemButton)
                elseif ignoreStore:IsIgnored(merchantItemID) then
                    colorIgnored(merchantButton, itemButton)
                end
            end
        end
        if hasUpdate then
            wt:RebuildData()
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
        if wt:IsPetAbilityLearned(merchantItemID) then 
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
