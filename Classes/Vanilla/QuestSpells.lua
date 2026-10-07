local _, wt = ...

-- QuestSpells[<CLASS>][<spellId>] = list of { races = {<addon race ids>}, level = <first-quest min level>, area = <AreaTable id> or areas = {<AreaTable ids>}, quests = {<reward quest ids>} }
local QuestSpells = { WARRIOR = {}, PALADIN = {}, HUNTER = {}, ROGUE = {}, PRIEST = {}, SHAMAN = {}, MAGE = {}, WARLOCK = {}, DRUID = {} }

wt.AddQuestSpells(QuestSpells)
