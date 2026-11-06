local _, wt = ...
local class = wt.forClass("ROGUE")

local stealth = {1784, 1785, 1786, 1787}
local backstab = {53, 2589, 2590, 2591, 8721, 11279, 11280, 11281}
local gouge = {1776, 1777, 8629, 11285, 11286}
local sinisterStrike = {1752, 1757, 1758, 1759, 1760, 8621, 11293, 11294}
local eviscerate = {2098, 6760, 6761, 6762, 8623, 8624, 11299, 11300}
local sap = {6770, 2070, 11297}
local sliceAndDice = {5171, 6774}
local sprint = {2983, 8696, 11305}
local kick = {1766, 1767, 1768, 1769}
local exposeArmor = {8647, 8649, 8650, 11197, 11198}
local garrote = {703, 8631, 8632, 8633, 11289, 11290}
local feint = {1966, 6768, 8637, 11303}
local ambush = {8676, 8724, 8725, 11267, 11268, 11269}
local cripplingPoison = {3420, 3421}
local rupture = {1943, 8639, 8640, 11273, 11274, 11275}
local vanish = {1856, 1857}
local mindNumbingPoison = {5763, 8694, 11400}
local instantPoison = {8687, 8691, 11341, 11342, 11343}
local deadlyPoison = {2835, 2837, 11357, 11358}
local kidneyShot = {408, 8643}
local woundPoison = {13220, 13228, 13229, 13230}
local deathMark = {1316709, 1325756, 1325757, 1325758}
local mutilate = {1310706, 1241582, 1241584}

class.overriddenGroups = {
	stealth,
	backstab,
	gouge,
	sinisterStrike,
	eviscerate,
	sap,
	sliceAndDice,
	sprint,
	kick,
	exposeArmor,
	garrote,
	feint,
	ambush,
	cripplingPoison,
	rupture,
	vanish,
	mindNumbingPoison,
	instantPoison,
	deadlyPoison,
	kidneyShot,
	woundPoison,
	deathMark,
	mutilate
}

class.spellsByLevel = {
	[1] = {{id = 1784, cost = 10}},
	[4] = {{id = 53, cost = 100}, {id = 921, cost = 100}},
	[6] = {{id = 1776, cost = 100}, {id = 1757, cost = 100, requiredIds = {1752}}},
	[8] = {{id = 5277, cost = 200}, {id = 6760, cost = 200, requiredIds = {2098}}},
	[10] = {{id = 674, cost = 300}, {id = 6770, cost = 300}, {id = 5171, cost = 300}, {id = 2983, cost = 300}},
	[12] = {{id = 2589, cost = 900, requiredIds = {53}}, {id = 1766, cost = 900}, {id = 3127, cost = 900}},
	[14] = {{id = 8647, cost = 1100}, {id = 703, cost = 1100}, {id = 1758, cost = 1100, requiredIds = {1757}}},
	[16] = {{id = 6761, cost = 1500, requiredIds = {6760}}, {id = 1966, cost = 1500}, {id = 1804, cost = 1500}},
	[18] = {{id = 8676, cost = 1600}, {id = 1777, cost = 1600, requiredIds = {1776}}, {id = 1328825, cost = 2200}},
	[20] = {
		{id = 2590, cost = 4300, requiredIds = {2589}},
		{id = 3420, cost = 4300, skills = {{skill = 40, level = 1}}},
		{id = 1943, cost = 4300},
		{id = 1785, cost = 4300, requiredIds = {1784}}
	},
	[22] = {
		{id = 1725, cost = 4500},
		{id = 8631, cost = 4500, requiredIds = {703}},
		{id = 1759, cost = 4500, requiredIds = {1758}},
		{id = 1856, cost = 4500}
	},
	[24] = {
		{id = 2836, cost = 6000},
		{id = 6762, cost = 6000, requiredIds = {6761}},
		{id = 5763, cost = 6000, skills = {{skill = 40, level = 100}}},
		{id = 1329283, cost = 6000}
	},
	[26] = {
		{id = 8724, cost = 7000, requiredIds = {8676}},
		{id = 1833, cost = 7000},
		{id = 8649, cost = 7000, requiredIds = {8647}},
		{id = 1767, cost = 7000, requiredIds = {1766}}
	},
	[28] = {
		{id = 2591, cost = 8000, requiredIds = {2590}},
		{id = 6768, cost = 8000, requiredIds = {1966}},
		{id = 8687, cost = 8000, skills = {{skill = 40, level = 120}}},
		{id = 8639, cost = 8000, requiredIds = {1943}},
		{id = 2070, cost = 8000, requiredIds = {6770}}
	},
	[30] = {
		{id = 2835, cost = 9000, skills = {{skill = 40, level = 130}}},
		{id = 1842, cost = 9000, requiredIds = {2836}},
		{id = 8632, cost = 9000, requiredIds = {8631}},
		{id = 408, cost = 9000},
		{id = 1760, cost = 9000, requiredIds = {1759}}
	},
	[32] = {
		{id = 8623, cost = 13000, requiredIds = {6762}},
		{id = 8629, cost = 13000, requiredIds = {1777}},
		{id = 13220, cost = 13000, skills = {{skill = 40, level = 140}}}
	},
	[34] = {
		{id = 8725, cost = 14000, requiredIds = {8724}},
		{id = 2094, cost = 14000, skills = {{skill = 40, level = 1}}},
		{id = 6510, cost = 14000, skills = {{skill = 40, level = 150}}},
		{id = 8696, cost = 14000, requiredIds = {2983}}
	},
	[36] = {
		{id = 8721, cost = 15000, requiredIds = {2591}},
		{id = 8650, cost = 15000, requiredIds = {8649}},
		{id = 8691, cost = 15000, skills = {{skill = 40, level = 160}}},
		{id = 8640, cost = 15000, requiredIds = {8639}}
	},
	[38] = {
		{id = 2837, cost = 16000, skills = {{skill = 40, level = 170}}},
		{id = 8633, cost = 16000, requiredIds = {8632}},
		{id = 8694, cost = 16000, skills = {{skill = 40, level = 170}}},
		{id = 8621, cost = 16000, requiredIds = {1760}}
	},
	[40] = {
		{id = 8624, cost = 19000, requiredIds = {8623}},
		{id = 8637, cost = 19000, requiredIds = {6768}},
		{id = 1860, cost = 19000},
		{id = 1786, cost = 19000, requiredIds = {1785}},
		{id = 13228, cost = 19000, skills = {{skill = 40, level = 180}}}
	},
	[42] = {
		{id = 11267, cost = 22000, requiredIds = {8725}},
		{id = 1768, cost = 22000, requiredIds = {1767}},
		{id = 6774, cost = 22000, requiredIds = {5171}},
		{id = 1857, cost = 22000, requiredIds = {1856}}
	},
	[44] = {
		{id = 11279, cost = 23000, requiredIds = {8721}},
		{id = 11341, cost = 23000, skills = {{skill = 40, level = 200}}},
		{id = 11273, cost = 23000, requiredIds = {8640}},
		{id = 1329549, cost = 23000, requiredIds = {1329283}}
	},
	[46] = {
		{id = 11357, cost = 25000, skills = {{skill = 40, level = 210}}},
		{id = 11197, cost = 25000, requiredIds = {8650}},
		{id = 11289, cost = 25000, requiredIds = {8633}},
		{id = 11285, cost = 25000, requiredIds = {8629}},
		{id = 11293, cost = 25000, requiredIds = {8621}}
	},
	[48] = {
		{id = 1325756, cost = 43000, requiredIds = {1316709}, requiredTalentId = 1316709},
		{id = 11299, cost = 43000, requiredIds = {8624}},
		{id = 11297, cost = 43000, requiredIds = {2070}},
		{id = 13229, cost = 43000, skills = {{skill = 40, level = 220}}}
	},
	[50] = {
		{id = 11268, cost = 44000, requiredIds = {11267}},
		{id = 3421, cost = 44000, skills = {{skill = 40, level = 230}}},
		{id = 8643, cost = 44000, requiredIds = {408}},
		{id = 1241582, cost = 44000, requiredIds = {1310706}, requiredTalentId = 1310706}
	},
	[52] = {
		{id = 11280, cost = 45000, requiredIds = {11279}},
		{id = 11303, cost = 45000, requiredIds = {8637}},
		{id = 11342, cost = 45000, skills = {{skill = 40, level = 240}}},
		{id = 11400, cost = 45000, skills = {{skill = 40, level = 240}}},
		{id = 11274, cost = 45000, requiredIds = {11273}}
	},
	[54] = {
		{id = 11358, cost = 46000, skills = {{skill = 40, level = 250}}},
		{id = 11290, cost = 46000, requiredIds = {11289}},
		{id = 11294, cost = 46000, requiredIds = {11293}}
	},
	[56] = {
		{id = 1325757, cost = 48000, requiredIds = {1325756}, requiredTalentId = 1316709},
		{id = 11300, cost = 48000, requiredIds = {11299}},
		{id = 11198, cost = 48000, requiredIds = {11197}},
		{id = 13230, cost = 48000, skills = {{skill = 40, level = 260}}}
	},
	[58] = {
		{id = 11269, cost = 50000, requiredIds = {11268}},
		{id = 1769, cost = 50000, requiredIds = {1768}},
		{id = 11305, cost = 50000, requiredIds = {8696}}
	},
	[60] = {
		{id = 11281, cost = 51000, requiredIds = {11280}},
		{id = 1325758, cost = 51000, requiredIds = {1325757}, requiredTalentId = 1316709},
		{id = 11286, cost = 51000, requiredIds = {11285}},
		{id = 11343, cost = 51000, skills = {{skill = 40, level = 280}}},
		{id = 1241584, cost = 51000, requiredIds = {1241582}, requiredTalentId = 1310706},
		{id = 11275, cost = 51000, requiredIds = {11274}},
		{id = 1787, cost = 51000, requiredIds = {1786}}
	}
}
