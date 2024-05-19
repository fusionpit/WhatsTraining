local _, wt = ...
if (wt.currentClass ~= "SHAMAN") then
	return
end

--When I exported shaman the first 3 spells were inserted twice, not sure why, maybe the trainer was bugged but it only happened once.
--It only happened with shaman, but maybe keep an eye it doesn't happen with other classes if the exporter is used in future expansions.

--Added facton checks to Bloodlust/Heroism.
wt.SpellsByLevel = wt.FactionFilter({
	nil, -- [1]
	nil, -- [2]
	{
		{
			["id"] = 73899,
			["name"] = "Primal Strike",
			["cost"] = 57,
		}, -- [1]
	}, -- [3]
	{
		{
			["id"] = 8075,
			["name"] = "Strength of Earth Totem",
			["cost"] = 93,
		}, -- [1]
	}, -- [4]
	{
		{
			["id"] = 8042,
			["name"] = "Earth Shock",
			["cost"] = 135,
		}, -- [1]
	}, -- [5]
	nil, -- [6]
	{
		{
			["id"] = 331,
			["name"] = "Healing Wave",
			["cost"] = 271,
		}, -- [1]
	}, -- [7]
	{
		{
			["id"] = 324,
			["name"] = "Lightning Shield",
			["cost"] = 370,
		}, -- [1]
	}, -- [8]
	nil, -- [9]
	{
		{
			["id"] = 3599,
			["name"] = "Searing Totem",
			["cost"] = 646,
		}, -- [1]
		{
			["id"] = 8024,
			["name"] = "Flametongue Weapon",
			["cost"] = 646,
		}, -- [2]
	}, -- [10]
	nil, -- [11]
	{
		{
			["id"] = 370,
			["name"] = "Purge",
			["cost"] = 1023,
		}, -- [1]
		{
			["id"] = 8227,
			["name"] = "Flametongue Totem",
			["cost"] = 1023,
		}, -- [2]
		{
			["id"] = 2008,
			["name"] = "Ancestral Spirit",
			["cost"] = 1023,
		}, -- [3]
	}, -- [12]
	nil, -- [13]
	{
		{
			["id"] = 8050,
			["name"] = "Flame Shock",
			["cost"] = 1348,
		}, -- [1]
	}, -- [14]
	{
		{
			["id"] = 2645,
			["name"] = "Ghost Wolf",
			["cost"] = 1643,
		}, -- [1]
	}, -- [15]
	{
		{
			["id"] = 57994,
			["name"] = "Wind Shear",
			["cost"] = 1957,
		}, -- [1]
	}, -- [16]
	[58] = {
		{
			["id"] = 5730,
			["name"] = "Stoneclaw Totem",
			["cost"] = 25650,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 79206,
			["name"] = "Spiritwalker's Grace",
			["cost"] = 267900,
		}, -- [1]
	},
	[83] = {
		{
			["id"] = 73920,
			["name"] = "Healing Rain",
			["cost"] = 245100,
		}, -- [1]
	},
	[74] = {
		{
			["id"] = 87718,
			["name"] = "Totem of Tranquil Mind",
			["cost"] = 159600,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 8184,
			["name"] = "Elemental Resistance Totem",
			["cost"] = 76950,
		}, -- [1]
	},
	[32] = {
		{
			["id"] = 8232,
			["name"] = "Windfury Weapon",
			["cost"] = 8550,
		}, -- [1]
	},
	[64] = {
		{
			["id"] = 76780,
			["name"] = "Bind Elemental",
			["cost"] = 88350,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 2894,
			["name"] = "Fire Elemental Totem",
			["cost"] = 99750,
		}, -- [1]
	},
	[18] = {
		{
			["id"] = 2484,
			["name"] = "Earthbind Totem",
			["cost"] = 2646,
		}, -- [1]
		{
			["id"] = 51886,
			["name"] = "Cleanse Spirit",
			["cost"] = 2646,
		}, -- [2]
	},
	[70] = {
		{
			["id"] = 2825,
			["name"] = "Bloodlust",
			["cost"] = 125400,
			["faction"] = "Horde",
		}, -- [1]
		{
			["id"] = 32182,
			["name"] = "Heroism",
			["cost"] = 125400,
			["faction"] = "Alliance",
		}, -- [2]
	},
	[68] = {
		{
			["id"] = 77472,
			["name"] = "Greater Healing Wave",
			["cost"] = 111150,
		}, -- [1]
	},
	[38] = {
		{
			["id"] = 8177,
			["name"] = "Grounding Totem",
			["cost"] = 12825,
		}, -- [1]
	},
	[20] = {
		{
			["id"] = 5394,
			["name"] = "Healing Stream Totem",
			["cost"] = 3420,
		}, -- [1]
		{
			["id"] = 8004,
			["name"] = "Healing Surge",
			["cost"] = 3420,
		}, -- [2]
		{
			["id"] = 52127,
			["name"] = "Water Shield",
			["cost"] = 3420,
		}, -- [3]
	},
	[40] = {
		{
			["id"] = 66843,
			["name"] = "Call of the Ancestors",
			["cost"] = 14250,
		}, -- [1]
		{
			["id"] = 8737,
			["name"] = "Mail",
			["cost"] = 14250,
		}, -- [2]
		{
			["id"] = 1064,
			["name"] = "Chain Heal",
			["cost"] = 14250,
		}, -- [3]
	},
	[80] = {
		{
			["id"] = 51514,
			["name"] = "Hex",
			["cost"] = 210900,
		}, -- [1]
		{
			["id"] = 87497,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [2]
	},
	[42] = {
		{
			["id"] = 5675,
			["name"] = "Mana Spring Totem",
			["cost"] = 15675,
		}, -- [1]
	},
	[22] = {
		{
			["id"] = 8056,
			["name"] = "Frost Shock",
			["cost"] = 3990,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 3738,
			["name"] = "Wrath of Air Totem",
			["cost"] = 18525,
		}, -- [1]
		{
			["id"] = 450762,
			["name"] = "Ancestral Vision",
			["cost"] = 18525,
		}, -- [2]
	},
	[54] = {
		{
			["id"] = 51730,
			["name"] = "Earthliving Weapon",
			["cost"] = 22800,
		}, -- [1]
	},
	[46] = {
		{
			["id"] = 131,
			["name"] = "Water Breathing",
			["cost"] = 18525,
		}, -- [1]
	},
	[24] = {
		{
			["id"] = 546,
			["name"] = "Water Walking",
			["cost"] = 4845,
		}, -- [1]
	},
	[48] = {
		{
			["id"] = 8071,
			["name"] = "Stoneskin Totem",
			["cost"] = 19950,
		}, -- [1]
	},
	[34] = {
		{
			["id"] = 51505,
			["name"] = "Lava Burst",
			["cost"] = 9975,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 66844,
			["name"] = "Call of the Spirits",
			["cost"] = 21375,
		}, -- [1]
		{
			["id"] = 87507,
			["name"] = "Mail Specialization",
			["cost"] = 21375,
		}, -- [2]
	},
	[26] = {
		{
			["id"] = 8033,
			["name"] = "Frostbrand Weapon",
			["cost"] = 5700,
		}, -- [1]
	},
	[52] = {
		{
			["id"] = 8143,
			["name"] = "Tremor Totem",
			["cost"] = 21375,
		}, -- [1]
	},
	[30] = {
		{
			["id"] = 66842,
			["name"] = "Call of the Elements",
			["cost"] = 7125,
		}, -- [1]
		{
			["id"] = 556,
			["name"] = "Astral Recall",
			["cost"] = 7125,
		}, -- [2]
		{
			["id"] = 8512,
			["name"] = "Windfury Totem",
			["cost"] = 7125,
		}, -- [3]
		{
			["id"] = 20608,
			["name"] = "Reincarnation",
			["cost"] = 7125,
		}, -- [4]
		{
			["id"] = 36936,
			["name"] = "Totemic Recall",
			["cost"] = 7125,
		}, -- [5]
	},
	[75] = {
		{
			["id"] = 8017,
			["name"] = "Rockbiter Weapon",
			["cost"] = 168150,
		}, -- [1]
	},
	[28] = {
		{
			["id"] = 421,
			["name"] = "Chain Lightning",
			["cost"] = 7125,
		}, -- [1]
		{
			["id"] = 1535,
			["name"] = "Fire Nova",
			["cost"] = 7125,
		}, -- [2]
	},
	[56] = {
		{
			["id"] = 2062,
			["name"] = "Earth Elemental Totem",
			["cost"] = 24225,
		}, -- [1]
	},
	[81] = {
		{
			["id"] = 73680,
			["name"] = "Unleash Elements",
			["cost"] = 222300,
		}, -- [1]
	},
	[36] = {
		{
			["id"] = 8190,
			["name"] = "Magma Totem",
			["cost"] = 11400,
		}, -- [1]
		{
			["id"] = 6196,
			["name"] = "Far Sight",
			["cost"] = 11400,
		}, -- [2]
	},
})
