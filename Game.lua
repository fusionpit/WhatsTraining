local _, wt = ...

wt.gameVersion = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and "tbc" or "era"
wt.locale = GetLocale()
wt.currentClass = select(2, UnitClass("player"))
wt.playerFaction = UnitFactionGroup("player")
wt.playerRace = select(3, UnitRace("player"))
