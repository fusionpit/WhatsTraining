local _, wt = ...
if (wt.currentClass ~= "MAGE") then return end

--For mage I talked to the alliance class trainer and then the portal trainer in the same session.
--The exporter merges the data from both npcs.
--Then I talked to the horde portal trainer only and manually copied the horde only portals in from the exporter.

--Added faction checks to mage portals.

--Dalaran teleport and portal is the same spellID both factions.

wt.SpellsByLevel = wt.FactionFilter({
	[38] = {
		{
			["id"] = 42955,
			["name"] = "Conjure Refreshment",
			["cost"] = 12825,
		}, -- [1]
	},
	[46] = {
		{
			["id"] = 1463,
			["name"] = "Mana Shield",
			["cost"] = 18525,
		}, -- [1]
	},
	[54] = {
		{
			["id"] = 7302,
			["name"] = "Frost Armor",
			["cost"] = 22800,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 33690,
			["name"] = "Teleport: Shattrath",
			["cost"] = 76950,
			["faction"] = "Alliance",
		}, -- [1]
		{
			["id"] = 35715,
			["faction"] = "Horde",
			["name"] = "Teleport: Shattrath",
			["cost"] = 76950,
		}, -- [2]
	},
	[76] = {
		{
			["id"] = 43987,
			["name"] = "Ritual of Refreshment",
			["cost"] = 176700,
		}, -- [1]
	},
	[7] = {
		{
			["id"] = 116,
			["name"] = "Frostbolt",
			["cost"] = 271,
		}, -- [1]
	},
	[8] = {
		{
			["id"] = 122,
			["name"] = "Frost Nova",
			["cost"] = 370,
		}, -- [1]
	},
	[12] = {
		{
			["id"] = 12051,
			["name"] = "Evocation",
			["cost"] = 1023,
		}, -- [1]
	},
	[14] = {
		{
			["id"] = 118,
			["name"] = "Polymorph",
			["cost"] = 1348,
		}, -- [1]
	},
	[16] = {
		{
			["id"] = 1953,
			["name"] = "Blink",
			["cost"] = 1957,
		}, -- [1]
	},
	[78] = {
		{
			["id"] = 66,
			["name"] = "Invisibility",
			["cost"] = 193800,
		}, -- [1]
	},
	[24] = {
		{
			["id"] = 3565,
			["name"] = "Teleport: Darnassus",
			["cost"] = 4845,
			["faction"] = "Alliance",
		}, -- [1]
		{
			["id"] = 32271,
			["name"] = "Teleport: Exodar",
			["cost"] = 4845,
			["faction"] = "Alliance",
		}, -- [2]
		{
			["id"] = 3562,
			["name"] = "Teleport: Ironforge",
			["cost"] = 4845,
			["faction"] = "Alliance",
		}, -- [3]
		{
			["id"] = 3561,
			["name"] = "Teleport: Stormwind",
			["cost"] = 4845,
			["faction"] = "Alliance",
		}, -- [4]
		{
			["id"] = 49359,
			["name"] = "Teleport: Theramore",
			["cost"] = 4845,
			["faction"] = "Alliance",
		}, -- [5]
		{
			["id"] = 3567,
			["faction"] = "Horde",
			["name"] = "Teleport: Orgrimmar",
			["cost"] = 4845,
		}, -- [6]
		{
			["id"] = 32272,
			["faction"] = "Horde",
			["name"] = "Teleport: Silvermoon",
			["cost"] = 4845,
		}, -- [7]
		{
			["id"] = 3566,
			["faction"] = "Horde",
			["name"] = "Teleport: Thunder Bluff",
			["cost"] = 4845,
		}, -- [8]
		{
			["id"] = 3563,
			["faction"] = "Horde",
			["name"] = "Teleport: Undercity",
			["cost"] = 4845,
		}, -- [9]
	},
	[28] = {
		{
			["id"] = 30455,
			["name"] = "Ice Lance",
			["cost"] = 7125,
		}, -- [1]
	},
	[32] = {
		{
			["id"] = 130,
			["name"] = "Slow Fall",
			["cost"] = 8550,
		}, -- [1]
	},
	[48] = {
		{
			["id"] = 759,
			["name"] = "Conjure Mana Gem",
			["cost"] = 19950,
		}, -- [1]
	},
	[56] = {
		{
			["id"] = 44614,
			["name"] = "Frostfire Bolt",
			["cost"] = 24225,
		}, -- [1]
	},
	[80] = {
		{
			["id"] = 86467,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 82731,
			["name"] = "Flame Orb",
			["cost"] = 222300,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 33691,
			["name"] = "Portal: Shattrath",
			["cost"] = 99750,
			["faction"] = "Alliance",
		}, -- [1]
		{
			["id"] = 35717,
			["faction"] = "Horde",
			["name"] = "Portal: Shattrath",
			["cost"] = 99750,
		}, -- [2]
	},
	[34] = {
		{
			["id"] = 30482,
			["name"] = "Molten Armor",
			["cost"] = 11400,
		}, -- [1]
	},
	[83] = {
		{
			["id"] = 82676,
			["name"] = "Ring of Frost",
			["cost"] = 245100,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 55342,
			["name"] = "Mirror Image",
			["cost"] = 21375,
		}, -- [1]
		{
			["id"] = 89744,
			["name"] = "Wizardry",
			["cost"] = 21375,
		}, -- [2]
	},
	[58] = {
		{
			["id"] = 1459,
			["name"] = "Arcane Brilliance",
			["cost"] = 25650,
		}, -- [1]
	},
	[68] = {
		{
			["id"] = 6117,
			["name"] = "Mage Armor",
			["cost"] = 111150,
		}, -- [1]
	},
	[9] = {
		{
			["id"] = 2139,
			["name"] = "Counterspell",
			["cost"] = 499,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 80353,
			["name"] = "Time Warp",
			["cost"] = 267900,
		}, -- [1]
		{
			["id"] = 88345,
			["name"] = "Portal: Tol Barad",
			["cost"] = 267900,
			["faction"] = "Alliance",
		}, -- [2]
		{
			["id"] = 88342,
			["name"] = "Teleport: Tol Barad",
			["cost"] = 267900,
			["faction"] = "Alliance",
		}, -- [3]
		{
			["id"] = 88346,
			["faction"] = "Horde",
			["name"] = "Portal: Tol Barad",
			["cost"] = 267900,
		}, -- [4]
		{
			["id"] = 88344,
			["faction"] = "Horde",
			["name"] = "Teleport: Tol Barad",
			["cost"] = 267900,
		}, -- [5]
	},
	[70] = {
		{
			["id"] = 30449,
			["name"] = "Spellsteal",
			["cost"] = 125400,
		}, -- [1]
	},
	[22] = {
		{
			["id"] = 1449,
			["name"] = "Arcane Explosion",
			["cost"] = 4180,
		}, -- [1]
	},
	[26] = {
		{
			["id"] = 2948,
			["name"] = "Scorch",
			["cost"] = 5700,
		}, -- [1]
	},
	[30] = {
		{
			["id"] = 475,
			["name"] = "Remove Curse",
			["cost"] = 7125,
		}, -- [1]
		{
			["id"] = 45438,
			["name"] = "Ice Block",
			["cost"] = 7125,
		}, -- [2]
	},
	[36] = {
		{
			["id"] = 543,
			["name"] = "Mage Ward",
			["cost"] = 3420,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 2120,
			["name"] = "Flamestrike",
			["cost"] = 18525,
		}, -- [1]
	},
	[52] = {
		{
			["id"] = 10,
			["name"] = "Blizzard",
			["cost"] = 21375,
		}, -- [1]
		{
			["id"] = 49361,
			["faction"] = "Horde",
			["name"] = "Portal: Stonard",
			["cost"] = 21375,
		}, -- [2]
		{
			["id"] = 49358,
			["faction"] = "Horde",
			["name"] = "Teleport: Stonard",
			["cost"] = 21375,
		}, -- [3]
	},
	[20] = {
		{
			["id"] = 30451,
			["name"] = "Arcane Blast",
			["cost"] = 9975,
		}, -- [1]
	},
	[71] = {
		{
			["id"] = 53140,
			["name"] = "Teleport: Dalaran",
			["cost"] = 142500,
		}, -- [1]
	},
	[42] = {
		{
			["id"] = 11419,
			["name"] = "Portal: Darnassus",
			["cost"] = 15675,
			["faction"] = "Alliance",
		}, -- [1]
		{
			["id"] = 32266,
			["name"] = "Portal: Exodar",
			["cost"] = 15675,
			["faction"] = "Alliance",
		}, -- [2]
		{
			["id"] = 11416,
			["name"] = "Portal: Ironforge",
			["cost"] = 15675,
			["faction"] = "Alliance",
		}, -- [3]
		{
			["id"] = 10059,
			["name"] = "Portal: Stormwind",
			["cost"] = 15675,
			["faction"] = "Alliance",
		}, -- [4]
		{
			["id"] = 49360,
			["name"] = "Portal: Theramore",
			["cost"] = 15675,
			["faction"] = "Alliance",
		}, -- [5]
		{
			["id"] = 11417,
			["faction"] = "Horde",
			["name"] = "Portal: Orgrimmar",
			["cost"] = 15675,
		}, -- [6]
		{
			["id"] = 32267,
			["faction"] = "Horde",
			["name"] = "Portal: Silvermoon",
			["cost"] = 15675,
		}, -- [7]
		{
			["id"] = 11420,
			["faction"] = "Horde",
			["name"] = "Portal: Thunder Bluff",
			["cost"] = 15675,
		}, -- [8]
		{
			["id"] = 11418,
			["faction"] = "Horde",
			["name"] = "Portal: Undercity",
			["cost"] = 15675,
		}, -- [9]
	},
	[5] = {
		{
			["id"] = 2136,
			["name"] = "Fire Blast",
			["cost"] = 135,
		}, -- [1]
	},
	[74] = {
		{
			["id"] = 53142,
			["name"] = "Portal: Dalaran",
			["cost"] = 159600,
		}, -- [1]
	},
	[18] = {
		{
			["id"] = 120,
			["name"] = "Cone of Cold",
			["cost"] = 2646,
		}, -- [1]
	},
	[3] = {
		{
			["id"] = 5143,
			["name"] = "Arcane Missiles",
			["cost"] = 57,
		}, -- [1]
	},
})
