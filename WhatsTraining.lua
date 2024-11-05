setfenv(1, WhatsTraining)
WhatsTraining = {}

function WhatsTraining:Initialise()
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
end

local function OnEvent()
  WhatsTraining:Initialise()
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", OnEvent)