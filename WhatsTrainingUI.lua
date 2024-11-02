setfenv(1, WhatsTraining)
WhatsTrainingUI = {}

local AceGUI = LibStub("AceGUI-3.0")

function WhatsTrainingUI:Initialize()
  self:InitDisplay()
  -- self:InitMinimapButton()

  -- self:RefreshConfig()
end

function WhatsTrainingUI:InitDisplay()
  self.frame = AceGUI:Create("Frame")
  self.frame:SetTitle("What can I train?")
  self.frame:SetWidth(300)
  self.frame:SetHeight(300)
  self.frame:EnableResize(false)

  self.scrollFrame = AceGUI:Create("ScrollFrame")
  self.scrollFrame:SetFullWidth(true)
  self.scrollFrame:SetFullHeight(true)
  self.scrollFrame:SetAutoAdjustHeight(true) -- probably?
  self.scrollFrame:SetLayout("List")
  self.frame:AddChild(self.scrollFrame)

  self.frame:Hide()
end

---Sets the given spells as rows
---@param spells table<SpellCategories, Spell[]>
function WhatsTrainingUI:SetItems(spells)
  for index, spellCategory in ipairs(SpellCategoryHeaders) do
    local categorySpells = spells[spellCategory.key]

    if categorySpells ~= nil then
      local categoryHeader = AceGUI:Create("Label")
      categoryHeader:SetText(spellCategory.name)
      categoryHeader:SetFullWidth(true)
      categoryHeader.label:SetJustifyH("CENTER")
      self.scrollFrame:AddChild(categoryHeader)

      for _, spell in ipairs(categorySpells) do
        local row = AceGUI:Create("SimpleGroup")
        row:SetFullWidth(true)
        row:SetLayout("Flow")
        row:SetCallback("OnClick", function(button)
          Utils.log(button.text)
        end)

        local label = AceGUI:Create("InteractiveLabel")
        local name = spell.name
        if spell.subText ~= "" then
          name = name .. " (" .. spell.subText .. ")"
        end
        label:SetImage(spell.icon)
        label:SetText(name)
        -- label:SetFullWidth(true)
        row:AddChild(label)

        local level = AceGUI:Create("Label")
        level:SetText("Level " .. spell.level)
        row:AddChild(level)

        self.scrollFrame:AddChild(row)
      end
    end
  end
end