local _, wt = ...
local class = wt.ClassData[wt.currentClass]
if not class then return end

wt.SpellsByLevel = wt.RaceFilter(wt.FactionFilter(class.spellsByLevel))
if class.overriddenGroups then wt:AddOverriddenSpells(unpack(class.overriddenGroups)) end
wt.PetAbilityIds = class.petAbilityIds
wt.TomesByLevel = class.tomesByLevel
wt.TomeTaughtSpells = class.tomeTaughtSpells
wt.AddQuestSpells(wt.QuestSpells)
