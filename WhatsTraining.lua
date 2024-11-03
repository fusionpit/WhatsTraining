setfenv(1, WhatsTraining)

---@class Addon : AceAddonDef
---@field db WhatsTrainingTurtleConfig
Addon = LibStub("AceAddon-3.0"):NewAddon("WhatsTraining_Turtle", "AceEvent-3.0", "AceTimer-3.0")

---@class WhatsTrainingTurtleConfig : table
local defaults = {
  profile = {
    MinimapButton = {
      LibDBIcon = {}, -- Table used by LibDBIcon to store position (minimapPos), dragging lock (lock) and hidden state (hide)
      Commands = {
        LeftButton = "SimpleLog",
      }
    },
  }
}

function Addon:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("WhatsTraining_TurtleDB", defaults)

  MiniMapButton:Initialise()
  WhatsTrainingUI:Initialize()
end

function Addon:Initialise()
  local name = UnitName("player")
  if name then
    PlayerData:SetName(name)
  end
  PlayerData:SetClass(UnitClass("player"))
  PlayerData:SetRace(UnitRace("player"))
  PlayerData:SetLevel(UnitLevel("player"))
  PlayerData:SetSpellsByLevel(ClassSpellsByLevel[PlayerData.class])

  PlayerData:SayHello()

  PlayerData:GetKnownSpells()
  PlayerData:GetAvailableSpells()

  WhatsTrainingUI:SetItems(PlayerData.spellsByCategory)

  WhatsTrainingUI.frame:Show()
end