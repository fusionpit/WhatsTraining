local _, wt = ...
if (wt.currentClass ~= "DEATHKNIGHT") then
	return
end
print(1)
wt.SpellsByLevel = {
	[58] = {
		{
			["id"] = 48721,
			["name"] = "Blood Boil",
			["cost"] = 27000,
		}, -- [1]
		{
			["id"] = 45524,
			["name"] = "Chains of Ice",
			["cost"] = 27000,
		}, -- [2]
	},
	[59] = {
		{
			["id"] = 47476,
			["name"] = "Strangulate",
			["cost"] = 27000,
		}, -- [1]
	},
	[60] = {
		{
			["id"] = 53331,
			["name"] = "Rune of Lichbane",
			["cost"] = 27000,
		}, -- [1]
		{
			["id"] = 43265,
			["name"] = "Death and Decay",
			["cost"] = 27000,
		}, -- [2]
	},
	[61] = {
		{
			["id"] = 49020,
			["name"] = "Obliterate",
			["cost"] = 60000,
		}, -- [1]
		{
			["id"] = 3714,
			["name"] = "Path of Frost",
			["cost"] = 60000,
		}, -- [2]
	},
	[62] = {
		{
			["id"] = 48792,
			["name"] = "Icebound Fortitude",
			["cost"] = 81000,
		}, -- [1]
	},
	[63] = {
		{
			["id"] = 54446,
			["name"] = "Rune of Swordbreaking",
			["cost"] = 87000,
		}, -- [1]
		{
			["id"] = 53323,
			["name"] = "Rune of Swordshattering",
			["cost"] = 87000,
		}, -- [2]
	},
	[64] = {
		{
			["id"] = 45529,
			["name"] = "Blood Tap",
			["cost"] = 93000,
		}, -- [1]
		{
			["id"] = 85948,
			["name"] = "Festering Strike",
			["cost"] = 117000,
		}, -- [2]
	},
	[66] = {
		{
			["id"] = 48743,
			["name"] = "Death Pact",
			["cost"] = 105000,
		}, -- [1]
	},
	[68] = {
		{
			["id"] = 81229,
			["name"] = "Runic Empowerment",
			["cost"] = 117000,
		}, -- [1]
		{
			["id"] = 48707,
			["name"] = "Anti-Magic Shell",
			["cost"] = 117000,
		}, -- [2]
	},
	[70] = {
		{
			["id"] = 53344,
			["name"] = "Rune of the Fallen Crusader",
			["cost"] = 132000,
		}, -- [1]
		{
			["id"] = 48265,
			["name"] = "Unholy Presence",
			["cost"] = 132000,
		}, -- [2]
	},
	[72] = {
		{
			["id"] = 70164,
			["name"] = "Rune of the Nerubian Carapace",
			["cost"] = 150000,
		}, -- [1]
		{
			["id"] = 62158,
			["name"] = "Rune of the Stoneskin Gargoyle",
			["cost"] = 150000,
		}, -- [2]
		{
			["id"] = 61999,
			["name"] = "Raise Ally",
			["cost"] = 141000,
		}, -- [3]
	},
	[80] = {
		{
			["id"] = 87492,
			["name"] = "Mastery",
			["cost"] = 222000,
		}, -- [1]
		{
			["id"] = 42650,
			["name"] = "Army of the Dead",
			["cost"] = 222000,
		}, -- [2]
	},
	[65] = {
		{
			["id"] = 56222,
			["name"] = "Dark Command",
			["cost"] = 99000,
		}, -- [1]
		{
			["id"] = 57330,
			["name"] = "Horn of Winter",
			["cost"] = 99000,
		}, -- [2]
	},
	[67] = {
		{
			["id"] = 56815,
			["name"] = "Rune Strike",
			["cost"] = 111000,
		}, -- [1]
	},
	[83] = {
		{
			["id"] = 73975,
			["name"] = "Necrotic Strike",
			["cost"] = 258000,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 77575,
			["name"] = "Outbreak",
			["cost"] = 234000,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 87510,
			["name"] = "Plate Specialization",
			["cost"] = 22500,
		}, -- [1]
	},
	[75] = {
		{
			["id"] = 47568,
			["name"] = "Empower Rune Weapon",
			["cost"] = 177000,
		}, -- [1]
	},
	[55] = {
		{
			["id"] = 53341,
			["name"] = "Rune of Cinderglacier",
			["cost"] = 25500,
		}, -- [1]
		{
			["id"] = 53343,
			["name"] = "Rune of Razorice",
			["cost"] = 25500,
		}, -- [2]
	},
	[56] = {
		{
			["id"] = 49998,
			["name"] = "Death Strike",
			["cost"] = 25500,
		}, -- [1]
		{
			["id"] = 50842,
			["name"] = "Pestilence",
			["cost"] = 25500,
		}, -- [2]
		{
			["id"] = 46584,
			["name"] = "Raise Dead",
			["cost"] = 25500,
		}, -- [3]
	},
	[57] = {
		{
			["id"] = 48263,
			["name"] = "Blood Presence",
			["cost"] = 25500,
		}, -- [1]
		{
			["id"] = 47528,
			["name"] = "Mind Freeze",
			["cost"] = 25500,
		}, -- [2]
		{
			["id"] = 54447,
			["name"] = "Rune of Spellbreaking",
			["cost"] = 25500,
		}, -- [3]
		{
			["id"] = 53342,
			["name"] = "Rune of Spellshattering",
			["cost"] = 25500,
		}, -- [4]
	},
	[85] = {
		{
			["id"] = 77606,
			["name"] = "Dark Simulacrum",
			["cost"] = 282000,
		}, -- [1]
	},
}