local _, wt = ...
if (wt.currentClass ~= "WARRIOR") then
	return
end

wt.SpellsByLevel = {
	[38] = {
		{
			["id"] = 6552,
			["name"] = "Pummel",
			["cost"] = 12825,
		}, -- [1]
	},
	[46] = {
		{
			["id"] = 1161,
			["name"] = "Challenging Shout",
			["cost"] = 18525,
		}, -- [1]
	},
	[54] = {
		{
			["id"] = 18499,
			["name"] = "Berserker Rage",
			["cost"] = 22800,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 20230,
			["name"] = "Retaliation",
			["cost"] = 76950,
		}, -- [1]
	},
	[76] = {
		{
			["id"] = 55694,
			["name"] = "Enraged Regeneration",
			["cost"] = 176700,
		}, -- [1]
	},
	[7] = {
		{
			["id"] = 772,
			["name"] = "Rend",
			["cost"] = 271,
		}, -- [1]
	},
	[10] = {
		{
			["id"] = 71,
			["name"] = "Defensive Stance",
			["cost"] = 646,
		}, -- [1]
		{
			["id"] = 3127,
			["name"] = "Parry",
			["cost"] = 646,
		}, -- [2]
	},
	[12] = {
		{
			["id"] = 355,
			["name"] = "Taunt",
			["cost"] = 1023,
		}, -- [1]
	},
	[14] = {
		{
			["id"] = 78,
			["name"] = "Heroic Strike",
			["cost"] = 1348,
		}, -- [1]
	},
	[16] = {
		{
			["id"] = 5308,
			["name"] = "Execute",
			["cost"] = 1957,
		}, -- [1]
	},
	[20] = {
		{
			["id"] = 57755,
			["name"] = "Heroic Throw",
			["cost"] = 3420,
		}, -- [1]
		{
			["id"] = 6673,
			["name"] = "Battle Shout",
			["cost"] = 3420,
		}, -- [2]
	},
	[24] = {
		{
			["id"] = 845,
			["name"] = "Cleave",
			["cost"] = 4845,
		}, -- [1]
	},
	[28] = {
		{
			["id"] = 2565,
			["name"] = "Shield Block",
			["cost"] = 7125,
		}, -- [1]
	},
	[40] = {
		{
			["id"] = 750,
			["name"] = "Plate Mail",
			["cost"] = 14250,
		}, -- [1]
		{
			["id"] = 6572,
			["name"] = "Revenge",
			["cost"] = 14250,
		}, -- [2]
	},
	[48] = {
		{
			["id"] = 871,
			["name"] = "Shield Wall",
			["cost"] = 19950,
		}, -- [1]
	},
	[56] = {
		{
			["id"] = 1134,
			["name"] = "Inner Rage",
			["cost"] = 24225,
		}, -- [1]
	},
	[64] = {
		{
			["id"] = 1719,
			["name"] = "Recklessness",
			["cost"] = 88350,
		}, -- [1]
	},
	[80] = {
		{
			["id"] = 87500,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 86346,
			["name"] = "Colossus Smash",
			["cost"] = 222300,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 23920,
			["name"] = "Spell Reflection",
			["cost"] = 99750,
		}, -- [1]
	},
	[34] = {
		{
			["id"] = 676,
			["name"] = "Disarm",
			["cost"] = 9975,
		}, -- [1]
	},
	[42] = {
		{
			["id"] = 5246,
			["name"] = "Intimidating Shout",
			["cost"] = 15675,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 20252,
			["name"] = "Intercept",
			["cost"] = 21375,
		}, -- [1]
		{
			["id"] = 87509,
			["name"] = "Plate Specialization",
			["cost"] = 21375,
		}, -- [2]
	},
	[58] = {
		{
			["id"] = 12678,
			["name"] = "Stance Mastery",
			["cost"] = 25650,
		}, -- [1]
	},
	[68] = {
		{
			["id"] = 469,
			["name"] = "Commanding Shout",
			["cost"] = 111150,
		}, -- [1]
	},
	[9] = {
		{
			["id"] = 6343,
			["name"] = "Thunder Clap",
			["cost"] = 524,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 6544,
			["name"] = "Heroic Leap",
			["cost"] = 267900,
		}, -- [1]
	},
	[18] = {
		{
			["id"] = 7386,
			["name"] = "Sunder Armor",
			["cost"] = 2646,
		}, -- [1]
	},
	[22] = {
		{
			["id"] = 7384,
			["name"] = "Overpower",
			["cost"] = 3990,
		}, -- [1]
	},
	[26] = {
		{
			["id"] = 1715,
			["name"] = "Hamstring",
			["cost"] = 5700,
		}, -- [1]
	},
	[30] = {
		{
			["id"] = 2458,
			["name"] = "Berserker Stance",
			["cost"] = 7125,
		}, -- [1]
	},
	[36] = {
		{
			["id"] = 1680,
			["name"] = "Whirlwind",
			["cost"] = 11400,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 1464,
			["name"] = "Slam",
			["cost"] = 18525,
		}, -- [1]
	},
	[52] = {
		{
			["id"] = 1160,
			["name"] = "Demoralizing Shout",
			["cost"] = 21375,
		}, -- [1]
	},
	[72] = {
		{
			["id"] = 3411,
			["name"] = "Intervene",
			["cost"] = 142500,
		}, -- [1]
	},
	[83] = {
		{
			["id"] = 97462,
			["name"] = "Rallying Cry",
			["cost"] = 245100,
		}, -- [1]
	},
	[74] = {
		{
			["id"] = 64382,
			["name"] = "Shattering Throw",
			["cost"] = 159600,
		}, -- [1]
	},
	[5] = {
		{
			["id"] = 34428,
			["name"] = "Victory Rush",
			["cost"] = 135,
		}, -- [1]
	},
	[3] = {
		{
			["id"] = 100,
			["name"] = "Charge",
			["cost"] = 57,
		}, -- [1]
	},
}