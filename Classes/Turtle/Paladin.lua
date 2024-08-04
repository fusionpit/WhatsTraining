if (WT.currentClass ~= "PALADIN") then return end
WT:AddOverriddenSpells({
	{465,10290,643,10291,1032,10292,10293},
	{633,2800,10310},
	{7294,10298,10299,10300,10301,19998},
	{19876,19895,19896},
	{19888,19897,19898},
	{19891,19899,19900}
})
WT.SpellsByLevel = {
	[1] = {
		{id=465,name="Devotion Aura",subText="Rank 1",level=1,skillLineId=267,skillLineAbilityId=3530,icon="Interface\\Icons\\Spell_Holy_DevotionAura"},
		{id=635,name="Holy Light",subText="Rank 1",level=1,skillLineId=594,skillLineAbilityId=6501,icon="Interface\\Icons\\Spell_Holy_HolyBolt"},
		{id=19982,name="Holy Light",subText="",level=1,skillLineId=594,skillLineAbilityId=11331,icon="Interface\\Icons\\Spell_Holy_HolyBolt"},
		{id=19981,name="Holy Light",subText="",level=1,skillLineId=594,skillLineAbilityId=11332,icon="Interface\\Icons\\Spell_Holy_HolyBolt"},
		{id=19980,name="Holy Light",subText="",level=1,skillLineId=594,skillLineAbilityId=11333,icon="Interface\\Icons\\Spell_Holy_HolyBolt"},
		{id=19968,name="Holy Light",subText="",level=1,skillLineId=594,skillLineAbilityId=11334,icon="Interface\\Icons\\Spell_Holy_HolyBolt"},
		{id=20154,name="Seal of Righteousness",subText="Rank 1",level=1,skillLineId=594,skillLineAbilityId=11536,icon="Interface\\Icons\\Ability_ThunderBolt"},
		{id=20187,name="Judgement of Righteousness",subText="Rank 1",level=1,skillLineId=594,skillLineAbilityId=11537,icon="Interface\\Icons\\Ability_ThunderBolt"},
		{id=21084,name="Seal of Righteousness",subText="Rank 1",level=1,skillLineId=594,skillLineAbilityId=11957,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20154}},
		{id=25997,name="Eye for an Eye",subText="Rank 1",level=1,skillLineId=184,skillLineAbilityId=13378,icon="Interface\\Icons\\Spell_Holy_EyeforanEye"},
		{id=679,name="Holy Strike",subText="Rank 1",level=1,skillLineId=594,skillLineAbilityId=30000,icon="Interface\\Icons\\INV_Sword_01"}
	},
	[4] = {
		{id=19740,name="Blessing of Might",subText="Rank 1",level=4,skillLineId=184,skillLineAbilityId=11216,icon="Interface\\Icons\\Spell_Holy_FistOfJustice"},
		{id=20271,name="Judgement",subText="",level=4,skillLineId=184,skillLineAbilityId=11549,icon="Interface\\Icons\\Spell_Holy_RighteousFury"}
	},
	[6] = {
		{id=639,name="Holy Light",subText="Rank 2",level=6,skillLineId=594,skillLineAbilityId=6502,icon="Interface\\Icons\\Spell_Holy_HolyBolt",requiredIds={635}},
		{id=498,name="Divine Protection",subText="Rank 1",level=6,skillLineId=267,skillLineAbilityId=6537,icon="Interface\\Icons\\Spell_Holy_Restoration"},
		{id=21082,name="Seal of the Crusader",subText="Rank 1",level=6,skillLineId=184,skillLineAbilityId=11956,icon="Interface\\Icons\\Spell_Holy_HolySmite"}
	},
	[8] = {
		{id=1152,name="Purify",subText="",level=8,skillLineId=594,skillLineAbilityId=6529,icon="Interface\\Icons\\Spell_Holy_Purify"},
		{id=853,name="Hammer of Justice",subText="Rank 1",level=8,skillLineId=267,skillLineAbilityId=13448,icon="Interface\\Icons\\Spell_Holy_SealOfMight"},
		{id=678,name="Holy Strike",subText="Rank 2",level=8,skillLineId=594,skillLineAbilityId=30003,icon="Interface\\Icons\\INV_Sword_01",requiredIds={679}}
	},
	[10] = {
		{id=10290,name="Devotion Aura",subText="Rank 2",level=10,skillLineId=267,skillLineAbilityId=5522,icon="Interface\\Icons\\Spell_Holy_DevotionAura",requiredIds={465}},
		{id=633,name="Lay on Hands",subText="Rank 1",level=10,skillLineId=594,skillLineAbilityId=6509,icon="Interface\\Icons\\Spell_Holy_LayOnHands"},
		{id=1022,name="Blessing of Protection",subText="Rank 1",level=10,skillLineId=267,skillLineAbilityId=6530,icon="Interface\\Icons\\Spell_Holy_SealOfProtection"},
		{id=20287,name="Seal of Righteousness",subText="Rank 2",level=10,skillLineId=594,skillLineAbilityId=11561,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={21084}},
		{id=20280,name="Judgement of Righteousness",subText="Rank 2",level=10,skillLineId=594,skillLineAbilityId=11562,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20187}},
		{id=2537,name="Crusader Strike",subText="Rank 1",level=10,skillLineId=184,skillLineAbilityId=30045,icon="Interface\\Icons\\Spell_Holy_CrusaderStrike"}
	},
	[12] = {
		{id=7328,name="Redemption",subText="Rank 1",level=12,skillLineId=594,skillLineAbilityId=6521,icon="Interface\\Icons\\Spell_Holy_Resurrection"},
		{id=19834,name="Blessing of Might",subText="Rank 2",level=12,skillLineId=184,skillLineAbilityId=11217,icon="Interface\\Icons\\Spell_Holy_FistOfJustice",requiredIds={19740}},
		{id=20162,name="Seal of the Crusader",subText="Rank 2",level=12,skillLineId=184,skillLineAbilityId=11547,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={21082}},
		{id=20188,name="Judgement of the Crusader",subText="Rank 2",level=12,skillLineId=184,skillLineAbilityId=11548,icon="Interface\\Icons\\Spell_Holy_HolySmite"}
	},
	[14] = {
		{id=647,name="Holy Light",subText="Rank 3",level=14,skillLineId=594,skillLineAbilityId=6503,icon="Interface\\Icons\\Spell_Holy_HolyBolt",requiredIds={639}},
		{id=19742,name="Blessing of Wisdom",subText="Rank 1",level=14,skillLineId=594,skillLineAbilityId=11245,icon="Interface\\Icons\\Spell_Holy_SealOfWisdom"}
	},
	[16] = {
		{id=7294,name="Retribution Aura",subText="Rank 1",level=16,skillLineId=184,skillLineAbilityId=6496,icon="Interface\\Icons\\Spell_Holy_AuraOfLight"},
		{id=25780,name="Righteous Fury",subText="",level=16,skillLineId=267,skillLineAbilityId=13345,icon="Interface\\Icons\\Spell_Holy_SealOfFury"},
		{id=1866,name="Holy Strike",subText="Rank 3",level=16,skillLineId=594,skillLineAbilityId=30004,icon="Interface\\Icons\\INV_Sword_01",requiredIds={678}}
	},
	[18] = {
		{id=5573,name="Divine Protection",subText="Rank 2",level=18,skillLineId=267,skillLineAbilityId=6538,icon="Interface\\Icons\\Spell_Holy_Restoration",requiredIds={498}},
		{id=1044,name="Blessing of Freedom",subText="",level=18,skillLineId=267,skillLineAbilityId=10464,icon="Interface\\Icons\\Spell_Holy_SealOfValor"},
		{id=20288,name="Seal of Righteousness",subText="Rank 3",level=18,skillLineId=594,skillLineAbilityId=11563,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20287}},
		{id=20281,name="Judgement of Righteousness",subText="Rank 3",level=18,skillLineId=594,skillLineAbilityId=11569,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20280}}
	},
	[20] = {
		{id=643,name="Devotion Aura",subText="Rank 3",level=20,skillLineId=267,skillLineAbilityId=3531,icon="Interface\\Icons\\Spell_Holy_DevotionAura",requiredIds={10290}},
		{id=879,name="Exorcism",subText="Rank 1",level=20,skillLineId=594,skillLineAbilityId=6512,icon="Interface\\Icons\\Spell_Holy_Excorcism_02"},
		{id=5502,name="Sense Undead",subText="",level=20,skillLineId=594,skillLineAbilityId=6527,icon="Interface\\Icons\\Spell_Holy_SenseUndead"},
		{id=19750,name="Flash of Light",subText="Rank 1",level=20,skillLineId=594,skillLineAbilityId=11276,icon="Interface\\Icons\\Spell_Holy_FlashHeal"},
		{id=19993,name="Flash of Light",subText="",level=20,skillLineId=594,skillLineAbilityId=11335,icon="Interface\\Icons\\Spell_Holy_FlashHeal"},
		{id=26573,name="Consecration",subText="Rank 1",level=20,skillLineId=594,skillLineAbilityId=13453,icon="Interface\\Icons\\Spell_Holy_InnerFire"},
		{id=20066,name="Repentance",subText="",level=20,skillLineId=184,skillLineAbilityId=13454,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing",requiredTalentId=1441},
		{id=20217,name="Blessing of Kings",subText="",level=20,skillLineId=267,skillLineAbilityId=13455,icon="Interface\\Icons\\Spell_Magic_MageArmor",requiredTalentId=1481}
	},
	[22] = {
		{id=1026,name="Holy Light",subText="Rank 4",level=22,skillLineId=594,skillLineAbilityId=6504,icon="Interface\\Icons\\Spell_Holy_HolyBolt",requiredIds={647}},
		{id=19835,name="Blessing of Might",subText="Rank 3",level=22,skillLineId=184,skillLineAbilityId=11218,icon="Interface\\Icons\\Spell_Holy_FistOfJustice",requiredIds={19834}},
		{id=19746,name="Concentration Aura",subText="",level=22,skillLineId=267,skillLineAbilityId=11336,icon="Interface\\Icons\\Spell_Holy_MindSooth"},
		{id=20164,name="Seal of Justice",subText="",level=22,skillLineId=267,skillLineAbilityId=11545,icon="Interface\\Icons\\Spell_Holy_SealOfWrath"},
		{id=20184,name="Judgement of Justice",subText="Rank 1",level=22,skillLineId=267,skillLineAbilityId=11546,icon="Interface\\Icons\\Spell_Holy_SealOfWrath"},
		{id=20305,name="Seal of the Crusader",subText="Rank 3",level=22,skillLineId=184,skillLineAbilityId=11576,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20162}},
		{id=20300,name="Judgement of the Crusader",subText="Rank 3",level=22,skillLineId=184,skillLineAbilityId=11581,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20188}},
		{id=8823,name="Crusader Strike",subText="Rank 2",level=22,skillLineId=184,skillLineAbilityId=30046,icon="Interface\\Icons\\Spell_Holy_CrusaderStrike",requiredIds={2537}}
	},
	[24] = {
		{id=2878,name="Turn Undead",subText="Rank 1",level=24,skillLineId=594,skillLineAbilityId=6525,icon="Interface\\Icons\\Spell_Holy_TurnUndead"},
		{id=5599,name="Blessing of Protection",subText="Rank 2",level=24,skillLineId=267,skillLineAbilityId=6531,icon="Interface\\Icons\\Spell_Holy_SealOfProtection",requiredIds={1022}},
		{id=19850,name="Blessing of Wisdom",subText="Rank 2",level=24,skillLineId=594,skillLineAbilityId=11246,icon="Interface\\Icons\\Spell_Holy_SealOfWisdom",requiredIds={19742}},
		{id=10322,name="Redemption",subText="Rank 2",level=24,skillLineId=594,skillLineAbilityId=11794,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={7328}},
		{id=5588,name="Hammer of Justice",subText="Rank 2",level=24,skillLineId=267,skillLineAbilityId=13449,icon="Interface\\Icons\\Spell_Holy_SealOfMight",requiredIds={853}},
		{id=680,name="Holy Strike",subText="Rank 4",level=24,skillLineId=594,skillLineAbilityId=30005,icon="Interface\\Icons\\INV_Sword_01",requiredIds={1866}}
	},
	[26] = {
		{id=10298,name="Retribution Aura",subText="Rank 2",level=26,skillLineId=184,skillLineAbilityId=6497,icon="Interface\\Icons\\Spell_Holy_AuraOfLight",requiredIds={7294}},
		{id=1038,name="Blessing of Salvation",subText="",level=26,skillLineId=267,skillLineAbilityId=6535,icon="Interface\\Icons\\Spell_Holy_SealOfSalvation"},
		{id=19939,name="Flash of Light",subText="Rank 2",level=26,skillLineId=594,skillLineAbilityId=11277,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={19750}},
		{id=20289,name="Seal of Righteousness",subText="Rank 4",level=26,skillLineId=594,skillLineAbilityId=11564,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20288}},
		{id=20282,name="Judgement of Righteousness",subText="Rank 4",level=26,skillLineId=594,skillLineAbilityId=11570,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20281}}
	},
	[28] = {
		{id=5614,name="Exorcism",subText="Rank 2",level=28,skillLineId=594,skillLineAbilityId=6513,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={879}},
		{id=19876,name="Shadow Resistance Aura",subText="Rank 1",level=28,skillLineId=267,skillLineAbilityId=11256,icon="Interface\\Icons\\Spell_Shadow_SealOfKings"}
	},
	[30] = {
		{id=10291,name="Devotion Aura",subText="Rank 4",level=30,skillLineId=267,skillLineAbilityId=5523,icon="Interface\\Icons\\Spell_Holy_DevotionAura",requiredIds={643}},
		{id=2800,name="Lay on Hands",subText="Rank 2",level=30,skillLineId=594,skillLineAbilityId=6510,icon="Interface\\Icons\\Spell_Holy_LayOnHands",requiredIds={633}},
		{id=20165,name="Seal of Light",subText="Rank 1",level=30,skillLineId=594,skillLineAbilityId=11538,icon="Interface\\Icons\\Spell_Holy_HealingAura"},
		{id=20185,name="Judgement of Light",subText="Rank 1",level=30,skillLineId=594,skillLineAbilityId=11539,icon="Interface\\Icons\\Spell_Holy_HealingAura"},
		{id=19752,name="Divine Intervention",subText="",level=30,skillLineId=267,skillLineAbilityId=11916,icon="Interface\\Icons\\Spell_Nature_TimeStop"},
		{id=20116,name="Consecration",subText="Rank 2",level=30,skillLineId=594,skillLineAbilityId=13438,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={26573}},
		{id=20218,name="Sanctity Aura",subText="",level=30,skillLineId=184,skillLineAbilityId=13442,icon="Interface\\Icons\\Spell_Holy_MindVision",requiredTalentId=1435},
		{id=20218,name="Sanctity Aura",subText="",level=30,skillLineId=184,skillLineAbilityId=13443,icon="Interface\\Icons\\Spell_Holy_MindVision",requiredTalentId=1435},
		{id=20116,name="Consecration",subText="Rank 2",level=30,skillLineId=594,skillLineAbilityId=13444,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={26573}}
	},
	[32] = {
		{id=19836,name="Blessing of Might",subText="Rank 4",level=32,skillLineId=184,skillLineAbilityId=11219,icon="Interface\\Icons\\Spell_Holy_FistOfJustice",requiredIds={19835}},
		{id=19888,name="Frost Resistance Aura",subText="Rank 1",level=32,skillLineId=267,skillLineAbilityId=11262,icon="Interface\\Icons\\Spell_Frost_WizardMark"},
		{id=20306,name="Seal of the Crusader",subText="Rank 4",level=32,skillLineId=184,skillLineAbilityId=11577,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20305}},
		{id=20301,name="Judgement of the Crusader",subText="Rank 4",level=32,skillLineId=184,skillLineAbilityId=11582,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20300}},
		{id=2495,name="Holy Strike",subText="Rank 5",level=32,skillLineId=594,skillLineAbilityId=30008,icon="Interface\\Icons\\INV_Sword_01",requiredIds={680}}
	},
	[34] = {
		{id=642,name="Divine Shield",subText="Rank 1",level=34,skillLineId=267,skillLineAbilityId=6533,icon="Interface\\Icons\\Spell_Holy_DivineIntervention"},
		{id=19852,name="Blessing of Wisdom",subText="Rank 3",level=34,skillLineId=594,skillLineAbilityId=11247,icon="Interface\\Icons\\Spell_Holy_SealOfWisdom",requiredIds={19850}},
		{id=19940,name="Flash of Light",subText="Rank 3",level=34,skillLineId=594,skillLineAbilityId=11278,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={19939}},
		{id=20290,name="Seal of Righteousness",subText="Rank 5",level=34,skillLineId=594,skillLineAbilityId=11565,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20289}},
		{id=20283,name="Judgement of Righteousness",subText="Rank 5",level=34,skillLineId=594,skillLineAbilityId=11571,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20282}},
		{id=8824,name="Crusader Strike",subText="Rank 3",level=34,skillLineId=184,skillLineAbilityId=30047,icon="Interface\\Icons\\Spell_Holy_CrusaderStrike",requiredIds={8823}}
	},
	[36] = {
		{id=10299,name="Retribution Aura",subText="Rank 3",level=36,skillLineId=184,skillLineAbilityId=6498,icon="Interface\\Icons\\Spell_Holy_AuraOfLight",requiredIds={10298}},
		{id=5615,name="Exorcism",subText="Rank 3",level=36,skillLineId=594,skillLineAbilityId=6514,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={5614}},
		{id=19891,name="Fire Resistance Aura",subText="Rank 1",level=36,skillLineId=267,skillLineAbilityId=11259,icon="Interface\\Icons\\Spell_Fire_SealOfFire"},
		{id=10324,name="Redemption",subText="Rank 3",level=36,skillLineId=594,skillLineAbilityId=11795,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={10322}}
	},
	[38] = {
		{id=3472,name="Holy Light",subText="Rank 6",level=38,skillLineId=594,skillLineAbilityId=6506,icon="Interface\\Icons\\Spell_Holy_HolyBolt",requiredIds={1026}},
		{id=5627,name="Turn Undead",subText="Rank 2",level=38,skillLineId=594,skillLineAbilityId=6524,icon="Interface\\Icons\\Spell_Holy_TurnUndead",requiredIds={2878}},
		{id=10278,name="Blessing of Protection",subText="Rank 3",level=38,skillLineId=267,skillLineAbilityId=6532,icon="Interface\\Icons\\Spell_Holy_SealOfProtection",requiredIds={5599}},
		{id=20166,name="Seal of Wisdom",subText="Rank 1",level=38,skillLineId=594,skillLineAbilityId=11540,icon="Interface\\Icons\\Spell_Holy_RighteousnessAura"},
		{id=20186,name="Judgement of Wisdom",subText="Rank 1",level=38,skillLineId=594,skillLineAbilityId=11541,icon="Interface\\Icons\\Spell_Holy_RighteousnessAura"}
	},
	[40] = {
		{id=1032,name="Devotion Aura",subText="Rank 5",level=40,skillLineId=267,skillLineAbilityId=3532,icon="Interface\\Icons\\Spell_Holy_DevotionAura",requiredIds={10291}},
		{id=13819,name="Summon Warhorse",subText="Summon",level=40,skillLineId=594,skillLineAbilityId=7594,icon="Interface\\Icons\\Spell_Nature_Swiftness"},
		{id=19895,name="Shadow Resistance Aura",subText="Rank 2",level=40,skillLineId=267,skillLineAbilityId=11257,icon="Interface\\Icons\\Spell_Shadow_SealOfKings",requiredIds={19876}},
		{id=19977,name="Blessing of Light",subText="Rank 1",level=40,skillLineId=594,skillLineAbilityId=11328,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02"},
		{id=20347,name="Seal of Light",subText="Rank 2",level=40,skillLineId=594,skillLineAbilityId=11595,icon="Interface\\Icons\\Spell_Holy_HealingAura",requiredIds={20165}},
		{id=20344,name="Judgement of Light",subText="Rank 2",level=40,skillLineId=594,skillLineAbilityId=11598,icon="Interface\\Icons\\Spell_Holy_HealingAura",requiredIds={20185}},
		{id=20922,name="Consecration",subText="Rank 3",level=40,skillLineId=594,skillLineAbilityId=13439,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={20116}},
		{id=20922,name="Consecration",subText="Rank 3",level=40,skillLineId=594,skillLineAbilityId=13445,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={20116}},
		{id=5589,name="Hammer of Justice",subText="Rank 3",level=40,skillLineId=267,skillLineAbilityId=13450,icon="Interface\\Icons\\Spell_Holy_SealOfMight",requiredIds={5588}},
		{id=25912,name="Holy Shock",subText="Rank 1",level=40,skillLineId=594,skillLineAbilityId=13935,icon="Interface\\Icons\\Spell_Holy_SearingLight"},
		{id=25914,name="Holy Shock",subText="Rank 1",level=40,skillLineId=594,skillLineAbilityId=13938,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={25912}},
		{id=5569,name="Holy Strike",subText="Rank 6",level=40,skillLineId=594,skillLineAbilityId=30010,icon="Interface\\Icons\\INV_Sword_01",requiredIds={2495}},
		{id=45017,name="Summon Thalassian Warhorse",subText="Summon",level=40,skillLineId=594,skillLineAbilityId=36335,icon="Interface\\Icons\\Spell_Nature_Swiftness"},
		{id=45028,name="Summon Scarlet Warhorse",subText="Summon",level=40,skillLineId=594,skillLineAbilityId=36339,icon="Interface\\Icons\\Spell_Nature_Swiftness"},
		{id=45619,name="Conviction",subText="Rank 1",level=40,skillLineId=184,skillLineAbilityId=36430,icon="Interface\\Icons\\Spell_Holy_RetributionAura"}
	},
	[42] = {
		{id=4987,name="Cleanse",subText="",level=42,skillLineId=594,skillLineAbilityId=6528,icon="Interface\\Icons\\Spell_Holy_Renew"},
		{id=19837,name="Blessing of Might",subText="Rank 5",level=42,skillLineId=184,skillLineAbilityId=11220,icon="Interface\\Icons\\Spell_Holy_FistOfJustice",requiredIds={19836}},
		{id=19941,name="Flash of Light",subText="Rank 4",level=42,skillLineId=594,skillLineAbilityId=11279,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={19940}},
		{id=20291,name="Seal of Righteousness",subText="Rank 6",level=42,skillLineId=594,skillLineAbilityId=11566,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20290}},
		{id=20284,name="Judgement of Righteousness",subText="Rank 6",level=42,skillLineId=594,skillLineAbilityId=11572,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20283}},
		{id=20307,name="Seal of the Crusader",subText="Rank 5",level=42,skillLineId=184,skillLineAbilityId=11578,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20306}},
		{id=20302,name="Judgement of the Crusader",subText="Rank 5",level=42,skillLineId=184,skillLineAbilityId=11583,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20301}}
	},
	[44] = {
		{id=10312,name="Exorcism",subText="Rank 4",level=44,skillLineId=594,skillLineAbilityId=6515,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={5615}},
		{id=19853,name="Blessing of Wisdom",subText="Rank 4",level=44,skillLineId=594,skillLineAbilityId=11248,icon="Interface\\Icons\\Spell_Holy_SealOfWisdom",requiredIds={19852}},
		{id=19897,name="Frost Resistance Aura",subText="Rank 2",level=44,skillLineId=267,skillLineAbilityId=11263,icon="Interface\\Icons\\Spell_Frost_WizardMark",requiredIds={19888}},
		{id=24275,name="Hammer of Wrath",subText="Rank 1",level=44,skillLineId=594,skillLineAbilityId=12877,icon="Interface\\Icons\\Ability_ThunderClap"}
	},
	[46] = {
		{id=10300,name="Retribution Aura",subText="Rank 4",level=46,skillLineId=184,skillLineAbilityId=6499,icon="Interface\\Icons\\Spell_Holy_AuraOfLight",requiredIds={10299}},
		{id=10328,name="Holy Light",subText="Rank 7",level=46,skillLineId=594,skillLineAbilityId=6507,icon="Interface\\Icons\\Spell_Holy_HolyBolt",requiredIds={3472}},
		{id=6940,name="Blessing of Sacrifice",subText="Rank 1",level=46,skillLineId=267,skillLineAbilityId=6536,icon="Interface\\Icons\\Spell_Holy_SealOfSacrifice"},
		{id=10336,name="Crusader Strike",subText="Rank 4",level=46,skillLineId=184,skillLineAbilityId=30048,icon="Interface\\Icons\\Spell_Holy_CrusaderStrike",requiredIds={8824}}
	},
	[48] = {
		{id=19899,name="Fire Resistance Aura",subText="Rank 2",level=48,skillLineId=267,skillLineAbilityId=11260,icon="Interface\\Icons\\Spell_Fire_SealOfFire",requiredIds={19891}},
		{id=20356,name="Seal of Wisdom",subText="Rank 2",level=48,skillLineId=594,skillLineAbilityId=11601,icon="Interface\\Icons\\Spell_Holy_RighteousnessAura",requiredIds={20166}},
		{id=20354,name="Judgement of Wisdom",subText="Rank 2",level=48,skillLineId=594,skillLineAbilityId=11603,icon="Interface\\Icons\\Spell_Holy_RighteousnessAura",requiredIds={20186}},
		{id=20772,name="Redemption",subText="Rank 4",level=48,skillLineId=594,skillLineAbilityId=11796,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={10324}},
		{id=25911,name="Holy Shock",subText="Rank 2",level=48,skillLineId=594,skillLineAbilityId=13936,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={25914}},
		{id=25913,name="Holy Shock",subText="Rank 2",level=48,skillLineId=594,skillLineAbilityId=13939,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={25911}},
		{id=10332,name="Holy Strike",subText="Rank 7",level=48,skillLineId=594,skillLineAbilityId=30011,icon="Interface\\Icons\\INV_Sword_01",requiredIds={5569}}
	},
	[50] = {
		{id=10292,name="Devotion Aura",subText="Rank 6",level=50,skillLineId=267,skillLineAbilityId=5524,icon="Interface\\Icons\\Spell_Holy_DevotionAura",requiredIds={1032}},
		{id=10310,name="Lay on Hands",subText="Rank 3",level=50,skillLineId=594,skillLineAbilityId=6511,icon="Interface\\Icons\\Spell_Holy_LayOnHands",requiredIds={2800}},
		{id=2812,name="Holy Wrath",subText="Rank 1",level=50,skillLineId=594,skillLineAbilityId=6518,icon="Interface\\Icons\\Spell_Holy_Excorcism"},
		{id=1020,name="Divine Shield",subText="Rank 2",level=50,skillLineId=267,skillLineAbilityId=6534,icon="Interface\\Icons\\Spell_Holy_DivineIntervention",requiredIds={642}},
		{id=19942,name="Flash of Light",subText="Rank 5",level=50,skillLineId=594,skillLineAbilityId=11280,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={19941}},
		{id=19978,name="Blessing of Light",subText="Rank 2",level=50,skillLineId=594,skillLineAbilityId=11329,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02",requiredIds={19977}},
		{id=20292,name="Seal of Righteousness",subText="Rank 7",level=50,skillLineId=594,skillLineAbilityId=11573,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20291}},
		{id=20285,name="Judgement of Righteousness",subText="Rank 7",level=50,skillLineId=594,skillLineAbilityId=11574,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20284}},
		{id=20348,name="Seal of Light",subText="Rank 3",level=50,skillLineId=594,skillLineAbilityId=11596,icon="Interface\\Icons\\Spell_Holy_HealingAura",requiredIds={20347}},
		{id=20345,name="Judgement of Light",subText="Rank 3",level=50,skillLineId=594,skillLineAbilityId=11599,icon="Interface\\Icons\\Spell_Holy_HealingAura",requiredIds={20344}},
		{id=20923,name="Consecration",subText="Rank 4",level=50,skillLineId=594,skillLineAbilityId=13440,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={20922}},
		{id=20923,name="Consecration",subText="Rank 4",level=50,skillLineId=594,skillLineAbilityId=13446,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={20922}}
	},
	[52] = {
		{id=10313,name="Exorcism",subText="Rank 5",level=52,skillLineId=594,skillLineAbilityId=6516,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={10312}},
		{id=10326,name="Turn Undead",subText="Rank 3",level=52,skillLineId=594,skillLineAbilityId=6526,icon="Interface\\Icons\\Spell_Holy_TurnUndead",requiredIds={5627}},
		{id=19838,name="Blessing of Might",subText="Rank 6",level=52,skillLineId=184,skillLineAbilityId=11221,icon="Interface\\Icons\\Spell_Holy_FistOfJustice",requiredIds={19837}},
		{id=19896,name="Shadow Resistance Aura",subText="Rank 3",level=52,skillLineId=267,skillLineAbilityId=11258,icon="Interface\\Icons\\Spell_Shadow_SealOfKings",requiredIds={19895}},
		{id=20308,name="Seal of the Crusader",subText="Rank 6",level=52,skillLineId=184,skillLineAbilityId=11579,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20307}},
		{id=20303,name="Judgement of the Crusader",subText="Rank 6",level=52,skillLineId=184,skillLineAbilityId=11584,icon="Interface\\Icons\\Spell_Holy_HolySmite",requiredIds={20302}},
		{id=24274,name="Hammer of Wrath",subText="Rank 2",level=52,skillLineId=594,skillLineAbilityId=12878,icon="Interface\\Icons\\Ability_ThunderClap",requiredIds={24275}},
		{id=25782,name="Greater Blessing of Might",subText="Rank 1",level=52,skillLineId=184,skillLineAbilityId=13369,icon="Interface\\Icons\\Spell_Holy_GreaterBlessingofKings"}
	},
	[54] = {
		{id=10329,name="Holy Light",subText="Rank 8",level=54,skillLineId=594,skillLineAbilityId=6508,icon="Interface\\Icons\\Spell_Holy_HolyBolt",requiredIds={10328}},
		{id=19854,name="Blessing of Wisdom",subText="Rank 5",level=54,skillLineId=594,skillLineAbilityId=11249,icon="Interface\\Icons\\Spell_Holy_SealOfWisdom",requiredIds={19853}},
		{id=20729,name="Blessing of Sacrifice",subText="Rank 2",level=54,skillLineId=267,skillLineAbilityId=11783,icon="Interface\\Icons\\Spell_Holy_SealOfSacrifice",requiredIds={6940}},
		{id=25894,name="Greater Blessing of Wisdom",subText="Rank 1",level=54,skillLineId=594,skillLineAbilityId=13366,icon="Interface\\Icons\\Spell_Holy_GreaterBlessingofWisdom"},
		{id=10308,name="Hammer of Justice",subText="Rank 4",level=54,skillLineId=267,skillLineAbilityId=13452,icon="Interface\\Icons\\Spell_Holy_SealOfMight",requiredIds={5589}}
	},
	[56] = {
		{id=10301,name="Retribution Aura",subText="Rank 5",level=56,skillLineId=184,skillLineAbilityId=6500,icon="Interface\\Icons\\Spell_Holy_AuraOfLight",requiredIds={10300}},
		{id=19898,name="Frost Resistance Aura",subText="Rank 3",level=56,skillLineId=267,skillLineAbilityId=11264,icon="Interface\\Icons\\Spell_Frost_WizardMark",requiredIds={19897}},
		{id=25902,name="Holy Shock",subText="Rank 3",level=56,skillLineId=594,skillLineAbilityId=13937,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={25913}},
		{id=25903,name="Holy Shock",subText="Rank 3",level=56,skillLineId=594,skillLineAbilityId=13940,icon="Interface\\Icons\\Spell_Holy_SearingLight",requiredIds={25902}},
		{id=10333,name="Holy Strike",subText="Rank 8",level=56,skillLineId=594,skillLineAbilityId=30012,icon="Interface\\Icons\\INV_Sword_01",requiredIds={10332}}
	},
	[58] = {
		{id=19943,name="Flash of Light",subText="Rank 6",level=58,skillLineId=594,skillLineAbilityId=11281,icon="Interface\\Icons\\Spell_Holy_FlashHeal",requiredIds={19942}},
		{id=20293,name="Seal of Righteousness",subText="Rank 8",level=58,skillLineId=594,skillLineAbilityId=11568,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20292}},
		{id=20286,name="Judgement of Righteousness",subText="Rank 8",level=58,skillLineId=594,skillLineAbilityId=11575,icon="Interface\\Icons\\Ability_ThunderBolt",requiredIds={20285}},
		{id=20357,name="Seal of Wisdom",subText="Rank 3",level=58,skillLineId=594,skillLineAbilityId=11602,icon="Interface\\Icons\\Spell_Holy_RighteousnessAura",requiredIds={20356}},
		{id=20355,name="Judgement of Wisdom",subText="Rank 3",level=58,skillLineId=594,skillLineAbilityId=11604,icon="Interface\\Icons\\Spell_Holy_RighteousnessAura",requiredIds={20354}},
		{id=10337,name="Crusader Strike",subText="Rank 5",level=58,skillLineId=184,skillLineAbilityId=30049,icon="Interface\\Icons\\Spell_Holy_CrusaderStrike",requiredIds={10336}}
	},
	[60] = {
		{id=10293,name="Devotion Aura",subText="Rank 7",level=60,skillLineId=267,skillLineAbilityId=5525,icon="Interface\\Icons\\Spell_Holy_DevotionAura",requiredIds={10292}},
		{id=10314,name="Exorcism",subText="Rank 6",level=60,skillLineId=594,skillLineAbilityId=6517,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={10313}},
		{id=10318,name="Holy Wrath",subText="Rank 2",level=60,skillLineId=594,skillLineAbilityId=6519,icon="Interface\\Icons\\Spell_Holy_Excorcism",requiredIds={2812}},
		{id=19900,name="Fire Resistance Aura",subText="Rank 3",level=60,skillLineId=267,skillLineAbilityId=11261,icon="Interface\\Icons\\Spell_Fire_SealOfFire",requiredIds={19899}},
		{id=19979,name="Blessing of Light",subText="Rank 3",level=60,skillLineId=594,skillLineAbilityId=11330,icon="Interface\\Icons\\Spell_Holy_PrayerOfHealing02",requiredIds={19978}},
		{id=20349,name="Seal of Light",subText="Rank 4",level=60,skillLineId=594,skillLineAbilityId=11597,icon="Interface\\Icons\\Spell_Holy_HealingAura",requiredIds={20348}},
		{id=20346,name="Judgement of Light",subText="Rank 4",level=60,skillLineId=594,skillLineAbilityId=11600,icon="Interface\\Icons\\Spell_Holy_HealingAura",requiredIds={20345}},
		{id=20773,name="Redemption",subText="Rank 5",level=60,skillLineId=594,skillLineAbilityId=11797,icon="Interface\\Icons\\Spell_Holy_Resurrection",requiredIds={20772}},
		{id=23214,name="Summon Charger",subText="Summon",level=60,skillLineId=594,skillLineAbilityId=12518,icon="Interface\\Icons\\Ability_Mount_Charger"},
		{id=24239,name="Hammer of Wrath",subText="Rank 3",level=60,skillLineId=594,skillLineAbilityId=12879,icon="Interface\\Icons\\Ability_ThunderClap",requiredIds={24274}},
		{id=25292,name="Holy Light",subText="Rank 9",level=60,skillLineId=594,skillLineAbilityId=13229,icon="Interface\\Icons\\Spell_Holy_HolyBolt",requiredIds={10329}},
		{id=25290,name="Blessing of Wisdom",subText="Rank 6",level=60,skillLineId=594,skillLineAbilityId=13230,icon="Interface\\Icons\\Spell_Holy_SealOfWisdom",requiredIds={19854}},
		{id=25291,name="Blessing of Might",subText="Rank 7",level=60,skillLineId=184,skillLineAbilityId=13231,icon="Interface\\Icons\\Spell_Holy_FistOfJustice",requiredIds={19838}},
		{id=25890,name="Greater Blessing of Light",subText="Rank 1",level=60,skillLineId=594,skillLineAbilityId=13365,icon="Interface\\Icons\\Spell_Holy_GreaterBlessingofLight"},
		{id=25895,name="Greater Blessing of Salvation",subText="",level=60,skillLineId=267,skillLineAbilityId=13367,icon="Interface\\Icons\\Spell_Holy_GreaterBlessingofSalvation"},
		{id=25899,name="Greater Blessing of Sanctuary",subText="Rank 1",level=60,skillLineId=267,skillLineAbilityId=13368,icon="Interface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary"},
		{id=25916,name="Greater Blessing of Might",subText="Rank 2",level=60,skillLineId=184,skillLineAbilityId=13372,icon="Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",requiredIds={25782}},
		{id=25918,name="Greater Blessing of Wisdom",subText="Rank 2",level=60,skillLineId=594,skillLineAbilityId=13421,icon="Interface\\Icons\\Spell_Holy_GreaterBlessingofWisdom",requiredIds={25894}},
		{id=20924,name="Consecration",subText="Rank 5",level=60,skillLineId=594,skillLineAbilityId=13441,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={20923}},
		{id=20924,name="Consecration",subText="Rank 5",level=60,skillLineId=594,skillLineAbilityId=13447,icon="Interface\\Icons\\Spell_Holy_InnerFire",requiredIds={20923}},
		{id=25898,name="Greater Blessing of Kings",subText="",level=60,skillLineId=267,skillLineAbilityId=13456,icon="Interface\\Icons\\Spell_Magic_GreaterBlessingofKings"},
		{id=45802,name="Seal of the Martyr",subText="Rank 1",level=60,skillLineId=184,skillLineAbilityId=30518,icon="Interface\\Icons\\Spell_Holy_SealofBLood"},
		{id=45801,name="Greater Blessing of Sacrifice",subText="",level=60,skillLineId=267,skillLineAbilityId=30519,icon="Interface\\Icons\\Spell_Holy_SealOfSacrifice"},
		{id=45019,name="Summon Thalassian Charger",subText="Summon",level=60,skillLineId=594,skillLineAbilityId=36337,icon="Interface\\Icons\\Ability_Mount_Charger"},
		{id=45020,name="Summon Argent Charger",subText="Summon",level=60,skillLineId=594,skillLineAbilityId=36338,icon="Interface\\Icons\\Ability_Mount_Charger"},
		{id=45029,name="Summon Scarlet Charger",subText="Summon",level=60,skillLineId=594,skillLineAbilityId=36340,icon="Interface\\Icons\\Ability_Mount_Charger"},
		{id=45620,name="Conviction",subText="Rank 2",level=60,skillLineId=184,skillLineAbilityId=36431,icon="Interface\\Icons\\Spell_Holy_RetributionAura",requiredIds={45619}}
	}
}