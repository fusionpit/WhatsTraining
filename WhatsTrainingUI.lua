setfenv(1, WhatsTraining)
WhatsTrainingUI = {}

local HIGHLIGHT_TEXTURE_FILEID = "Interface\\AddOns\\WhatsTraining_Turtle\\textures\\highlight"
local LEFT_BG_TEXTURE_FILEID = "Interface\\AddOns\\WhatsTraining_Turtle\\textures\\left"
local RIGHT_BG_TEXTURE_FILEID = "Interface\\AddOns\\WhatsTraining_Turtle\\textures\\right"
local TAB_TEXTURE_FILEID = "Interface\\Icons\\INV_Misc_QuestionMark"
local TAB_BACKDROP_FILEID = "Interface\\Spellbook\\SpellBook-SkillLineTab"
local TAB_HIGHLIGHT_TEXTURE_FILEID = "Interface\\Buttons\\ButtonHilight-Square"
local TAB_CHECKED_TEXTURE_FILEID = "Interface\\Buttons\\CheckButtonHilight"

local ROW_HEIGHT = 14

function WhatsTrainingUI:Initialize()
  self:InitDisplay()
end

function WhatsTrainingUI:Update()
  FauxScrollFrame_Update(self.scrollBar, 50, 5, ROW_HEIGHT);
end

-- Sets up the tab
---@return CheckButton
function WhatsTrainingUI:SetupTab()
  local tab = CreateFrame("CheckButton", "WhatsTrainingTab", SpellBookFrame)
  tab:SetFrameStrata("HIGH")
  tab:SetPoint('BOTTOMRIGHT', SpellBookFrame, -7, 86)
  tab:SetWidth(24)
  tab:SetHeight(24)

  tab:SetHighlightTexture(TAB_HIGHLIGHT_TEXTURE_FILEID)
  tab:SetCheckedTexture(TAB_CHECKED_TEXTURE_FILEID)

  local TAB_BACKDROP_TEXTURE = tab:CreateTexture(nil, "BACKGROUND")
  TAB_BACKDROP_TEXTURE:SetTexture(TAB_BACKDROP_FILEID)
  TAB_BACKDROP_TEXTURE:SetWidth(54)
  TAB_BACKDROP_TEXTURE:SetHeight(54)
  TAB_BACKDROP_TEXTURE:SetPoint("TOPLEFT", -4, 11)
  tab:SetBackdrop(TAB_BACKDROP_TEXTURE)

  tab:SetNormalTexture(TAB_TEXTURE_FILEID)

  return tab
end

function WhatsTrainingUI:handleTabToggle()
  if self.tab:GetChecked() then
    self.frame:Show()
  else
    self.frame:Hide()
  end
end

function WhatsTrainingUI:InitDisplay()
  self.frame = CreateFrame("Frame", "WhatsTrainingFrame", SpellBookFrame)
  self.frame:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", 0, 0)
  self.frame:SetPoint("BOTTOMRIGHT", SpellBookFrame, "BOTTOMRIGHT", 0, 0)
  self.frame:SetFrameStrata("HIGH")

  self.tab = WhatsTrainingUI:SetupTab()
  self.tab:SetScript("OnClick", function() WhatsTrainingUI:handleTabToggle() end)

  local left = self.frame:CreateTexture(nil, "ARTWORK")
  left:SetTexture(LEFT_BG_TEXTURE_FILEID)
  left:SetWidth(256)
  left:SetHeight(512)
  left:SetPoint("TOPLEFT", self.frame)

  local right = self.frame:CreateTexture(nil, "ARTWORK")
  right:SetTexture(RIGHT_BG_TEXTURE_FILEID)
  right:SetWidth(128)
  right:SetHeight(512)
  right:SetPoint("TOPRIGHT", self.frame)

  self.scrollBar = CreateFrame("ScrollFrame", "$parentScrollBar", self.frame, "FauxScrollFrameTemplate")
  self.scrollBar:SetPoint("TOPLEFT", 0, -75)
  self.scrollBar:SetPoint("BOTTOMRIGHT", -65, 81)

  self.scrollBar:SetScript("OnVerticalScroll", function(self, offset)
    FauxScrollFrame_OnVerticalScroll(self, offset, ROW_HEIGHT, WhatsTrainingUI:Update())
  end)

  self.frame:Hide()
end

---Sets the given spells as rows
---@param spells table<SpellCategories, Spell[]>
function WhatsTrainingUI:SetItems(spells)
  local rows = {}
  local i = 1
  for categoryIndex, spellCategory in ipairs(SpellCategoryHeaders) do
    local headerName = "$headerRow-" .. spellCategory.name
    local header = CreateFrame("Button", headerName, self.frame)
    header:SetHeight(ROW_HEIGHT)

    local headerLabel = header:CreateFontString(headerName .. "-header", "OVERLAY", "GameFontWhite")
    headerLabel:SetAllPoints()
    headerLabel:SetJustifyV("Middle")
    headerLabel:SetJustifyH("Center")
    headerLabel:SetText(spellCategory.color .. spellCategory.name .. FONT_COLOR_CODE_CLOSE)

    header:SetPoint("RIGHT", self.scrollBar)

    if (rows[i - 1] == nil) then
      header:SetPoint("TOPLEFT", self.frame, 26, -78)
    else
      header:SetPoint("TOPLEFT", rows[i - 1], "BOTTOMLEFT", 0, -2)
    end

    rawset(rows, i, header)

    i = i + 1

    local categorySpells = spells[spellCategory.key]

    if categorySpells ~= nil then
      for spellIndex, categorySpell in ipairs(categorySpells) do
        local rowFrameName = "$parentRow-" .. categoryIndex .. "-" .. spellIndex
        local row = CreateFrame("Button", rowFrameName, self.frame)
        row:SetHeight(ROW_HEIGHT)
        row:EnableMouse(true)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        -- row:SetScript("OnEnter", function(self)
        --   tooltip:SetOwner(self, "ANCHOR_RIGHT")
        --   setTooltip(self.currentSpell)
        -- end)
        -- row:SetScript("OnLeave", function() tooltip:Hide() end)

        local highlight = row:CreateTexture("$parentHighlight", "HIGHLIGHT")
        highlight:SetAllPoints()
        highlight:SetTexture(HIGHLIGHT_TEXTURE_FILEID)

        local spell = CreateFrame("Frame", "$parentSpell", row)
        spell:SetPoint("LEFT", row, "Left")
        spell:SetPoint("TOP", row, "TOP")
        spell:SetPoint("BOTTOM", row, "BOTTOM")

        local spellIcon = spell:CreateTexture(nil, "OVERLAY")
        spellIcon:SetPoint("TOPLEFT", spell)
        spellIcon:SetPoint("BOTTOMLEFT", spell)
        spellIcon:SetTexture(categorySpell.icon)

        local iconWidth = ROW_HEIGHT
        spellIcon:SetWidth(iconWidth)

        local spellLabel = spell:CreateFontString("$parentLabel", "OVERLAY", "GameFontNormal")
        spellLabel:SetPoint("TOPLEFT", spell, "TOPLEFT", iconWidth + 4, 0)
        spellLabel:SetPoint("BOTTOM", spell)
        spellLabel:SetJustifyV("Middle")
        spellLabel:SetJustifyH("Left")
        spellLabel:SetText(categorySpell.name)

        local spellSublabel = spell:CreateFontString("$parentSubLabel", "OVERLAY", "GameTooltipText")
        spellSublabel:SetJustifyH("Left")
        spellSublabel:SetPoint("TOPLEFT", spellLabel, "TOPRIGHT", 2, 0)
        spellSublabel:SetPoint("BOTTOM", spellLabel)
        spellSublabel:SetText(categorySpell.subText)

        local spellLevelLabel = spell:CreateFontString("$parentLevelLabel", "OVERLAY", "GameFontWhite")
        spellLevelLabel:SetPoint("TOPRIGHT", spell, -4, 0)
        spellLevelLabel:SetPoint("BOTTOM", spell)
        spellLevelLabel:SetJustifyH("Right")
        spellLevelLabel:SetJustifyV("Middle")
        spellLevelLabel:SetText("Level " .. categorySpell.level)

        spellSublabel:SetPoint("RIGHT", spellLevelLabel, "Left")
        spellSublabel:SetJustifyV("Middle")

        row:SetPoint("RIGHT", self.scrollBar)
        row:SetPoint("TOPLEFT", rows[i - 1], "BOTTOMLEFT", 0, -2)

        rawset(rows, i, row)

        i = i + 1
      end
    end
  end
end