local MAX_ROWS = 18;
local ROW_HEIGHT = 18;

local _, englishClass = UnitClass("player");
englishClass = string.gsub(string.lower(englishClass),"^%l", string.upper);
local byLevel = _G[format("WhatsTraining%sAbilitiesByLevel", englishClass)];

local spellCache = {};
-- done has params spell, cacheHit
local function getSpell(spellId, done)
    if (spellCache[spellId] ~= nil) then 
        done(spellCache[spellId], true);
        return function()
            return false;
        end; 
    end
    local spell = Spell:CreateFromSpellID(spellId);
    spell:ContinueOnSpellLoad(function()
        if (spellCache[spell:GetSpellID()] ~= nil) then 
            done(spellCache[spellId], true); 
            return; 
        end
        spellCache[spell:GetSpellID()] = {
            id = spell:GetSpellID(),
            name = spell:GetSpellName(),
            subText = spell:GetSpellSubtext()
        };
        done(spellCache[spell:GetSpellID()], false);
    end);
end

local spells = {};
local function rebuild(level)
    local spellsByCategory = {
        available = {},
        missingReqs = {},
        notLevel = {},
        ignored = {}
    };
    for i, v in pairs(byLevel) do
        for _, a in ipairs(v) do
            local spell = spellCache[a.id];
            if (spell ~= nil) then
                spell.level = i;
                spell.cost = a.cost;
                if (ClassTrainerPlusDBPC and ClassTrainerPlusDBPC[spell.id]) then
                    tinsert(spellsByCategory.ignored, spell);
                elseif (i > level) then
                    tinsert(spellsByCategory.notLevel, spell);
                elseif (GetSpellInfo(spell.name, spell.subText) == nil) then
                    local canInsert = true;
                    local hasReqs = true;
                    if (a.requiredIds ~= nil) then
                        for j = 1, #a.requiredIds do
                            local reqId = a.requiredIds[j];
                            local req = spellCache[reqId];
                            if (req == nil) then
                                canInsert = false;
                            elseif (hasReqs) then
                                hasReqs = GetSpellInfo(req.name, req.subText) ~= nil;
                            end
                        end
                    end
                    if (canInsert) then
                        if (not hasReqs) then
                            tinsert(spellsByCategory.missingReqs, spell);
                        else
                            tinsert(spellsByCategory.available, spell);
                        end
                    end
                end
            end
        end
    end

    spells = {};
    local function sorter(a, b)
        if (a.level == b.level) then
            return a.name < b.name;
        end
        return a.level < b.level;
    end
    local categories = {
        {name = "Available", table = spellsByCategory.available, color = GREEN_FONT_COLOR_CODE},
        {name = "Missing Requirements", table = spellsByCategory.missingReqs, color = ORANGE_FONT_COLOR_CODE},
        {name = "Not Yet Available", table = spellsByCategory.notLevel, color = RED_FONT_COLOR_CODE},
        {name = "Ignored", table = spellsByCategory.ignored, color = GRAY_FONT_COLOR_CODE},
    }
    for _, category in ipairs(categories) do
        if (#category.table > 0) then
            tinsert(spells, {name = category.name, isHeader = true, color = category.color});
            table.sort(category.table, sorter);
            for _, s in ipairs(category.table) do
                tinsert(spells, s);
            end
        end
    end
end
local function rebuildIfNotCached(_, fromCache)
    if (fromCache) then return; end
    rebuild(UnitLevel("player"));
end
for i, v in pairs(byLevel) do
    for _, a in ipairs(v) do
        getSpell(a.id, rebuildIfNotCached);
        if (a.requiredIds and #a.requiredIds > 0) then
            for j = 1, #a.requiredIds do
                getSpell(a.requiredIds[j], rebuildIfNotCached);
            end
        end
    end
end
rebuild(UnitLevel("player"));

function WhatsTraining_SetRowSpell(row, spell)
    if (spell == nil) then
        row:Hide();
        return;
    elseif (spell.isHeader) then
        row.spell.label:SetText(spell.color..spell.name..FONT_COLOR_CODE_CLOSE);
        row.spell.label:SetJustifyH("CENTER");
        row:SetID(0);
        row.cost = 0;
    elseif (spell ~= nil) then
        local text = spell.name;
        if (spell.subText and spell.subText ~= "") then
            text = format(text.." "..PARENS_TEMPLATE, spell.subText);
        end
        text = text..format(" - Level %d", spell.level);
        row.spell.label:SetText(text)
        row.spell.label:SetJustifyH("LEFT");
        row.spell.label:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
        row:SetID(spell.id);
        row.cost = spell.cost;
        if (GameTooltip:IsOwned(row)) then
            GameTooltip:SetSpellByID(spell.id);
            GameTooltip:AddLine(GetCoinTextureString(spell.cost));
            GameTooltip:Show();
        end
    end
    row:Show();
end

function WhatsTraining_Update(frame)
    local scrollBar = frame.scrollBar;
    FauxScrollFrame_Update(scrollBar, #spells, MAX_ROWS, ROW_HEIGHT);
    local offset = FauxScrollFrame_GetOffset(scrollBar);
    for i = 1, MAX_ROWS do
        local spellIndex = i + offset;
        local spell = spells[spellIndex];
        local row = _G[frame:GetName().."Row"..i];
        WhatsTraining_SetRowSpell(row, spell);
    end
end

function WhatsTraining_CreateFrame()
    local mainFrame = CreateFrame("Frame", "WhatsTrainingFrame", SpellBookFrame);
    mainFrame:SetPoint("TOPLEFT", "SpellBookFrame", "TOPLEFT", 15, -69);
    mainFrame:SetPoint("BOTTOMRIGHT", "SpellBookFrame", "BOTTOMRIGHT", -36, 75);
    mainFrame:SetBackdrop({
        bgFile = "Interface\\FrameGeneral\\UI-Background-Rock",
        tile = false, tileSize = 32, edgeSize = 32,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    });
    mainFrame:SetFrameStrata("HIGH");

    mainFrame:Hide();
   
    hooksecurefunc("SpellBookFrame_UpdateSkillLineTabs", function()
        local skillLineTab = _G["SpellBookSkillLineTab"..MAX_SKILLLINE_TABS-1];
        skillLineTab:SetNormalTexture(134400);
        skillLineTab.tooltip = "What can I train?";
        skillLineTab:Show();
        if ( SpellBookFrame.selectedSkillLine == MAX_SKILLLINE_TABS-1 ) then
            skillLineTab:SetChecked(true);
            mainFrame:Show();
        else
            skillLineTab:SetChecked(false);
            mainFrame:Hide();
        end
    end);

    local scrollBar = CreateFrame("ScrollFrame", "$parentScrollBar", mainFrame, "FauxScrollFrameTemplate");
    scrollBar:SetPoint("TOPLEFT", 0, -8);
    scrollBar:SetPoint("BOTTOMRIGHT", -28, 8);
    scrollBar:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, ROW_HEIGHT, function()
            WhatsTraining_Update(mainFrame);
        end);
    end);
    scrollBar:SetScript("OnShow", function() 
        WhatsTraining_Update(mainFrame);
    end);
    mainFrame.scrollBar = scrollBar;

    local rows = {};
    local lastRow = nil;
    for i = 1, MAX_ROWS do
        local row = CreateFrame("Frame", "$parentRow"..i, mainFrame);
        row:SetHeight(ROW_HEIGHT);
        row:EnableMouse();
        row:SetScript("OnEnter", function(self)
            if (self:GetID() <= 0) then
                return;
            end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
            GameTooltip:SetSpellByID(self:GetID());
            GameTooltip:AddLine(GetCoinTextureString(self.cost));
            GameTooltip:Show();
        end);
        row:SetScript("OnLeave", function(self)
            GameTooltip:Hide();
        end);

        local spell = CreateFrame("Frame", "$parentSpell", row);
        spell:SetPoint("LEFT", "WhatsTrainingFrameRow"..i, "LEFT");
        spell:SetPoint("TOP", "WhatsTrainingFrameRow"..i, "TOP");
        spell:SetPoint("BOTTOM", "WhatsTrainingFrameRow"..i, "BOTTOM");

        local spellLabel = spell:CreateFontString(nil, "OVERLAY", "GameFontWhite");
        spellLabel:SetPoint("TOPLEFT", spell:GetName(), "TOPLEFT");
        spellLabel:SetPoint("BOTTOMRIGHT", spell:GetName(), "BOTTOMRIGHT");
        
        spell.label = spellLabel;
        row.spell = spell;

        if (lastRow == nil) then
            row:SetPoint("TOPLEFT", mainFrame, 8, -4);
        else
            row:SetPoint("TOPLEFT", rows[i-1], "BOTTOMLEFT", 0, -2);
        end
        row:SetPoint("RIGHT", mainFrame);
        lastRow = row;

        rawset(rows, i, row);
    end
end

local function hookCTP()
    hooksecurefunc("CTP_UpdateService", function()
        rebuild(UnitLevel("player"));
    end);
end

if (CTP_UpdateService) then
    hookCTP();
end

local eventFrame = CreateFrame("Frame");
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if (event == "ADDON_LOADED" and ... == "ClassTrainerPlus") then
        hookCTP();
        self:UnregisterEvent("ADDON_LOADED");
    elseif (event == "PLAYER_ENTERING_WORLD") then
        local isLogin, isReload = ...;
        if (isLogin or isReload) then
            rebuild(UnitLevel("player"));
            WhatsTraining_CreateFrame();
        end
        return;
    elseif (event == "LEARNED_SPELL_IN_TAB") then
        rebuild(UnitLevel("player"));
        if (WhatsTrainingFrame and WhatsTrainingFrame:IsVisible()) then
            WhatsTraining_Update(WhatsTrainingFrame);
        end
    elseif (event == "PLAYER_LEVEL_UP") then
        local level = ...;
        rebuild(level);
        if (WhatsTrainingFrame and WhatsTrainingFrame:IsVisible()) then
            WhatsTraining_Update(WhatsTrainingFrame);
        end
    end
end);
eventFrame:RegisterEvent("ADDON_LOADED");
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB");
eventFrame:RegisterEvent("PLAYER_LEVEL_UP");
