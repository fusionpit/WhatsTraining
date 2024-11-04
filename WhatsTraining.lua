setfenv(1, WhatsTraining)

function Initialise()
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

  WhatsTrainingUI:Initialize()

  WhatsTrainingUI:SetItems(PlayerData.spellsByCategory)

  -- WhatsTrainingUI.frame:Show()
end

Initialise()