local _, wt = ...
if (wt.currentClass ~= "ROGUE") then
	return
end

wt.SpellsByLevel = {
nil, -- [1]
	nil, -- [2]
	{
		{
			["id"] = 2098,
			["name"] = "Eviscerate",
			["cost"] = 57,
		}, -- [1]
	}, -- [3]
	nil, -- [4]
	{
		{
			["id"] = 1784,
			["name"] = "Stealth",
			["cost"] = 135,
		}, -- [1]
	}, -- [5]
	nil, -- [6]
	{
		{
			["id"] = 921,
			["name"] = "Pick Pocket",
			["cost"] = 271,
		}, -- [1]
	}, -- [7]
	{
		{
			["id"] = 8676,
			["name"] = "Ambush",
			["cost"] = 370,
		}, -- [1]
	}, -- [8]
	{
		{
			["id"] = 5277,
			["name"] = "Evasion",
			["cost"] = 524,
		}, -- [1]
	}, -- [9]
	{
		{
			["id"] = 6770,
			["name"] = "Sap",
			["cost"] = 646,
		}, -- [1]
	}, -- [10]
	nil, -- [11]
	{
		{
			["id"] = 82245,
			["name"] = "Parry",
			["cost"] = 1023,
		}, -- [1]
		{
			["id"] = 73651,
			["name"] = "Recuperate",
			["cost"] = 1023,
		}, -- [2]
	}, -- [12]
	nil, -- [13]
	{
		{
			["id"] = 1766,
			["name"] = "Kick",
			["cost"] = 1348,
		}, -- [1]
	}, -- [14]
	nil, -- [15]
	{
		{
			["id"] = 1776,
			["name"] = "Gouge",
			["cost"] = 1957,
		}, -- [1]
		{
			["id"] = 2983,
			["name"] = "Sprint",
			["cost"] = 1957,
		}, -- [2]
	}, -- [16]
	nil, -- [17]
	{
		{
			["id"] = 53,
			["name"] = "Backstab",
			["cost"] = 2646,
		}, -- [1]
	}, -- [18]
	nil, -- [19]
	{
		{
			["id"] = 1804,
			["name"] = "Pick Lock",
			["cost"] = 3420,
		}, -- [1]
	}, -- [20]
	nil, -- [21]
	{
		{
			["id"] = 5171,
			["name"] = "Slice and Dice",
			["cost"] = 3990,
		}, -- [1]
	}, -- [22]
	nil, -- [23]
	{
		{
			["id"] = 1856,
			["name"] = "Vanish",
			["cost"] = 4845,
		}, -- [1]
	}, -- [24]
	nil, -- [25]
	{
		{
			["id"] = 1833,
			["name"] = "Cheap Shot",
			["cost"] = 5700,
		}, -- [1]
	}, -- [26]
	nil, -- [27]
	{
		{
			["id"] = 1725,
			["name"] = "Distract",
			["cost"] = 7125,
		}, -- [1]
	}, -- [28]
	nil, -- [29]
	{
		{
			["id"] = 408,
			["name"] = "Kidney Shot",
			["cost"] = 7125,
		}, -- [1]
	}, -- [30]
	nil, -- [31]
	{
		{
			["id"] = 2836,
			["name"] = "Detect Traps",
			["cost"] = 8550,
		}, -- [1]
	}, -- [32]
	[58] = {
		{
			["id"] = 31224,
			["name"] = "Cloak of Shadows",
			["cost"] = 25650,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 76577,
			["name"] = "Smoke Bomb",
			["cost"] = 267900,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 26679,
			["name"] = "Deadly Throw",
			["cost"] = 76950,
		}, -- [1]
	},
	[34] = {
		{
			["id"] = 2094,
			["name"] = "Blind",
			["cost"] = 9975,
		}, -- [1]
	},
	[36] = {
		{
			["id"] = 8647,
			["name"] = "Expose Armor",
			["cost"] = 11400,
		}, -- [1]
	},
	[38] = {
		{
			["id"] = 51722,
			["name"] = "Dismantle",
			["cost"] = 12825,
		}, -- [1]
	},
	[40] = {
		{
			["id"] = 703,
			["name"] = "Garrote",
			["cost"] = 14250,
		}, -- [1]
	},
	[80] = {
		{
			["id"] = 51723,
			["name"] = "Fan of Knives",
			["cost"] = 210900,
		}, -- [1]
		{
			["id"] = 87496,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [2]
	},
	[42] = {
		{
			["id"] = 1966,
			["name"] = "Feint",
			["cost"] = 15675,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 1842,
			["name"] = "Disarm Trap",
			["cost"] = 18525,
		}, -- [1]
	},
	[46] = {
		{
			["id"] = 1943,
			["name"] = "Rupture",
			["cost"] = 18525,
		}, -- [1]
	},
	[48] = {
		{
			["id"] = 1860,
			["name"] = "Safe Fall",
			["cost"] = 19950,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 87504,
			["name"] = "Leather Specialization",
			["cost"] = 21375,
		}, -- [1]
	},
	[75] = {
		{
			["id"] = 57934,
			["name"] = "Tricks of the Trade",
			["cost"] = 168150,
		}, -- [1]
	},
	[83] = {
		{
			["id"] = 73981,
			["name"] = "Redirect",
			["cost"] = 245100,
		}, -- [1]
	},
	[70] = {
		{
			["id"] = 5938,
			["name"] = "Shiv",
			["cost"] = 125400,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 74001,
			["name"] = "Combat Readiness",
			["cost"] = 222300,
		}, -- [1]
	},
	[54] = {
		{
			["id"] = 32645,
			["name"] = "Envenom",
			["cost"] = 22800,
		}, -- [1]
	},
}