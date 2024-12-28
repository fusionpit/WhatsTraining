local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local hasNewSpellbook = WOW_PROJECT_ID >= WOW_PROJECT_CATACLYSM_CLASSIC

local BOOKTYPE_SPELL = BOOKTYPE_SPELL

local MAX_ROWS = 22
local ROW_HEIGHT = 14
local SKILL_LINE_TAB = MAX_SKILLLINE_TABS - 1
local HIGHLIGHT_TEXTURE_FILEID = GetFileIDFromPath(
                                     "Interface\\AddOns\\WhatsTraining\\highlight")
local LEFT_BG_TEXTURE_FILEID = GetFileIDFromPath(
                                   "Interface\\AddOns\\WhatsTraining\\left")
local RIGHT_BG_TEXTURE_FILEID = GetFileIDFromPath(
                                    "Interface\\AddOns\\WhatsTraining\\right")
local TAB_TEXTURE_FILEID = GetFileIDFromPath(
                               "Interface\\Icons\\INV_Misc_QuestionMark")

local tooltip = CreateFrame("GameTooltip", "WhatsTrainingTooltip", UIParent,
                            "GameTooltipTemplate")

local function setTooltip(spellInfo)
    if spellInfo.isItem then
        local taughtSpellId = wt.TomeTaughtSpells[spellInfo.itemId]
        if taughtSpellId then 
            tooltip:SetSpellByID(taughtSpellId)
        else
            print('no taught spell found for tome', spellInfo.itemId)
        end
        tooltip:AddLine(spellInfo.formattedFullName, 1, 1, 1)
    elseif spellInfo.id then
        tooltip:SetSpellByID(spellInfo.id)
    else
        tooltip:ClearLines()
    end
    if spellInfo.cost > 0 then
        tooltip:AddLine(wt.formatSpellCost(spellInfo))
    end
    if spellInfo.tooltip then tooltip:AddLine(spellInfo.tooltip) end
    tooltip:Show()
end

local menuFrame = CreateFrame("Frame", "WTRightClickFrame", UIParent,
                              "UIDropDownMenuTemplate")
local function setRowSpell(row, spell)
    if spell == nil then
        row.currentSpell = nil
        row:Hide()
        return
    elseif spell.isHeader then
        row.spell:Hide()
        row.header:Show()
        row.header:SetText(spell.formattedName)
        row:SetID(0)
        row.highlight:SetTexture(nil)
    else
        local rowSpell = row.spell
        row.header:Hide()
        row.isHeader = false
        row.highlight:SetTexture(HIGHLIGHT_TEXTURE_FILEID)
        rowSpell:Show()
        rowSpell.label:SetText(spell.name)
        rowSpell.subLabel:SetText(spell.formattedSubText)
        if not spell.hideLevel then
            rowSpell.level:Show()
            rowSpell.level:SetText(spell.formattedLevel)
            local color = spell.levelColor
            rowSpell.level:SetTextColor(color.r, color.g, color.b)
        else
            rowSpell.level:Hide()
        end
        row:SetID(spell.itemId or spell.id)
        rowSpell.icon:SetTexture(spell.useAltIcon and spell.altIcon or spell.icon)
    end
    if spell.click then
        row:SetScript("OnClick", spell.click)
    elseif not spell.isHeader then
        row:SetScript("OnClick", function(_, button)
            if button == "LeftButton" and IsShiftKeyDown() then
                local link = spell.link
                if spell.taughtSpell then
                    link = link..' '..spell.taughtSpell.link
                end
                local window = ChatEdit_GetActiveWindow()
                if window then
                    window:Insert(link)
                else
                    ChatFrame_OpenChat(link)
                end
            end
            if not wt.ClickHook then return end
            if button == "RightButton" then
                wt.ClickHook(spell, function()
                    wt:RebuildData()
                end, row)
            end
        end)
    else
        row:SetScript("OnClick", nil)
    end
    row.currentSpell = spell
    if (tooltip:IsOwned(row)) then setTooltip(spell) end
    row:Show()
end

-- When holding down left mouse on the slider knob, it will keep firing update even though
-- the offset hasn't changed so this will help throttle that
local lastOffset = -1
function wt.Update(frame, forceUpdate)
    local scrollBar = frame.scrollBar
    local offset = FauxScrollFrame_GetOffset(scrollBar)
    if offset == lastOffset and not forceUpdate then return end
    for i, row in ipairs(frame.rows) do
        local spellIndex = i + offset
        local spell = wt.data[spellIndex]
        setRowSpell(row, spell)
    end
    FauxScrollFrame_Update(wt.MainFrame.scrollBar, #wt.data, MAX_ROWS,
                           ROW_HEIGHT, nil, nil, nil, nil, nil, nil, true)
    lastOffset = offset
end

local hasFrameShown = false
function wt.CreateFrame()
    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", SpellBookFrame)
    mainFrame:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", 0, 0)
    mainFrame:SetPoint("BOTTOMRIGHT", SpellBookFrame, "BOTTOMRIGHT", 0, 0)
    mainFrame:SetFrameStrata("HIGH")
    local left = mainFrame:CreateTexture(nil, "ARTWORK")
    left:SetTexture(LEFT_BG_TEXTURE_FILEID)
    left:SetWidth(256)
    left:SetHeight(512)
    left:SetPoint("TOPLEFT", mainFrame)
    local right = mainFrame:CreateTexture(nil, "ARTWORK")
    right:SetTexture(RIGHT_BG_TEXTURE_FILEID)
    right:SetWidth(128)
    right:SetHeight(512)
    right:SetPoint("TOPRIGHT", mainFrame)
    if not hasNewSpellbook then
        local search = CreateFrame("EditBox", "$parentSearchBox", mainFrame, "SearchBoxTemplate")
        search:SetWidth(124)
        search:SetHeight(32)
        search:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 81, -34)
        search:SetScript("OnTextChanged", function (self)
            SearchBoxTemplate_OnTextChanged(self)
            local oldFilter = wt.filter
            wt.filter = strlower(self:GetText())
            if wt.filter ~= oldFilter then wt:RebuildData() end
        end)
    end
    mainFrame:Hide()
    
    if hasNewSpellbook then
    	left:SetWidth(350)
    	left:SetHeight(536)
    	left:SetPoint("TOPLEFT", mainFrame, 72, 8)
    	right:SetHeight(536)
    	right:SetPoint("TOPRIGHT", mainFrame, 0, 8)
    end

    -- Fix for Season of Discovery's Shaman 'Way of the Earth' rune
    -- When this rune is engraved, it constantly causes a `SPELLS_CHANGED` event
    -- That event will keep switching the tab back to the first non-general tab when fired
    local deferredPriorTabSelection = SpellBookFrame.selectedSkillLine
    SpellBookFrame:HookScript("OnEvent", function(self, event)
        if event == "SPELLS_CHANGED"
            and deferredPriorTabSelection == SKILL_LINE_TAB 
            and SpellBookFrame.selectedSkillLine ~= SKILL_LINE_TAB 
        then
            SpellBookFrame.selectedSkillLine = SKILL_LINE_TAB
            if SpellBookFrame:IsVisible() then
                SpellBookFrame_Update()
            end
        end
    end)
    function wt.Open()
        SpellBookFrame.selectedSkillLine = SKILL_LINE_TAB
        if SpellBookFrame:IsVisible() then
            SpellBookFrame_Update()
        else
            ToggleSpellBook("spell")
        end
    end

    local skillLineTab = _G["SpellBookSkillLineTab" .. SKILL_LINE_TAB]
    hooksecurefunc("SpellBookFrame_UpdateSkillLineTabs", function()
        skillLineTab:SetNormalTexture(TAB_TEXTURE_FILEID)
        skillLineTab.tooltip = wt.L.TAB_TEXT
        skillLineTab:Show()
        if SpellBookFrame.selectedSkillLine == SKILL_LINE_TAB then
            skillLineTab:SetChecked(true)
            mainFrame:Show()
            if hasNewSpellbook then
                SpellBookPrevPageButton:Disable()
                SpellBookNextPageButton:Disable()
                SpellBookPageText:SetText('')
            else
                ShowAllSpellRanksCheckbox:Hide()
            end
        else
            skillLineTab:SetChecked(false)
            mainFrame:Hide()
            local _, class = UnitClass("player")
            if not hasNewSpellbook and class ~= "ROGUE" and class ~= "WARRIOR" then
                ShowAllSpellRanksCheckbox:Show()
            end
        end
    end)
    hooksecurefunc("SpellBookFrame_Update", function()
        if SpellBookFrame.bookType ~= BOOKTYPE_SPELL then
            mainFrame:Hide()
        elseif SpellBookFrame.selectedSkillLine == SKILL_LINE_TAB then
            mainFrame:Show()
        end
        C_Timer.After(0, function()
            deferredPriorTabSelection = SpellBookFrame.selectedSkillLine
        end)
    end)

    local scrollBar = CreateFrame("ScrollFrame", "$parentScrollBar", mainFrame,
                                  "FauxScrollFrameTemplate")
    scrollBar:SetPoint("TOPLEFT", 0, -75)
    scrollBar:SetPoint("BOTTOMRIGHT", -65, 81)
    scrollBar:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, ROW_HEIGHT,
                                         function() wt.Update(mainFrame) end)
    end)
    scrollBar:SetScript("OnShow", function()
        if not hasFrameShown then
            wt:RebuildData()
            hasFrameShown = true
        end
        wt.Update(mainFrame, true)
    end)
    mainFrame.scrollBar = scrollBar

    local rows = {}
    for i = 1, MAX_ROWS do
        local row = CreateFrame("Button", "$parentRow" .. i, mainFrame)
        row:SetHeight(ROW_HEIGHT)
        row:EnableMouse(true)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        row:SetScript("OnEnter", function(self)
            tooltip:SetOwner(self, "ANCHOR_RIGHT")
            setTooltip(self.currentSpell)
        end)
        row:SetScript("OnLeave", function() tooltip:Hide() end)

        local highlight = row:CreateTexture("$parentHighlight", "HIGHLIGHT")
        highlight:SetAllPoints()

        local spell = CreateFrame("Frame", "$parentSpell", row)
        spell:SetPoint("LEFT", row, "LEFT")
        spell:SetPoint("TOP", row, "TOP")
        spell:SetPoint("BOTTOM", row, "BOTTOM")

        local spellIcon = spell:CreateTexture(nil, "OVERLAY")
        spellIcon:SetPoint("TOPLEFT", spell)
        spellIcon:SetPoint("BOTTOMLEFT", spell)
        local iconWidth = ROW_HEIGHT
        spellIcon:SetWidth(iconWidth)
        local spellLabel = spell:CreateFontString("$parentLabel", "OVERLAY",
                                                  "GameFontNormal")
        spellLabel:SetPoint("TOPLEFT", spell, "TOPLEFT", iconWidth + 4, 0)
        spellLabel:SetPoint("BOTTOM", spell)
        spellLabel:SetJustifyV("MIDDLE")
        spellLabel:SetJustifyH("LEFT")
        local spellSublabel = spell:CreateFontString("$parentSubLabel",
                                                     "OVERLAY",
                                                     "NewSubSpellFont")
        spellSublabel:SetJustifyH("LEFT")
        spellSublabel:SetPoint("TOPLEFT", spellLabel, "TOPRIGHT", 2, 0)
        spellSublabel:SetPoint("BOTTOM", spellLabel)
        local spellLevelLabel = spell:CreateFontString("$parentLevelLabel",
                                                       "OVERLAY",
                                                       "GameFontWhite")
        spellLevelLabel:SetPoint("TOPRIGHT", spell, -4, 0)
        spellLevelLabel:SetPoint("BOTTOM", spell)
        spellLevelLabel:SetJustifyH("RIGHT")
        spellLevelLabel:SetJustifyV("MIDDLE")
        spellSublabel:SetPoint("RIGHT", spellLevelLabel, "LEFT")
        spellSublabel:SetJustifyV("MIDDLE")

        local headerLabel = row:CreateFontString("$parentHeaderLabel",
                                                 "OVERLAY", "GameFontWhite")
        headerLabel:SetAllPoints()
        headerLabel:SetJustifyV("MIDDLE")
        headerLabel:SetJustifyH("CENTER")

        spell.label = spellLabel
        spell.subLabel = spellSublabel
        spell.icon = spellIcon
        spell.level = spellLevelLabel
        row.highlight = highlight
        row.header = headerLabel
        row.spell = spell

        if rows[i - 1] == nil then
        	if hasNewSpellbook then
        		row:SetPoint("TOPLEFT", mainFrame, 110, -78)
        	else
            	row:SetPoint("TOPLEFT", mainFrame, 26, -78)
            end
        else
            row:SetPoint("TOPLEFT", rows[i - 1], "BOTTOMLEFT", 0, -2)
        end
        row:SetPoint("RIGHT", scrollBar)

        rawset(rows, i, row)
    end
    mainFrame.rows = rows
    wt.MainFrame = mainFrame
end

function addIgnoreLines(rootDescription, config)
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
        MenuUtil.CreateContextMenu(row, function(owner, rootDescription)
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
    MenuUtil.CreateContextMenu(row, function(owner, rootDescription)
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
