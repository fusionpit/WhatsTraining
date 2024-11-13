setfenv(1, WhatsTraining)
ClassSpellsByLevel["Mage"] = {
	[1] = {
		{id=133,name="Fireball",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Fire_FlameBolt"},
		{id=1459,name="Arcane Intellect",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Holy_MagicalSentry"},
		{id=168,name="Frost Armor",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Frost_FrostArmor02"},
		{id=12484,name="Chilled",subText="Rank 1",level=1,icon="Interface\\Icons\\Spell_Frost_IceStorm"}
	},
	[4] = {
		{id=116,name="Frostbolt",subText="Rank 1",level=4,icon="Interface\\Icons\\Spell_Frost_FrostBolt02"},
		{id=5504,name="Conjure Water",subText="Rank 1",level=4,icon="Interface\\Icons\\INV_Drink_06"}
	},
	[6] = {
		{id=143,name="Fireball",subText="Rank 2",level=6,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={25306}},
		{id=2136,name="Fire Blast",subText="Rank 1",level=6,icon="Interface\\Icons\\Spell_Fire_Fireball"},
		{id=587,name="Conjure Food",subText="Rank 1",level=6,icon="Interface\\Icons\\INV_Misc_Food_10"}
	},
	[8] = {
		{id=205,name="Frostbolt",subText="Rank 2",level=8,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={25304}},
		{id=5143,name="Arcane Missiles",subText="Rank 1",level=8,icon="Interface\\Icons\\Spell_Nature_StarFall"},
		{id=118,name="Polymorph",subText="Rank 1",level=8,icon="Interface\\Icons\\Spell_Nature_Polymorph"}
	},
	[10] = {
		{id=122,name="Frost Nova",subText="Rank 1",level=10,icon="Interface\\Icons\\Spell_Frost_FrostNova"},
		{id=7300,name="Frost Armor",subText="Rank 2",level=10,icon="Interface\\Icons\\Spell_Frost_FrostArmor02",requiredIds={168}},
		{id=5505,name="Conjure Water",subText="Rank 2",level=10,icon="Interface\\Icons\\INV_Drink_07",requiredIds={5504}},
		{id=12485,name="Chilled",subText="Rank 2",level=10,icon="Interface\\Icons\\Spell_Frost_IceStorm",requiredIds={12484}},
		{id=12486,name="Chilled",subText="Rank 3",level=10,icon="Interface\\Icons\\Spell_Frost_IceStorm",requiredIds={12485}}
	},
	[12] = {
		{id=145,name="Fireball",subText="Rank 3",level=12,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={143}},
		{id=604,name="Dampen Magic",subText="",level=12,icon="Interface\\Icons\\Spell_Nature_AbolishMagic"},
		{id=8450,name="Dampen Magic",subText="",level=12,icon="Interface\\Icons\\Spell_Nature_AbolishMagic"},
		{id=8451,name="Dampen Magic",subText="",level=12,icon="Interface\\Icons\\Spell_Nature_AbolishMagic"},
		{id=130,name="Slow Fall",subText="",level=12,icon="Interface\\Icons\\Spell_Magic_FeatherFall"},
		{id=597,name="Conjure Food",subText="Rank 2",level=12,icon="Interface\\Icons\\INV_Misc_Food_09",requiredIds={587}}
	},
	[14] = {
		{id=837,name="Frostbolt",subText="Rank 3",level=14,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={205}},
		{id=1460,name="Arcane Intellect",subText="Rank 2",level=14,icon="Interface\\Icons\\Spell_Holy_MagicalSentry",requiredIds={1459}},
		{id=2137,name="Fire Blast",subText="Rank 2",level=14,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={2136}},
		{id=1449,name="Arcane Explosion",subText="Rank 1",level=14,icon="Interface\\Icons\\Spell_Nature_WispSplode"}
	},
	[16] = {
		{id=2120,name="Flamestrike",subText="Rank 1",level=16,icon="Interface\\Icons\\Spell_Fire_SelfDestruct"},
		{id=5144,name="Arcane Missiles",subText="Rank 2",level=16,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={5143}},
		{id=2855,name="Detect Magic",subText="",level=16,icon="Interface\\Icons\\Spell_Holy_Dizzy"}
	},
	[18] = {
		{id=3140,name="Fireball",subText="Rank 4",level=18,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={145}},
		{id=475,name="Remove Lesser Curse",subText="",level=18,icon="Interface\\Icons\\Spell_Nature_RemoveCurse"},
		{id=1008,name="Amplify Magic",subText="",level=18,icon="Interface\\Icons\\Spell_Holy_FlashHeal"},
		{id=8455,name="Amplify Magic",subText="",level=18,icon="Interface\\Icons\\Spell_Holy_FlashHeal"},
		{id=10169,name="Amplify Magic",subText="",level=18,icon="Interface\\Icons\\Spell_Holy_FlashHeal"}
	},
	[20] = {
		{id=543,name="Fire Ward",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Fire_FireArmor"},
		{id=3562,name="Teleport: Ironforge",subText="",level=20,icon="Interface\\Icons\\Spell_Arcane_TeleportIronForge",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=3567,name="Teleport: Orgrimmar",subText="",level=20,icon="Interface\\Icons\\Spell_Arcane_TeleportOrgrimmar",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=3561,name="Teleport: Stormwind",subText="",level=20,icon="Interface\\Icons\\Spell_Arcane_TeleportStormWind",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=3563,name="Teleport: Undercity",subText="",level=20,icon="Interface\\Icons\\Spell_Arcane_TeleportUnderCity",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=10,name="Blizzard",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Frost_IceStorm"},
		{id=7301,name="Frost Armor",subText="Rank 3",level=20,icon="Interface\\Icons\\Spell_Frost_FrostArmor02",requiredIds={7300}},
		{id=7322,name="Frostbolt",subText="Rank 4",level=20,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={837}},
		{id=1463,name="Mana Shield",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility"},
		{id=11366,name="Pyroblast",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredTalent={id=8,tabIndex=2}},
		{id=5506,name="Conjure Water",subText="Rank 3",level=20,icon="Interface\\Icons\\INV_Drink_Milk_02",requiredIds={5505}},
		{id=12472,name="Cold Snap",subText="",level=20,icon="Interface\\Icons\\Spell_Frost_WizardMark",requiredTalent={id=26,tabIndex=3}},
		{id=12824,name="Polymorph",subText="Rank 2",level=20,icon="Interface\\Icons\\Spell_Nature_Polymorph",requiredIds={118}},
		{id=1953,name="Blink",subText="",level=20,icon="Interface\\Icons\\Spell_Arcane_Blink"},
		{id=52615,name="Teleport: Alah'Thalas",subText="",level=20,icon="Interface\\Icons\\Spell_Arcane_TeleportStormWind",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=49358,name="Teleport: Stonard",subText="",level=20,icon="Interface\\Icons\\Spell_Arcane_TeleportStonard",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=51949,name="Arcane Rupture",subText="Rank 1",level=20,icon="Interface\\Icons\\Spell_Arcane_Blast",requiredTalent={id=45,tabIndex=1}}
	},
	[22] = {
		{id=6143,name="Frost Ward",subText="Rank 1",level=22,icon="Interface\\Icons\\Spell_Frost_FrostWard"},
		{id=2138,name="Fire Blast",subText="Rank 3",level=22,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={2137}},
		{id=8437,name="Arcane Explosion",subText="Rank 2",level=22,icon="Interface\\Icons\\Spell_Nature_WispSplode",requiredIds={1449}},
		{id=2948,name="Scorch",subText="Rank 1",level=22,icon="Interface\\Icons\\Spell_Fire_SoulBurn"},
		{id=990,name="Conjure Food",subText="Rank 3",level=22,icon="Interface\\Icons\\INV_Misc_Food_12",requiredIds={597}}
	},
	[24] = {
		{id=2121,name="Flamestrike",subText="Rank 2",level=24,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={2120}},
		{id=5145,name="Arcane Missiles",subText="Rank 3",level=24,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={5144}},
		{id=2139,name="Counterspell",subText="",level=24,icon="Interface\\Icons\\Spell_Frost_IceShock"},
		{id=8400,name="Fireball",subText="Rank 5",level=24,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={3140}},
		{id=12505,name="Pyroblast",subText="Rank 2",level=24,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={11366}}
	},
	[26] = {
		{id=865,name="Frost Nova",subText="Rank 2",level=26,icon="Interface\\Icons\\Spell_Frost_FrostNova",requiredIds={122}},
		{id=8406,name="Frostbolt",subText="Rank 5",level=26,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={7322}},
		{id=120,name="Cone of Cold",subText="Rank 1",level=26,icon="Interface\\Icons\\Spell_Frost_Glacier"}
	},
	[28] = {
		{id=1461,name="Arcane Intellect",subText="Rank 3",level=28,icon="Interface\\Icons\\Spell_Holy_MagicalSentry",requiredIds={1460}},
		{id=6141,name="Blizzard",subText="Rank 2",level=28,icon="Interface\\Icons\\Spell_Frost_IceStorm",requiredIds={10}},
		{id=8444,name="Scorch",subText="Rank 2",level=28,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={2948}},
		{id=8494,name="Mana Shield",subText="Rank 2",level=28,icon="Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility",requiredIds={1463}},
		{id=759,name="Conjure Mana Agate",subText="",level=28,icon="Interface\\Icons\\INV_Misc_Gem_Emerald_01"},
		{id=51950,name="Arcane Rupture",subText="Rank 2",level=28,icon="Interface\\Icons\\Spell_Arcane_Blast",requiredIds={51949}}
	},
	[30] = {
		{id=3565,name="Teleport: Darnassus",subText="",level=30,icon="Interface\\Icons\\Spell_Arcane_TeleportDarnassus",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=3566,name="Teleport: Thunder Bluff",subText="",level=30,icon="Interface\\Icons\\Spell_Arcane_TeleportThunderBluff",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=7302,name="Ice Armor",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Frost_FrostArmor02"},
		{id=8401,name="Fireball",subText="Rank 6",level=30,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={8400}},
		{id=8412,name="Fire Blast",subText="Rank 4",level=30,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={2138}},
		{id=8438,name="Arcane Explosion",subText="Rank 3",level=30,icon="Interface\\Icons\\Spell_Nature_WispSplode",requiredIds={8437}},
		{id=8457,name="Fire Ward",subText="Rank 2",level=30,icon="Interface\\Icons\\Spell_Fire_FireArmor",requiredIds={543}},
		{id=11113,name="Blast Wave",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredTalent={id=13,tabIndex=2}},
		{id=6127,name="Conjure Water",subText="Rank 4",level=30,icon="Interface\\Icons\\INV_Drink_10",requiredIds={5506}},
		{id=11958,name="Ice Block",subText="",level=30,icon="Interface\\Icons\\Spell_Frost_Frost",requiredTalent={id=31,tabIndex=3}},
		{id=12522,name="Pyroblast",subText="Rank 3",level=30,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={12505}},
		{id=52516,name="Icicles",subText="Rank 1",level=30,icon="Interface\\Icons\\Spell_Frost_FrostBlast",requiredTalent={id=32,tabIndex=3}},
		{id=49361,name="Teleport: Theramore",subText="",level=30,icon="Interface\\Icons\\Spell_Arcane_TeleportTheramore",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}}
	},
	[32] = {
		{id=8407,name="Frostbolt",subText="Rank 6",level=32,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={8406}},
		{id=8416,name="Arcane Missiles",subText="Rank 4",level=32,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={5145}},
		{id=8422,name="Flamestrike",subText="Rank 3",level=32,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={2121}},
		{id=8461,name="Frost Ward",subText="Rank 2",level=32,icon="Interface\\Icons\\Spell_Frost_FrostWard",requiredIds={6143}},
		{id=6129,name="Conjure Food",subText="Rank 4",level=32,icon="Interface\\Icons\\INV_Misc_Food_08",requiredIds={990}},
		{id=51933,name="Arcane Surge",subText="Rank 1",level=32,icon="Interface\\Icons\\INV_Enchant_EssenceMysticalLarge"}
	},
	[34] = {
		{id=8445,name="Scorch",subText="Rank 3",level=34,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={8444}},
		{id=8492,name="Cone of Cold",subText="Rank 2",level=34,icon="Interface\\Icons\\Spell_Frost_Glacier",requiredIds={120}},
		{id=6117,name="Mage Armor",subText="Rank 1",level=34,icon="Interface\\Icons\\Spell_MageArmor"}
	},
	[36] = {
		{id=8402,name="Fireball",subText="Rank 7",level=36,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={8401}},
		{id=8427,name="Blizzard",subText="Rank 3",level=36,icon="Interface\\Icons\\Spell_Frost_IceStorm",requiredIds={6141}},
		{id=8495,name="Mana Shield",subText="Rank 3",level=36,icon="Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility",requiredIds={8494}},
		{id=12523,name="Pyroblast",subText="Rank 4",level=36,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={12522}},
		{id=13018,name="Blast Wave",subText="Rank 2",level=36,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={11113}},
		{id=51951,name="Arcane Rupture",subText="Rank 3",level=36,icon="Interface\\Icons\\Spell_Arcane_Blast",requiredIds={51950}}
	},
	[38] = {
		{id=8408,name="Frostbolt",subText="Rank 7",level=38,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={8407}},
		{id=8413,name="Fire Blast",subText="Rank 5",level=38,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={8412}},
		{id=8439,name="Arcane Explosion",subText="Rank 4",level=38,icon="Interface\\Icons\\Spell_Nature_WispSplode",requiredIds={8438}},
		{id=3552,name="Conjure Mana Jade",subText="",level=38,icon="Interface\\Icons\\INV_Misc_Gem_Emerald_02"}
	},
	[40] = {
		{id=6131,name="Frost Nova",subText="Rank 3",level=40,icon="Interface\\Icons\\Spell_Frost_FrostNova",requiredIds={865}},
		{id=7320,name="Ice Armor",subText="Rank 2",level=40,icon="Interface\\Icons\\Spell_Frost_FrostArmor02",requiredIds={7302}},
		{id=8417,name="Arcane Missiles",subText="Rank 5",level=40,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8416}},
		{id=8423,name="Flamestrike",subText="Rank 4",level=40,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={8422}},
		{id=8446,name="Scorch",subText="Rank 4",level=40,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={8445}},
		{id=8458,name="Fire Ward",subText="Rank 3",level=40,icon="Interface\\Icons\\Spell_Fire_FireArmor",requiredIds={8457}},
		{id=11416,name="Portal: Ironforge",subText="",level=40,icon="Interface\\Icons\\Spell_Arcane_PortalIronForge",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=11417,name="Portal: Orgrimmar",subText="",level=40,icon="Interface\\Icons\\Spell_Arcane_PortalOrgrimmar",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=10059,name="Portal: Stormwind",subText="",level=40,icon="Interface\\Icons\\Spell_Arcane_PortalStormWind",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=11418,name="Portal: Undercity",subText="",level=40,icon="Interface\\Icons\\Spell_Arcane_PortalUnderCity",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=11426,name="Ice Barrier",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Ice_Lament",requiredTalent={id=36,tabIndex=3}},
		{id=10138,name="Conjure Water",subText="Rank 5",level=40,icon="Interface\\Icons\\INV_Drink_09",requiredIds={6127}},
		{id=11129,name="Combustion",subText="",level=40,icon="Interface\\Icons\\Spell_Fire_SealOfFire",requiredTalent={id=17,tabIndex=2}},
		{id=12825,name="Polymorph",subText="Rank 3",level=40,icon="Interface\\Icons\\Spell_Nature_Polymorph",requiredIds={12824}},
		{id=51991,name="Icicles",subText="Rank 2",level=40,icon="Interface\\Icons\\Spell_Frost_FrostBlast",requiredIds={52516}},
		{id=52618,name="Portal: Alah'Thalas",subText="",level=40,icon="Interface\\Icons\\Spell_Arcane_PortalStormWind",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=49362,name="Portal: Stonard",subText="",level=40,icon="Interface\\Icons\\Spell_Arcane_PortalStonard",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=51934,name="Arcane Surge",subText="Rank 2",level=40,icon="Interface\\Icons\\INV_Enchant_EssenceMysticalLarge",requiredIds={51933}}
	},
	[42] = {
		{id=10148,name="Fireball",subText="Rank 8",level=42,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={8402}},
		{id=10156,name="Arcane Intellect",subText="Rank 4",level=42,icon="Interface\\Icons\\Spell_Holy_MagicalSentry",requiredIds={1461}},
		{id=10159,name="Cone of Cold",subText="Rank 3",level=42,icon="Interface\\Icons\\Spell_Frost_Glacier",requiredIds={8492}},
		{id=8462,name="Frost Ward",subText="Rank 3",level=42,icon="Interface\\Icons\\Spell_Frost_FrostWard",requiredIds={8461}},
		{id=10144,name="Conjure Food",subText="Rank 5",level=42,icon="Interface\\Icons\\INV_Misc_Food_11",requiredIds={6129}},
		{id=12524,name="Pyroblast",subText="Rank 5",level=42,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={12523}}
	},
	[44] = {
		{id=10179,name="Frostbolt",subText="Rank 8",level=44,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={8408}},
		{id=10185,name="Blizzard",subText="Rank 4",level=44,icon="Interface\\Icons\\Spell_Frost_IceStorm",requiredIds={8427}},
		{id=10191,name="Mana Shield",subText="Rank 4",level=44,icon="Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility",requiredIds={8495}},
		{id=13019,name="Blast Wave",subText="Rank 3",level=44,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={13018}},
		{id=51952,name="Arcane Rupture",subText="Rank 4",level=44,icon="Interface\\Icons\\Spell_Arcane_Blast",requiredIds={51951}}
	},
	[46] = {
		{id=10197,name="Fire Blast",subText="Rank 6",level=46,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={8413}},
		{id=10201,name="Arcane Explosion",subText="Rank 5",level=46,icon="Interface\\Icons\\Spell_Nature_WispSplode",requiredIds={8439}},
		{id=10205,name="Scorch",subText="Rank 5",level=46,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={8446}},
		{id=13031,name="Ice Barrier",subText="Rank 2",level=46,icon="Interface\\Icons\\Spell_Ice_Lament",requiredIds={11426}},
		{id=22782,name="Mage Armor",subText="Rank 2",level=46,icon="Interface\\Icons\\Spell_MageArmor",requiredIds={6117}}
	},
	[48] = {
		{id=10149,name="Fireball",subText="Rank 9",level=48,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={10148}},
		{id=10173,name="[Deprecated] Dampen Magic",subText="Rank 4",level=48,icon="Interface\\Icons\\Spell_Nature_AbolishMagic"},
		{id=10211,name="Arcane Missiles",subText="Rank 6",level=48,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={8417}},
		{id=10215,name="Flamestrike",subText="Rank 5",level=48,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={8423}},
		{id=10053,name="Conjure Mana Citrine",subText="",level=48,icon="Interface\\Icons\\INV_Misc_Gem_Opal_01"},
		{id=12525,name="Pyroblast",subText="Rank 6",level=48,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={12524}},
		{id=51935,name="Arcane Surge",subText="Rank 3",level=48,icon="Interface\\Icons\\INV_Enchant_EssenceMysticalLarge",requiredIds={51934}}
	},
	[50] = {
		{id=10160,name="Cone of Cold",subText="Rank 4",level=50,icon="Interface\\Icons\\Spell_Frost_Glacier",requiredIds={10159}},
		{id=10180,name="Frostbolt",subText="Rank 9",level=50,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={10179}},
		{id=10219,name="Ice Armor",subText="Rank 3",level=50,icon="Interface\\Icons\\Spell_Frost_FrostArmor02",requiredIds={7320}},
		{id=10223,name="Fire Ward",subText="Rank 4",level=50,icon="Interface\\Icons\\Spell_Fire_FireArmor",requiredIds={8458}},
		{id=11419,name="Portal: Darnassus",subText="",level=50,icon="Interface\\Icons\\Spell_Arcane_PortalDarnassus",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}},
		{id=11420,name="Portal: Thunder Bluff",subText="",level=50,icon="Interface\\Icons\\Spell_Arcane_PortalThunderBluff",races={"Goblin","Troll","Tauren","Undead","Orc"}},
		{id=10139,name="Conjure Water",subText="Rank 6",level=50,icon="Interface\\Icons\\INV_Drink_11",requiredIds={10138}},
		{id=51995,name="Icicles",subText="Rank 3",level=50,icon="Interface\\Icons\\Spell_Frost_FrostBlast",requiredIds={51991}},
		{id=49366,name="Portal: Theramore",subText="",level=50,icon="Interface\\Icons\\Spell_Arcane_PortalTheramore",races={"High Elf","Gnome","Night Elf","Dwarf","Human"}}
	},
	[52] = {
		{id=10177,name="Frost Ward",subText="Rank 4",level=52,icon="Interface\\Icons\\Spell_Frost_FrostWard",requiredIds={8462}},
		{id=10186,name="Blizzard",subText="Rank 5",level=52,icon="Interface\\Icons\\Spell_Frost_IceStorm",requiredIds={10185}},
		{id=10192,name="Mana Shield",subText="Rank 5",level=52,icon="Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility",requiredIds={10191}},
		{id=10206,name="Scorch",subText="Rank 6",level=52,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={10205}},
		{id=10145,name="Conjure Food",subText="Rank 6",level=52,icon="Interface\\Icons\\INV_Misc_Food_33",requiredIds={10144}},
		{id=13020,name="Blast Wave",subText="Rank 4",level=52,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={13019}},
		{id=13032,name="Ice Barrier",subText="Rank 3",level=52,icon="Interface\\Icons\\Spell_Ice_Lament",requiredIds={13031}},
		{id=51953,name="Arcane Rupture",subText="Rank 5",level=52,icon="Interface\\Icons\\Spell_Arcane_Blast",requiredIds={51952}}
	},
	[54] = {
		{id=10150,name="Fireball",subText="Rank 10",level=54,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={133}},
		{id=10170,name="[Deprecated] Amplify Magic",subText="Rank 4",level=54,icon="Interface\\Icons\\Spell_Holy_FlashHeal"},
		{id=10199,name="Fire Blast",subText="Rank 7",level=54,icon="Interface\\Icons\\Spell_Fire_Fireball",requiredIds={10197}},
		{id=10202,name="Arcane Explosion",subText="Rank 6",level=54,icon="Interface\\Icons\\Spell_Nature_WispSplode",requiredIds={10201}},
		{id=10230,name="Frost Nova",subText="Rank 4",level=54,icon="Interface\\Icons\\Spell_Frost_FrostNova",requiredIds={6131}},
		{id=12526,name="Pyroblast",subText="Rank 7",level=54,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={12525}}
	},
	[56] = {
		{id=10157,name="Arcane Intellect",subText="Rank 5",level=56,icon="Interface\\Icons\\Spell_Holy_MagicalSentry",requiredIds={10156}},
		{id=10181,name="Frostbolt",subText="Rank 10",level=56,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={116}},
		{id=10212,name="Arcane Missiles",subText="Rank 7",level=56,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={10211}},
		{id=10216,name="Flamestrike",subText="Rank 6",level=56,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={10215}},
		{id=23028,name="Arcane Brilliance",subText="Rank 1",level=56,icon="Interface\\Icons\\Spell_Holy_ArcaneIntellect"},
		{id=25345,name="Arcane Missiles",subText="Rank 8",level=56,icon="Interface\\Icons\\Spell_Nature_StarFall",requiredIds={10212}},
		{id=51936,name="Arcane Surge",subText="Rank 4",level=56,icon="Interface\\Icons\\INV_Enchant_EssenceMysticalLarge",requiredIds={51935}}
	},
	[58] = {
		{id=10161,name="Cone of Cold",subText="Rank 5",level=58,icon="Interface\\Icons\\Spell_Frost_Glacier",requiredIds={10160}},
		{id=10207,name="Scorch",subText="Rank 7",level=58,icon="Interface\\Icons\\Spell_Fire_SoulBurn",requiredIds={10206}},
		{id=10054,name="Conjure Mana Ruby",subText="",level=58,icon="Interface\\Icons\\INV_Misc_Gem_Ruby_01"},
		{id=13033,name="Ice Barrier",subText="Rank 4",level=58,icon="Interface\\Icons\\Spell_Ice_Lament",requiredIds={13032}},
		{id=22783,name="Mage Armor",subText="Rank 3",level=58,icon="Interface\\Icons\\Spell_MageArmor",requiredIds={22782}}
	},
	[60] = {
		{id=10151,name="Fireball",subText="Rank 11",level=60,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={10150}},
		{id=10174,name="[Deprecated] Dampen Magic",subText="Rank 5",level=60,icon="Interface\\Icons\\Spell_Nature_AbolishMagic",requiredIds={10173}},
		{id=10187,name="Blizzard",subText="Rank 6",level=60,icon="Interface\\Icons\\Spell_Frost_IceStorm",requiredIds={10186}},
		{id=10193,name="Mana Shield",subText="Rank 6",level=60,icon="Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility",requiredIds={10192}},
		{id=10220,name="Ice Armor",subText="Rank 4",level=60,icon="Interface\\Icons\\Spell_Frost_FrostArmor02",requiredIds={10219}},
		{id=10225,name="Fire Ward",subText="Rank 5",level=60,icon="Interface\\Icons\\Spell_Fire_FireArmor",requiredIds={10223}},
		{id=12826,name="Polymorph",subText="Rank 4",level=60,icon="Interface\\Icons\\Spell_Nature_Polymorph",requiredIds={12825}},
		{id=13021,name="Blast Wave",subText="Rank 5",level=60,icon="Interface\\Icons\\Spell_Holy_Excorcism_02",requiredIds={13020}},
		{id=18809,name="Pyroblast",subText="Rank 8",level=60,icon="Interface\\Icons\\Spell_Fire_Fireball02",requiredIds={12526}},
		{id=10140,name="Conjure Water",subText="Rank 7",level=60,icon="Interface\\Icons\\INV_Drink_18",requiredIds={10139}},
		{id=25304,name="Frostbolt",subText="Rank 11",level=60,icon="Interface\\Icons\\Spell_Frost_FrostBolt02",requiredIds={10181}},
		{id=25306,name="Fireball",subText="Rank 12",level=60,icon="Interface\\Icons\\Spell_Fire_FlameBolt",requiredIds={10151}},
		{id=28270,name="Polymorph: Cow",subText="",level=60,icon="Interface\\Icons\\Spell_Nature_Polymorph_Cow"},
		{id=28271,name="Polymorph: Turtle",subText="",level=60,icon="Interface\\Icons\\Ability_Hunter_Pet_Turtle"},
		{id=28272,name="Polymorph: Pig",subText="",level=60,icon="Interface\\Icons\\Spell_Magic_PolymorphPig"},
		{id=28609,name="Frost Ward",subText="Rank 5",level=60,icon="Interface\\Icons\\Spell_Frost_FrostWard",requiredIds={10177}},
		{id=28612,name="Conjure Food",subText="Rank 7",level=60,icon="Interface\\Icons\\INV_Misc_Food_73CinnamonRoll",requiredIds={10145}},
		{id=45407,name="Ritual of Refreshment",subText="",level=60,icon="Interface\\Icons\\INV_Misc_Food_DimSum"},
		{id=51997,name="Icicles",subText="Rank 4",level=60,icon="Interface\\Icons\\Spell_Frost_FrostBlast",requiredIds={51995}},
		{id=57561,name="Polymorph: Rodent",subText="",level=60,icon="Interface\\Icons\\Achievement_rat"},
		{id=51954,name="Arcane Rupture",subText="Rank 6",level=60,icon="Interface\\Icons\\Spell_Arcane_Blast",requiredIds={51953}}
	}
}