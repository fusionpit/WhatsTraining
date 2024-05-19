local _, wt = ...
if (wt.currentClass ~= "DRUID") then
	return
end

wt.SpellsByLevel = {
	[46] = {
		{
			["id"] = 5221,
			["name"] = "Shred",
			["cost"] = 18525,
		}, -- [1]
	},
	[54] = {
		{
			["id"] = 1079,
			["name"] = "Rip",
			["cost"] = 22800,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 22570,
			["name"] = "Maim",
			["cost"] = 76950,
		}, -- [1]
	},
	[76] = {
		{
			["id"] = 52610,
			["name"] = "Savage Roar",
			["cost"] = 176700,
		}, -- [1]
	},
	[7] = {
		{
			["id"] = 339,
			["name"] = "Entangling Roots",
			["cost"] = 271,
		}, -- [1]
	},
	[8] = {
		{
			["id"] = 2912,
			["name"] = "Starfire",
			["cost"] = 370,
		}, -- [1]
		{
			["id"] = 768,
			["name"] = "Cat Form",
			["cost"] = 370,
		}, -- [2]
		{
			["id"] = 1082,
			["name"] = "Claw",
			["cost"] = 370,
		}, -- [3]
		{
			["id"] = 1822,
			["name"] = "Rake",
			["cost"] = 370,
		}, -- [4]
		{
			["id"] = 50464,
			["name"] = "Nourish",
			["cost"] = 370,
		}, -- [5]
	},
	[10] = {
		{
			["id"] = 22568,
			["name"] = "Ferocious Bite",
			["cost"] = 370,
		}, -- [1]
		{
			["id"] = 5215,
			["name"] = "Prowl",
			["cost"] = 646,
		}, -- [2]
	},
	[12] = {
		{
			["id"] = 8936,
			["name"] = "Regrowth",
			["cost"] = 1023,
		}, -- [1]
		{
			["id"] = 50769,
			["name"] = "Revive",
			["cost"] = 1023,
		}, -- [2]
	},
	[16] = {
		{
			["id"] = 1066,
			["name"] = "Aquatic Form",
			["cost"] = 1957,
		}, -- [1]
		{
			["id"] = 783,
			["name"] = "Travel Form",
			["cost"] = 1957,
		}, -- [2]
	},
	[20] = {
		{
			["id"] = 5570,
			["name"] = "Insect Swarm",
			["cost"] = 3420,
		}, -- [1]
		{
			["id"] = 16864,
			["name"] = "Omen of Clarity",
			["cost"] = 3420,
		}, -- [2]
		{
			["id"] = 20484,
			["name"] = "Rebirth",
			["cost"] = 3420,
		}, -- [3]
	},
	[24] = {
		{
			["id"] = 770,
			["name"] = "Faerie Fire",
			["cost"] = 2422,
		}, -- [1]
		{
			["id"] = 16857,
			["name"] = "Faerie Fire (Feral)",
			["cost"] = 2422,
		}, -- [2]
		{
			["id"] = 5217,
			["name"] = "Tiger's Fury",
			["cost"] = 4845,
		}, -- [3]
		{
			["id"] = 2782,
			["name"] = "Remove Corruption",
			["cost"] = 4845,
		}, -- [4]
	},
	[28] = {
		{
			["id"] = 29166,
			["name"] = "Innervate",
			["cost"] = 7125,
		}, -- [1]
		{
			["id"] = 2908,
			["name"] = "Soothe",
			["cost"] = 7125,
		}, -- [2]
		{
			["id"] = 5209,
			["name"] = "Challenging Roar",
			["cost"] = 7125,
		}, -- [3]
	},
	[32] = {
		{
			["id"] = 5211,
			["name"] = "Bash",
			["cost"] = 8550,
		}, -- [1]
		{
			["id"] = 9005,
			["name"] = "Pounce",
			["cost"] = 8550,
		}, -- [2]
		{
			["id"] = 5225,
			["name"] = "Track Humanoids",
			["cost"] = 8550,
		}, -- [3]
	},
	[40] = {
		{
			["id"] = 62600,
			["name"] = "Savage Defense",
			["cost"] = 14250,
		}, -- [1]
	},
	[48] = {
		{
			["id"] = 2637,
			["name"] = "Hibernate",
			["cost"] = 19950,
		}, -- [1]
	},
	[64] = {
		{
			["id"] = 33763,
			["name"] = "Lifebloom",
			["cost"] = 88350,
		}, -- [1]
	},
	[80] = {
		{
			["id"] = 87491,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 77758,
			["name"] = "Thrash",
			["cost"] = 222300,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 33745,
			["name"] = "Lacerate",
			["cost"] = 99750,
		}, -- [1]
	},
	[83] = {
		{
			["id"] = 77761,
			["name"] = "Stampeding Roar",
			["cost"] = 122550,
		}, -- [1]
		{
			["id"] = 77764,
			["name"] = "Stampeding Roar",
			["cost"] = 122550,
		}, -- [2]
	},
	[50] = {
		{
			["id"] = 87505,
			["name"] = "Leather Specialization",
			["cost"] = 21375,
		}, -- [1]
	},
	[58] = {
		{
			["id"] = 22812,
			["name"] = "Barkskin",
			["cost"] = 25650,
		}, -- [1]
	},
	[68] = {
		{
			["id"] = 740,
			["name"] = "Tranquility",
			["cost"] = 111150,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 88747,
			["name"] = "Wild Mushroom",
			["cost"] = 133950,
		}, -- [1]
		{
			["id"] = 88751,
			["name"] = "Wild Mushroom: Detonate",
			["cost"] = 0,
		}, -- [2]
	},
	[15] = {
		{
			["id"] = 18960,
			["name"] = "Teleport: Moonglade",
			["cost"] = 1643,
		}, -- [1]
		{
			["id"] = 5487,
			["name"] = "Bear Form",
			["cost"] = 1643,
		}, -- [2]
		{
			["id"] = 99,
			["name"] = "Demoralizing Roar",
			["cost"] = 1643,
		}, -- [3]
		{
			["id"] = 6795,
			["name"] = "Growl",
			["cost"] = 1643,
		}, -- [4]
		{
			["id"] = 6807,
			["name"] = "Maul",
			["cost"] = 1643,
		}, -- [5]
	},
	[70] = {
		{
			["id"] = 40120,
			["name"] = "Swift Flight Form",
			["cost"] = 133950,
		}, -- [1]
	},
	[22] = {
		{
			["id"] = 5229,
			["name"] = "Enrage",
			["cost"] = 3990,
		}, -- [1]
		{
			["id"] = 6785,
			["name"] = "Ravage",
			["cost"] = 3990,
		}, -- [2]
		{
			["id"] = 80964,
			["name"] = "Skull Bash",
			["cost"] = 1995,
		}, -- [3]
		{
			["id"] = 80965,
			["name"] = "Skull Bash",
			["cost"] = 1995,
		}, -- [4]
	},
	[26] = {
		{
			["id"] = 8998,
			["name"] = "Cower",
			["cost"] = 5700,
		}, -- [1]
		{
			["id"] = 1850,
			["name"] = "Dash",
			["cost"] = 5700,
		}, -- [2]
		{
			["id"] = 20719,
			["name"] = "Feline Grace",
			["cost"] = 5700,
		}, -- [3]
	},
	[30] = {
		{
			["id"] = 1126,
			["name"] = "Mark of the Wild",
			["cost"] = 7125,
		}, -- [1]
	},
	[36] = {
		{
			["id"] = 62078,
			["name"] = "Swipe",
			["cost"] = 5700,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 16914,
			["name"] = "Hurricane",
			["cost"] = 18525,
		}, -- [1]
		{
			["id"] = 450759,
			["name"] = "Revitalize",
			["cost"] = 18525,
		}, -- [2]
	},
	[52] = {
		{
			["id"] = 16689,
			["name"] = "Nature's Grasp",
			["cost"] = 21375,
		}, -- [1]
		{
			["id"] = 22842,
			["name"] = "Frenzied Regeneration",
			["cost"] = 21375,
		}, -- [2]
	},
	[60] = {
		{
			["id"] = 33943,
			["name"] = "Flight Form",
			["cost"] = 25650,
		}, -- [1]
	},
	[78] = {
		{
			["id"] = 5185,
			["name"] = "Healing Touch",
			["cost"] = 190380,
		}, -- [1]
	},
	[3] = {
		{
			["id"] = 774,
			["name"] = "Rejuvenation",
			["cost"] = 57,
		}, -- [1]
	},
	[4] = {
		{
			["id"] = 8921,
			["name"] = "Moonfire",
			["cost"] = 93,
		}, -- [1]
	},
	[74] = {
		{
			["id"] = 33786,
			["name"] = "Cyclone",
			["cost"] = 159600,
		}, -- [1]
	},
	[18] = {
		{
			["id"] = 779,
			["name"] = "Swipe",
			["cost"] = 2646,
		}, -- [1]
	},
	[5] = {
		{
			["id"] = 467,
			["name"] = "Thorns",
			["cost"] = 135,
		}, -- [1]
	},
}