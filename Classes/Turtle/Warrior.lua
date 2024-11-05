setfenv(1, WhatsTraining)
OverridenSpells["Warrior"] = {
	{72,1671,1672,7377},
	{78,284,285,1608,11564,11565,11566,11567,25286},
	{100,6178,26177,11578,26178,26179,26201},
	{694,7400,7402,20559,20560},
	{772,6546,6547,6548,11572,11573,11574},
	{1464,8820,11604,11605,45961},
	{1715,7372,7373},
	{6190,11554,11555,11556},
	{6552,6554},
	{6572,6574,7379,11600,11601,25288},
	{6673,5242,6192,11549,11550,11551,25289},
	{7369,11608,11609,20569},
	{7384,7887,11584,11585},
	{7386,7405,8380,11596,11597},
	{8198,8204,8205,11580,11581},
	{12294,21551,21552,21553},
	{20616,20617},
	{23892,23893,23894},
	{23922,23923,23924,23925}
}
ClassSpellsByLevel["Warrior"] = {
	[1] = {
		{id=78,name="Heroic Strike",subText="Rank 1",level=1,icon="Interface\\Icons\\Ability_Rogue_Ambush"},
		{id=2457,name="Battle Stance",subText="",level=1,icon="Interface\\Icons\\Ability_Warrior_OffensiveStance"},
		{id=6673,name="Battle Shout",subText="Rank 1",level=1,icon="Interface\\Icons\\Ability_Warrior_BattleShout"},
		{id=20647,name="Execute",subText="",level=1,icon="Interface\\Icons\\INV_Sword_48"}
	},
	[4] = {
		{id=772,name="Rend",subText="Rank 1",level=4,icon="Interface\\Icons\\Ability_Gouge"},
		{id=100,name="Charge",subText="Rank 1",level=4,icon="Interface\\Icons\\Ability_Warrior_Charge"}
	},
	[6] = {
		{id=6343,name="Thunder Clap",subText="Rank 1",level=6,icon="Interface\\Icons\\Spell_Nature_ThunderClap"}
	},
	[8] = {
		{id=284,name="Heroic Strike",subText="Rank 2",level=8,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={78}},
		{id=1715,name="Hamstring",subText="Rank 1",level=8,icon="Interface\\Icons\\Ability_ShockWave"}
	},
	[10] = {
		{id=6546,name="Rend",subText="Rank 2",level=10,icon="Interface\\Icons\\Ability_Gouge",requiredIds={772}},
		{id=2687,name="Bloodrage",subText="",level=10,icon="Interface\\Icons\\Ability_Racial_BloodRage"},
		{id=71,name="Defensive Stance",subText="",level=10,icon="Interface\\Icons\\Ability_Warrior_DefensiveStance"},
		{id=7386,name="Sunder Armor",subText="Rank 1",level=10,icon="Interface\\Icons\\Ability_Warrior_Sunder"},
		{id=355,name="Taunt",subText="",level=10,icon="Interface\\Icons\\Spell_Nature_Reincarnation"},
		{id=12798,name="Revenge Stun",subText="Rank 1",level=10,icon="Interface\\Icons\\Ability_Warrior_Revenge"}
	},
	[12] = {
		{id=72,name="Shield Bash",subText="Rank 1",level=12,icon="Interface\\Icons\\Ability_Warrior_ShieldBash"},
		{id=7384,name="Overpower",subText="Rank 1",level=12,icon="Interface\\Icons\\Ability_MeleeDamage"},
		{id=5242,name="Battle Shout",subText="Rank 2",level=12,icon="Interface\\Icons\\Ability_Warrior_BattleShout",requiredIds={6673}}
	},
	[14] = {
		{id=1160,name="Demoralizing Shout",subText="Rank 1",level=14,icon="Interface\\Icons\\Ability_Warrior_WarCry"},
		{id=6572,name="Revenge",subText="Rank 1",level=14,icon="Interface\\Icons\\Ability_Warrior_Revenge"}
	},
	[16] = {
		{id=285,name="Heroic Strike",subText="Rank 3",level=16,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={284}},
		{id=694,name="Mocking Blow",subText="Rank 1",level=16,icon="Interface\\Icons\\Ability_Warrior_PunishingBlow"},
		{id=2565,name="Shield Block",subText="",level=16,icon="Interface\\Icons\\Ability_Defend"}
	},
	[18] = {
		{id=8198,name="Thunder Clap",subText="Rank 2",level=18,icon="Interface\\Icons\\Spell_Nature_ThunderClap",requiredIds={6343}},
		{id=676,name="Disarm",subText="",level=18,icon="Interface\\Icons\\Ability_Warrior_Disarm"}
	},
	[20] = {
		{id=6547,name="Rend",subText="Rank 3",level=20,icon="Interface\\Icons\\Ability_Gouge",requiredIds={6546}},
		{id=845,name="Cleave",subText="Rank 1",level=20,icon="Interface\\Icons\\Ability_Warrior_Cleave"},
		{id=12323,name="Piercing Howl",subText="",level=20,icon="Interface\\Icons\\Spell_Shadow_DeathScream",requiredTalent={id=160,tabIndex=2}},
		{id=12975,name="Last Stand",subText="",level=20,icon="Interface\\Icons\\Spell_Holy_AshesToAshes",requiredTalent={id=153,tabIndex=3}},
		{id=20230,name="Retaliation",subText="",level=20,icon="Interface\\Icons\\Ability_Warrior_Challange"}
	},
	[22] = {
		{id=6192,name="Battle Shout",subText="Rank 3",level=22,icon="Interface\\Icons\\Ability_Warrior_BattleShout",requiredIds={5242}},
		{id=5246,name="Intimidating Shout",subText="",level=22,icon="Interface\\Icons\\Ability_GolemThunderClap"},
		{id=7405,name="Sunder Armor",subText="Rank 2",level=22,icon="Interface\\Icons\\Ability_Warrior_Sunder",requiredIds={7386}}
	},
	[24] = {
		{id=1608,name="Heroic Strike",subText="Rank 4",level=24,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={285}},
		{id=6190,name="Demoralizing Shout",subText="Rank 2",level=24,icon="Interface\\Icons\\Ability_Warrior_WarCry",requiredIds={1160}},
		{id=6574,name="Revenge",subText="Rank 2",level=24,icon="Interface\\Icons\\Ability_Warrior_Revenge",requiredIds={6572}}
	},
	[26] = {
		{id=7400,name="Mocking Blow",subText="Rank 2",level=26,icon="Interface\\Icons\\Ability_Warrior_PunishingBlow",requiredIds={694}},
		{id=6178,name="Charge",subText="Rank 2",level=26,icon="Interface\\Icons\\Ability_Warrior_Charge",requiredIds={100}},
		{id=1161,name="Challenging Shout",subText="",level=26,icon="Interface\\Icons\\Ability_BullRush"}
	},
	[28] = {
		{id=871,name="Shield Wall",subText="",level=28,icon="Interface\\Icons\\Ability_Warrior_ShieldWall"},
		{id=7887,name="Overpower",subText="Rank 2",level=28,icon="Interface\\Icons\\Ability_MeleeDamage",requiredIds={7384}},
		{id=8204,name="Thunder Clap",subText="Rank 3",level=28,icon="Interface\\Icons\\Spell_Nature_ThunderClap",requiredIds={8198}}
	},
	[30] = {
		{id=6548,name="Rend",subText="Rank 4",level=30,icon="Interface\\Icons\\Ability_Gouge",requiredIds={6547}},
		{id=1464,name="Slam",subText="Rank 1",level=30,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike"},
		{id=2458,name="Berserker Stance",subText="",level=30,icon="Interface\\Icons\\Ability_Racial_Avatar"},
		{id=7369,name="Cleave",subText="Rank 2",level=30,icon="Interface\\Icons\\Ability_Warrior_Cleave",requiredIds={845}},
		{id=12292,name="Sweeping Strikes",subText="",level=30,icon="Interface\\Icons\\Ability_Rogue_SliceDice",requiredTalent={id=133,tabIndex=1}},
		{id=12809,name="Concussion Blow",subText="",level=30,icon="Interface\\Icons\\Ability_ThunderBolt",requiredTalent={id=152,tabIndex=3}},
		{id=12328,name="Death Wish",subText="",level=30,icon="Interface\\Icons\\Spell_Shadow_DeathPact",requiredTalent={id=165,tabIndex=2}},
		{id=20252,name="Intercept",subText="Rank 1",level=30,icon="Interface\\Icons\\Ability_Rogue_Sprint"}
	},
	[32] = {
		{id=1671,name="Shield Bash",subText="Rank 2",level=32,icon="Interface\\Icons\\Ability_Warrior_ShieldBash",requiredIds={72}},
		{id=7372,name="Hamstring",subText="Rank 2",level=32,icon="Interface\\Icons\\Ability_ShockWave",requiredIds={1715}},
		{id=11564,name="Heroic Strike",subText="Rank 5",level=32,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={1608}},
		{id=11549,name="Battle Shout",subText="Rank 4",level=32,icon="Interface\\Icons\\Ability_Warrior_BattleShout",requiredIds={6192}},
		{id=18499,name="Berserker Rage",subText="",level=32,icon="Interface\\Icons\\Spell_Nature_AncestralGuardian"}
	},
	[34] = {
		{id=11554,name="Demoralizing Shout",subText="Rank 3",level=34,icon="Interface\\Icons\\Ability_Warrior_WarCry",requiredIds={6190}},
		{id=7379,name="Revenge",subText="Rank 3",level=34,icon="Interface\\Icons\\Ability_Warrior_Revenge",requiredIds={6574}},
		{id=8380,name="Sunder Armor",subText="Rank 3",level=34,icon="Interface\\Icons\\Ability_Warrior_Sunder",requiredIds={7405}}
	},
	[36] = {
		{id=7402,name="Mocking Blow",subText="Rank 3",level=36,icon="Interface\\Icons\\Ability_Warrior_PunishingBlow",requiredIds={7400}},
		{id=1680,name="Whirlwind",subText="",level=36,icon="Interface\\Icons\\Ability_Whirlwind"}
	},
	[38] = {
		{id=8820,name="Slam",subText="Rank 2",level=38,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike",requiredIds={1464}},
		{id=8205,name="Thunder Clap",subText="Rank 4",level=38,icon="Interface\\Icons\\Spell_Nature_ThunderClap",requiredIds={8204}},
		{id=6552,name="Pummel",subText="Rank 1",level=38,icon="Interface\\Icons\\INV_Gauntlets_04"}
	},
	[40] = {
		{id=11572,name="Rend",subText="Rank 5",level=40,icon="Interface\\Icons\\Ability_Gouge",requiredIds={6548}},
		{id=11565,name="Heroic Strike",subText="Rank 6",level=40,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={11564}},
		{id=11608,name="Cleave",subText="Rank 3",level=40,icon="Interface\\Icons\\Ability_Warrior_Cleave",requiredIds={7369}},
		{id=12294,name="Mortal Strike",subText="Rank 1",level=40,icon="Interface\\Icons\\Ability_Warrior_SavageBlow",requiredTalent={id=135,tabIndex=1}},
		{id=23881,name="Bloodthirst",subText="Rank 1",level=40,icon="Interface\\Icons\\Spell_Nature_BloodLust",requiredTalent={id=167,tabIndex=2}},
		{id=23885,name="Bloodthirst",subText="",level=40,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23880,name="Bloodthirst",subText="",level=40,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23922,name="Shield Slam",subText="Rank 1",level=40,icon="Interface\\Icons\\INV_Shield_05",requiredTalent={id=148,tabIndex=3}}
	},
	[42] = {
		{id=11550,name="Battle Shout",subText="Rank 5",level=42,icon="Interface\\Icons\\Ability_Warrior_BattleShout",requiredIds={11549}},
		{id=20616,name="Intercept",subText="Rank 2",level=42,icon="Interface\\Icons\\Ability_Rogue_Sprint",requiredIds={20252}}
	},
	[44] = {
		{id=11584,name="Overpower",subText="Rank 3",level=44,icon="Interface\\Icons\\Ability_MeleeDamage",requiredIds={7887}},
		{id=11555,name="Demoralizing Shout",subText="Rank 4",level=44,icon="Interface\\Icons\\Ability_Warrior_WarCry",requiredIds={11554}},
		{id=11600,name="Revenge",subText="Rank 4",level=44,icon="Interface\\Icons\\Ability_Warrior_Revenge",requiredIds={7379}}
	},
	[46] = {
		{id=11578,name="Charge",subText="Rank 3",level=46,icon="Interface\\Icons\\Ability_Warrior_Charge",requiredIds={6178}},
		{id=11604,name="Slam",subText="Rank 3",level=46,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike",requiredIds={8820}},
		{id=11596,name="Sunder Armor",subText="Rank 4",level=46,icon="Interface\\Icons\\Ability_Warrior_Sunder",requiredIds={8380}},
		{id=20559,name="Mocking Blow",subText="Rank 4",level=46,icon="Interface\\Icons\\Ability_Warrior_PunishingBlow",requiredIds={7402}}
	},
	[48] = {
		{id=11566,name="Heroic Strike",subText="Rank 7",level=48,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={11565}},
		{id=11580,name="Thunder Clap",subText="Rank 5",level=48,icon="Interface\\Icons\\Spell_Nature_ThunderClap",requiredIds={8205}},
		{id=21551,name="Mortal Strike",subText="Rank 2",level=48,icon="Interface\\Icons\\Ability_Warrior_SavageBlow",requiredIds={12294}},
		{id=23892,name="Bloodthirst",subText="Rank 2",level=48,icon="Interface\\Icons\\Spell_Nature_BloodLust",requiredIds={23881}},
		{id=23886,name="Bloodthirst",subText="",level=48,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23889,name="Bloodthirst",subText="",level=48,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23923,name="Shield Slam",subText="Rank 2",level=48,icon="Interface\\Icons\\INV_Shield_05",requiredIds={23922}}
	},
	[50] = {
		{id=11573,name="Rend",subText="Rank 6",level=50,icon="Interface\\Icons\\Ability_Gouge",requiredIds={11572}},
		{id=11609,name="Cleave",subText="Rank 4",level=50,icon="Interface\\Icons\\Ability_Warrior_Cleave",requiredIds={11608}},
		{id=1719,name="Recklessness",subText="",level=50,icon="Interface\\Icons\\Ability_CriticalStrike"}
	},
	[52] = {
		{id=1672,name="Shield Bash",subText="Rank 3",level=52,icon="Interface\\Icons\\Ability_Warrior_ShieldBash",requiredIds={1671}},
		{id=11551,name="Battle Shout",subText="Rank 6",level=52,icon="Interface\\Icons\\Ability_Warrior_BattleShout",requiredIds={11550}},
		{id=20617,name="Intercept",subText="Rank 3",level=52,icon="Interface\\Icons\\Ability_Rogue_Sprint",requiredIds={20616}}
	},
	[54] = {
		{id=7373,name="Hamstring",subText="Rank 3",level=54,icon="Interface\\Icons\\Ability_ShockWave",requiredIds={7372}},
		{id=11605,name="Slam",subText="Rank 4",level=54,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike",requiredIds={11604}},
		{id=11556,name="Demoralizing Shout",subText="Rank 5",level=54,icon="Interface\\Icons\\Ability_Warrior_WarCry",requiredIds={11555}},
		{id=11601,name="Revenge",subText="Rank 5",level=54,icon="Interface\\Icons\\Ability_Warrior_Revenge",requiredIds={11600}},
		{id=21552,name="Mortal Strike",subText="Rank 3",level=54,icon="Interface\\Icons\\Ability_Warrior_SavageBlow",requiredIds={21551}},
		{id=23893,name="Bloodthirst",subText="Rank 3",level=54,icon="Interface\\Icons\\Spell_Nature_BloodLust",requiredIds={23892}},
		{id=23887,name="Bloodthirst",subText="",level=54,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23924,name="Shield Slam",subText="Rank 3",level=54,icon="Interface\\Icons\\INV_Shield_05",requiredIds={23923}},
		{id=45599,name="Decisive Strike",subText="Rank 1",level=54,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike"},
		{id=45960,name="Decisive Strike",subText="Rank 2",level=54,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike",requiredIds={45599}},
		{id=45960,name="Decisive Strike",subText="Rank 2",level=54,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike",requiredIds={45599}},
		{id=45961,name="Slam",subText="Rank 5",level=54,icon="Interface\\Icons\\Ability_Warrior_DecisiveStrike",requiredIds={11605}}
	},
	[56] = {
		{id=11567,name="Heroic Strike",subText="Rank 8",level=56,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={11566}},
		{id=20560,name="Mocking Blow",subText="Rank 5",level=56,icon="Interface\\Icons\\Ability_Warrior_PunishingBlow",requiredIds={20559}}
	},
	[58] = {
		{id=11581,name="Thunder Clap",subText="Rank 6",level=58,icon="Interface\\Icons\\Spell_Nature_ThunderClap",requiredIds={11580}},
		{id=11597,name="Sunder Armor",subText="Rank 5",level=58,icon="Interface\\Icons\\Ability_Warrior_Sunder",requiredIds={11596}},
		{id=6554,name="Pummel",subText="Rank 2",level=58,icon="Interface\\Icons\\INV_Gauntlets_04",requiredIds={6552}}
	},
	[60] = {
		{id=11585,name="Overpower",subText="Rank 4",level=60,icon="Interface\\Icons\\Ability_MeleeDamage",requiredIds={11584}},
		{id=11574,name="Rend",subText="Rank 7",level=60,icon="Interface\\Icons\\Ability_Gouge",requiredIds={11573}},
		{id=20569,name="Cleave",subText="Rank 5",level=60,icon="Interface\\Icons\\Ability_Warrior_Cleave",requiredIds={11609}},
		{id=21553,name="Mortal Strike",subText="Rank 4",level=60,icon="Interface\\Icons\\Ability_Warrior_SavageBlow",requiredIds={21552}},
		{id=23890,name="Bloodthirst",subText="",level=60,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23894,name="Bloodthirst",subText="Rank 4",level=60,icon="Interface\\Icons\\Spell_Nature_BloodLust",requiredIds={23893}},
		{id=23888,name="Bloodthirst",subText="",level=60,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23891,name="Bloodthirst",subText="",level=60,icon="Interface\\Icons\\Spell_Nature_BloodLust"},
		{id=23925,name="Shield Slam",subText="Rank 4",level=60,icon="Interface\\Icons\\INV_Shield_05",requiredIds={23924}},
		{id=25286,name="Heroic Strike",subText="Rank 9",level=60,icon="Interface\\Icons\\Ability_Rogue_Ambush",requiredIds={11567}},
		{id=25288,name="Revenge",subText="Rank 6",level=60,icon="Interface\\Icons\\Ability_Warrior_Revenge",requiredIds={11601}},
		{id=25289,name="Battle Shout",subText="Rank 7",level=60,icon="Interface\\Icons\\Ability_Warrior_BattleShout",requiredIds={11551}},
		{id=45595,name="Intervene",subText="Rank 1",level=60,icon="Interface\\Icons\\Ability_Warrior_Intervene"}
	}
}