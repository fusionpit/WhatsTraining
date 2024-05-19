local _, wt = ...
if (wt.currentClass ~= "HUNTER") then return end

wt.SpellsByLevel = {
	nil, -- [1]
	nil, -- [2]
	{
		{
			["id"] = 56641,
			["name"] = "Steady Shot",
			["cost"] = 57,
		}, -- [1]
	}, -- [3]
	{
		{
			["id"] = 1494,
			["name"] = "Track Beasts",
			["cost"] = 93,
		}, -- [1]
	}, -- [4]
	nil, -- [5]
	{
		{
			["id"] = 2973,
			["name"] = "Raptor Strike",
			["cost"] = 180,
		}, -- [1]
	}, -- [6]
	nil, -- [7]
	{
		{
			["id"] = 5116,
			["name"] = "Concussive Shot",
			["cost"] = 370,
		}, -- [1]
		{
			["id"] = 82243,
			["name"] = "Parry",
			["cost"] = 370,
		}, -- [2]
	}, -- [8]
	nil, -- [9]
	{
		{
			["id"] = 1462,
			["name"] = "Beast Lore",
			["cost"] = 646,
		}, -- [1]
		{
			["id"] = 2641,
			["name"] = "Dismiss Pet",
			["cost"] = 104,
		}, -- [2]
		{
			["id"] = 6991,
			["name"] = "Feed Pet",
			["cost"] = 104,
		}, -- [3]
		{
			["id"] = 34026,
			["name"] = "Kill Command",
			["cost"] = 646,
		}, -- [4]
		{
			["id"] = 1515,
			["name"] = "Tame Beast",
			["cost"] = 646,
		}, -- [5]
		{
			["id"] = 1978,
			["name"] = "Serpent Sting",
			["cost"] = 1023,
		}, -- [6]
	}, -- [10]
	nil, -- [11]
	{
		{
			["id"] = 13165,
			["name"] = "Aspect of the Hawk",
			["cost"] = 1023,
		}, -- [1]
		{
			["id"] = 19883,
			["name"] = "Track Humanoids",
			["cost"] = 1023,
		}, -- [2]
		{
			["id"] = 2974,
			["name"] = "Wing Clip",
			["cost"] = 1023,
		}, -- [3]
	}, -- [12]
	nil, -- [13]
	{
		{
			["id"] = 1130,
			["name"] = "Hunter's Mark",
			["cost"] = 1348,
		}, -- [1]
		{
			["id"] = 781,
			["name"] = "Disengage",
			["cost"] = 1348,
		}, -- [2]
	}, -- [14]
	{
		{
			["id"] = 19503,
			["name"] = "Scatter Shot",
			["cost"] = 1643,
		}, -- [1]
	}, -- [15]
	{
		{
			["id"] = 6197,
			["name"] = "Eagle Eye",
			["cost"] = 1957,
		}, -- [1]
		{
			["id"] = 136,
			["name"] = "Mend Pet",
			["cost"] = 1957,
		}, -- [2]
	}, -- [16]
	[83] = {
		{
			["id"] = 82661,
			["name"] = "Aspect of the Fox",
			["cost"] = 245100,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 51753,
			["name"] = "Camouflage",
			["cost"] = 267900,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 83244,
			["name"] = "Call Pet 4",
			["cost"] = 76950,
		}, -- [1]
	},
	[32] = {
		{
			["id"] = 5384,
			["name"] = "Feign Death",
			["cost"] = 8550,
		}, -- [1]
	},
	[64] = {
		{
			["id"] = 20043,
			["name"] = "Aspect of the Wild",
			["cost"] = 88350,
		}, -- [1]
	},
	[34] = {
		{
			["id"] = 19880,
			["name"] = "Track Elementals",
			["cost"] = 9975,
		}, -- [1]
	},
	[35] = {
		{
			["id"] = 53351,
			["name"] = "Kill Shot",
			["cost"] = 9975,
		}, -- [1]
		{
			["id"] = 19801,
			["name"] = "Tranquilizing Shot",
			["cost"] = 9975,
		}, -- [2]
	},
	[36] = {
		{
			["id"] = 1513,
			["name"] = "Scare Beast",
			["cost"] = 11400,
		}, -- [1]
		{
			["id"] = 19878,
			["name"] = "Track Demons",
			["cost"] = 11400,
		}, -- [2]
	},
	[18] = {
		{
			["id"] = 83242,
			["name"] = "Call Pet 2",
			["cost"] = 2646,
		}, -- [1]
		{
			["id"] = 19884,
			["name"] = "Track Undead",
			["cost"] = 2646,
		}, -- [2]
	},
	[38] = {
		{
			["id"] = 1543,
			["name"] = "Flare",
			["cost"] = 12825,
		}, -- [1]
		{
			["id"] = 13813,
			["name"] = "Explosive Trap",
			["cost"] = 12825,
		}, -- [2]
	},
	[20] = {
		{
			["id"] = 674,
			["name"] = "Dual Wield",
			["cost"] = 3420,
		}, -- [1]
	},
	[40] = {
		{
			["id"] = 82654,
			["name"] = "Widow Venom",
			["cost"] = 14250,
		}, -- [1]
		{
			["id"] = 8737,
			["name"] = "Mail",
			["cost"] = 14250,
		}, -- [2]
	},
	[80] = {
		{
			["id"] = 87493,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [1]
	},
	[82] = {
		{
			["id"] = 83245,
			["name"] = "Call Pet 5",
			["cost"] = 233700,
		}, -- [1]
	},
	[22] = {
		{
			["id"] = 13795,
			["name"] = "Immolation Trap",
			["cost"] = 3990,
		}, -- [1]
	},
	[78] = {
		{
			["id"] = 19263,
			["name"] = "Deterrence",
			["cost"] = 193800,
		}, -- [1]
	},
	[76] = {
		{
			["id"] = 34477,
			["name"] = "Misdirection",
			["cost"] = 176700,
		}, -- [1]
	},
	[46] = {
		{
			["id"] = 13809,
			["name"] = "Ice Trap",
			["cost"] = 18525,
		}, -- [1]
		{
			["id"] = 19882,
			["name"] = "Track Giants",
			["cost"] = 18525,
		}, -- [2]
	},
	[24] = {
		{
			["id"] = 5118,
			["name"] = "Aspect of the Cheetah",
			["cost"] = 4845,
		}, -- [1]
		{
			["id"] = 2643,
			["name"] = "Multi-Shot",
			["cost"] = 4845,
		}, -- [2]
	},
	[48] = {
		{
			["id"] = 77769,
			["name"] = "Trap Launcher",
			["cost"] = 19950,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 34600,
			["name"] = "Snake Trap",
			["cost"] = 99750,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 87506,
			["name"] = "Mail Specialization",
			["cost"] = 21375,
		}, -- [1]
	},
	[26] = {
		{
			["id"] = 19885,
			["name"] = "Track Hidden",
			["cost"] = 5700,
		}, -- [1]
	},
	[52] = {
		{
			["id"] = 20736,
			["name"] = "Distracting Shot",
			["cost"] = 21375,
		}, -- [1]
		{
			["id"] = 19879,
			["name"] = "Track Dragonkin",
			["cost"] = 21375,
		}, -- [2]
	},
	[74] = {
		{
			["id"] = 53271,
			["name"] = "Master's Call",
			["cost"] = 159600,
		}, -- [1]
	},
	[54] = {
		{
			["id"] = 3045,
			["name"] = "Rapid Fire",
			["cost"] = 22800,
		}, -- [1]
	},
	[28] = {
		{
			["id"] = 1499,
			["name"] = "Freezing Trap",
			["cost"] = 7125,
		}, -- [1]
	},
	[56] = {
		{
			["id"] = 13159,
			["name"] = "Aspect of the Pack",
			["cost"] = 24225,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 77767,
			["name"] = "Cobra Shot",
			["cost"] = 222300,
		}, -- [1]
	},
	[42] = {
		{
			["id"] = 83243,
			["name"] = "Call Pet 3",
			["cost"] = 15675,
		}, -- [1]
	},
}