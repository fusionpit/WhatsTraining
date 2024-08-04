if (WT.currentClass ~= "SHAMAN") then return end
WT:AddOverriddenSpells({
	{45505,45514}
})
WT.SpellsByLevel = WT.RaceFilter({
	[1] = {
		{id=331,name="Healing Wave",subText="Rank 1",level=1,skillLineId=374,skillLineAbilityId=4492,icon="Interface\\Icons\\Spell_Nature_MagicImmunity"},
		{id=403,name="Lightning Bolt",subText="Rank 1",level=1,skillLineId=375,skillLineAbilityId=8714,icon="Interface\\Icons\\Spell_Nature_Lightning"},
		{id=8017,name="Rockbiter Weapon",subText="Rank 1",level=1,skillLineId=373,skillLineAbilityId=8747,icon="Interface\\Icons\\Spell_Nature_RockBiter"}
	},
	[4] = {
		{id=8042,name="Earth Shock",subText="Rank 1",level=4,skillLineId=375,skillLineAbilityId=4468,icon="Interface\\Icons\\Spell_Nature_EarthShock"},
		{id=8071,name="Stoneskin Totem",subText="Rank 1",level=4,skillLineId=373,skillLineAbilityId=8764,icon="Interface\\Icons\\Spell_Nature_StoneSkinTotem"}
	},
	[6] = {
		{id=2484,name="Earthbind Totem",subText="",level=6,skillLineId=375,skillLineAbilityId=4481,icon="Interface\\Icons\\Spell_Nature_StrengthOfEarthTotem02"},
		{id=332,name="Healing Wave",subText="Rank 2",level=6,skillLineId=374,skillLineAbilityId=4493,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={25357}}
	},
	[8] = {
		{id=5730,name="Stoneclaw Totem",subText="Rank 1",level=8,skillLineId=375,skillLineAbilityId=4456,icon="Interface\\Icons\\Spell_Nature_StoneClawTotem"},
		{id=8044,name="Earth Shock",subText="Rank 2",level=8,skillLineId=375,skillLineAbilityId=4469,icon="Interface\\Icons\\Spell_Nature_EarthShock",requiredIds={8042}},
		{id=324,name="Lightning Shield",subText="Rank 1",level=8,skillLineId=373,skillLineAbilityId=4499,icon="Interface\\Icons\\Spell_Nature_LightningShield"},
		{id=529,name="Lightning Bolt",subText="Rank 2",level=8,skillLineId=375,skillLineAbilityId=8716,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={15208}},
		{id=8018,name="Rockbiter Weapon",subText="Rank 2",level=8,skillLineId=373,skillLineAbilityId=8748,icon="Interface\\Icons\\Spell_Nature_RockBiter",requiredIds={8017}}
	},
	[10] = {
		{id=8050,name="Flame Shock",subText="Rank 1",level=10,skillLineId=375,skillLineAbilityId=8705,icon="Interface\\Icons\\Spell_Fire_FlameShock"},
		{id=3599,name="Searing Totem",subText="Rank 1",level=10,skillLineId=375,skillLineAbilityId=8728,icon="Interface\\Icons\\Spell_Fire_SearingTotem"},
		{id=8024,name="Flametongue Weapon",subText="Rank 1",level=10,skillLineId=373,skillLineAbilityId=8761,icon="Interface\\Icons\\Spell_Fire_FlameTounge"},
		{id=8075,name="Strength of Earth Totem",subText="Rank 1",level=10,skillLineId=373,skillLineAbilityId=8771,icon="Interface\\Icons\\Spell_Nature_EarthBindTotem"}
	},
	[12] = {
		{id=547,name="Healing Wave",subText="Rank 3",level=12,skillLineId=374,skillLineAbilityId=4494,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={332}},
		{id=2008,name="Ancestral Spirit",subText="Rank 1",level=12,skillLineId=374,skillLineAbilityId=8696,icon="Interface\\Icons\\Spell_Nature_Regenerate"},
		{id=370,name="Purge",subText="Rank 1",level=12,skillLineId=375,skillLineAbilityId=8703,icon="Interface\\Icons\\Spell_Nature_Purge"},
		{id=1535,name="Fire Nova Totem",subText="Rank 1",level=12,skillLineId=375,skillLineAbilityId=8734,icon="Interface\\Icons\\Spell_Fire_SealOfFire"}
	},
	[14] = {
		{id=8045,name="Earth Shock",subText="Rank 3",level=14,skillLineId=375,skillLineAbilityId=4470,icon="Interface\\Icons\\Spell_Nature_EarthShock",requiredIds={8044}},
		{id=548,name="Lightning Bolt",subText="Rank 3",level=14,skillLineId=375,skillLineAbilityId=8717,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={529}},
		{id=8154,name="Stoneskin Totem",subText="Rank 2",level=14,skillLineId=373,skillLineAbilityId=8765,icon="Interface\\Icons\\Spell_Nature_StoneSkinTotem",requiredIds={8071}}
	},
	[16] = {
		{id=325,name="Lightning Shield",subText="Rank 2",level=16,skillLineId=373,skillLineAbilityId=4500,icon="Interface\\Icons\\Spell_Nature_LightningShield",requiredIds={324}},
		{id=526,name="Cure Poison",subText="",level=16,skillLineId=374,skillLineAbilityId=8697,icon="Interface\\Icons\\Spell_Nature_NullifyPoison"},
		{id=8019,name="Rockbiter Weapon",subText="Rank 3",level=16,skillLineId=373,skillLineAbilityId=8749,icon="Interface\\Icons\\Spell_Nature_RockBiter",requiredIds={8018}}
	},
	[18] = {
		{id=6390,name="Stoneclaw Totem",subText="Rank 2",level=18,skillLineId=375,skillLineAbilityId=4457,icon="Interface\\Icons\\Spell_Nature_StoneClawTotem",requiredIds={5730}},
		{id=913,name="Healing Wave",subText="Rank 4",level=18,skillLineId=374,skillLineAbilityId=4495,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={547}},
		{id=8143,name="Tremor Totem",subText="",level=18,skillLineId=374,skillLineAbilityId=8699,icon="Interface\\Icons\\Spell_Nature_TremorTotem"},
		{id=8052,name="Flame Shock",subText="Rank 2",level=18,skillLineId=375,skillLineAbilityId=8706,icon="Interface\\Icons\\Spell_Fire_FlameShock",requiredIds={8050}},
		{id=8027,name="Flametongue Weapon",subText="Rank 2",level=18,skillLineId=373,skillLineAbilityId=8762,icon="Interface\\Icons\\Spell_Fire_FlameTounge",requiredIds={8024}}
	},
	[20] = {
		{id=8004,name="Lesser Healing Wave",subText="Rank 1",level=20,skillLineId=374,skillLineAbilityId=4489,icon="Interface\\Icons\\Spell_Nature_HealingWaveLesser"},
		{id=5394,name="Healing Stream Totem",subText="Rank 1",level=20,skillLineId=374,skillLineAbilityId=4496,icon="Interface\\Icons\\INV_Spear_04"},
		{id=2645,name="Ghost Wolf",subText="",level=20,skillLineId=373,skillLineAbilityId=8700,icon="Interface\\Icons\\Spell_Nature_SpiritWolf"},
		{id=8056,name="Frost Shock",subText="Rank 1",level=20,skillLineId=375,skillLineAbilityId=8710,icon="Interface\\Icons\\Spell_Frost_FrostShock"},
		{id=915,name="Lightning Bolt",subText="Rank 4",level=20,skillLineId=375,skillLineAbilityId=8719,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={548}},
		{id=6363,name="Searing Totem",subText="Rank 2",level=20,skillLineId=375,skillLineAbilityId=8729,icon="Interface\\Icons\\Spell_Fire_SearingTotem",requiredIds={3599}},
		{id=8033,name="Frostbrand Weapon",subText="Rank 1",level=20,skillLineId=373,skillLineAbilityId=8775,icon="Interface\\Icons\\Spell_Frost_FrostBrand"}
	},
	[22] = {
		{id=8166,name="Poison Cleansing Totem",subText="",level=22,skillLineId=374,skillLineAbilityId=4538,icon="Interface\\Icons\\Spell_Nature_PoisonCleansingTotem"},
		{id=2870,name="Cure Disease",subText="",level=22,skillLineId=374,skillLineAbilityId=8698,icon="Interface\\Icons\\Spell_Nature_RemoveDisease"},
		{id=8498,name="Fire Nova Totem",subText="Rank 2",level=22,skillLineId=375,skillLineAbilityId=8735,icon="Interface\\Icons\\Spell_Fire_SealOfFire",requiredIds={1535}},
		{id=131,name="Water Breathing",subText="",level=22,skillLineId=373,skillLineAbilityId=8781,icon="Interface\\Icons\\Spell_Shadow_DemonBreath"}
	},
	[24] = {
		{id=8046,name="Earth Shock",subText="Rank 4",level=24,skillLineId=375,skillLineAbilityId=4471,icon="Interface\\Icons\\Spell_Nature_EarthShock",requiredIds={8045}},
		{id=939,name="Healing Wave",subText="Rank 5",level=24,skillLineId=374,skillLineAbilityId=4486,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={913}},
		{id=905,name="Lightning Shield",subText="Rank 3",level=24,skillLineId=373,skillLineAbilityId=4501,icon="Interface\\Icons\\Spell_Nature_LightningShield",requiredIds={325}},
		{id=10399,name="Rockbiter Weapon",subText="Rank 4",level=24,skillLineId=373,skillLineAbilityId=8750,icon="Interface\\Icons\\Spell_Nature_RockBiter",requiredIds={8019}},
		{id=8181,name="Frost Resistance Totem",subText="Rank 1",level=24,skillLineId=373,skillLineAbilityId=8756,icon="Interface\\Icons\\Spell_FrostResistanceTotem_01"},
		{id=8155,name="Stoneskin Totem",subText="Rank 3",level=24,skillLineId=373,skillLineAbilityId=8766,icon="Interface\\Icons\\Spell_Nature_StoneSkinTotem",requiredIds={8154}},
		{id=8160,name="Strength of Earth Totem",subText="Rank 2",level=24,skillLineId=373,skillLineAbilityId=8772,icon="Interface\\Icons\\Spell_Nature_EarthBindTotem",requiredIds={8075}},
		{id=20609,name="Ancestral Spirit",subText="Rank 2",level=24,skillLineId=374,skillLineAbilityId=11798,icon="Interface\\Icons\\Spell_Nature_Regenerate",requiredIds={2008}}
	},
	[26] = {
		{id=5675,name="Mana Spring Totem",subText="Rank 1",level=26,skillLineId=374,skillLineAbilityId=4544,icon="Interface\\Icons\\Spell_Nature_ManaRegenTotem"},
		{id=6196,name="Far Sight",subText="",level=26,skillLineId=373,skillLineAbilityId=8701,icon="Interface\\Icons\\Spell_Nature_FarSight"},
		{id=943,name="Lightning Bolt",subText="Rank 5",level=26,skillLineId=375,skillLineAbilityId=8718,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={915}},
		{id=8190,name="Magma Totem",subText="Rank 1",level=26,skillLineId=375,skillLineAbilityId=8743,icon="Interface\\Icons\\Spell_Fire_SelfDestruct"},
		{id=8030,name="Flametongue Weapon",subText="Rank 3",level=26,skillLineId=373,skillLineAbilityId=8763,icon="Interface\\Icons\\Spell_Fire_FlameTounge",requiredIds={8027}}
	},
	[28] = {
		{id=6391,name="Stoneclaw Totem",subText="Rank 3",level=28,skillLineId=375,skillLineAbilityId=4458,icon="Interface\\Icons\\Spell_Nature_StoneClawTotem",requiredIds={6390}},
		{id=8008,name="Lesser Healing Wave",subText="Rank 2",level=28,skillLineId=374,skillLineAbilityId=4490,icon="Interface\\Icons\\Spell_Nature_HealingWaveLesser",requiredIds={8004}},
		{id=8053,name="Flame Shock",subText="Rank 3",level=28,skillLineId=375,skillLineAbilityId=8707,icon="Interface\\Icons\\Spell_Fire_FlameShock",requiredIds={8052}},
		{id=8227,name="Flametongue Totem",subText="Rank 1",level=28,skillLineId=373,skillLineAbilityId=8759,icon="Interface\\Icons\\Spell_Nature_GuardianWard"},
		{id=8038,name="Frostbrand Weapon",subText="Rank 2",level=28,skillLineId=373,skillLineAbilityId=8776,icon="Interface\\Icons\\Spell_Frost_FrostBrand",requiredIds={8033}},
		{id=8184,name="Fire Resistance Totem",subText="Rank 1",level=28,skillLineId=373,skillLineAbilityId=8778,icon="Interface\\Icons\\Spell_FireResistanceTotem_01"},
		{id=546,name="Water Walking",subText="",level=28,skillLineId=373,skillLineAbilityId=9565,icon="Interface\\Icons\\Spell_Frost_WindWalkOn"}
	},
	[30] = {
		{id=6375,name="Healing Stream Totem",subText="Rank 2",level=30,skillLineId=374,skillLineAbilityId=4497,icon="Interface\\Icons\\INV_Spear_04",requiredIds={5394}},
		{id=8232,name="Windfury Weapon",subText="Rank 1",level=30,skillLineId=373,skillLineAbilityId=4572,icon="Interface\\Icons\\Spell_Nature_Cyclone"},
		{id=8177,name="Grounding Totem",subText="",level=30,skillLineId=373,skillLineAbilityId=5636,icon="Interface\\Icons\\Spell_Nature_GroundingTotem"},
		{id=10595,name="Nature Resistance Totem",subText="Rank 1",level=30,skillLineId=373,skillLineAbilityId=5639,icon="Interface\\Icons\\Spell_Nature_NatureResistanceTotem"},
		{id=556,name="Astral Recall",subText="",level=30,skillLineId=373,skillLineAbilityId=8702,icon="Interface\\Icons\\Spell_Nature_AstralRecal"},
		{id=6364,name="Searing Totem",subText="Rank 3",level=30,skillLineId=375,skillLineAbilityId=8730,icon="Interface\\Icons\\Spell_Fire_SearingTotem",requiredIds={6363}},
		{id=20608,name="Reincarnation",subText="Passive",level=30,skillLineId=374,skillLineAbilityId=11732,icon="Interface\\Icons\\Spell_Nature_Reincarnation"},
		{id=21169,name="Reincarnation",subText="",level=30,skillLineId=374,skillLineAbilityId=11996,icon="Interface\\Icons\\Spell_Nature_Reincarnation"},
		{id=45504,name="Hex",subText="Rank 1",level=30,skillLineId=375,skillLineAbilityId=15034,icon="Interface\\Icons\\Spell_Shaman_Hex",race="Troll"}
	},
	[32] = {
		{id=959,name="Healing Wave",subText="Rank 6",level=32,skillLineId=374,skillLineAbilityId=4487,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={939}},
		{id=945,name="Lightning Shield",subText="Rank 4",level=32,skillLineId=373,skillLineAbilityId=4502,icon="Interface\\Icons\\Spell_Nature_LightningShield",requiredIds={905}},
		{id=8512,name="Windfury Totem",subText="Rank 1",level=32,skillLineId=373,skillLineAbilityId=4725,icon="Interface\\Icons\\Spell_Nature_Windfury"},
		{id=8012,name="Purge",subText="Rank 2",level=32,skillLineId=375,skillLineAbilityId=8704,icon="Interface\\Icons\\Spell_Nature_Purge",requiredIds={370}},
		{id=6041,name="Lightning Bolt",subText="Rank 6",level=32,skillLineId=375,skillLineAbilityId=8720,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={943}},
		{id=421,name="Chain Lightning",subText="Rank 1",level=32,skillLineId=375,skillLineAbilityId=8724,icon="Interface\\Icons\\Spell_Nature_ChainLightning"},
		{id=8499,name="Fire Nova Totem",subText="Rank 3",level=32,skillLineId=375,skillLineAbilityId=8736,icon="Interface\\Icons\\Spell_Fire_SealOfFire",requiredIds={8498}}
	},
	[34] = {
		{id=6495,name="Sentry Totem",subText="",level=34,skillLineId=373,skillLineAbilityId=4480,icon="Interface\\Icons\\Spell_Nature_RemoveCurse"},
		{id=8058,name="Frost Shock",subText="Rank 2",level=34,skillLineId=375,skillLineAbilityId=8711,icon="Interface\\Icons\\Spell_Frost_FrostShock",requiredIds={8056}},
		{id=10406,name="Stoneskin Totem",subText="Rank 4",level=34,skillLineId=373,skillLineAbilityId=8767,icon="Interface\\Icons\\Spell_Nature_StoneSkinTotem",requiredIds={8155}},
		{id=16314,name="Rockbiter Weapon",subText="Rank 5",level=34,skillLineId=373,skillLineAbilityId=8986,icon="Interface\\Icons\\Spell_Nature_RockBiter",requiredIds={10399}}
	},
	[36] = {
		{id=8010,name="Lesser Healing Wave",subText="Rank 3",level=36,skillLineId=374,skillLineAbilityId=4491,icon="Interface\\Icons\\Spell_Nature_HealingWaveLesser",requiredIds={8008}},
		{id=10412,name="Earth Shock",subText="Rank 5",level=36,skillLineId=375,skillLineAbilityId=5576,icon="Interface\\Icons\\Spell_Nature_EarthShock",requiredIds={8046}},
		{id=10495,name="Mana Spring Totem",subText="Rank 2",level=36,skillLineId=374,skillLineAbilityId=5626,icon="Interface\\Icons\\Spell_Nature_ManaRegenTotem",requiredIds={5675}},
		{id=15107,name="Windwall Totem",subText="Rank 1",level=36,skillLineId=373,skillLineAbilityId=8116,icon="Interface\\Icons\\Spell_Nature_EarthBind"},
		{id=10585,name="Magma Totem",subText="Rank 2",level=36,skillLineId=375,skillLineAbilityId=8744,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={8190}},
		{id=16339,name="Flametongue Weapon",subText="Rank 4",level=36,skillLineId=373,skillLineAbilityId=8990,icon="Interface\\Icons\\Spell_Fire_FlameTounge",requiredIds={8030}},
		{id=20610,name="Ancestral Spirit",subText="Rank 3",level=36,skillLineId=374,skillLineAbilityId=11799,icon="Interface\\Icons\\Spell_Nature_Regenerate",requiredIds={20609}}
	},
	[38] = {
		{id=6392,name="Stoneclaw Totem",subText="Rank 4",level=38,skillLineId=375,skillLineAbilityId=4459,icon="Interface\\Icons\\Spell_Nature_StoneClawTotem",requiredIds={6391}},
		{id=8170,name="Disease Cleansing Totem",subText="",level=38,skillLineId=374,skillLineAbilityId=4539,icon="Interface\\Icons\\Spell_Nature_DiseaseCleansingTotem"},
		{id=10391,name="Lightning Bolt",subText="Rank 7",level=38,skillLineId=375,skillLineAbilityId=8721,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={6041}},
		{id=10478,name="Frost Resistance Totem",subText="Rank 2",level=38,skillLineId=373,skillLineAbilityId=8757,icon="Interface\\Icons\\Spell_FrostResistanceTotem_01",requiredIds={8181}},
		{id=8249,name="Flametongue Totem",subText="Rank 2",level=38,skillLineId=373,skillLineAbilityId=8760,icon="Interface\\Icons\\Spell_Nature_GuardianWard",requiredIds={8227}},
		{id=8161,name="Strength of Earth Totem",subText="Rank 3",level=38,skillLineId=373,skillLineAbilityId=8773,icon="Interface\\Icons\\Spell_Nature_EarthBindTotem",requiredIds={8160}},
		{id=10456,name="Frostbrand Weapon",subText="Rank 3",level=38,skillLineId=373,skillLineAbilityId=8777,icon="Interface\\Icons\\Spell_Frost_FrostBrand",requiredIds={8038}}
	},
	[40] = {
		{id=8005,name="Healing Wave",subText="Rank 7",level=40,skillLineId=374,skillLineAbilityId=4488,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={959}},
		{id=6377,name="Healing Stream Totem",subText="Rank 3",level=40,skillLineId=374,skillLineAbilityId=4498,icon="Interface\\Icons\\INV_Spear_04",requiredIds={6375}},
		{id=8134,name="Lightning Shield",subText="Rank 5",level=40,skillLineId=373,skillLineAbilityId=4532,icon="Interface\\Icons\\Spell_Nature_LightningShield",requiredIds={945}},
		{id=8235,name="Windfury Weapon",subText="Rank 2",level=40,skillLineId=373,skillLineAbilityId=4573,icon="Interface\\Icons\\Spell_Nature_Cyclone",requiredIds={8232}},
		{id=1064,name="Chain Heal",subText="Rank 1",level=40,skillLineId=374,skillLineAbilityId=5648,icon="Interface\\Icons\\Spell_Nature_HealingWaveGreater"},
		{id=10447,name="Flame Shock",subText="Rank 4",level=40,skillLineId=375,skillLineAbilityId=8708,icon="Interface\\Icons\\Spell_Fire_FlameShock",requiredIds={8053}},
		{id=930,name="Chain Lightning",subText="Rank 2",level=40,skillLineId=375,skillLineAbilityId=8725,icon="Interface\\Icons\\Spell_Nature_ChainLightning",requiredIds={421}},
		{id=6365,name="Searing Totem",subText="Rank 4",level=40,skillLineId=375,skillLineAbilityId=8731,icon="Interface\\Icons\\Spell_Fire_SearingTotem",requiredIds={6364}},
		{id=16190,name="Mana Tide Totem",subText="Rank 1",level=40,skillLineId=374,skillLineAbilityId=8910,icon="Interface\\Icons\\Spell_Frost_SummonWaterElemental",requiredTalentId=590},
		{id=45505,name="Feral Spirit",subText="Rank 1",level=40,skillLineId=373,skillLineAbilityId=15035,icon="Interface\\Icons\\Spell_Shaman_FeralSpirit",race="Orc"},
		{id=45534,name="Lava Lash",subText="Rank 1",level=40,skillLineId=373,skillLineAbilityId=15044,icon="Interface\\Icons\\Ability_Shaman_Lavalash"},
		{id=45502,name="Ethereal Form",subText="Rank 1",level=40,skillLineId=374,skillLineAbilityId=36365,icon="Interface\\Icons\\Spell_Shaman_AstralShift",race="Tauren"}
	},
	[42] = {
		{id=10613,name="Windfury Totem",subText="Rank 2",level=42,skillLineId=373,skillLineAbilityId=5646,icon="Interface\\Icons\\Spell_Nature_Windfury",requiredIds={8512}},
		{id=8835,name="Grace of Air Totem",subText="Rank 1",level=42,skillLineId=373,skillLineAbilityId=5651,icon="Interface\\Icons\\Spell_Nature_InvisibilityTotem"},
		{id=11314,name="Fire Nova Totem",subText="Rank 4",level=42,skillLineId=375,skillLineAbilityId=8737,icon="Interface\\Icons\\Spell_Fire_SealOfFire",requiredIds={8499}},
		{id=10537,name="Fire Resistance Totem",subText="Rank 2",level=42,skillLineId=373,skillLineAbilityId=8779,icon="Interface\\Icons\\Spell_FireResistanceTotem_01",requiredIds={8184}}
	},
	[44] = {
		{id=10466,name="Lesser Healing Wave",subText="Rank 4",level=44,skillLineId=374,skillLineAbilityId=5600,icon="Interface\\Icons\\Spell_Nature_HealingWaveLesser",requiredIds={8010}},
		{id=10600,name="Nature Resistance Totem",subText="Rank 2",level=44,skillLineId=373,skillLineAbilityId=5640,icon="Interface\\Icons\\Spell_Nature_NatureResistanceTotem",requiredIds={10595}},
		{id=10392,name="Lightning Bolt",subText="Rank 8",level=44,skillLineId=375,skillLineAbilityId=8722,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={10391}},
		{id=10407,name="Stoneskin Totem",subText="Rank 5",level=44,skillLineId=373,skillLineAbilityId=8769,icon="Interface\\Icons\\Spell_Nature_StoneSkinTotem",requiredIds={10406}},
		{id=16315,name="Rockbiter Weapon",subText="Rank 6",level=44,skillLineId=373,skillLineAbilityId=8987,icon="Interface\\Icons\\Spell_Nature_RockBiter",requiredIds={16314}},
		{id=45509,name="Bloodlust",subText="Rank 1",level=44,skillLineId=373,skillLineAbilityId=15038,icon="Interface\\Icons\\Spell_Nature_BloodLust",requiredTalentId=901}
	},
	[46] = {
		{id=10496,name="Mana Spring Totem",subText="Rank 3",level=46,skillLineId=374,skillLineAbilityId=5627,icon="Interface\\Icons\\Spell_Nature_ManaRegenTotem",requiredIds={10495}},
		{id=10622,name="Chain Heal",subText="Rank 2",level=46,skillLineId=374,skillLineAbilityId=5649,icon="Interface\\Icons\\Spell_Nature_HealingWaveGreater",requiredIds={1064}},
		{id=15111,name="Windwall Totem",subText="Rank 2",level=46,skillLineId=373,skillLineAbilityId=8117,icon="Interface\\Icons\\Spell_Nature_EarthBind",requiredIds={15107}},
		{id=10472,name="Frost Shock",subText="Rank 3",level=46,skillLineId=375,skillLineAbilityId=8712,icon="Interface\\Icons\\Spell_Frost_FrostShock",requiredIds={8058}},
		{id=10586,name="Magma Totem",subText="Rank 3",level=46,skillLineId=375,skillLineAbilityId=8745,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={10585}},
		{id=16341,name="Flametongue Weapon",subText="Rank 5",level=46,skillLineId=373,skillLineAbilityId=8991,icon="Interface\\Icons\\Spell_Fire_FlameTounge",requiredIds={16339}}
	},
	[48] = {
		{id=10395,name="Healing Wave",subText="Rank 8",level=48,skillLineId=374,skillLineAbilityId=5569,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={8005}},
		{id=10413,name="Earth Shock",subText="Rank 6",level=48,skillLineId=375,skillLineAbilityId=5577,icon="Interface\\Icons\\Spell_Nature_EarthShock",requiredIds={10412}},
		{id=10431,name="Lightning Shield",subText="Rank 6",level=48,skillLineId=373,skillLineAbilityId=5588,icon="Interface\\Icons\\Spell_Nature_LightningShield",requiredIds={8134}},
		{id=10427,name="Stoneclaw Totem",subText="Rank 5",level=48,skillLineId=375,skillLineAbilityId=5590,icon="Interface\\Icons\\Spell_Nature_StoneClawTotem",requiredIds={6392}},
		{id=2860,name="Chain Lightning",subText="Rank 3",level=48,skillLineId=375,skillLineAbilityId=8726,icon="Interface\\Icons\\Spell_Nature_ChainLightning",requiredIds={930}},
		{id=16355,name="Frostbrand Weapon",subText="Rank 4",level=48,skillLineId=373,skillLineAbilityId=8993,icon="Interface\\Icons\\Spell_Frost_FrostBrand",requiredIds={10456}},
		{id=10526,name="Flametongue Totem",subText="Rank 3",level=48,skillLineId=373,skillLineAbilityId=9016,icon="Interface\\Icons\\Spell_Nature_GuardianWard",requiredIds={8249}},
		{id=17354,name="Mana Tide Totem",subText="Rank 2",level=48,skillLineId=374,skillLineAbilityId=9858,icon="Interface\\Icons\\Spell_Frost_SummonWaterElemental",requiredIds={16190}},
		{id=20776,name="Ancestral Spirit",subText="Rank 4",level=48,skillLineId=374,skillLineAbilityId=11800,icon="Interface\\Icons\\Spell_Nature_Regenerate",requiredIds={20610}},
		{id=45527,name="Water Shield",subText="Rank 1",level=48,skillLineId=373,skillLineAbilityId=30588,icon="Interface\\Icons\\Ability_Shaman_WaterShield"}
	},
	[50] = {
		{id=10462,name="Healing Stream Totem",subText="Rank 4",level=50,skillLineId=374,skillLineAbilityId=5598,icon="Interface\\Icons\\INV_Spear_04",requiredIds={6377}},
		{id=15207,name="Lightning Bolt",subText="Rank 9",level=50,skillLineId=375,skillLineAbilityId=8723,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={10392}},
		{id=10437,name="Searing Totem",subText="Rank 5",level=50,skillLineId=375,skillLineAbilityId=8732,icon="Interface\\Icons\\Spell_Fire_SearingTotem",requiredIds={6365}},
		{id=10486,name="Windfury Weapon",subText="Rank 3",level=50,skillLineId=373,skillLineAbilityId=8995,icon="Interface\\Icons\\Spell_Nature_Cyclone",requiredIds={8235}}
	},
	[52] = {
		{id=10467,name="Lesser Healing Wave",subText="Rank 5",level=52,skillLineId=374,skillLineAbilityId=5601,icon="Interface\\Icons\\Spell_Nature_HealingWaveLesser",requiredIds={10466}},
		{id=10448,name="Flame Shock",subText="Rank 5",level=52,skillLineId=375,skillLineAbilityId=8709,icon="Interface\\Icons\\Spell_Fire_FlameShock",requiredIds={10447}},
		{id=11315,name="Fire Nova Totem",subText="Rank 5",level=52,skillLineId=375,skillLineAbilityId=8738,icon="Interface\\Icons\\Spell_Fire_SealOfFire",requiredIds={11314}},
		{id=10442,name="Strength of Earth Totem",subText="Rank 4",level=52,skillLineId=373,skillLineAbilityId=8774,icon="Interface\\Icons\\Spell_Nature_EarthBindTotem",requiredIds={8161}},
		{id=10614,name="Windfury Totem",subText="Rank 3",level=52,skillLineId=373,skillLineAbilityId=9023,icon="Interface\\Icons\\Spell_Nature_Windfury",requiredIds={10613}},
		{id=45529,name="Calm Elements",subText="Rank 1",level=52,skillLineId=374,skillLineAbilityId=15043,icon="Interface\\Icons\\Spell_Nature_Swiftness"}
	},
	[54] = {
		{id=10623,name="Chain Heal",subText="Rank 3",level=54,skillLineId=374,skillLineAbilityId=5650,icon="Interface\\Icons\\Spell_Nature_HealingWaveGreater",requiredIds={10622}},
		{id=10479,name="Frost Resistance Totem",subText="Rank 3",level=54,skillLineId=373,skillLineAbilityId=8758,icon="Interface\\Icons\\Spell_FrostResistanceTotem_01",requiredIds={10478}},
		{id=10408,name="Stoneskin Totem",subText="Rank 6",level=54,skillLineId=373,skillLineAbilityId=8770,icon="Interface\\Icons\\Spell_Nature_StoneSkinTotem",requiredIds={10407}},
		{id=16316,name="Rockbiter Weapon",subText="Rank 7",level=54,skillLineId=373,skillLineAbilityId=8988,icon="Interface\\Icons\\Spell_Nature_RockBiter",requiredIds={16315}},
		{id=45500,name="Spirit Link",subText="Rank 1",level=54,skillLineId=374,skillLineAbilityId=15033,icon="Interface\\Icons\\Spell_Shaman_SpiritLink"}
	},
	[56] = {
		{id=10396,name="Healing Wave",subText="Rank 9",level=56,skillLineId=374,skillLineAbilityId=5570,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={10395}},
		{id=10432,name="Lightning Shield",subText="Rank 7",level=56,skillLineId=373,skillLineAbilityId=5589,icon="Interface\\Icons\\Spell_Nature_LightningShield",requiredIds={10431}},
		{id=10497,name="Mana Spring Totem",subText="Rank 4",level=56,skillLineId=374,skillLineAbilityId=5628,icon="Interface\\Icons\\Spell_Nature_ManaRegenTotem",requiredIds={10496}},
		{id=10627,name="Grace of Air Totem",subText="Rank 2",level=56,skillLineId=373,skillLineAbilityId=5652,icon="Interface\\Icons\\Spell_Nature_InvisibilityTotem",requiredIds={8835}},
		{id=15112,name="Windwall Totem",subText="Rank 3",level=56,skillLineId=373,skillLineAbilityId=8118,icon="Interface\\Icons\\Spell_Nature_EarthBind",requiredIds={15111}},
		{id=15208,name="Lightning Bolt",subText="Rank 10",level=56,skillLineId=375,skillLineAbilityId=8715,icon="Interface\\Icons\\Spell_Nature_Lightning",requiredIds={403}},
		{id=10605,name="Chain Lightning",subText="Rank 4",level=56,skillLineId=375,skillLineAbilityId=8727,icon="Interface\\Icons\\Spell_Nature_ChainLightning",requiredIds={2860}},
		{id=10587,name="Magma Totem",subText="Rank 4",level=56,skillLineId=375,skillLineAbilityId=8746,icon="Interface\\Icons\\Spell_Fire_SelfDestruct",requiredIds={10586}},
		{id=16342,name="Flametongue Weapon",subText="Rank 6",level=56,skillLineId=373,skillLineAbilityId=8992,icon="Interface\\Icons\\Spell_Fire_FlameTounge",requiredIds={16341}}
	},
	[58] = {
		{id=10428,name="Stoneclaw Totem",subText="Rank 6",level=58,skillLineId=375,skillLineAbilityId=5591,icon="Interface\\Icons\\Spell_Nature_StoneClawTotem",requiredIds={10427}},
		{id=10473,name="Frost Shock",subText="Rank 4",level=58,skillLineId=375,skillLineAbilityId=8713,icon="Interface\\Icons\\Spell_Frost_FrostShock",requiredIds={10472}},
		{id=10538,name="Fire Resistance Totem",subText="Rank 3",level=58,skillLineId=373,skillLineAbilityId=8780,icon="Interface\\Icons\\Spell_FireResistanceTotem_01",requiredIds={10537}},
		{id=16356,name="Frostbrand Weapon",subText="Rank 5",level=58,skillLineId=373,skillLineAbilityId=8994,icon="Interface\\Icons\\Spell_Frost_FrostBrand",requiredIds={16355}},
		{id=16387,name="Flametongue Totem",subText="Rank 4",level=58,skillLineId=373,skillLineAbilityId=9017,icon="Interface\\Icons\\Spell_Nature_GuardianWard",requiredIds={10526}},
		{id=17359,name="Mana Tide Totem",subText="Rank 3",level=58,skillLineId=374,skillLineAbilityId=9859,icon="Interface\\Icons\\Spell_Frost_SummonWaterElemental",requiredIds={17354}}
	},
	[60] = {
		{id=10414,name="Earth Shock",subText="Rank 7",level=60,skillLineId=375,skillLineAbilityId=5578,icon="Interface\\Icons\\Spell_Nature_EarthShock",requiredIds={10413}},
		{id=10463,name="Healing Stream Totem",subText="Rank 5",level=60,skillLineId=374,skillLineAbilityId=5599,icon="Interface\\Icons\\INV_Spear_04",requiredIds={10462}},
		{id=10468,name="Lesser Healing Wave",subText="Rank 6",level=60,skillLineId=374,skillLineAbilityId=5602,icon="Interface\\Icons\\Spell_Nature_HealingWaveLesser",requiredIds={10467}},
		{id=10601,name="Nature Resistance Totem",subText="Rank 3",level=60,skillLineId=373,skillLineAbilityId=5641,icon="Interface\\Icons\\Spell_Nature_NatureResistanceTotem",requiredIds={10600}},
		{id=10438,name="Searing Totem",subText="Rank 6",level=60,skillLineId=375,skillLineAbilityId=8733,icon="Interface\\Icons\\Spell_Fire_SearingTotem",requiredIds={10437}},
		{id=16362,name="Windfury Weapon",subText="Rank 4",level=60,skillLineId=373,skillLineAbilityId=8996,icon="Interface\\Icons\\Spell_Nature_Cyclone",requiredIds={10486}},
		{id=20777,name="Ancestral Spirit",subText="Rank 5",level=60,skillLineId=374,skillLineAbilityId=11801,icon="Interface\\Icons\\Spell_Nature_Regenerate",requiredIds={20776}},
		{id=25359,name="Grace of Air Totem",subText="Rank 3",level=60,skillLineId=373,skillLineAbilityId=13226,icon="Interface\\Icons\\Spell_Nature_InvisibilityTotem",requiredIds={10627}},
		{id=25361,name="Strength of Earth Totem",subText="Rank 5",level=60,skillLineId=373,skillLineAbilityId=13227,icon="Interface\\Icons\\Spell_Nature_EarthBindTotem",requiredIds={10442}},
		{id=25357,name="Healing Wave",subText="Rank 10",level=60,skillLineId=374,skillLineAbilityId=13228,icon="Interface\\Icons\\Spell_Nature_MagicImmunity",requiredIds={331}},
		{id=29228,name="Flame Shock",subText="Rank 6",level=60,skillLineId=375,skillLineAbilityId=14110,icon="Interface\\Icons\\Spell_Fire_FlameShock",requiredIds={10448}},
		{id=45514,name="Feral Spirit",subText="Rank 2",level=60,skillLineId=373,skillLineAbilityId=15036,icon="Interface\\Icons\\Spell_Shaman_FeralSpirit",race="Orc",requiredIds={45505}},
		{id=45511,name="Bloodlust",subText="Rank 2",level=60,skillLineId=373,skillLineAbilityId=15039,icon="Interface\\Icons\\Spell_Nature_BloodLust",requiredIds={45509}},
		{id=45521,name="Stormstrike",subText="Rank 2",level=60,skillLineId=373,skillLineAbilityId=15040,icon="Interface\\Icons\\Ability_Shaman_StormStrike"}
	}
})