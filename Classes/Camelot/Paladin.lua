local _, wt = ...
local class = wt.forClass("PALADIN")

local devotionAura = {465, 10290, 643, 10291, 1032, 10292, 10293}
local layOnHands = {633, 2800, 10310}
local retributionAura = {7294, 10298, 10299, 10300, 10301}
local shadowResistanceAura = {19876, 19895, 19896}
local frostResistanceAura = {19888, 19897, 19898}
local fireResistanceAura = {19891, 19899, 19900}

class.overriddenGroups = {
	devotionAura,
	layOnHands,
	retributionAura,
	shadowResistanceAura,
	frostResistanceAura,
	fireResistanceAura
}

class.spellsByLevel = {
	[1] = {{id = 465, cost = 10}},
	[4] = {{id = 19740, cost = 100}, {id = 20271, cost = 100}},
	[6] = {
		{id = 498, cost = 100},
		{id = 639, cost = 100, requiredIds = {635}},
		{id = 679, cost = 100},
		{id = 21082, cost = 100}
	},
	[8] = {{id = 853, cost = 100}, {id = 3127, cost = 100}, {id = 1152, cost = 100}},
	[10] = {
		{id = 1022, cost = 300},
		{id = 10290, cost = 300, requiredIds = {465}},
		{id = 633, cost = 300},
		{id = 25780, cost = 300},
		{id = 1311649, cost = 300},
		{id = 20287, cost = 300, requiredIds = {20154}}
	},
	[12] = {
		{id = 19834, cost = 800, requiredIds = {19740}},
		{id = 678, cost = 800, requiredIds = {679}},
		{id = 20162, cost = 800, requiredIds = {21082}}
	},
	[14] = {{id = 19742, cost = 1400}, {id = 647, cost = 1400, requiredIds = {639}}},
	[16] = {{id = 7294, cost = 1500}},
	[18] = {
		{id = 1044, cost = 1600},
		{id = 5573, cost = 1600, requiredIds = {498}},
		{id = 1311656, cost = 1600, requiredIds = {1311649}},
		{id = 20288, cost = 1600, requiredIds = {20287}}
	},
	[20] = {
		{id = 20217, cost = 3100},
		{id = 26573, cost = 3100},
		{id = 643, cost = 3100, requiredIds = {10290}},
		{id = 879, cost = 3100},
		{id = 19750, cost = 3100},
		{id = 1866, cost = 3100, requiredIds = {678}}
	},
	[22] = {
		{id = 19835, cost = 3400, requiredIds = {19834}},
		{id = 19746, cost = 3400},
		{id = 1026, cost = 3400, requiredIds = {647}},
		{id = 20164, cost = 3400},
		{id = 20305, cost = 3400, requiredIds = {20162}}
	},
	[24] = {
		{id = 5599, cost = 4800, requiredIds = {1022}},
		{id = 19850, cost = 4800, requiredIds = {19742}},
		{id = 5588, cost = 4800, requiredIds = {853}},
		{id = 10322, cost = 4800, requiredIds = {7328}},
		{id = 2878, cost = 4800}
	},
	[26] = {
		{id = 19939, cost = 6100, requiredIds = {19750}},
		{id = 10298, cost = 6100, requiredIds = {7294}},
		{id = 20163, cost = 6100, requiredIds = {1311656}},
		{id = 20289, cost = 6100, requiredIds = {20288}}
	},
	[28] = {
		{id = 5614, cost = 8000, requiredIds = {879}},
		{id = 680, cost = 8000, requiredIds = {1866}},
		{id = 19876, cost = 8000}
	},
	[30] = {
		{id = 20116, cost = 9000, requiredIds = {26573}},
		{id = 10291, cost = 9000, requiredIds = {643}},
		{id = 19752, cost = 9000},
		{id = 1042, cost = 9000, requiredIds = {1026}},
		{id = 2800, cost = 9000, requiredIds = {633}},
		{id = 20915, cost = 9000, requiredIds = {20375}, requiredTalentId = 20375},
		{id = 20165, cost = 9000}
	},
	[32] = {
		{id = 19836, cost = 10000, requiredIds = {19835}},
		{id = 19888, cost = 10000},
		{id = 20306, cost = 10000, requiredIds = {20305}}
	},
	[34] = {
		{id = 19852, cost = 11000, requiredIds = {19850}},
		{id = 642, cost = 11000},
		{id = 19940, cost = 11000, requiredIds = {19939}},
		{id = 20419, cost = 11000, requiredIds = {20163}},
		{id = 20290, cost = 11000, requiredIds = {20289}}
	},
	[36] = {
		{id = 5615, cost = 12000, requiredIds = {5614}},
		{id = 19891, cost = 12000},
		{id = 2495, cost = 12000, requiredIds = {680}},
		{id = 10324, cost = 12000, requiredIds = {10322}},
		{id = 10299, cost = 12000, requiredIds = {10298}}
	},
	[38] = {
		{id = 10278, cost = 13000, requiredIds = {5599}},
		{id = 3472, cost = 13000, requiredIds = {1042}},
		{id = 20166, cost = 13000},
		{id = 5627, cost = 13000, requiredIds = {2878}}
	},
	[40] = {
		{id = 20922, cost = 15000, requiredIds = {20116}},
		{id = 1032, cost = 15000, requiredIds = {10291}},
		{id = 5589, cost = 15000, requiredIds = {5588}},
		{id = 20927, cost = 15000, requiredIds = {20925}, requiredTalentId = 20925},
		{id = 20473, cost = 15000, requiredIds = {1311606}, requiredTalentId = 1311606},
		{id = 750, cost = 15000},
		{id = 20918, cost = 15000, requiredIds = {20915}, requiredTalentId = 20375},
		{id = 20347, cost = 15000, requiredIds = {20165}},
		{id = 19895, cost = 15000, requiredIds = {19876}}
	},
	[42] = {
		{id = 19837, cost = 16000, requiredIds = {19836}},
		{id = 4987, cost = 16000},
		{id = 19941, cost = 16000, requiredIds = {19940}},
		{id = 20421, cost = 16000, requiredIds = {20419}},
		{id = 20291, cost = 16000, requiredIds = {20290}},
		{id = 20307, cost = 16000, requiredIds = {20306}}
	},
	[44] = {
		{id = 19853, cost = 17000, requiredIds = {19852}},
		{id = 10312, cost = 17000, requiredIds = {5615}},
		{id = 19897, cost = 17000, requiredIds = {19888}},
		{id = 24275, cost = 17000},
		{id = 5569, cost = 17000, requiredIds = {2495}}
	},
	[46] = {
		{id = 6940, cost = 21000},
		{id = 10328, cost = 21000, requiredIds = {3472}},
		{id = 10300, cost = 21000, requiredIds = {10299}}
	},
	[48] = {
		{id = 19899, cost = 22000, requiredIds = {19891}},
		{id = 20929, cost = 22000, requiredIds = {20473}, requiredTalentId = 1311606},
		{id = 20772, cost = 21000, requiredIds = {10324}},
		{id = 20356, cost = 22000, requiredIds = {20166}}
	},
	[50] = {
		{id = 20923, cost = 23000, requiredIds = {20922}},
		{id = 10292, cost = 23000, requiredIds = {1032}},
		{id = 1020, cost = 23000, requiredIds = {642}},
		{id = 19942, cost = 23000, requiredIds = {19941}},
		{id = 20928, cost = 23000, requiredIds = {20927}, requiredTalentId = 20925},
		{id = 2812, cost = 23000},
		{id = 10310, cost = 23000, requiredIds = {2800}},
		{id = 1311590, cost = 23000, requiredIds = {1310911}, requiredTalentId = 1310911},
		{id = 20919, cost = 23000, requiredIds = {20918}, requiredTalentId = 20375},
		{id = 20422, cost = 23000, requiredIds = {20421}},
		{id = 20348, cost = 23000, requiredIds = {20347}},
		{id = 20292, cost = 23000, requiredIds = {20291}}
	},
	[52] = {
		{id = 19838, cost = 24000, requiredIds = {19837}},
		{id = 10313, cost = 24000, requiredIds = {10312}},
		{id = 25782, cost = 24000, requiredIds = {19838}},
		{id = 24274, cost = 24000, requiredIds = {24275}},
		{id = 10332, cost = 24000, requiredIds = {5569}},
		{id = 20308, cost = 24000, requiredIds = {20307}},
		{id = 19896, cost = 24000, requiredIds = {19895}},
		{id = 10326, cost = 24000, requiredIds = {5627}}
	},
	[54] = {
		{id = 20729, cost = 25000, requiredIds = {6940}},
		{id = 19854, cost = 25000, requiredIds = {19853}},
		{id = 25894, cost = 25000, requiredIds = {19854}},
		{id = 10308, cost = 25000, requiredIds = {5589}},
		{id = 10329, cost = 25000, requiredIds = {10328}}
	},
	[56] = {
		{id = 19898, cost = 26000, requiredIds = {19897}},
		{id = 20930, cost = 26000, requiredIds = {20929}, requiredTalentId = 1311606},
		{id = 10301, cost = 26000, requiredIds = {10300}}
	},
	[58] = {
		{id = 19943, cost = 27000, requiredIds = {19942}},
		{id = 20423, cost = 27000, requiredIds = {20422}},
		{id = 20293, cost = 27000, requiredIds = {20292}},
		{id = 20357, cost = 27000, requiredIds = {20356}}
	},
	[60] = {
		{id = 20924, cost = 29000, requiredIds = {20923}},
		{id = 10293, cost = 29000, requiredIds = {10292}},
		{id = 10314, cost = 29000, requiredIds = {10313}},
		{id = 19900, cost = 29000, requiredIds = {19899}},
		{id = 25898, cost = 29000, requiredIds = {20217}},
		{id = 25916, cost = 29000, requiredIds = {19740}},
		{id = 25918, cost = 29000, requiredIds = {19742}},
		{id = 24239, cost = 29000, requiredIds = {24274}},
		{id = 1239570, cost = 29000, requiredIds = {20928}, requiredTalentId = 20925},
		{id = 10333, cost = 29000, requiredIds = {10332}},
		{id = 10318, cost = 29000, requiredIds = {2812}},
		{id = 1311595, cost = 29000, requiredIds = {1311590}, requiredTalentId = 1310911},
		{id = 20773, cost = 29000, requiredIds = {20772}},
		{id = 20920, cost = 29000, requiredIds = {20919}, requiredTalentId = 20375},
		{id = 20349, cost = 29000, requiredIds = {20348}}
	}
}
