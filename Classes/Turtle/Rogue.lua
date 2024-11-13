setfenv(1, WhatsTraining)
OverridenSpells["Rogue"] = {
	{53,2589,2590,2591,8721,11279,11280,11281,25300},
	{408,8643},
	{703,8631,8632,8633,11289,11290},
	{1752,1757,1758,1759,1760,8621,11293,11294},
	{1766,1767,1768,1769},
	{1776,1777,8629,11285,11286},
	{1784,1785,1786,1787},
	{1856,1857},
	{1943,8639,8640,11273,11274,11275},
	{1966,6768,8637,11303,25302},
	{2070,11297},
	{2098,6760,6761,6762,8623,8624,11299,11300,31016},
	{2983,8696,11305},
	{5171,6774},
	{8647,8649,8650,11197,11198},
	{8676,8724,8725,11267,11268,11269}
}
ClassSpellsByLevel["Rogue"] = {
	[1] = {
		{id=1752,name="Sinister Strike",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice"},
		{id=2098,name="Eviscerate",subText="Rank 1",level=1,icon="Interface\\Icons\\Ability_Rogue_Eviscerate"},
		{id=1784,name="Stealth",subText="Rank 1",level=1,icon="Interface\\Icons\\Ability_Stealth"},
		{id=1804,name="Pick Lock",subText="",level=1,icon="Interface\\Icons\\Spell_Nature_MoonKey"}
	},
	[4] = {
		{id=921,name="Pick Pocket",subText="",level=4,icon="Interface\\Icons\\INV_Misc_Bag_11"},
		{id=53,name="Backstab",subText="Rank 1",level=4,icon="Interface\\Icons\\Ability_BackStab"}
	},
	[6] = {
		{id=1776,name="Gouge",subText="Rank 1",level=6,icon="Interface\\Icons\\Ability_Gouge"},
		{id=1757,name="Sinister Strike",subText="Rank 2",level=6,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",requiredIds={1752}}
	},
	[8] = {
		{id=6760,name="Eviscerate",subText="Rank 2",level=8,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={2098}},
		{id=5277,name="Evasion",subText="",level=8,icon="Interface\\Icons\\Spell_Shadow_ShadowWard"}
	},
	[10] = {
		{id=6770,name="Sap",subText="Rank 1",level=10,icon="Interface\\Icons\\Ability_Sap"},
		{id=5171,name="Slice and Dice",subText="Rank 1",level=10,icon="Interface\\Icons\\Ability_Rogue_SliceDice"},
		{id=2983,name="Sprint",subText="Rank 1",level=10,icon="Interface\\Icons\\Ability_Rogue_Sprint"}
	},
	[12] = {
		{id=1766,name="Kick",subText="Rank 1",level=12,icon="Interface\\Icons\\Ability_Kick"},
		{id=2589,name="Backstab",subText="Rank 2",level=12,icon="Interface\\Icons\\Ability_BackStab",requiredIds={53}}
	},
	[14] = {
		{id=1758,name="Sinister Strike",subText="Rank 3",level=14,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",requiredIds={1757}},
		{id=703,name="Garrote",subText="Rank 1",level=14,icon="Interface\\Icons\\Ability_Rogue_Garrote"},
		{id=8647,name="Expose Armor",subText="Rank 1",level=14,icon="Interface\\Icons\\Ability_Warrior_Riposte"}
	},
	[16] = {
		{id=6761,name="Eviscerate",subText="Rank 3",level=16,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={6760}},
		{id=1966,name="Feint",subText="Rank 1",level=16,icon="Interface\\Icons\\Ability_Rogue_Feint"}
	},
	[18] = {
		{id=1777,name="Gouge",subText="Rank 2",level=18,icon="Interface\\Icons\\Ability_Gouge",requiredIds={1776}},
		{id=8676,name="Ambush",subText="Rank 1",level=18,icon="Interface\\Icons\\Ability_Rogue_Ambush"}
	},
	[20] = {
		{id=2842,name="Poisons",subText="",level=20,icon="Interface\\Icons\\Trade_BrewPoison"},
		{id=1943,name="Rupture",subText="Rank 1",level=20,icon="Interface\\Icons\\Ability_Rogue_Rupture"},
		{id=1785,name="Stealth",subText="Rank 2",level=20,icon="Interface\\Icons\\Ability_Stealth",requiredIds={1784}},
		{id=2590,name="Backstab",subText="Rank 3",level=20,icon="Interface\\Icons\\Ability_BackStab",requiredIds={2589}},
		{id=16511,name="Hemorrhage",subText="",level=20,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredTalent={id=155,tabIndex=3}},
		{id=51969,name="Smoke Bomb",subText="",level=20,icon="Interface\\Icons\\Spell_Holiday_ToW_SpiceCloud",requiredTalent={id=154,tabIndex=3}}
	},
	[22] = {
		{id=1725,name="Distract",subText="",level=22,icon="Interface\\Icons\\Ability_Rogue_Distract"},
		{id=1759,name="Sinister Strike",subText="Rank 4",level=22,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",requiredIds={1758}},
		{id=8631,name="Garrote",subText="Rank 2",level=22,icon="Interface\\Icons\\Ability_Rogue_Garrote",requiredIds={703}},
		{id=1856,name="Vanish",subText="Rank 1",level=22,icon="Interface\\Icons\\Ability_Vanish"},
		{id=45603,name="Surprise Attack",subText="",level=22,icon="Interface\\Icons\\Ability_Rogue_SurpriseAttack"}
	},
	[24] = {
		{id=5763,name="Mind-numbing Poison",subText="Rank 1",level=24,icon="Interface\\Icons\\Spell_Nature_NullifyDisease"},
		{id=6762,name="Eviscerate",subText="Rank 4",level=24,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={6761}},
		{id=2836,name="Detect Traps",subText="Passive",level=24,icon="Interface\\Icons\\Ability_Spy"},
		{id=45608,name="Detection",subText="",level=24,icon="Interface\\Icons\\Ability_Spy"}
	},
	[26] = {
		{id=1767,name="Kick",subText="Rank 2",level=26,icon="Interface\\Icons\\Ability_Kick",requiredIds={1766}},
		{id=8724,name="Ambush",subText="Rank 2",level=26,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={8676}},
		{id=1833,name="Cheap Shot",subText="",level=26,icon="Interface\\Icons\\Ability_CheapShot"},
		{id=8649,name="Expose Armor",subText="Rank 2",level=26,icon="Interface\\Icons\\Ability_Warrior_Riposte",requiredIds={8647}}
	},
	[28] = {
		{id=8639,name="Rupture",subText="Rank 2",level=28,icon="Interface\\Icons\\Ability_Rogue_Rupture",requiredIds={1943}},
		{id=2591,name="Backstab",subText="Rank 4",level=28,icon="Interface\\Icons\\Ability_BackStab",requiredIds={2590}},
		{id=6768,name="Feint",subText="Rank 2",level=28,icon="Interface\\Icons\\Ability_Rogue_Feint",requiredIds={1966}},
		{id=2070,name="Sap",subText="Rank 2",level=28,icon="Interface\\Icons\\Ability_Sap",requiredIds={6770}}
	},
	[30] = {
		{id=1760,name="Sinister Strike",subText="Rank 5",level=30,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",requiredIds={1759}},
		{id=8632,name="Garrote",subText="Rank 3",level=30,icon="Interface\\Icons\\Ability_Rogue_Garrote",requiredIds={8631}},
		{id=408,name="Kidney Shot",subText="Rank 1",level=30,icon="Interface\\Icons\\Ability_Rogue_KidneyShot"},
		{id=1842,name="Disarm Trap",subText="",level=30,icon="Interface\\Icons\\Spell_Shadow_GrimWard"},
		{id=52511,name="Surprise Attack",subText="",level=30,icon="Interface\\Icons\\Ability_Rogue_SurpriseAttack",requiredTalent={id=123,tabIndex=2}},
		{id=52503,name="Dust of Disappearance",subText="",level=30,icon="Interface\\Icons\\INV_Misc_Dust_Infinite",requiredTalent={id=161,tabIndex=3}}
	},
	[32] = {
		{id=8623,name="Eviscerate",subText="Rank 5",level=32,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={6762}},
		{id=8629,name="Gouge",subText="Rank 3",level=32,icon="Interface\\Icons\\Ability_Gouge",requiredIds={1777}}
	},
	[34] = {
		{id=2094,name="Blind",subText="",level=34,icon="Interface\\Icons\\Spell_Shadow_MindSteal"},
		{id=8725,name="Ambush",subText="Rank 3",level=34,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={8724}},
		{id=8696,name="Sprint",subText="Rank 2",level=34,icon="Interface\\Icons\\Ability_Rogue_Sprint",requiredIds={2983}}
	},
	[36] = {
		{id=8640,name="Rupture",subText="Rank 3",level=36,icon="Interface\\Icons\\Ability_Rogue_Rupture",requiredIds={8639}},
		{id=8721,name="Backstab",subText="Rank 5",level=36,icon="Interface\\Icons\\Ability_BackStab",requiredIds={2591}},
		{id=8650,name="Expose Armor",subText="Rank 3",level=36,icon="Interface\\Icons\\Ability_Warrior_Riposte",requiredIds={8649}}
	},
	[38] = {
		{id=8621,name="Sinister Strike",subText="Rank 6",level=38,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",requiredIds={1760}},
		{id=8633,name="Garrote",subText="Rank 4",level=38,icon="Interface\\Icons\\Ability_Rogue_Garrote",requiredIds={8632}},
		{id=8694,name="Mind-numbing Poison II",subText="Rank 2",level=38,icon="Interface\\Icons\\Spell_Nature_NullifyDisease"}
	},
	[40] = {
		{id=8624,name="Eviscerate",subText="Rank 6",level=40,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={8623}},
		{id=1786,name="Stealth",subText="Rank 3",level=40,icon="Interface\\Icons\\Ability_Stealth",requiredIds={1785}},
		{id=8637,name="Feint",subText="Rank 3",level=40,icon="Interface\\Icons\\Ability_Rogue_Feint",requiredIds={6768}},
		{id=1860,name="Safe Fall",subText="Passive",level=40,icon="Interface\\Icons\\INV_Feather_01"},
		{id=52538,name="Mark for Death",subText="",level=40,icon="Interface\\Icons\\Ability_Creature_Cursed_02",requiredTalent={id=165,tabIndex=3}},
		{id=52531,name="Envenom",subText="",level=40,icon="Interface\\Icons\\INV_Sword_31",requiredTalent={id=146,tabIndex=1}}
	},
	[42] = {
		{id=1768,name="Kick",subText="Rank 3",level=42,icon="Interface\\Icons\\Ability_Kick",requiredIds={1767}},
		{id=11267,name="Ambush",subText="Rank 4",level=42,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={8725}},
		{id=1857,name="Vanish",subText="Rank 2",level=42,icon="Interface\\Icons\\Ability_Vanish",requiredIds={1856}},
		{id=6774,name="Slice and Dice",subText="Rank 2",level=42,icon="Interface\\Icons\\Ability_Rogue_SliceDice",requiredIds={5171}},
		{id=45604,name="Flourish",subText="Rank 1",level=42,icon="Interface\\Icons\\Ability_DualWield"},
		{id=45605,name="Deadly Throw",subText="",level=42,icon="Interface\\Icons\\INV_ThrowingKnife_03"}
	},
	[44] = {
		{id=11273,name="Rupture",subText="Rank 4",level=44,icon="Interface\\Icons\\Ability_Rogue_Rupture",requiredIds={8640}},
		{id=11279,name="Backstab",subText="Rank 6",level=44,icon="Interface\\Icons\\Ability_BackStab",requiredIds={8721}}
	},
	[46] = {
		{id=11285,name="Gouge",subText="Rank 4",level=46,icon="Interface\\Icons\\Ability_Gouge",requiredIds={8629}},
		{id=11293,name="Sinister Strike",subText="Rank 7",level=46,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",requiredIds={8621}},
		{id=11289,name="Garrote",subText="Rank 5",level=46,icon="Interface\\Icons\\Ability_Rogue_Garrote",requiredIds={8633}},
		{id=17347,name="[Deprecated] Hemorrhage",subText="Rank 2",level=46,icon="Interface\\Icons\\Spell_Shadow_LifeDrain"},
		{id=11197,name="Expose Armor",subText="Rank 4",level=46,icon="Interface\\Icons\\Ability_Warrior_Riposte",requiredIds={8650}}
	},
	[48] = {
		{id=11299,name="Eviscerate",subText="Rank 7",level=48,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={8624}},
		{id=11297,name="Sap",subText="Rank 3",level=48,icon="Interface\\Icons\\Ability_Sap",requiredIds={2070}}
	},
	[50] = {
		{id=11268,name="Ambush",subText="Rank 5",level=50,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={11267}},
		{id=8643,name="Kidney Shot",subText="Rank 2",level=50,icon="Interface\\Icons\\Ability_Rogue_KidneyShot",requiredIds={408}}
	},
	[52] = {
		{id=11274,name="Rupture",subText="Rank 5",level=52,icon="Interface\\Icons\\Ability_Rogue_Rupture",requiredIds={11273}},
		{id=11400,name="Mind-numbing Poison III",subText="Rank 3",level=52,icon="Interface\\Icons\\Spell_Nature_NullifyDisease"},
		{id=11280,name="Backstab",subText="Rank 7",level=52,icon="Interface\\Icons\\Ability_BackStab",requiredIds={11279}},
		{id=11303,name="Feint",subText="Rank 4",level=52,icon="Interface\\Icons\\Ability_Rogue_Feint",requiredIds={8637}}
	},
	[54] = {
		{id=11294,name="Sinister Strike",subText="Rank 8",level=54,icon="Interface\\Icons\\Spell_Shadow_RitualOfSacrifice",requiredIds={11293}},
		{id=11290,name="Garrote",subText="Rank 6",level=54,icon="Interface\\Icons\\Ability_Rogue_Garrote",requiredIds={11289}}
	},
	[56] = {
		{id=11300,name="Eviscerate",subText="Rank 8",level=56,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={11299}},
		{id=11198,name="Expose Armor",subText="Rank 5",level=56,icon="Interface\\Icons\\Ability_Warrior_Riposte",requiredIds={11197}}
	},
	[58] = {
		{id=1769,name="Kick",subText="Rank 4",level=58,icon="Interface\\Icons\\Ability_Kick",requiredIds={1768}},
		{id=11269,name="Ambush",subText="Rank 6",level=58,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={11268}},
		{id=11305,name="Sprint",subText="Rank 3",level=58,icon="Interface\\Icons\\Ability_Rogue_Sprint",requiredIds={8696}},
		{id=17348,name="[Deprecated] Hemorrhage",subText="Rank 3",level=58,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredIds={17347}}
	},
	[60] = {
		{id=11286,name="Gouge",subText="Rank 5",level=60,icon="Interface\\Icons\\Ability_Gouge",requiredIds={11285}},
		{id=11275,name="Rupture",subText="Rank 6",level=60,icon="Interface\\Icons\\Ability_Rogue_Rupture",requiredIds={11274}},
		{id=1787,name="Stealth",subText="Rank 4",level=60,icon="Interface\\Icons\\Ability_Stealth",requiredIds={1786}},
		{id=11281,name="Backstab",subText="Rank 8",level=60,icon="Interface\\Icons\\Ability_BackStab",requiredIds={11280}},
		{id=25300,name="Backstab",subText="Rank 9",level=60,icon="Interface\\Icons\\Ability_BackStab",requiredIds={11281}},
		{id=25302,name="Feint",subText="Rank 5",level=60,icon="Interface\\Icons\\Ability_Rogue_Feint",requiredIds={11303}},
		{id=31016,name="Eviscerate",subText="Rank 9",level=60,icon="Interface\\Icons\\Ability_Rogue_Eviscerate",requiredIds={11300}},
		{id=45609,name="Shiv",subText="",level=60,icon="Interface\\Icons\\INV_ThrowingKnife_03"}
	}
}