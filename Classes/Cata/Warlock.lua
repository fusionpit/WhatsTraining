local _, wt = ...
if (wt.currentClass ~= "WARLOCK") then return end
wt.SpellsByLevel = {
	nil, -- [1]
	nil, -- [2]
	{
		{
			["id"] = 348,
			["name"] = "Immolate",
			["cost"] = 57,
		}, -- [1]
	}, -- [3]
	{
		{
			["id"] = 172,
			["name"] = "Corruption",
			["cost"] = 93,
		}, -- [1]
	}, -- [4]
	{
		{
			["id"] = 1454,
			["name"] = "Life Tap",
			["cost"] = 135,
		}, -- [1]
	}, -- [5]
	{
		{
			["id"] = 689,
			["name"] = "Drain Life",
			["cost"] = 180,
		}, -- [1]
	}, -- [6]
	nil, -- [7]
	{
		{
			["id"] = 687,
			["name"] = "Demon Armor",
			["cost"] = 456,
		}, -- [1]
		{
			["id"] = 697,
			["name"] = "Summon Voidwalker",
			["cost"] = 370,
		}, -- [2]
	}, -- [8]
	{
		{
			["id"] = 6201,
			["name"] = "Create Healthstone",
			["cost"] = 524,
		}, -- [1]
	}, -- [9]
	{
		{
			["id"] = 1120,
			["name"] = "Drain Soul",
			["cost"] = 646,
		}, -- [1]
		{
			["id"] = 74434,
			["name"] = "Soulburn",
			["cost"] = 646,
		}, -- [2]
	}, -- [10]
	nil, -- [11]
	{
		{
			["id"] = 980,
			["name"] = "Bane of Agony",
			["cost"] = 1023,
		}, -- [1]
		{
			["id"] = 755,
			["name"] = "Health Funnel",
			["cost"] = 1023,
		}, -- [2]
		{
			["id"] = 79268,
			["name"] = "Soul Harvest",
			["cost"] = 1023,
		}, -- [3]
	}, -- [12]
	nil, -- [13]
	{
		{
			["id"] = 5782,
			["name"] = "Fear",
			["cost"] = 1348,
		}, -- [1]
	}, -- [14]
	nil, -- [15]
	{
		{
			["id"] = 702,
			["name"] = "Curse of Weakness",
			["cost"] = 1957,
		}, -- [1]
		{
			["id"] = 5697,
			["name"] = "Unending Breath",
			["cost"] = 1957,
		}, -- [2]
	}, -- [16]
	[83] = {
		{
			["id"] = 80398,
			["name"] = "Dark Intent",
			["cost"] = 245100,
		}, -- [1]
	},
	[30] = {
		{
			["id"] = 1098,
			["name"] = "Subjugate Demon",
			["cost"] = 7125,
		}, -- [1]
		{
			["id"] = 691,
			["name"] = "Summon Felhunter",
			["cost"] = 7125,
		}, -- [2]
		{
			["id"] = 1949,
			["name"] = "Hellfire",
			["cost"] = 7125,
		}, -- [3]
	},
	[62] = {
		{
			["id"] = 28176,
			["name"] = "Fel Armor",
			["cost"] = 76950,
		}, -- [1]
	},
	[32] = {
		{
			["id"] = 710,
			["name"] = "Banish",
			["cost"] = 8550,
		}, -- [1]
	},
	[64] = {
		{
			["id"] = 29722,
			["name"] = "Incinerate",
			["cost"] = 88350,
		}, -- [1]
	},
	[34] = {
		{
			["id"] = 6229,
			["name"] = "Shadow Ward",
			["cost"] = 9975,
		}, -- [1]
	},
	[18] = {
		{
			["id"] = 693,
			["name"] = "Create Soulstone",
			["cost"] = 2646,
		}, -- [1]
		{
			["id"] = 5740,
			["name"] = "Rain of Fire",
			["cost"] = 2646,
		}, -- [2]
		{
			["id"] = 5676,
			["name"] = "Searing Pain",
			["cost"] = 2646,
		}, -- [3]
	},
	[72] = {
		{
			["id"] = 27243,
			["name"] = "Seed of Corruption",
			["cost"] = 142500,
		}, -- [1]
	},
	[20] = {
		{
			["id"] = 603,
			["name"] = "Bane of Doom",
			["cost"] = 3420,
		}, -- [1]
		{
			["id"] = 19028,
			["name"] = "Soul Link",
			["cost"] = 3420,
		}, -- [2]
		{
			["id"] = 712,
			["name"] = "Summon Succubus",
			["cost"] = 3420,
		}, -- [3]
		{
			["id"] = 6353,
			["name"] = "Soul Fire",
			["cost"] = 3420,
		}, -- [4]
	},
	[78] = {
		{
			["id"] = 48018,
			["name"] = "Demonic Circle: Summon",
			["cost"] = 96900,
		}, -- [1]
		{
			["id"] = 48020,
			["name"] = "Demonic Circle: Teleport",
			["cost"] = 96900,
		}, -- [2]
	},
	[80] = {
		{
			["id"] = 87498,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [1]
	},
	[42] = {
		{
			["id"] = 6789,
			["name"] = "Death Coil",
			["cost"] = 15675,
		}, -- [1]
		{
			["id"] = 698,
			["name"] = "Ritual of Summoning",
			["cost"] = 15675,
		}, -- [2]
	},
	[22] = {
		{
			["id"] = 126,
			["name"] = "Eye of Kilrogg",
			["cost"] = 3990,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 5484,
			["name"] = "Howl of Terror",
			["cost"] = 18525,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 1122,
			["name"] = "Summon Infernal",
			["cost"] = 21375,
		}, -- [1]
		{
			["id"] = 86091,
			["name"] = "Nethermancy",
			["cost"] = 21375,
		}, -- [2]
	},
	[26] = {
		{
			["id"] = 1714,
			["name"] = "Curse of Tongues",
			["cost"] = 5700,
		}, -- [1]
	},
	[52] = {
		{
			["id"] = 1490,
			["name"] = "Curse of the Elements",
			["cost"] = 21375,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 29858,
			["name"] = "Soulshatter",
			["cost"] = 99750,
		}, -- [1]
	},
	[76] = {
		{
			["id"] = 47897,
			["name"] = "Shadowflame",
			["cost"] = 176700,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 77801,
			["name"] = "Demon Soul",
			["cost"] = 267900,
		}, -- [1]
	},
	[68] = {
		{
			["id"] = 29893,
			["name"] = "Ritual of Souls",
			["cost"] = 111150,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 77799,
			["name"] = "Fel Flame",
			["cost"] = 222300,
		}, -- [1]
	},
	[58] = {
		{
			["id"] = 18540,
			["name"] = "Summon Doomguard",
			["cost"] = 25650,
		}, -- [1]
	},
}