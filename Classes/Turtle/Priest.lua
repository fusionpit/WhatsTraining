if (WT.currentClass ~= "PRIEST") then return end
WT.SpellsByLevel = WT.RaceFilter({
	[1] = {
		{id=2050,name="Lesser Heal",subText="Rank 1",level=1,skillLineId=56,skillLineAbilityId=2313,icon="Interface\\Icons\\Spell_Holy_LesserHeal"},
		{id=585,name="Smite",subText="Rank 1",level=1,skillLineId=56,skillLineAbilityId=2319,icon="Interface\\Icons\\Spell_Holy_HolySmite"},
		{id=1243,name="Power Word: Fortitude",subText="Rank 1",level=1,skillLineId=613,skillLineAbilityId=7938,icon="Interface\\Icons\\Spell_Holy_WordFortitude"},
		{id=15286,name="Vampiric Embrace",subText="",level=1,skillLineId=78,skillLineAbilityId=8328,icon="Interface\\Icons\\Spell_Shadow_UnsummonBuilding",requiredTalentId=484}
	},
	[4] = {
		{id=2052,name="Lesser Heal",subText="Rank 2",level=4,skillLineId=56,skillLineAbilityId=2314,icon="Interface\\Icons\\Spell_Holy_LesserHeal",requiredIds={2050}},
		{id=589,name="Shadow Word: Pain",subText="Rank 1",level=4,skillLineId=78,skillLineAbilityId=2346,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain"}
	},
	[6] = {
		{id=591,name="Smite",subText="Rank 2",level=6,skillLineId=56,skillLineAbilityId=2320,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={585}},
		{id=17,name="Power Word: Shield",subText="Rank 1",level=6,skillLineId=613,skillLineAbilityId=7928,icon="Interface\\Icons\\Spell_Holy_PowerWordShield"}
	},
	[8] = {
		{id=139,name="Renew",subText="Rank 1",level=8,skillLineId=56,skillLineAbilityId=3790,icon="Interface\\Icons\\Spell_Holy_Renew"},
		{id=586,name="Fade",subText="Rank 1",level=8,skillLineId=78,skillLineAbilityId=5166,icon="Interface\\Icons\\Spell_Magic_LesserInvisibilty"}
	},
	[10] = {
		{id=2053,name="Lesser Heal",subText="Rank 3",level=10,skillLineId=56,skillLineAbilityId=2315,icon="Interface\\Icons\\Spell_Holy_LesserHeal",requiredIds={2052}},
		{id=2006,name="Resurrection",subText="Rank 1",level=10,skillLineId=56,skillLineAbilityId=2331,icon="Interface\\Icons\\Spell_Holy_Resurrection"},
		{id=594,name="Shadow Word: Pain",subText="Rank 2",level=10,skillLineId=78,skillLineAbilityId=2347,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain",requiredIds={589}},
		{id=8092,name="Mind Blast",subText="Rank 1",level=10,skillLineId=78,skillLineAbilityId=4522,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy"},
		{id=13908,name="Desperate Prayer",subText="Rank 1",level=10,skillLineId=56,skillLineAbilityId=10136,icon="Interface\\Icons\\Spell_Holy_Restoration",races={"Human","Dwarf"}},
		{id=10797,name="Starshards",subText="Rank 1",level=10,skillLineId=613,skillLineAbilityId=10139,icon="Interface\\Icons\\Spell_Arcane_StarFire",race="Night Elf"},
		{id=2652,name="Touch of Weakness",subText="Rank 1",level=10,skillLineId=78,skillLineAbilityId=10141,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead"},
		{id=2943,name="Touch of Weakness",subText="Rank 1",level=10,skillLineId=78,skillLineAbilityId=10142,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={2652}},
		{id=9035,name="Hex of Weakness",subText="Rank 1",level=10,skillLineId=78,skillLineAbilityId=10181,icon="Interface\\Icons\\Spell_Shadow_FingerOfDeath",race="Troll"},
		{id=46042,name="Grace of the Sunwell",subText="",level=10,skillLineId=56,skillLineAbilityId=30018,icon="Interface\\Icons\\Spell_Holy_MindVision"}
	},
	[12] = {
		{id=588,name="Inner Fire",subText="Rank 1",level=12,skillLineId=613,skillLineAbilityId=7922,icon="Interface\\Icons\\Spell_Holy_InnerFire"},
		{id=592,name="Power Word: Shield",subText="Rank 2",level=12,skillLineId=613,skillLineAbilityId=7930,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={10901}},
		{id=1244,name="Power Word: Fortitude",subText="Rank 2",level=12,skillLineId=613,skillLineAbilityId=7939,icon="Interface\\Icons\\Spell_Holy_WordFortitude",requiredIds={1243}}
	},
	[14] = {
		{id=598,name="Smite",subText="Rank 3",level=14,skillLineId=56,skillLineAbilityId=2321,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={591}},
		{id=528,name="Cure Disease",subText="",level=14,skillLineId=56,skillLineAbilityId=2326,icon="Interface\\Icons\\Spell_Holy_NullifyDisease"},
		{id=6074,name="Renew",subText="Rank 2",level=14,skillLineId=56,skillLineAbilityId=3791,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={25315}},
		{id=8122,name="Psychic Scream",subText="Rank 1",level=14,skillLineId=78,skillLineAbilityId=4528,icon="Interface\\Icons\\Spell_Shadow_PsychicScream"}
	},
	[16] = {
		{id=2054,name="Heal",subText="Rank 1",level=16,skillLineId=56,skillLineAbilityId=2316,icon="Interface\\Icons\\Spell_Holy_Heal"},
		{id=8102,name="Mind Blast",subText="Rank 2",level=16,skillLineId=78,skillLineAbilityId=4523,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={8092}}
	},
	[18] = {
		{id=970,name="Shadow Word: Pain",subText="Rank 3",level=18,skillLineId=78,skillLineAbilityId=2348,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain",requiredIds={594}},
		{id=600,name="Power Word: Shield",subText="Rank 3",level=18,skillLineId=613,skillLineAbilityId=7931,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={592}},
		{id=527,name="Dispel Magic",subText="Rank 1",level=18,skillLineId=613,skillLineAbilityId=7950,icon="Interface\\Icons\\Spell_Holy_DispelMagic"},
		{id=19236,name="Desperate Prayer",subText="Rank 2",level=18,skillLineId=56,skillLineAbilityId=10839,icon="Interface\\Icons\\Spell_Holy_Restoration",races={"Human","Dwarf"},requiredIds={13908}},
		{id=19296,name="Starshards",subText="Rank 2",level=18,skillLineId=613,skillLineAbilityId=10900,icon="Interface\\Icons\\Spell_Arcane_StarFire",race="Night Elf",requiredIds={10797}}
	},
	[20] = {
		{id=6075,name="Renew",subText="Rank 3",level=20,skillLineId=56,skillLineAbilityId=3792,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={6074}},
		{id=453,name="Mind Soothe",subText="Rank 1",level=20,skillLineId=78,skillLineAbilityId=4545,icon="Interface\\Icons\\Spell_Holy_MindSooth"},
		{id=2061,name="Flash Heal",subText="Rank 1",level=20,skillLineId=56,skillLineAbilityId=5107,icon="Interface\\Icons\\Spell_Holy_FlashHeal"},
		{id=9578,name="Fade",subText="Rank 2",level=20,skillLineId=78,skillLineAbilityId=5167,icon="Interface\\Icons\\Spell_Magic_LesserInvisibilty",requiredIds={586}},
		{id=9484,name="Shackle Undead",subText="Rank 1",level=20,skillLineId=613,skillLineAbilityId=7919,icon="Interface\\Icons\\Spell_Nature_Slow"},
		{id=7128,name="Inner Fire",subText="Rank 2",level=20,skillLineId=613,skillLineAbilityId=7923,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={588}},
		{id=15237,name="Holy Nova",subText="Rank 1",level=20,skillLineId=56,skillLineAbilityId=8178,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredTalentId=442},
		{id=14914,name="Holy Fire",subText="Rank 1",level=20,skillLineId=56,skillLineAbilityId=8275,icon="Interface\\Icons\\Spell_Holy_SearingLight"},
		{id=15407,name="Mind Flay",subText="Rank 1",level=20,skillLineId=78,skillLineAbilityId=8336,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredTalentId=501},
		{id=6346,name="Fear Ward",subText="",level=20,skillLineId=613,skillLineAbilityId=10138,icon="Interface\\Icons\\Spell_Holy_Excorcism",race="Dwarf"},
		{id=2651,name="Elune's Grace",subText="Rank 1",level=20,skillLineId=613,skillLineAbilityId=10140,icon="Interface\\Icons\\Spell_Holy_ElunesGrace",race="Night Elf"},
		{id=2944,name="Devouring Plague",subText="Rank 1",level=20,skillLineId=78,skillLineAbilityId=10180,icon="Interface\\Icons\\Spell_Shadow_BlackPlague",race="Undead"},
		{id=18137,name="Shadowguard",subText="Rank 1",level=20,skillLineId=78,skillLineAbilityId=10182,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll"},
		{id=19261,name="Touch of Weakness",subText="Rank 2",level=20,skillLineId=78,skillLineAbilityId=10854,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={2943}},
		{id=19249,name="Touch of Weakness",subText="Rank 2",level=20,skillLineId=78,skillLineAbilityId=10859,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19261}},
		{id=13896,name="Feedback",subText="Rank 1",level=20,skillLineId=613,skillLineAbilityId=10866,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",race="Human"},
		{id=19281,name="Hex of Weakness",subText="Rank 2",level=20,skillLineId=78,skillLineAbilityId=10881,icon="Interface\\Icons\\Spell_Shadow_FingerOfDeath",race="Troll",requiredIds={9035}},
		{id=23455,name="Holy Nova",subText="Rank 1",level=20,skillLineId=56,skillLineAbilityId=12601,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={15237}},
		{id=28377,name="Shadowguard",subText="Rank 1",level=20,skillLineId=78,skillLineAbilityId=14059,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={18137}},
		{id=46043,name="Sun's Embrace",subText="Rank 1",level=20,skillLineId=56,skillLineAbilityId=30019,icon="Interface\\Icons\\Spell_Holy_HolyProtection"}
	},
	[22] = {
		{id=2055,name="Heal",subText="Rank 2",level=22,skillLineId=56,skillLineAbilityId=2317,icon="Interface\\Icons\\Spell_Holy_Heal",requiredIds={2054}},
		{id=984,name="Smite",subText="Rank 4",level=22,skillLineId=56,skillLineAbilityId=2322,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={598}},
		{id=2010,name="Resurrection",subText="Rank 2",level=22,skillLineId=56,skillLineAbilityId=2332,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={2006}},
		{id=2096,name="Mind Vision",subText="Rank 1",level=22,skillLineId=78,skillLineAbilityId=4025,icon="Interface\\Icons\\Spell_Holy_MindVision"},
		{id=8103,name="Mind Blast",subText="Rank 3",level=22,skillLineId=78,skillLineAbilityId=4524,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={8102}}
	},
	[24] = {
		{id=3747,name="Power Word: Shield",subText="Rank 4",level=24,skillLineId=613,skillLineAbilityId=7932,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={600}},
		{id=1245,name="Power Word: Fortitude",subText="Rank 3",level=24,skillLineId=613,skillLineAbilityId=7940,icon="Interface\\Icons\\Spell_Holy_WordFortitude",requiredIds={1244}},
		{id=8129,name="Mana Burn",subText="Rank 1",level=24,skillLineId=613,skillLineAbilityId=7944,icon="Interface\\Icons\\Spell_Shadow_ManaBurn"},
		{id=15262,name="Holy Fire",subText="Rank 2",level=24,skillLineId=56,skillLineAbilityId=8277,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={14914}}
	},
	[26] = {
		{id=992,name="Shadow Word: Pain",subText="Rank 4",level=26,skillLineId=78,skillLineAbilityId=2349,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain",requiredIds={970}},
		{id=6076,name="Renew",subText="Rank 4",level=26,skillLineId=56,skillLineAbilityId=3793,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={6075}},
		{id=9472,name="Flash Heal",subText="Rank 2",level=26,skillLineId=56,skillLineAbilityId=5108,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={2061}},
		{id=19238,name="Desperate Prayer",subText="Rank 3",level=26,skillLineId=56,skillLineAbilityId=10840,icon="Interface\\Icons\\Spell_Holy_Restoration",races={"Human","Dwarf"},requiredIds={19236}},
		{id=19299,name="Starshards",subText="Rank 3",level=26,skillLineId=613,skillLineAbilityId=10901,icon="Interface\\Icons\\Spell_Arcane_StarFire",race="Night Elf",requiredIds={19296}}
	},
	[28] = {
		{id=6063,name="Heal",subText="Rank 3",level=28,skillLineId=56,skillLineAbilityId=3778,icon="Interface\\Icons\\Spell_Holy_Heal02",requiredIds={2055}},
		{id=8104,name="Mind Blast",subText="Rank 4",level=28,skillLineId=78,skillLineAbilityId=4525,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={8103}},
		{id=8124,name="Psychic Scream",subText="Rank 2",level=28,skillLineId=78,skillLineAbilityId=4529,icon="Interface\\Icons\\Spell_Shadow_PsychicScream",requiredIds={8122}},
		{id=15430,name="Holy Nova",subText="Rank 2",level=28,skillLineId=56,skillLineAbilityId=8356,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={23455}},
		{id=17311,name="Mind Flay",subText="Rank 2",level=28,skillLineId=78,skillLineAbilityId=9836,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={15407}},
		{id=19276,name="Devouring Plague",subText="Rank 2",level=28,skillLineId=78,skillLineAbilityId=10876,icon="Interface\\Icons\\Spell_Shadow_BlackPlague",race="Undead",requiredIds={2944}},
		{id=19308,name="Shadowguard",subText="Rank 2",level=28,skillLineId=78,skillLineAbilityId=10907,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={28377}},
		{id=23458,name="Holy Nova",subText="Rank 2",level=28,skillLineId=56,skillLineAbilityId=12602,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={15430}},
		{id=28378,name="Shadowguard",subText="Rank 2",level=28,skillLineId=78,skillLineAbilityId=14060,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={19308}}
	},
	[30] = {
		{id=1004,name="Smite",subText="Rank 5",level=30,skillLineId=56,skillLineAbilityId=2323,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={984}},
		{id=596,name="Prayer of Healing",subText="Rank 1",level=30,skillLineId=56,skillLineAbilityId=2325,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02"},
		{id=976,name="Shadow Protection",subText="Rank 1",level=30,skillLineId=78,skillLineAbilityId=2337,icon="Interface\\Icons\\Spell_Shadow_AntiShadow"},
		{id=605,name="Mind Control",subText="Rank 1",level=30,skillLineId=78,skillLineAbilityId=2340,icon="Interface\\Icons\\Spell_Shadow_ShadowWordDominate"},
		{id=9579,name="Fade",subText="Rank 3",level=30,skillLineId=78,skillLineAbilityId=5168,icon="Interface\\Icons\\Spell_Magic_LesserInvisibilty",requiredIds={9578}},
		{id=602,name="Inner Fire",subText="Rank 3",level=30,skillLineId=613,skillLineAbilityId=7924,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={7128}},
		{id=6065,name="Power Word: Shield",subText="Rank 5",level=30,skillLineId=613,skillLineAbilityId=7933,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={3747}},
		{id=14752,name="Divine Spirit",subText="Rank 1",level=30,skillLineId=613,skillLineAbilityId=7956,icon="Interface\\Icons\\Spell_Holy_DivineSpirit"},
		{id=15263,name="Holy Fire",subText="Rank 3",level=30,skillLineId=56,skillLineAbilityId=8278,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={15262}},
		{id=19262,name="Touch of Weakness",subText="Rank 3",level=30,skillLineId=78,skillLineAbilityId=10855,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19249}},
		{id=19251,name="Touch of Weakness",subText="Rank 3",level=30,skillLineId=78,skillLineAbilityId=10861,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19262}},
		{id=19271,name="Feedback",subText="Rank 2",level=30,skillLineId=613,skillLineAbilityId=10867,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",race="Human",requiredIds={13896}},
		{id=19282,name="Hex of Weakness",subText="Rank 3",level=30,skillLineId=78,skillLineAbilityId=10882,icon="Interface\\Icons\\Spell_Shadow_FingerOfDeath",race="Troll",requiredIds={19281}},
		{id=19289,name="Elune's Grace",subText="Rank 2",level=30,skillLineId=613,skillLineAbilityId=10889,icon="Interface\\Icons\\Spell_Holy_ElunesGrace",race="Night Elf",requiredIds={2651}}
	},
	[32] = {
		{id=552,name="Abolish Disease",subText="",level=32,skillLineId=56,skillLineAbilityId=2327,icon="Interface\\Icons\\Spell_Nature_NullifyDisease"},
		{id=6077,name="Renew",subText="Rank 5",level=32,skillLineId=56,skillLineAbilityId=3794,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={6076}},
		{id=9473,name="Flash Heal",subText="Rank 3",level=32,skillLineId=56,skillLineAbilityId=5109,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={9472}},
		{id=8131,name="Mana Burn",subText="Rank 2",level=32,skillLineId=613,skillLineAbilityId=7945,icon="Interface\\Icons\\Spell_Shadow_ManaBurn",requiredIds={8129}}
	},
	[34] = {
		{id=2767,name="Shadow Word: Pain",subText="Rank 5",level=34,skillLineId=78,skillLineAbilityId=2350,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain",requiredIds={992}},
		{id=6064,name="Heal",subText="Rank 4",level=34,skillLineId=56,skillLineAbilityId=3779,icon="Interface\\Icons\\Spell_Holy_Heal02",requiredIds={6063}},
		{id=8105,name="Mind Blast",subText="Rank 5",level=34,skillLineId=78,skillLineAbilityId=4526,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={8104}},
		{id=10880,name="Resurrection",subText="Rank 3",level=34,skillLineId=56,skillLineAbilityId=5869,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={2010}},
		{id=1706,name="Levitate",subText="",level=34,skillLineId=613,skillLineAbilityId=9580,icon="Interface\\Icons\\Spell_Holy_LayOnHands"},
		{id=19240,name="Desperate Prayer",subText="Rank 4",level=34,skillLineId=56,skillLineAbilityId=10841,icon="Interface\\Icons\\Spell_Holy_Restoration",races={"Human","Dwarf"},requiredIds={19238}},
		{id=19302,name="Starshards",subText="Rank 4",level=34,skillLineId=613,skillLineAbilityId=10902,icon="Interface\\Icons\\Spell_Arcane_StarFire",race="Night Elf",requiredIds={19299}}
	},
	[35] = {
		{id=46044,name="Sun's Embrace",subText="Rank 2",level=35,skillLineId=56,skillLineAbilityId=30020,icon="Interface\\Icons\\Spell_Holy_HolyProtection",requiredIds={46043}}
	},
	[36] = {
		{id=8192,name="Mind Soothe",subText="Rank 2",level=36,skillLineId=78,skillLineAbilityId=4546,icon="Interface\\Icons\\Spell_Holy_MindSooth",requiredIds={453}},
		{id=6066,name="Power Word: Shield",subText="Rank 6",level=36,skillLineId=613,skillLineAbilityId=7934,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={6065}},
		{id=2791,name="Power Word: Fortitude",subText="Rank 4",level=36,skillLineId=613,skillLineAbilityId=7941,icon="Interface\\Icons\\Spell_Holy_WordFortitude",requiredIds={1245}},
		{id=988,name="Dispel Magic",subText="Rank 2",level=36,skillLineId=613,skillLineAbilityId=7951,icon="Interface\\Icons\\Spell_Holy_DispelMagic",requiredIds={527}},
		{id=15264,name="Holy Fire",subText="Rank 4",level=36,skillLineId=56,skillLineAbilityId=8279,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={15263}},
		{id=15431,name="Holy Nova",subText="Rank 3",level=36,skillLineId=56,skillLineAbilityId=8357,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={23458}},
		{id=17312,name="Mind Flay",subText="Rank 3",level=36,skillLineId=78,skillLineAbilityId=9837,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={17311}},
		{id=19277,name="Devouring Plague",subText="Rank 3",level=36,skillLineId=78,skillLineAbilityId=10877,icon="Interface\\Icons\\Spell_Shadow_BlackPlague",race="Undead",requiredIds={19276}},
		{id=19309,name="Shadowguard",subText="Rank 3",level=36,skillLineId=78,skillLineAbilityId=10908,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={28378}},
		{id=23459,name="Holy Nova",subText="Rank 3",level=36,skillLineId=56,skillLineAbilityId=12603,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={15431}},
		{id=28379,name="Shadowguard",subText="Rank 3",level=36,skillLineId=78,skillLineAbilityId=14061,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={19309}}
	},
	[38] = {
		{id=6060,name="Smite",subText="Rank 6",level=38,skillLineId=56,skillLineAbilityId=3776,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={1004}},
		{id=6078,name="Renew",subText="Rank 6",level=38,skillLineId=56,skillLineAbilityId=3795,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={6077}},
		{id=9474,name="Flash Heal",subText="Rank 4",level=38,skillLineId=56,skillLineAbilityId=5110,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={9473}}
	},
	[40] = {
		{id=2060,name="Greater Heal",subText="Rank 1",level=40,skillLineId=56,skillLineAbilityId=3777,icon="Interface\\Icons\\Spell_Holy_GreaterHeal"},
		{id=996,name="Prayer of Healing",subText="Rank 2",level=40,skillLineId=56,skillLineAbilityId=3787,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02",requiredIds={596}},
		{id=8106,name="Mind Blast",subText="Rank 6",level=40,skillLineId=78,skillLineAbilityId=4527,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={8105}},
		{id=9592,name="Fade",subText="Rank 4",level=40,skillLineId=78,skillLineAbilityId=5169,icon="Interface\\Icons\\Spell_Magic_LesserInvisibilty",requiredIds={9579}},
		{id=9485,name="Shackle Undead",subText="Rank 2",level=40,skillLineId=613,skillLineAbilityId=7920,icon="Interface\\Icons\\Spell_Nature_Slow",requiredIds={9484}},
		{id=1006,name="Inner Fire",subText="Rank 4",level=40,skillLineId=613,skillLineAbilityId=7925,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={602}},
		{id=10874,name="Mana Burn",subText="Rank 3",level=40,skillLineId=613,skillLineAbilityId=7946,icon="Interface\\Icons\\Spell_Shadow_ManaBurn",requiredIds={8131}},
		{id=14818,name="Divine Spirit",subText="Rank 2",level=40,skillLineId=613,skillLineAbilityId=8003,icon="Interface\\Icons\\Spell_Holy_DivineSpirit",requiredIds={14752}},
		{id=19264,name="Touch of Weakness",subText="Rank 4",level=40,skillLineId=78,skillLineAbilityId=10856,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19251}},
		{id=19252,name="Touch of Weakness",subText="Rank 4",level=40,skillLineId=78,skillLineAbilityId=10862,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19264}},
		{id=19273,name="Feedback",subText="Rank 3",level=40,skillLineId=613,skillLineAbilityId=10868,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",race="Human",requiredIds={19271}},
		{id=19283,name="Hex of Weakness",subText="Rank 4",level=40,skillLineId=78,skillLineAbilityId=10883,icon="Interface\\Icons\\Spell_Shadow_FingerOfDeath",race="Troll",requiredIds={19282}},
		{id=19291,name="Elune's Grace",subText="Rank 3",level=40,skillLineId=613,skillLineAbilityId=10890,icon="Interface\\Icons\\Spell_Holy_ElunesGrace",race="Night Elf",requiredIds={19289}},
		{id=10060,name="Power Infusion",subText="",level=40,skillLineId=613,skillLineAbilityId=13831,icon="Interface\\Icons\\Spell_Holy_PowerInfusion",requiredTalentId=322},
		{id=724,name="Lightwell",subText="Rank 1",level=40,skillLineId=56,skillLineAbilityId=13838,icon="Interface\\Icons\\Spell_Holy_SummonLightwell"},
		{id=7001,name="Lightwell Renew",subText="Rank 1",level=40,skillLineId=56,skillLineAbilityId=13839,icon="Interface\\Icons\\Spell_Holy_SummonLightwell"},
		{id=45562,name="Proclaim Champion",subText="",level=40,skillLineId=56,skillLineAbilityId=15048,icon="Interface\\Icons\\Spell_Holy_ProclaimChampion_02",requiredTalentId=1637},
		{id=45563,name="Champion's Grace",subText="",level=40,skillLineId=56,skillLineAbilityId=15049,icon="Interface\\Icons\\Spell_Holy_ChampionsGrace"},
		{id=45569,name="Champion's Resolve",subText="",level=40,skillLineId=56,skillLineAbilityId=15055,icon="Interface\\Icons\\Spell_Holy_ProclaimChampion"}
	},
	[42] = {
		{id=10957,name="Shadow Protection",subText="Rank 2",level=42,skillLineId=78,skillLineAbilityId=5831,icon="Interface\\Icons\\Spell_Shadow_AntiShadow",requiredIds={976}},
		{id=10888,name="Psychic Scream",subText="Rank 3",level=42,skillLineId=78,skillLineAbilityId=5833,icon="Interface\\Icons\\Spell_Shadow_PsychicScream",requiredIds={8124}},
		{id=10892,name="Shadow Word: Pain",subText="Rank 6",level=42,skillLineId=78,skillLineAbilityId=5835,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain",requiredIds={2767}},
		{id=10898,name="Power Word: Shield",subText="Rank 7",level=42,skillLineId=613,skillLineAbilityId=7935,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={6066}},
		{id=15265,name="Holy Fire",subText="Rank 5",level=42,skillLineId=56,skillLineAbilityId=8280,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={15264}},
		{id=19241,name="Desperate Prayer",subText="Rank 5",level=42,skillLineId=56,skillLineAbilityId=10842,icon="Interface\\Icons\\Spell_Holy_Restoration",races={"Human","Dwarf"},requiredIds={19240}},
		{id=19303,name="Starshards",subText="Rank 5",level=42,skillLineId=613,skillLineAbilityId=10903,icon="Interface\\Icons\\Spell_Arcane_StarFire",race="Night Elf",requiredIds={19302}}
	},
	[44] = {
		{id=10915,name="Flash Heal",subText="Rank 5",level=44,skillLineId=56,skillLineAbilityId=5842,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={9474}},
		{id=10927,name="Renew",subText="Rank 7",level=44,skillLineId=56,skillLineAbilityId=5845,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={6078}},
		{id=10909,name="Mind Vision",subText="Rank 2",level=44,skillLineId=78,skillLineAbilityId=5859,icon="Interface\\Icons\\Spell_Holy_MindVision",requiredIds={2096}},
		{id=10911,name="Mind Control",subText="Rank 2",level=44,skillLineId=78,skillLineAbilityId=5860,icon="Interface\\Icons\\Spell_Shadow_ShadowWordDominate",requiredIds={605}},
		{id=17313,name="Mind Flay",subText="Rank 4",level=44,skillLineId=78,skillLineAbilityId=9838,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={17312}},
		{id=19278,name="Devouring Plague",subText="Rank 4",level=44,skillLineId=78,skillLineAbilityId=10878,icon="Interface\\Icons\\Spell_Shadow_BlackPlague",race="Undead",requiredIds={19277}},
		{id=19310,name="Shadowguard",subText="Rank 4",level=44,skillLineId=78,skillLineAbilityId=10909,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={28379}},
		{id=27799,name="Holy Nova",subText="Rank 4",level=44,skillLineId=56,skillLineAbilityId=13825,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={23459}},
		{id=27803,name="Holy Nova",subText="Rank 4",level=44,skillLineId=56,skillLineAbilityId=13826,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={27799}},
		{id=28380,name="Shadowguard",subText="Rank 4",level=44,skillLineId=78,skillLineAbilityId=14062,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={19310}},
		{id=45564,name="Champion's Bond",subText="Rank 1",level=44,skillLineId=56,skillLineAbilityId=15050,icon="Interface\\Icons\\Spell_Holy_ChampionsBond"}
	},
	[46] = {
		{id=10963,name="Greater Heal",subText="Rank 2",level=46,skillLineId=56,skillLineAbilityId=5848,icon="Interface\\Icons\\Spell_Holy_GreaterHeal",requiredIds={2060}},
		{id=10933,name="Smite",subText="Rank 7",level=46,skillLineId=56,skillLineAbilityId=5851,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={6060}},
		{id=10945,name="Mind Blast",subText="Rank 7",level=46,skillLineId=78,skillLineAbilityId=5862,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={8106}},
		{id=10881,name="Resurrection",subText="Rank 4",level=46,skillLineId=56,skillLineAbilityId=5870,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={10880}}
	},
	[48] = {
		{id=10899,name="Power Word: Shield",subText="Rank 8",level=48,skillLineId=613,skillLineAbilityId=7936,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={10898}},
		{id=10937,name="Power Word: Fortitude",subText="Rank 5",level=48,skillLineId=613,skillLineAbilityId=7942,icon="Interface\\Icons\\Spell_Holy_WordFortitude",requiredIds={2791}},
		{id=10875,name="Mana Burn",subText="Rank 4",level=48,skillLineId=613,skillLineAbilityId=7947,icon="Interface\\Icons\\Spell_Shadow_ManaBurn",requiredIds={10874}},
		{id=15266,name="Holy Fire",subText="Rank 6",level=48,skillLineId=56,skillLineAbilityId=8281,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={15265}},
		{id=21562,name="Prayer of Fortitude",subText="Rank 1",level=48,skillLineId=613,skillLineAbilityId=12042,icon="Interface\\Icons\\Spell_Holy_PrayerOfFortitude"}
	},
	[50] = {
		{id=10893,name="Shadow Word: Pain",subText="Rank 7",level=50,skillLineId=78,skillLineAbilityId=5836,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain",requiredIds={10892}},
		{id=10916,name="Flash Heal",subText="Rank 6",level=50,skillLineId=56,skillLineAbilityId=5843,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={10915}},
		{id=10928,name="Renew",subText="Rank 8",level=50,skillLineId=56,skillLineAbilityId=5846,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={10927}},
		{id=10960,name="Prayer of Healing",subText="Rank 3",level=50,skillLineId=56,skillLineAbilityId=5855,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02",requiredIds={996}},
		{id=10941,name="Fade",subText="Rank 5",level=50,skillLineId=78,skillLineAbilityId=5865,icon="Interface\\Icons\\Spell_Magic_LesserInvisibilty",requiredIds={9592}},
		{id=10951,name="Inner Fire",subText="Rank 5",level=50,skillLineId=613,skillLineAbilityId=7926,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={1006}},
		{id=14819,name="Divine Spirit",subText="Rank 3",level=50,skillLineId=613,skillLineAbilityId=8004,icon="Interface\\Icons\\Spell_Holy_DivineSpirit",requiredIds={14818}},
		{id=19242,name="Desperate Prayer",subText="Rank 6",level=50,skillLineId=56,skillLineAbilityId=10843,icon="Interface\\Icons\\Spell_Holy_Restoration",races={"Human","Dwarf"},requiredIds={19241}},
		{id=19265,name="Touch of Weakness",subText="Rank 5",level=50,skillLineId=78,skillLineAbilityId=10857,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19252}},
		{id=19253,name="Touch of Weakness",subText="Rank 5",level=50,skillLineId=78,skillLineAbilityId=10863,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19265}},
		{id=19274,name="Feedback",subText="Rank 4",level=50,skillLineId=613,skillLineAbilityId=10869,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",race="Human",requiredIds={19273}},
		{id=19284,name="Hex of Weakness",subText="Rank 5",level=50,skillLineId=78,skillLineAbilityId=10884,icon="Interface\\Icons\\Spell_Shadow_FingerOfDeath",race="Troll",requiredIds={19283}},
		{id=19292,name="Elune's Grace",subText="Rank 4",level=50,skillLineId=613,skillLineAbilityId=10892,icon="Interface\\Icons\\Spell_Holy_ElunesGrace",race="Night Elf",requiredIds={19291}},
		{id=19304,name="Starshards",subText="Rank 6",level=50,skillLineId=613,skillLineAbilityId=10904,icon="Interface\\Icons\\Spell_Arcane_StarFire",race="Night Elf",requiredIds={19303}},
		{id=27870,name="Lightwell",subText="Rank 2",level=50,skillLineId=56,skillLineAbilityId=13850,icon="Interface\\Icons\\Spell_Holy_SummonLightwell",requiredIds={724}},
		{id=45565,name="Empower Champion",subText="Rank 1",level=50,skillLineId=56,skillLineAbilityId=15051,icon="Interface\\Icons\\Spell_Holy_EmpowerChampion"},
		{id=46045,name="Sun's Embrace",subText="Rank 3",level=50,skillLineId=56,skillLineAbilityId=30021,icon="Interface\\Icons\\Spell_Holy_HolyProtection",requiredIds={46044}}
	},
	[52] = {
		{id=10964,name="Greater Heal",subText="Rank 3",level=52,skillLineId=56,skillLineAbilityId=5849,icon="Interface\\Icons\\Spell_Holy_GreaterHeal",requiredIds={10963}},
		{id=10946,name="Mind Blast",subText="Rank 8",level=52,skillLineId=78,skillLineAbilityId=5863,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={10945}},
		{id=10953,name="Mind Soothe",subText="Rank 3",level=52,skillLineId=78,skillLineAbilityId=5867,icon="Interface\\Icons\\Spell_Holy_MindSooth",requiredIds={8192}},
		{id=17314,name="Mind Flay",subText="Rank 5",level=52,skillLineId=78,skillLineAbilityId=9839,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={17313}},
		{id=19279,name="Devouring Plague",subText="Rank 5",level=52,skillLineId=78,skillLineAbilityId=10879,icon="Interface\\Icons\\Spell_Shadow_BlackPlague",race="Undead",requiredIds={19278}},
		{id=19311,name="Shadowguard",subText="Rank 5",level=52,skillLineId=78,skillLineAbilityId=10910,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={28380}},
		{id=27800,name="Holy Nova",subText="Rank 5",level=52,skillLineId=56,skillLineAbilityId=13827,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={27803}},
		{id=27804,name="Holy Nova",subText="Rank 5",level=52,skillLineId=56,skillLineAbilityId=13828,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={27800}},
		{id=28381,name="Shadowguard",subText="Rank 5",level=52,skillLineId=78,skillLineAbilityId=14063,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={19311}}
	},
	[54] = {
		{id=10934,name="Smite",subText="Rank 8",level=54,skillLineId=56,skillLineAbilityId=5852,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={10933}},
		{id=10900,name="Power Word: Shield",subText="Rank 9",level=54,skillLineId=613,skillLineAbilityId=7937,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={10899}},
		{id=15267,name="Holy Fire",subText="Rank 7",level=54,skillLineId=56,skillLineAbilityId=8282,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={15266}}
	},
	[56] = {
		{id=10958,name="Shadow Protection",subText="Rank 3",level=56,skillLineId=78,skillLineAbilityId=5832,icon="Interface\\Icons\\Spell_Shadow_AntiShadow",requiredIds={10957}},
		{id=10890,name="Psychic Scream",subText="Rank 4",level=56,skillLineId=78,skillLineAbilityId=5834,icon="Interface\\Icons\\Spell_Shadow_PsychicScream",requiredIds={10888}},
		{id=10917,name="Flash Heal",subText="Rank 7",level=56,skillLineId=56,skillLineAbilityId=5844,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={10916}},
		{id=10929,name="Renew",subText="Rank 9",level=56,skillLineId=56,skillLineAbilityId=5847,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={10928}},
		{id=10876,name="Mana Burn",subText="Rank 5",level=56,skillLineId=613,skillLineAbilityId=7948,icon="Interface\\Icons\\Spell_Shadow_ManaBurn",requiredIds={10875}},
		{id=27683,name="Prayer of Shadow Protection",subText="Rank 1",level=56,skillLineId=78,skillLineAbilityId=13810,icon="Interface\\Icons\\Spell_Holy_PrayerofShadowProtection"},
		{id=45566,name="Summon Champion",subText="",level=56,skillLineId=56,skillLineAbilityId=15052,icon="Interface\\Icons\\Spell_Holy_SummonChampion"}
	},
	[58] = {
		{id=10894,name="Shadow Word: Pain",subText="Rank 8",level=58,skillLineId=78,skillLineAbilityId=5837,icon="Interface\\Icons\\Spell_Shadow_ShadowWordPain",requiredIds={10893}},
		{id=10965,name="Greater Heal",subText="Rank 4",level=58,skillLineId=56,skillLineAbilityId=5850,icon="Interface\\Icons\\Spell_Holy_GreaterHeal",requiredIds={10964}},
		{id=10912,name="Mind Control",subText="Rank 3",level=58,skillLineId=78,skillLineAbilityId=5861,icon="Interface\\Icons\\Spell_Shadow_ShadowWordDominate",requiredIds={10911}},
		{id=10947,name="Mind Blast",subText="Rank 9",level=58,skillLineId=78,skillLineAbilityId=5864,icon="Interface\\Icons\\Spell_Shadow_UnholyFrenzy",requiredIds={10946}},
		{id=19243,name="Desperate Prayer",subText="Rank 7",level=58,skillLineId=56,skillLineAbilityId=10844,icon="Interface\\Icons\\Spell_Holy_Restoration",races={"Human","Dwarf"},requiredIds={19242}},
		{id=19305,name="Starshards",subText="Rank 7",level=58,skillLineId=613,skillLineAbilityId=10905,icon="Interface\\Icons\\Spell_Arcane_StarFire",race="Night Elf",requiredIds={19304}},
		{id=20770,name="Resurrection",subText="Rank 5",level=58,skillLineId=56,skillLineAbilityId=11793,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={10881}},
		{id=45554,name="Shadow Mend",subText="Rank 1",level=58,skillLineId=78,skillLineAbilityId=15046,icon="Interface\\Icons\\Spell_Shadow_ShadowMend"},
		{id=45567,name="Revive Champion",subText="Rank 1",level=58,skillLineId=56,skillLineAbilityId=15053,icon="Interface\\Icons\\Spell_Holy_ReviveChampion"}
	},
	[60] = {
		{id=10961,name="Prayer of Healing",subText="Rank 4",level=60,skillLineId=56,skillLineAbilityId=5856,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02",requiredIds={10960}},
		{id=10942,name="Fade",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=5866,icon="Interface\\Icons\\Spell_Magic_LesserInvisibilty",requiredIds={10941}},
		{id=10955,name="Shackle Undead",subText="Rank 3",level=60,skillLineId=613,skillLineAbilityId=7921,icon="Interface\\Icons\\Spell_Nature_Slow",requiredIds={9485}},
		{id=10952,name="Inner Fire",subText="Rank 6",level=60,skillLineId=613,skillLineAbilityId=7927,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={10951}},
		{id=10901,name="Power Word: Shield",subText="Rank 10",level=60,skillLineId=613,skillLineAbilityId=7929,icon="Interface\\Icons\\Spell_Holy_PowerWordShield",requiredIds={17}},
		{id=10938,name="Power Word: Fortitude",subText="Rank 6",level=60,skillLineId=613,skillLineAbilityId=7943,icon="Interface\\Icons\\Spell_Holy_WordFortitude",requiredIds={10937}},
		{id=15261,name="Holy Fire",subText="Rank 8",level=60,skillLineId=56,skillLineAbilityId=10616,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={15267}},
		{id=18807,name="Mind Flay",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=10617,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={17314}},
		{id=19266,name="Touch of Weakness",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=10858,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19253}},
		{id=19254,name="Touch of Weakness",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=10864,icon="Interface\\Icons\\Spell_Shadow_DeadofNight",race="Undead",requiredIds={19266}},
		{id=19275,name="Feedback",subText="Rank 5",level=60,skillLineId=613,skillLineAbilityId=10870,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",race="Human",requiredIds={19274}},
		{id=19280,name="Devouring Plague",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=10880,icon="Interface\\Icons\\Spell_Shadow_BlackPlague",race="Undead",requiredIds={19279}},
		{id=19285,name="Hex of Weakness",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=10885,icon="Interface\\Icons\\Spell_Shadow_FingerOfDeath",race="Troll",requiredIds={19284}},
		{id=19293,name="Elune's Grace",subText="Rank 5",level=60,skillLineId=613,skillLineAbilityId=10894,icon="Interface\\Icons\\Spell_Holy_ElunesGrace",race="Night Elf",requiredIds={19292}},
		{id=19312,name="Shadowguard",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=10911,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={28381}},
		{id=21564,name="Prayer of Fortitude",subText="Rank 2",level=60,skillLineId=613,skillLineAbilityId=12043,icon="Interface\\Icons\\Spell_Holy_PrayerOfFortitude",requiredIds={21562}},
		{id=25314,name="Greater Heal",subText="Rank 5",level=60,skillLineId=56,skillLineAbilityId=13214,icon="Interface\\Icons\\Spell_Holy_GreaterHeal",requiredIds={10965}},
		{id=25315,name="Renew",subText="Rank 10",level=60,skillLineId=56,skillLineAbilityId=13215,icon="Interface\\Icons\\Spell_Holy_Renew",requiredIds={139}},
		{id=25316,name="Prayer of Healing",subText="Rank 5",level=60,skillLineId=56,skillLineAbilityId=13216,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02",requiredIds={10961}},
		{id=27681,name="Prayer of Spirit",subText="Rank 1",level=60,skillLineId=613,skillLineAbilityId=13809,icon="Interface\\Icons\\Spell_Holy_PrayerofSpirit"},
		{id=27801,name="Holy Nova",subText="Rank 6",level=60,skillLineId=56,skillLineAbilityId=13829,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={27804}},
		{id=27805,name="Holy Nova",subText="Rank 6",level=60,skillLineId=56,skillLineAbilityId=13830,icon="Interface\\Icons\\Spell_Holy_HolyNova",requiredIds={27801}},
		{id=27841,name="Divine Spirit",subText="Rank 4",level=60,skillLineId=613,skillLineAbilityId=13848,icon="Interface\\Icons\\Spell_Holy_DivineSpirit",requiredIds={14819}},
		{id=27871,name="Lightwell",subText="Rank 3",level=60,skillLineId=56,skillLineAbilityId=13851,icon="Interface\\Icons\\Spell_Holy_SummonLightwell",requiredIds={27870}},
		{id=28382,name="Shadowguard",subText="Rank 6",level=60,skillLineId=78,skillLineAbilityId=14064,icon="Interface\\Icons\\Spell_Nature_LightningShield",race="Troll",requiredIds={19312}},
		{id=45555,name="Pain Spike",subText="Rank 1",level=60,skillLineId=78,skillLineAbilityId=15047,icon="Interface\\Icons\\Spell_Shadow_PainSpike"},
		{id=46046,name="Sun's Embrace",subText="Rank 4",level=60,skillLineId=56,skillLineAbilityId=30022,icon="Interface\\Icons\\Spell_Holy_HolyProtection",requiredIds={46045}},
		{id=45968,name="Smite",subText="Rank 9",level=60,skillLineId=56,skillLineAbilityId=30388,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={10934}}
	}
})