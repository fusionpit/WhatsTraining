setfenv(1, WhatsTraining)
OverridenSpells["Druid"] = {
	{99,1735,9490,9747,9898},
	{779,780,769,9754,9908},
	{1079,9492,9493,9752,9894,9896},
	{1082,3029,16828,5201,16829,9849,16830,9850,16831,16832,3010,3009},
	{1742,1753,9000,1754,9892,1755,1756,16697},
	{1822,1823,1824,9904},
	{5211,6798,8983},
	{5215,6783,24452,9913,24453},
	{5217,6793,9845,9846},
	{5221,6800,8992,9829,9830,45969},
	{5487,9634},
	{6785,6787,9866,9867},
	{6807,6808,6809,8972,9745,9880,9881},
	{9005,9823,9827},
	{9007,9824,9826},
	{9821,23109,23110},
	{14916,14917,14918,14919,14920,14921},
	{22568,22827,22828,22829,31018},
	{22842,22895,22896}
}
ClassSpellsByLevel["Druid"] = {
	[1] = {
		{id=5185,name="Healing Touch",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Nature_HealingTouch"},
		{id=1126,name="Mark of the Wild",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Nature_Regeneration"},
		{id=5176,name="Wrath",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Nature_AbolishMagic"}
	},
	[4] = {
		{id=774,name="Rejuvenation",subText="Rank 1",level=4,icon="Interface\\Icons\\Spell_Nature_Rejuvenation"},
		{id=8921,name="Moonfire",subText="Rank 1",level=4,icon="Interface\\Icons\\Spell_Nature_StarFall"}
	},
	[6] = {
		{id=467,name="Thorns",subText="Rank 1",level=6,icon="Interface\\Icons\\Spell_Nature_Thorns"},
		{id=5177,name="Wrath",subText="Rank 2",level=6,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={5176}},
		{id=22570,name="Mangle",subText="Rank 1",level=6,icon="Interface\\Icons\\Ability_Druid_Mangle.tga"}
	},
	[8] = {
		{id=5186,name="Healing Touch",subText="Rank 2",level=8,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={25297}},
		{id=339,name="Entangling Roots",subText="Rank 1",level=8,icon="Interface\\Icons\\Spell_Nature_StrangleVines"}
	},
	[10] = {
		{id=99,name="Demoralizing Roar",subText="Rank 1",level=10,icon="Interface\\Icons\\Ability_Druid_DemoralizingRoar"},
		{id=5487,name="Bear Form",subText="Shapeshift",level=10,icon="Interface\\Icons\\Ability_Racial_BearForm"},
		{id=6807,name="Maul",subText="Rank 1",level=10,icon="Interface\\Icons\\Ability_Druid_Maul"},
		{id=1178,name="Bear Form (Passive)",subText="Passive",level=10,icon="Interface\\Icons\\Ability_Racial_BearForm"},
		{id=6795,name="Growl",subText="",level=10,icon="Interface\\Icons\\Ability_Physical_Taunt"},
		{id=5232,name="Mark of the Wild",subText="Rank 2",level=10,icon="Interface\\Icons\\Spell_Nature_Regeneration",requiredIds={1126}},
		{id=1058,name="Rejuvenation",subText="Rank 2",level=10,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={25299}},
		{id=8924,name="Moonfire",subText="Rank 2",level=10,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={9835}},
		{id=16689,name="Nature's Grasp",subText="Rank 1",level=10,icon="Interface\\Icons\\Spell_Nature_NaturesWrath",requiredTalent={id=761,tabIndex=1}},
		{id=18960,name="Teleport: Moonglade",subText="",level=10,icon="Interface\\Icons\\Spell_Arcane_TeleportMoonglade"}
	},
	[12] = {
		{id=8936,name="Regrowth",subText="Rank 1",level=12,icon="Interface\\Icons\\Spell_Nature_ResistNature"}
	},
	[14] = {
		{id=5211,name="Bash",subText="Rank 1",level=14,icon="Interface\\Icons\\Ability_Druid_Bash"},
		{id=5187,name="Healing Touch",subText="Rank 3",level=14,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={5186}},
		{id=782,name="Thorns",subText="Rank 2",level=14,icon="Interface\\Icons\\Spell_Nature_Thorns",requiredIds={467}},
		{id=5178,name="Wrath",subText="Rank 3",level=14,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={5177}},
		{id=8946,name="Cure Poison",subText="",level=14,icon="Interface\\Icons\\Spell_Nature_NullifyPoison"}
	},
	[16] = {
		{id=779,name="Swipe",subText="Rank 1",level=16,icon="Interface\\Icons\\INV_Misc_MonsterClaw_03"},
		{id=1066,name="Aquatic Form",subText="Shapeshift",level=16,icon="Interface\\Icons\\Ability_Druid_AquaticForm"},
		{id=5421,name="Aquatic Form (Passive)",subText="Passive",level=16,icon="Interface\\Icons\\Ability_Druid_AquaticForm"},
		{id=1430,name="Rejuvenation",subText="Rank 3",level=16,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={1058}},
		{id=8925,name="Moonfire",subText="Rank 3",level=16,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8924}}
	},
	[18] = {
		{id=6808,name="Maul",subText="Rank 2",level=18,icon="Interface\\Icons\\Ability_Druid_Maul",requiredIds={6807}},
		{id=8938,name="Regrowth",subText="Rank 2",level=18,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={8936}},
		{id=770,name="Faerie Fire",subText="Rank 1",level=18,icon="Interface\\Icons\\Spell_Nature_FaerieFire"},
		{id=1062,name="Entangling Roots",subText="Rank 2",level=18,icon="Interface\\Icons\\Spell_Nature_StrangleVines",requiredIds={339}},
		{id=16810,name="Nature's Grasp",subText="Rank 2",level=18,icon="Interface\\Icons\\Spell_Nature_NaturesWrath",requiredIds={16689}},
		{id=2637,name="Hibernate",subText="Rank 1",level=18,icon="Interface\\Icons\\Spell_Nature_Sleep"}
	},
	[20] = {
		{id=768,name="Cat Form",subText="Shapeshift",level=20,icon="Interface\\Icons\\Ability_Druid_CatForm"},
		{id=1082,name="Claw",subText="Rank 1",level=20,icon="Interface\\Icons\\Ability_Druid_Rake"},
		{id=1735,name="Demoralizing Roar",subText="Rank 2",level=20,icon="Interface\\Icons\\Ability_Druid_DemoralizingRoar",requiredIds={99}},
		{id=1079,name="Rip",subText="Rank 1",level=20,icon="Interface\\Icons\\Ability_GhoulFrenzy"},
		{id=5215,name="Prowl",subText="Rank 1",level=20,icon="Interface\\Icons\\Ability_Ambush"},
		{id=5188,name="Healing Touch",subText="Rank 4",level=20,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={5187}},
		{id=6756,name="Mark of the Wild",subText="Rank 3",level=20,icon="Interface\\Icons\\Spell_Nature_Regeneration",requiredIds={5232}},
		{id=2912,name="Starfire",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Arcane_StarFire"},
		{id=20484,name="Rebirth",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Nature_Reincarnation"},
		{id=5570,name="Insect Swarm",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Nature_InsectSwarm"}
	},
	[22] = {
		{id=5221,name="Shred",subText="Rank 1",level=22,icon="Interface\\Icons\\Spell_Shadow_VampiricAura"},
		{id=2090,name="Rejuvenation",subText="Rank 4",level=22,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={1430}},
		{id=5179,name="Wrath",subText="Rank 4",level=22,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={5178}},
		{id=8926,name="Moonfire",subText="Rank 4",level=22,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8925}},
		{id=2908,name="Soothe Animal",subText="Rank 1",level=22,icon="Interface\\Icons\\Ability_Hunter_BeastSoothe"}
	},
	[24] = {
		{id=780,name="Swipe",subText="Rank 2",level=24,icon="Interface\\Icons\\INV_Misc_MonsterClaw_03",requiredIds={779}},
		{id=5217,name="Tiger's Fury",subText="Rank 1",level=24,icon="Interface\\Icons\\Ability_Mount_JungleTiger"},
		{id=1822,name="Rake",subText="Rank 1",level=24,icon="Interface\\Icons\\Ability_Druid_Disembowel"},
		{id=8939,name="Regrowth",subText="Rank 3",level=24,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={8938}},
		{id=1075,name="Thorns",subText="Rank 3",level=24,icon="Interface\\Icons\\Spell_Nature_Thorns",requiredIds={782}},
		{id=2782,name="Remove Curse",subText="",level=24,icon="Interface\\Icons\\Spell_Holy_RemoveCurse"}
	},
	[25] = {
		{id=16857,name="Faerie Fire (Feral)",subText="Rank 1",level=25,icon="Interface\\Icons\\Spell_Nature_FaerieFire"}
	},
	[26] = {
		{id=6809,name="Maul",subText="Rank 3",level=26,icon="Interface\\Icons\\Ability_Druid_Maul",requiredIds={6808}},
		{id=1850,name="Dash",subText="Rank 1",level=26,icon="Interface\\Icons\\Ability_Druid_Dash"},
		{id=5189,name="Healing Touch",subText="Rank 5",level=26,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={5188}},
		{id=8949,name="Starfire",subText="Rank 2",level=26,icon="Interface\\Icons\\Spell_Arcane_StarFire",requiredIds={2912}},
		{id=2893,name="Abolish Poison",subText="",level=26,icon="Interface\\Icons\\Spell_Nature_NullifyPoison_02"}
	},
	[28] = {
		{id=3029,name="Claw",subText="Rank 2",level=28,icon="Interface\\Icons\\Ability_Druid_Rake",requiredIds={1082}},
		{id=5209,name="Challenging Roar",subText="",level=28,icon="Interface\\Icons\\Ability_Druid_ChallangingRoar"},
		{id=8998,name="Cower",subText="Rank 1",level=28,icon="Interface\\Icons\\Ability_Druid_Cower"},
		{id=9492,name="Rip",subText="Rank 2",level=28,icon="Interface\\Icons\\Ability_GhoulFrenzy",requiredIds={1079}},
		{id=2091,name="Rejuvenation",subText="Rank 5",level=28,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={2090}},
		{id=8927,name="Moonfire",subText="Rank 5",level=28,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8926}},
		{id=5195,name="Entangling Roots",subText="Rank 3",level=28,icon="Interface\\Icons\\Spell_Nature_StrangleVines",requiredIds={1062}},
		{id=16811,name="Nature's Grasp",subText="Rank 3",level=28,icon="Interface\\Icons\\Spell_Nature_NaturesWrath",requiredIds={16810}}
	},
	[30] = {
		{id=6800,name="Shred",subText="Rank 2",level=30,icon="Interface\\Icons\\Spell_Shadow_VampiricAura",requiredIds={5221}},
		{id=6798,name="Bash",subText="Rank 2",level=30,icon="Interface\\Icons\\Ability_Druid_Bash",requiredIds={5211}},
		{id=783,name="Travel Form",subText="Shapeshift",level=30,icon="Interface\\Icons\\Ability_Druid_TravelForm"},
		{id=5234,name="Mark of the Wild",subText="Rank 4",level=30,icon="Interface\\Icons\\Spell_Nature_Regeneration",requiredIds={6756}},
		{id=8940,name="Regrowth",subText="Rank 4",level=30,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={8939}},
		{id=740,name="Tranquility",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Nature_Tranquility"},
		{id=778,name="Faerie Fire",subText="Rank 2",level=30,icon="Interface\\Icons\\Spell_Nature_FaerieFire",requiredIds={770}},
		{id=5180,name="Wrath",subText="Rank 5",level=30,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={5179}},
		{id=17390,name="Faerie Fire (Feral)",subText="Rank 2",level=30,icon="Interface\\Icons\\Spell_Nature_FaerieFire",requiredIds={16857}},
		{id=20739,name="Rebirth",subText="Rank 2",level=30,icon="Interface\\Icons\\Spell_Nature_Reincarnation",requiredIds={20484}},
		{id=24974,name="Insect Swarm",subText="Rank 2",level=30,icon="Interface\\Icons\\Spell_Nature_InsectSwarm",requiredIds={5570}}
	},
	[32] = {
		{id=5225,name="Track Humanoids",subText="",level=32,icon="Interface\\Icons\\Ability_Tracking"},
		{id=6785,name="Ravage",subText="Rank 1",level=32,icon="Interface\\Icons\\Ability_Druid_Ravage"},
		{id=9490,name="Demoralizing Roar",subText="Rank 3",level=32,icon="Interface\\Icons\\Ability_Druid_DemoralizingRoar",requiredIds={1735}},
		{id=6778,name="Healing Touch",subText="Rank 6",level=32,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={5189}},
		{id=22568,name="Ferocious Bite",subText="Rank 1",level=32,icon="Interface\\Icons\\Ability_Druid_FerociousBite"}
	},
	[34] = {
		{id=1823,name="Rake",subText="Rank 2",level=34,icon="Interface\\Icons\\Ability_Druid_Disembowel",requiredIds={1822}},
		{id=8972,name="Maul",subText="Rank 4",level=34,icon="Interface\\Icons\\Ability_Druid_Maul",requiredIds={6809}},
		{id=769,name="Swipe",subText="Rank 3",level=34,icon="Interface\\Icons\\INV_Misc_MonsterClaw_03",requiredIds={780}},
		{id=3627,name="Rejuvenation",subText="Rank 6",level=34,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={2091}},
		{id=8914,name="Thorns",subText="Rank 4",level=34,icon="Interface\\Icons\\Spell_Nature_Thorns",requiredIds={1075}},
		{id=8950,name="Starfire",subText="Rank 3",level=34,icon="Interface\\Icons\\Spell_Arcane_StarFire",requiredIds={8949}},
		{id=8928,name="Moonfire",subText="Rank 6",level=34,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8927}}
	},
	[36] = {
		{id=6793,name="Tiger's Fury",subText="Rank 2",level=36,icon="Interface\\Icons\\Ability_Mount_JungleTiger",requiredIds={5217}},
		{id=9005,name="Pounce",subText="Rank 1",level=36,icon="Interface\\Icons\\Ability_Druid_SupriseAttack"},
		{id=9007,name="Pounce Bleed",subText="Rank 1",level=36,icon="Interface\\Icons\\Ability_Druid_SupriseAttack"},
		{id=9493,name="Rip",subText="Rank 3",level=36,icon="Interface\\Icons\\Ability_GhoulFrenzy",requiredIds={9492}},
		{id=8941,name="Regrowth",subText="Rank 5",level=36,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={8940}},
		{id=22842,name="Frenzied Regeneration",subText="Rank 1",level=36,icon="Interface\\Icons\\Ability_BullRush"}
	},
	[38] = {
		{id=5201,name="Claw",subText="Rank 3",level=38,icon="Interface\\Icons\\Ability_Druid_Rake",requiredIds={3029}},
		{id=8992,name="Shred",subText="Rank 3",level=38,icon="Interface\\Icons\\Spell_Shadow_VampiricAura",requiredIds={6800}},
		{id=8903,name="Healing Touch",subText="Rank 7",level=38,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={6778}},
		{id=6780,name="Wrath",subText="Rank 6",level=38,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={5180}},
		{id=5196,name="Entangling Roots",subText="Rank 4",level=38,icon="Interface\\Icons\\Spell_Nature_StrangleVines",requiredIds={5195}},
		{id=8955,name="Soothe Animal",subText="Rank 2",level=38,icon="Interface\\Icons\\Ability_Hunter_BeastSoothe",requiredIds={2908}},
		{id=16812,name="Nature's Grasp",subText="Rank 4",level=38,icon="Interface\\Icons\\Spell_Nature_NaturesWrath",requiredIds={16811}},
		{id=18657,name="Hibernate",subText="Rank 2",level=38,icon="Interface\\Icons\\Spell_Nature_Sleep",requiredIds={2637}}
	},
	[40] = {
		{id=9000,name="Cower",subText="Rank 2",level=40,icon="Interface\\Icons\\Ability_Druid_Cower",requiredIds={8998}},
		{id=9634,name="Dire Bear Form",subText="Shapeshift",level=40,icon="Interface\\Icons\\Ability_Racial_BearForm"},
		{id=9635,name="Dire Bear Form (Passive)",subText="Passive",level=40,icon="Interface\\Icons\\Ability_Racial_BearForm"},
		{id=6783,name="Prowl",subText="Rank 2",level=40,icon="Interface\\Icons\\Ability_Ambush",requiredIds={5215}},
		{id=8907,name="Mark of the Wild",subText="Rank 5",level=40,icon="Interface\\Icons\\Spell_Nature_Regeneration",requiredIds={5234}},
		{id=8910,name="Rejuvenation",subText="Rank 7",level=40,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={3627}},
		{id=8918,name="Tranquility",subText="Rank 2",level=40,icon="Interface\\Icons\\Spell_Nature_Tranquility",requiredIds={740}},
		{id=8929,name="Moonfire",subText="Rank 7",level=40,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8928}},
		{id=16914,name="Hurricane",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Nature_Cyclone"},
		{id=20719,name="Feline Grace",subText="Passive",level=40,icon="Interface\\Icons\\INV_Feather_01"},
		{id=20742,name="Rebirth",subText="Rank 3",level=40,icon="Interface\\Icons\\Spell_Nature_Reincarnation",requiredIds={20739}},
		{id=22827,name="Ferocious Bite",subText="Rank 2",level=40,icon="Interface\\Icons\\Ability_Druid_FerociousBite",requiredIds={22568}},
		{id=24858,name="Moonkin Form",subText="Shapeshift",level=40,icon="Interface\\Icons\\Spell_Nature_ForceOfNature",requiredTalent={id=793,tabIndex=1}},
		{id=24905,name="Moonkin Form (Passive)",subText="Passive",level=40,icon="Interface\\Icons\\Spell_Nature_ForceOfNature"},
		{id=24907,name="Moonkin Aura",subText="",level=40,icon="Interface\\Icons\\Spell_Nature_MoonGlow"},
		{id=24975,name="Insect Swarm",subText="Rank 3",level=40,icon="Interface\\Icons\\Spell_Nature_InsectSwarm",requiredIds={24974}},
		{id=45705,name="Tree of Life Form",subText="Shapeshift",level=40,icon="Interface\\Icons\\Ability_Druid_TreeofLife",requiredTalent={id=844,tabIndex=3}}
	},
	[42] = {
		{id=6787,name="Ravage",subText="Rank 2",level=42,icon="Interface\\Icons\\Ability_Druid_Ravage",requiredIds={6785}},
		{id=9745,name="Maul",subText="Rank 5",level=42,icon="Interface\\Icons\\Ability_Druid_Maul",requiredIds={8972}},
		{id=9747,name="Demoralizing Roar",subText="Rank 4",level=42,icon="Interface\\Icons\\Ability_Druid_DemoralizingRoar",requiredIds={9490}},
		{id=9750,name="Regrowth",subText="Rank 6",level=42,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={8941}},
		{id=9749,name="Faerie Fire",subText="Rank 3",level=42,icon="Interface\\Icons\\Spell_Nature_FaerieFire",requiredIds={778}},
		{id=8951,name="Starfire",subText="Rank 4",level=42,icon="Interface\\Icons\\Spell_Arcane_StarFire",requiredIds={8950}},
		{id=17391,name="Faerie Fire (Feral)",subText="Rank 3",level=42,icon="Interface\\Icons\\Spell_Nature_FaerieFire",requiredIds={17390}}
	},
	[44] = {
		{id=1824,name="Rake",subText="Rank 3",level=44,icon="Interface\\Icons\\Ability_Druid_Disembowel",requiredIds={1823}},
		{id=9752,name="Rip",subText="Rank 4",level=44,icon="Interface\\Icons\\Ability_GhoulFrenzy",requiredIds={9493}},
		{id=9754,name="Swipe",subText="Rank 4",level=44,icon="Interface\\Icons\\INV_Misc_MonsterClaw_03",requiredIds={769}},
		{id=9758,name="Healing Touch",subText="Rank 8",level=44,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={8903}},
		{id=9756,name="Thorns",subText="Rank 5",level=44,icon="Interface\\Icons\\Spell_Nature_Thorns",requiredIds={8914}},
		{id=22812,name="Barkskin",subText="",level=44,icon="Interface\\Icons\\Spell_Nature_StoneClawTotem"}
	},
	[46] = {
		{id=8983,name="Bash",subText="Rank 3",level=46,icon="Interface\\Icons\\Ability_Druid_Bash",requiredIds={6798}},
		{id=9821,name="Dash",subText="Rank 2",level=46,icon="Interface\\Icons\\Ability_Druid_Dash",requiredIds={1850}},
		{id=9823,name="Pounce",subText="Rank 2",level=46,icon="Interface\\Icons\\Ability_Druid_SupriseAttack",requiredIds={9005}},
		{id=9824,name="Pounce Bleed",subText="Rank 2",level=46,icon="Interface\\Icons\\Ability_Druid_SupriseAttack",requiredIds={9007}},
		{id=9829,name="Shred",subText="Rank 4",level=46,icon="Interface\\Icons\\Spell_Shadow_VampiricAura",requiredIds={8992}},
		{id=9839,name="Rejuvenation",subText="Rank 8",level=46,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={8910}},
		{id=8905,name="Wrath",subText="Rank 7",level=46,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={6780}},
		{id=9833,name="Moonfire",subText="Rank 8",level=46,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8929}},
		{id=22895,name="Frenzied Regeneration",subText="Rank 2",level=46,icon="Interface\\Icons\\Ability_BullRush",requiredIds={22842}}
	},
	[48] = {
		{id=9845,name="Tiger's Fury",subText="Rank 3",level=48,icon="Interface\\Icons\\Ability_Mount_JungleTiger",requiredIds={6793}},
		{id=9849,name="Claw",subText="Rank 4",level=48,icon="Interface\\Icons\\Ability_Druid_Rake",requiredIds={5201}},
		{id=9856,name="Regrowth",subText="Rank 7",level=48,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={9750}},
		{id=9852,name="Entangling Roots",subText="Rank 5",level=48,icon="Interface\\Icons\\Spell_Nature_StrangleVines",requiredIds={5196}},
		{id=16813,name="Nature's Grasp",subText="Rank 5",level=48,icon="Interface\\Icons\\Spell_Nature_NaturesWrath",requiredIds={16812}},
		{id=22828,name="Ferocious Bite",subText="Rank 3",level=48,icon="Interface\\Icons\\Ability_Druid_FerociousBite",requiredIds={22827}}
	},
	[50] = {
		{id=9866,name="Ravage",subText="Rank 3",level=50,icon="Interface\\Icons\\Ability_Druid_Ravage",requiredIds={6787}},
		{id=9880,name="Maul",subText="Rank 6",level=50,icon="Interface\\Icons\\Ability_Druid_Maul",requiredIds={9745}},
		{id=9888,name="Healing Touch",subText="Rank 9",level=50,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={9758}},
		{id=9884,name="Mark of the Wild",subText="Rank 6",level=50,icon="Interface\\Icons\\Spell_Nature_Regeneration",requiredIds={8907}},
		{id=9862,name="Tranquility",subText="Rank 3",level=50,icon="Interface\\Icons\\Spell_Nature_Tranquility",requiredIds={8918}},
		{id=9875,name="Starfire",subText="Rank 5",level=50,icon="Interface\\Icons\\Spell_Arcane_StarFire",requiredIds={8951}},
		{id=17401,name="Hurricane",subText="Rank 2",level=50,icon="Interface\\Icons\\Spell_Nature_Cyclone",requiredIds={16914}},
		{id=20747,name="Rebirth",subText="Rank 4",level=50,icon="Interface\\Icons\\Spell_Nature_Reincarnation",requiredIds={20742}},
		{id=21849,name="Gift of the Wild",subText="Rank 1",level=50,icon="Interface\\Icons\\Spell_Nature_Regeneration"},
		{id=24976,name="Insect Swarm",subText="Rank 4",level=50,icon="Interface\\Icons\\Spell_Nature_InsectSwarm",requiredIds={24975}}
	},
	[52] = {
		{id=9892,name="Cower",subText="Rank 3",level=52,icon="Interface\\Icons\\Ability_Druid_Cower",requiredIds={9000}},
		{id=9894,name="Rip",subText="Rank 5",level=52,icon="Interface\\Icons\\Ability_GhoulFrenzy",requiredIds={9752}},
		{id=9898,name="Demoralizing Roar",subText="Rank 5",level=52,icon="Interface\\Icons\\Ability_Druid_DemoralizingRoar",requiredIds={9747}},
		{id=9840,name="Rejuvenation",subText="Rank 9",level=52,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={9839}},
		{id=9834,name="Moonfire",subText="Rank 9",level=52,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={9833}}
	},
	[54] = {
		{id=9830,name="Shred",subText="Rank 5",level=54,icon="Interface\\Icons\\Spell_Shadow_VampiricAura",requiredIds={9829}},
		{id=9904,name="Rake",subText="Rank 4",level=54,icon="Interface\\Icons\\Ability_Druid_Disembowel",requiredIds={1824}},
		{id=9908,name="Swipe",subText="Rank 5",level=54,icon="Interface\\Icons\\INV_Misc_MonsterClaw_03",requiredIds={9754}},
		{id=9857,name="Regrowth",subText="Rank 8",level=54,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={9856}},
		{id=9910,name="Thorns",subText="Rank 6",level=54,icon="Interface\\Icons\\Spell_Nature_Thorns",requiredIds={9756}},
		{id=9907,name="Faerie Fire",subText="Rank 4",level=54,icon="Interface\\Icons\\Spell_Nature_FaerieFire",requiredIds={9749}},
		{id=9912,name="Wrath",subText="Rank 8",level=54,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={8905}},
		{id=9901,name="Soothe Animal",subText="Rank 3",level=54,icon="Interface\\Icons\\Ability_Hunter_BeastSoothe",requiredIds={8955}},
		{id=17392,name="Faerie Fire (Feral)",subText="Rank 4",level=54,icon="Interface\\Icons\\Spell_Nature_FaerieFire",requiredIds={17391}},
		{id=45969,name="Shred",subText="Rank 6",level=54,icon="Interface\\Icons\\Spell_Shadow_VampiricAura",requiredIds={9830}}
	},
	[56] = {
		{id=9827,name="Pounce",subText="Rank 3",level=56,icon="Interface\\Icons\\Ability_Druid_SupriseAttack",requiredIds={9823}},
		{id=9826,name="Pounce Bleed",subText="Rank 3",level=56,icon="Interface\\Icons\\Ability_Druid_SupriseAttack",requiredIds={9824}},
		{id=9889,name="Healing Touch",subText="Rank 10",level=56,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={5185}},
		{id=22829,name="Ferocious Bite",subText="Rank 4",level=56,icon="Interface\\Icons\\Ability_Druid_FerociousBite",requiredIds={22828}},
		{id=22896,name="Frenzied Regeneration",subText="Rank 3",level=56,icon="Interface\\Icons\\Ability_BullRush",requiredIds={22895}}
	},
	[58] = {
		{id=9850,name="Claw",subText="Rank 5",level=58,icon="Interface\\Icons\\Ability_Druid_Rake",requiredIds={9849}},
		{id=9867,name="Ravage",subText="Rank 4",level=58,icon="Interface\\Icons\\Ability_Druid_Ravage",requiredIds={9866}},
		{id=9881,name="Maul",subText="Rank 7",level=58,icon="Interface\\Icons\\Ability_Druid_Maul",requiredIds={9880}},
		{id=9841,name="Rejuvenation",subText="Rank 10",level=58,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={774}},
		{id=9876,name="Starfire",subText="Rank 6",level=58,icon="Interface\\Icons\\Spell_Arcane_StarFire",requiredIds={9875}},
		{id=9835,name="Moonfire",subText="Rank 10",level=58,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8921}},
		{id=9853,name="Entangling Roots",subText="Rank 6",level=58,icon="Interface\\Icons\\Spell_Nature_StrangleVines",requiredIds={9852}},
		{id=17329,name="Nature's Grasp",subText="Rank 6",level=58,icon="Interface\\Icons\\Spell_Nature_NaturesWrath",requiredIds={16813}},
		{id=18658,name="Hibernate",subText="Rank 3",level=58,icon="Interface\\Icons\\Spell_Nature_Sleep",requiredIds={18657}},
		{id=45736,name="Savage Bite",subText="Rank 1",level=58,icon="Interface\\Icons\\Ability_Racial_Cannibalize"}
	},
	[60] = {
		{id=9846,name="Tiger's Fury",subText="Rank 4",level=60,icon="Interface\\Icons\\Ability_Mount_JungleTiger",requiredIds={9845}},
		{id=9896,name="Rip",subText="Rank 6",level=60,icon="Interface\\Icons\\Ability_GhoulFrenzy",requiredIds={9894}},
		{id=9913,name="Prowl",subText="Rank 3",level=60,icon="Interface\\Icons\\Ability_Ambush",requiredIds={6783}},
		{id=9885,name="Mark of the Wild",subText="Rank 7",level=60,icon="Interface\\Icons\\Spell_Nature_Regeneration",requiredIds={9884}},
		{id=9858,name="Regrowth",subText="Rank 9",level=60,icon="Interface\\Icons\\Spell_Nature_ResistNature",requiredIds={9857}},
		{id=9863,name="Tranquility",subText="Rank 4",level=60,icon="Interface\\Icons\\Spell_Nature_Tranquility",requiredIds={9862}},
		{id=17402,name="Hurricane",subText="Rank 3",level=60,icon="Interface\\Icons\\Spell_Nature_Cyclone",requiredIds={17401}},
		{id=20748,name="Rebirth",subText="Rank 5",level=60,icon="Interface\\Icons\\Spell_Nature_Reincarnation",requiredIds={20747}},
		{id=21850,name="Gift of the Wild",subText="Rank 2",level=60,icon="Interface\\Icons\\Spell_Nature_Regeneration",requiredIds={21849}},
		{id=24977,name="Insect Swarm",subText="Rank 5",level=60,icon="Interface\\Icons\\Spell_Nature_InsectSwarm",requiredIds={24976}},
		{id=25298,name="Starfire",subText="Rank 7",level=60,icon="Interface\\Icons\\Spell_Arcane_StarFire",requiredIds={9876}},
		{id=25299,name="Rejuvenation",subText="Rank 11",level=60,icon="Interface\\Icons\\Spell_Nature_Rejuvenation",requiredIds={9841}},
		{id=25297,name="Healing Touch",subText="Rank 11",level=60,icon="Interface\\Icons\\Spell_Nature_HealingTouch",requiredIds={9889}},
		{id=31018,name="Ferocious Bite",subText="Rank 5",level=60,icon="Interface\\Icons\\Ability_Druid_FerociousBite",requiredIds={22829}},
		{id=45967,name="Wrath",subText="Rank 9",level=60,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={9912}}
	}
}