local _, wt = ...
if (wt.currentClass ~= "PRIEST") then return end

wt.SpellsByLevel = {
	nil, -- [1]
	nil, -- [2]
	{
		{
			["id"] = 2061,
			["name"] = "Flash Heal",
			["cost"] = 57,
		}, -- [1]
	}, -- [3]
	{
		{
			["id"] = 589,
			["name"] = "Shadow Word: Pain",
			["cost"] = 93,
		}, -- [1]
	}, -- [4]
	{
		{
			["id"] = 17,
			["name"] = "Power Word: Shield",
			["cost"] = 135,
		}, -- [1]
	}, -- [5]
	nil, -- [6]
	{
		{
			["id"] = 588,
			["name"] = "Inner Fire",
			["cost"] = 271,
		}, -- [1]
	}, -- [7]
	{
		{
			["id"] = 139,
			["name"] = "Renew",
			["cost"] = 370,
		}, -- [1]
	}, -- [8]
	{
		{
			["id"] = 8092,
			["name"] = "Mind Blast",
			["cost"] = 524,
		}, -- [1]
	}, -- [9]
	nil, -- [10]
	nil, -- [11]
	{
		{
			["id"] = 8122,
			["name"] = "Psychic Scream",
			["cost"] = 1023,
		}, -- [1]
	}, -- [12]
	nil, -- [13]
	{
		{
			["id"] = 21562,
			["name"] = "Power Word: Fortitude",
			["cost"] = 1348,
		}, -- [1]
		{
			["id"] = 2006,
			["name"] = "Resurrection",
			["cost"] = 1348,
		}, -- [2]
	}, -- [14]
	nil, -- [15]
	{
		{
			["id"] = 2050,
			["name"] = "Heal",
			["cost"] = 1957,
		}, -- [1]
	}, -- [16]
	[58] = {
		{
			["id"] = 8129,
			["name"] = "Mana Burn",
			["cost"] = 25650,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 73325,
			["name"] = "Leap of Faith",
			["cost"] = 267900,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 15237,
			["name"] = "Holy Nova",
			["cost"] = 76950,
		}, -- [1]
	},
	[32] = {
		{
			["id"] = 9484,
			["name"] = "Shackle Undead",
			["cost"] = 8550,
		}, -- [1]
		{
			["id"] = 32379,
			["name"] = "Shadow Word: Death",
			["cost"] = 8550,
		}, -- [2]
	},
	[64] = {
		{
			["id"] = 64901,
			["name"] = "Hymn of Hope",
			["cost"] = 88350,
		}, -- [1]
	},
	[34] = {
		{
			["id"] = 1706,
			["name"] = "Levitate",
			["cost"] = 9975,
		}, -- [1]
	},
	[68] = {
		{
			["id"] = 33076,
			["name"] = "Prayer of Mending",
			["cost"] = 111150,
		}, -- [1]
	},
	[36] = {
		{
			["id"] = 2096,
			["name"] = "Mind Vision",
			["cost"] = 11400,
		}, -- [1]
	},
	[72] = {
		{
			["id"] = 32375,
			["name"] = "Mass Dispel",
			["cost"] = 142500,
		}, -- [1]
	},
	[38] = {
		{
			["id"] = 2060,
			["name"] = "Greater Heal",
			["cost"] = 15675,
		}, -- [1]
		{
			["id"] = 605,
			["name"] = "Mind Control",
			["cost"] = 12825,
		}, -- [2]
	},
	[78] = {
		{
			["id"] = 64843,
			["name"] = "Divine Hymn",
			["cost"] = 193800,
		}, -- [1]
	},
	[80] = {
		{
			["id"] = 87495,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [1]
	},
	[22] = {
		{
			["id"] = 528,
			["name"] = "Cure Disease",
			["cost"] = 3990,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 83968,
			["name"] = "Mass Resurrection",
			["cost"] = 18525,
		}, -- [1]
		{
			["id"] = 596,
			["name"] = "Prayer of Healing",
			["cost"] = 18525,
		}, -- [2]
	},
	[83] = {
		{
			["id"] = 73413,
			["name"] = "Inner Will",
			["cost"] = 245100,
		}, -- [1]
	},
	[24] = {
		{
			["id"] = 586,
			["name"] = "Fade",
			["cost"] = 4845,
		}, -- [1]
	},
	[48] = {
		{
			["id"] = 32546,
			["name"] = "Binding Heal",
			["cost"] = 19950,
		}, -- [1]
	},
	[74] = {
		{
			["id"] = 48045,
			["name"] = "Mind Sear",
			["cost"] = 159600,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 89745,
			["name"] = "Mysticism",
			["cost"] = 21375,
		}, -- [1]
	},
	[26] = {
		{
			["id"] = 527,
			["name"] = "Dispel Magic",
			["cost"] = 5700,
		}, -- [1]
	},
	[52] = {
		{
			["id"] = 27683,
			["name"] = "Shadow Protection",
			["cost"] = 21375,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 34433,
			["name"] = "Shadowfiend",
			["cost"] = 99750,
		}, -- [1]
	},
	[54] = {
		{
			["id"] = 6346,
			["name"] = "Fear Ward",
			["cost"] = 22800,
		}, -- [1]
	},
	[28] = {
		{
			["id"] = 2944,
			["name"] = "Devouring Plague",
			["cost"] = 7125,
		}, -- [1]
	},
	[56] = {
		{
			["id"] = 453,
			["name"] = "Mind Soothe",
			["cost"] = 24225,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 73510,
			["name"] = "Mind Spike",
			["cost"] = 222300,
		}, -- [1]
	},
	[18] = {
		{
			["id"] = 14914,
			["name"] = "Holy Fire",
			["cost"] = 2646,
		}, -- [1]
	},
}