setfenv(1, WhatsTraining)
ClassSpellsByLevel["Warlock"] = {
	[1] = {
		{id=687,name="Demon Skin",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Shadow_RagingScream"},
		{id=688,name="Summon Imp",subText="Summon",level=1,icon="Interface\\Icons\\Spell_Shadow_SummonImp"},
		{id=686,name="Shadow Bolt",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt"},
		{id=348,name="Immolate",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Fire_Immolation"}
	},
	[4] = {
		{id=702,name="Curse of Weakness",subText="Rank 1",level=4,icon="Interface\\Icons\\Spell_Shadow_CurseOfMannoroth"},
		{id=172,name="Corruption",subText="Rank 1",level=4,icon="Interface\\Icons\\Spell_Shadow_AbominationExplosion"}
	},
	[6] = {
		{id=695,name="Shadow Bolt",subText="Rank 2",level=6,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={25307}},
		{id=1454,name="Life Tap",subText="Rank 1",level=6,icon="Interface\\Icons\\Spell_Shadow_BurningSpirit"}
	},
	[8] = {
		{id=980,name="Curse of Agony",subText="Rank 1",level=8,icon="Interface\\Icons\\Spell_Shadow_CurseOfSargeras"},
		{id=5782,name="Fear",subText="Rank 1",level=8,icon="Interface\\Icons\\Spell_Shadow_Possession"}
	},
	[10] = {
		{id=696,name="Demon Skin",subText="Rank 2",level=10,icon="Interface\\Icons\\Spell_Shadow_RagingScream",requiredIds={687}},
		{id=697,name="Summon Voidwalker",subText="Summon",level=10,icon="Interface\\Icons\\Spell_Shadow_SummonVoidWalker"},
		{id=6201,name="Create Healthstone (Minor)",subText="",level=10,icon="Interface\\Icons\\INV_Stone_04"},
		{id=707,name="Immolate",subText="Rank 2",level=10,icon="Interface\\Icons\\Spell_Fire_Immolation",requiredIds={348}},
		{id=1120,name="Drain Soul",subText="Rank 1",level=10,icon="Interface\\Icons\\Spell_Shadow_Haunting"}
	},
	[12] = {
		{id=1108,name="Curse of Weakness",subText="Rank 2",level=12,icon="Interface\\Icons\\Spell_Shadow_CurseOfMannoroth",requiredIds={702}},
		{id=755,name="Health Funnel",subText="Rank 1",level=12,icon="Interface\\Icons\\Spell_Shadow_LifeDrain"},
		{id=705,name="Shadow Bolt",subText="Rank 3",level=12,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={695}}
	},
	[14] = {
		{id=704,name="Curse of Recklessness",subText="Rank 1",level=14,icon="Interface\\Icons\\Spell_Shadow_UnholyStrength"},
		{id=6222,name="Corruption",subText="Rank 2",level=14,icon="Interface\\Icons\\Spell_Shadow_AbominationExplosion",requiredIds={172}},
		{id=689,name="Drain Life",subText="Rank 1",level=14,icon="Interface\\Icons\\Spell_Shadow_LifeDrain02"}
	},
	[16] = {
		{id=5697,name="Unending Breath",subText="",level=16,icon="Interface\\Icons\\Spell_Shadow_DemonBreath"},
		{id=1455,name="Life Tap",subText="Rank 2",level=16,icon="Interface\\Icons\\Spell_Shadow_BurningSpirit",requiredIds={1454}}
	},
	[18] = {
		{id=693,name="Create Soulstone (Minor)",subText="",level=18,icon="Interface\\Icons\\Spell_Shadow_SoulGem"},
		{id=5676,name="Searing Pain",subText="Rank 1",level=18,icon="Interface\\Icons\\Spell_Fire_SoulBurn"}
	},
	[20] = {
		{id=706,name="Demon Armor",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Shadow_RagingScream"},
		{id=712,name="Summon Succubus",subText="Summon",level=20,icon="Interface\\Icons\\Spell_Shadow_SummonSuccubus"},
		{id=3698,name="Health Funnel",subText="Rank 2",level=20,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredIds={755}},
		{id=1088,name="Shadow Bolt",subText="Rank 4",level=20,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={705}},
		{id=1094,name="Immolate",subText="Rank 3",level=20,icon="Interface\\Icons\\Spell_Fire_Immolation",requiredIds={707}},
		{id=5740,name="Rain of Fire",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Shadow_RainOfFire"},
		{id=698,name="Ritual of Summoning",subText="",level=20,icon="Interface\\Icons\\Spell_Shadow_Twilight"},
		{id=17877,name="Shadowburn",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Shadow_ScourgeBuild",requiredTalent={id=963,tabIndex=3}},
		{id=48017,name="Summon Incubus",subText="Summon",level=20,icon="Interface\\Icons\\ability_warlock_incubus"}
	},
	[22] = {
		{id=6205,name="Curse of Weakness",subText="Rank 3",level=22,icon="Interface\\Icons\\Spell_Shadow_CurseOfMannoroth",requiredIds={1108}},
		{id=6202,name="Create Healthstone (Lesser)",subText="",level=22,icon="Interface\\Icons\\INV_Stone_04"},
		{id=126,name="Eye of Kilrogg",subText="Summon",level=22,icon="Interface\\Icons\\Spell_Shadow_EvilEye"},
		{id=699,name="Drain Life",subText="Rank 2",level=22,icon="Interface\\Icons\\Spell_Shadow_LifeDrain02",requiredIds={689}}
	},
	[24] = {
		{id=5500,name="Sense Demons",subText="",level=24,icon="Interface\\Icons\\Spell_Shadow_Metamorphosis"},
		{id=6223,name="Corruption",subText="Rank 3",level=24,icon="Interface\\Icons\\Spell_Shadow_AbominationExplosion",requiredIds={6222}},
		{id=5138,name="Drain Mana",subText="Rank 1",level=24,icon="Interface\\Icons\\Spell_Shadow_SiphonMana"},
		{id=8288,name="Drain Soul",subText="Rank 2",level=24,icon="Interface\\Icons\\Spell_Shadow_Haunting",requiredIds={1120}},
		{id=18867,name="Shadowburn",subText="Rank 2",level=24,icon="Interface\\Icons\\Spell_Shadow_ScourgeBuild",requiredIds={17877}}
	},
	[26] = {
		{id=1714,name="Curse of Tongues",subText="Rank 1",level=26,icon="Interface\\Icons\\Spell_Shadow_CurseOfTounges"},
		{id=1456,name="Life Tap",subText="Rank 3",level=26,icon="Interface\\Icons\\Spell_Shadow_BurningSpirit",requiredIds={1455}},
		{id=132,name="Detect Lesser Invisibility",subText="",level=26,icon="Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility"},
		{id=17919,name="Searing Pain",subText="Rank 2",level=26,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={5676}}
	},
	[28] = {
		{id=6217,name="Curse of Agony",subText="Rank 3",level=28,icon="Interface\\Icons\\Spell_Shadow_CurseOfSargeras",requiredIds={980}},
		{id=7658,name="Curse of Recklessness",subText="Rank 2",level=28,icon="Interface\\Icons\\Spell_Shadow_UnholyStrength",requiredIds={704}},
		{id=3699,name="Health Funnel",subText="Rank 3",level=28,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredIds={3698}},
		{id=1106,name="Shadow Bolt",subText="Rank 5",level=28,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={1088}},
		{id=6366,name="Create Firestone (Lesser)",subText="",level=28,icon="Interface\\Icons\\INV_Ammo_FireTar"},
		{id=710,name="Banish",subText="Rank 1",level=28,icon="Interface\\Icons\\Spell_Shadow_Cripple"}
	},
	[30] = {
		{id=1098,name="Enslave Demon",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Shadow_EnslaveDemon"},
		{id=1086,name="Demon Armor",subText="Rank 2",level=30,icon="Interface\\Icons\\Spell_Shadow_RagingScream",requiredIds={706}},
		{id=2941,name="Immolate",subText="Rank 4",level=30,icon="Interface\\Icons\\Spell_Fire_Immolation",requiredIds={1094}},
		{id=1949,name="Hellfire",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Fire_Incinerate"},
		{id=5857,name="Hellfire Effect",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Fire_Incinerate"},
		{id=709,name="Drain Life",subText="Rank 3",level=30,icon="Interface\\Icons\\Spell_Shadow_LifeDrain02",requiredIds={699}},
		{id=18265,name="Siphon Life",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Shadow_Requiem",requiredTalent={id=1041,tabIndex=1}},
		{id=691,name="Summon Felhunter",subText="Summon",level=30,icon="Interface\\Icons\\Spell_Shadow_SummonFelHunter"},
		{id=20752,name="Create Soulstone (Lesser)",subText="",level=30,icon="Interface\\Icons\\Spell_Shadow_SoulGem"}
	},
	[32] = {
		{id=1490,name="Curse of the Elements",subText="Rank 1",level=32,icon="Interface\\Icons\\Spell_Shadow_ChillTouch"},
		{id=7646,name="Curse of Weakness",subText="Rank 4",level=32,icon="Interface\\Icons\\Spell_Shadow_CurseOfMannoroth",requiredIds={6205}},
		{id=6213,name="Fear",subText="Rank 2",level=32,icon="Interface\\Icons\\Spell_Shadow_Possession",requiredIds={5782}},
		{id=6229,name="Shadow Ward",subText="Rank 1",level=32,icon="Interface\\Icons\\Spell_Shadow_AntiShadow"},
		{id=18868,name="Shadowburn",subText="Rank 3",level=32,icon="Interface\\Icons\\Spell_Shadow_ScourgeBuild",requiredIds={18867}}
	},
	[34] = {
		{id=5699,name="Create Healthstone",subText="",level=34,icon="Interface\\Icons\\INV_Stone_04"},
		{id=6219,name="Rain of Fire",subText="Rank 2",level=34,icon="Interface\\Icons\\Spell_Shadow_RainOfFire",requiredIds={5740}},
		{id=17920,name="Searing Pain",subText="Rank 3",level=34,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={17919}},
		{id=7648,name="Corruption",subText="Rank 4",level=34,icon="Interface\\Icons\\Spell_Shadow_AbominationExplosion",requiredIds={6223}},
		{id=6226,name="Drain Mana",subText="Rank 2",level=34,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={5138}}
	},
	[36] = {
		{id=3700,name="Health Funnel",subText="Rank 4",level=36,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredIds={3699}},
		{id=7641,name="Shadow Bolt",subText="Rank 6",level=36,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={1106}},
		{id=11687,name="Life Tap",subText="Rank 4",level=36,icon="Interface\\Icons\\Spell_Shadow_BurningSpirit",requiredIds={1456}},
		{id=2362,name="Create Spellstone",subText="",level=36,icon="Interface\\Icons\\INV_Misc_Gem_Sapphire_01"},
		{id=17951,name="Create Firestone",subText="",level=36,icon="Interface\\Icons\\INV_Ammo_FireTar"}
	},
	[38] = {
		{id=11711,name="Curse of Agony",subText="Rank 4",level=38,icon="Interface\\Icons\\Spell_Shadow_CurseOfSargeras",requiredIds={6217}},
		{id=2970,name="Detect Invisibility",subText="",level=38,icon="Interface\\Icons\\Spell_Shadow_DetectInvisibility"},
		{id=1010,name="Curse of Idiocy",subText="Rank 1",level=38,icon="Interface\\Icons\\Spell_Shadow_MindRot"},
		{id=7651,name="Drain Life",subText="Rank 4",level=38,icon="Interface\\Icons\\Spell_Shadow_LifeDrain02",requiredIds={709}},
		{id=8289,name="Drain Soul",subText="Rank 3",level=38,icon="Interface\\Icons\\Spell_Shadow_Haunting",requiredIds={8288}},
		{id=18879,name="Siphon Life",subText="Rank 2",level=38,icon="Interface\\Icons\\Spell_Shadow_Requiem",requiredIds={18265}}
	},
	[40] = {
		{id=11733,name="Demon Armor",subText="Rank 3",level=40,icon="Interface\\Icons\\Spell_Shadow_RagingScream",requiredIds={1086}},
		{id=5784,name="Summon Felsteed",subText="Summon",level=40,icon="Interface\\Icons\\Spell_Nature_Swiftness"},
		{id=11665,name="Immolate",subText="Rank 5",level=40,icon="Interface\\Icons\\Spell_Fire_Immolation",requiredIds={2941}},
		{id=5484,name="Howl of Terror",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Shadow_DeathScream"},
		{id=17962,name="Conflagrate",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredTalent={id=968,tabIndex=3}},
		{id=18220,name="Dark Pact",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Shadow_DarkRitual",requiredTalent={id=1022,tabIndex=1}},
		{id=18869,name="Shadowburn",subText="Rank 4",level=40,icon="Interface\\Icons\\Spell_Shadow_ScourgeBuild",requiredIds={18868}},
		{id=20755,name="Create Soulstone",subText="",level=40,icon="Interface\\Icons\\Spell_Shadow_SoulGem"},
		{id=1941,name="Mana Funnel",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Shadow_UnsummonBuilding"},
		{id=45910,name="Mana Funnel",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Shadow_UnsummonBuilding",requiredIds={1941}}
	},
	[42] = {
		{id=7659,name="Curse of Recklessness",subText="Rank 3",level=42,icon="Interface\\Icons\\Spell_Shadow_UnholyStrength",requiredIds={7658}},
		{id=11707,name="Curse of Weakness",subText="Rank 5",level=42,icon="Interface\\Icons\\Spell_Shadow_CurseOfMannoroth",requiredIds={7646}},
		{id=11683,name="Hellfire",subText="Rank 2",level=42,icon="Interface\\Icons\\Spell_Fire_Incinerate",requiredIds={1949}},
		{id=11681,name="Hellfire Effect",subText="Rank 2",level=42,icon="Interface\\Icons\\Spell_Fire_Incinerate",requiredIds={5857}},
		{id=11739,name="Shadow Ward",subText="Rank 2",level=42,icon="Interface\\Icons\\Spell_Shadow_AntiShadow",requiredIds={6229}},
		{id=6789,name="Death Coil",subText="Rank 1",level=42,icon="Interface\\Icons\\Spell_Shadow_DeathCoil"},
		{id=17921,name="Searing Pain",subText="Rank 4",level=42,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={17920}}
	},
	[44] = {
		{id=11725,name="Enslave Demon",subText="Rank 2",level=44,icon="Interface\\Icons\\Spell_Shadow_EnslaveDemon",requiredIds={1098}},
		{id=11693,name="Health Funnel",subText="Rank 5",level=44,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredIds={3700}},
		{id=11659,name="Shadow Bolt",subText="Rank 7",level=44,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={7641}},
		{id=17862,name="Curse of Shadow",subText="Rank 1",level=44,icon="Interface\\Icons\\Spell_Shadow_CurseOfAchimonde"},
		{id=11671,name="Corruption",subText="Rank 5",level=44,icon="Interface\\Icons\\Spell_Shadow_AbominationExplosion",requiredIds={7648}},
		{id=11703,name="Drain Mana",subText="Rank 3",level=44,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={6226}}
	},
	[46] = {
		{id=11721,name="Curse of the Elements",subText="Rank 2",level=46,icon="Interface\\Icons\\Spell_Shadow_ChillTouch",requiredIds={1490}},
		{id=11729,name="Create Healthstone (Greater)",subText="",level=46,icon="Interface\\Icons\\INV_Stone_04"},
		{id=11677,name="Rain of Fire",subText="Rank 3",level=46,icon="Interface\\Icons\\Spell_Shadow_RainOfFire",requiredIds={6219}},
		{id=11688,name="Life Tap",subText="Rank 5",level=46,icon="Interface\\Icons\\Spell_Shadow_BurningSpirit",requiredIds={11687}},
		{id=17952,name="Create Firestone (Greater)",subText="",level=46,icon="Interface\\Icons\\INV_Ammo_FireTar"},
		{id=11699,name="Drain Life",subText="Rank 5",level=46,icon="Interface\\Icons\\Spell_Shadow_LifeDrain02",requiredIds={7651}}
	},
	[48] = {
		{id=11712,name="Curse of Agony",subText="Rank 5",level=48,icon="Interface\\Icons\\Spell_Shadow_CurseOfSargeras",requiredIds={11711}},
		{id=17727,name="Create Spellstone (Greater)",subText="",level=48,icon="Interface\\Icons\\INV_Misc_Gem_Sapphire_01"},
		{id=6353,name="Soul Fire",subText="Rank 1",level=48,icon="Interface\\Icons\\Spell_Fire_Fireball02"},
		{id=18647,name="Banish",subText="Rank 2",level=48,icon="Interface\\Icons\\Spell_Shadow_Cripple",requiredIds={710}},
		{id=18870,name="Shadowburn",subText="Rank 5",level=48,icon="Interface\\Icons\\Spell_Shadow_ScourgeBuild",requiredIds={18869}},
		{id=18880,name="Siphon Life",subText="Rank 3",level=48,icon="Interface\\Icons\\Spell_Shadow_Requiem",requiredIds={18879}},
		{id=18930,name="Conflagrate",subText="Rank 2",level=48,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={17962}}
	},
	[50] = {
		{id=11719,name="Curse of Tongues",subText="Rank 2",level=50,icon="Interface\\Icons\\Spell_Shadow_CurseOfTounges",requiredIds={1714}},
		{id=11734,name="Demon Armor",subText="Rank 4",level=50,icon="Interface\\Icons\\Spell_Shadow_RagingScream",requiredIds={11733}},
		{id=11667,name="Immolate",subText="Rank 6",level=50,icon="Interface\\Icons\\Spell_Fire_Immolation",requiredIds={11665}},
		{id=11743,name="Detect Greater Invisibility",subText="",level=50,icon="Interface\\Icons\\Spell_Shadow_DetectInvisibility"},
		{id=17922,name="Searing Pain",subText="Rank 5",level=50,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={17921}},
		{id=17925,name="Death Coil",subText="Rank 2",level=50,icon="Interface\\Icons\\Spell_Shadow_DeathCoil",requiredIds={6789}},
		{id=1122,name="Inferno",subText="Summon",level=50,icon="Interface\\Icons\\Spell_Shadow_SummonInfernal"},
		{id=18937,name="Dark Pact",subText="Rank 2",level=50,icon="Interface\\Icons\\Spell_Shadow_DarkRitual",requiredIds={18220}},
		{id=20756,name="Create Soulstone (Greater)",subText="",level=50,icon="Interface\\Icons\\Spell_Shadow_SoulGem"},
		{id=45911,name="Mana Funnel",subText="Rank 2",level=50,icon="Interface\\Icons\\Spell_Shadow_UnsummonBuilding",requiredIds={45910}}
	},
	[52] = {
		{id=11708,name="Curse of Weakness",subText="Rank 6",level=52,icon="Interface\\Icons\\Spell_Shadow_CurseOfMannoroth",requiredIds={11707}},
		{id=11694,name="Health Funnel",subText="Rank 6",level=52,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredIds={11693}},
		{id=11660,name="Shadow Bolt",subText="Rank 8",level=52,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={11659}},
		{id=11740,name="Shadow Ward",subText="Rank 3",level=52,icon="Interface\\Icons\\Spell_Shadow_AntiShadow",requiredIds={11739}},
		{id=11675,name="Drain Soul",subText="Rank 4",level=52,icon="Interface\\Icons\\Spell_Shadow_Haunting",requiredIds={8289}}
	},
	[54] = {
		{id=11684,name="Hellfire",subText="Rank 3",level=54,icon="Interface\\Icons\\Spell_Fire_Incinerate",requiredIds={11683}},
		{id=11682,name="Hellfire Effect",subText="Rank 3",level=54,icon="Interface\\Icons\\Spell_Fire_Incinerate",requiredIds={11681}},
		{id=17928,name="Howl of Terror",subText="Rank 2",level=54,icon="Interface\\Icons\\Spell_Shadow_DeathScream",requiredIds={5484}},
		{id=11672,name="Corruption",subText="Rank 6",level=54,icon="Interface\\Icons\\Spell_Shadow_AbominationExplosion",requiredIds={11671}},
		{id=11700,name="Drain Life",subText="Rank 6",level=54,icon="Interface\\Icons\\Spell_Shadow_LifeDrain02",requiredIds={11699}},
		{id=11704,name="Drain Mana",subText="Rank 4",level=54,icon="Interface\\Icons\\Spell_Shadow_SiphonMana",requiredIds={11703}},
		{id=18931,name="Conflagrate",subText="Rank 3",level=54,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={18930}}
	},
	[56] = {
		{id=11717,name="Curse of Recklessness",subText="Rank 4",level=56,icon="Interface\\Icons\\Spell_Shadow_UnholyStrength",requiredIds={7659}},
		{id=6215,name="Fear",subText="Rank 3",level=56,icon="Interface\\Icons\\Spell_Shadow_Possession",requiredIds={6213}},
		{id=11689,name="Life Tap",subText="Rank 6",level=56,icon="Interface\\Icons\\Spell_Shadow_BurningSpirit",requiredIds={11688}},
		{id=17924,name="Soul Fire",subText="Rank 2",level=56,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={6353}},
		{id=17937,name="Curse of Shadow",subText="Rank 2",level=56,icon="Interface\\Icons\\Spell_Shadow_CurseOfAchimonde",requiredIds={17862}},
		{id=17953,name="Create Firestone (Major)",subText="",level=56,icon="Interface\\Icons\\INV_Ammo_FireTar"},
		{id=18871,name="Shadowburn",subText="Rank 6",level=56,icon="Interface\\Icons\\Spell_Shadow_ScourgeBuild",requiredIds={18870}}
	},
	[58] = {
		{id=11713,name="Curse of Agony",subText="Rank 6",level=58,icon="Interface\\Icons\\Spell_Shadow_CurseOfSargeras",requiredIds={11712}},
		{id=11726,name="Enslave Demon",subText="Rank 3",level=58,icon="Interface\\Icons\\Spell_Shadow_EnslaveDemon",requiredIds={11725}},
		{id=11730,name="Create Healthstone (Major)",subText="",level=58,icon="Interface\\Icons\\INV_Stone_04"},
		{id=11678,name="Rain of Fire",subText="Rank 4",level=58,icon="Interface\\Icons\\Spell_Shadow_RainOfFire",requiredIds={11677}},
		{id=17923,name="Searing Pain",subText="Rank 6",level=58,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={17922}},
		{id=17926,name="Death Coil",subText="Rank 3",level=58,icon="Interface\\Icons\\Spell_Shadow_DeathCoil",requiredIds={17925}},
		{id=18881,name="Siphon Life",subText="Rank 4",level=58,icon="Interface\\Icons\\Spell_Shadow_Requiem",requiredIds={18880}}
	},
	[60] = {
		{id=11722,name="Curse of the Elements",subText="Rank 3",level=60,icon="Interface\\Icons\\Spell_Shadow_ChillTouch",requiredIds={11721}},
		{id=11735,name="Demon Armor",subText="Rank 5",level=60,icon="Interface\\Icons\\Spell_Shadow_RagingScream",requiredIds={11734}},
		{id=11695,name="Health Funnel",subText="Rank 7",level=60,icon="Interface\\Icons\\Spell_Shadow_LifeDrain",requiredIds={11694}},
		{id=11661,name="Shadow Bolt",subText="Rank 9",level=60,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={11660}},
		{id=11668,name="Immolate",subText="Rank 7",level=60,icon="Interface\\Icons\\Spell_Fire_Immolation",requiredIds={11667}},
		{id=17728,name="Create Spellstone (Major)",subText="",level=60,icon="Interface\\Icons\\INV_Misc_Gem_Sapphire_01"},
		{id=603,name="Curse of Doom",subText="",level=60,icon="Interface\\Icons\\Spell_Shadow_AuraOfDarkness"},
		{id=18540,name="Ritual of Doom",subText="",level=60,icon="Interface\\Icons\\Spell_Shadow_AntiMagicShell"},
		{id=18932,name="Conflagrate",subText="Rank 4",level=60,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={18931}},
		{id=18938,name="Dark Pact",subText="Rank 3",level=60,icon="Interface\\Icons\\Spell_Shadow_DarkRitual",requiredIds={18937}},
		{id=20757,name="Create Soulstone (Major)",subText="",level=60,icon="Interface\\Icons\\Spell_Shadow_SoulGem"},
		{id=23161,name="Summon Dreadsteed",subText="Summon",level=60,icon="Interface\\Icons\\Ability_Mount_Dreadsteed"},
		{id=25307,name="Shadow Bolt",subText="Rank 10",level=60,icon="Interface\\Icons\\Spell_Shadow_ShadowBolt",requiredIds={686}},
		{id=25309,name="Immolate",subText="Rank 8",level=60,icon="Interface\\Icons\\Spell_Fire_Immolation",requiredIds={11668}},
		{id=25311,name="Corruption",subText="Rank 7",level=60,icon="Interface\\Icons\\Spell_Shadow_AbominationExplosion",requiredIds={11672}},
		{id=28610,name="Shadow Ward",subText="Rank 4",level=60,icon="Interface\\Icons\\Spell_Shadow_AntiShadow",requiredIds={11740}},
		{id=45908,name="Demon Portal",subText="",level=60,icon="Interface\\Icons\\Spell_Shadow_SummonFelGuard"}
	}
}