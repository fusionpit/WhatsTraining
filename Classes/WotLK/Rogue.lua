local _, wt = ...
if (wt.currentClass ~= "ROGUE") then
	return
end
local backstab = {53,2589,2590,2591,8721,11279,11280,11281,25300,26863,48656,48657}
local kidneyShot = {408,8643}
local garrote = {703,8631,8632,8633,11289,11290,26839,26884,48675,48676}
local sinisterStrike = {1752,1757,1758,1759,1760,8621,11293,11294,26861,26862,48637,48638}
local kick = {1766}
local gouge = {1776}
local stealth = {1784}
local vanish = {1856,1857,26889}
local rupture = {1943,8639,8640,11273,11274,11275,26867,48671,48672}
local feint = {1966,6768,8637,11303,25302,27448,48658,48659}
local sap = {6770,2070,11297,51724}
local eviscerate = {2098,6760,6761,6762,8623,8624,11299,11300,31016,26865,48667,48668}
local sprint = {2983,8696,11305}
local sliceandDice = {5171,6774}
local evasion = {5277,26669}
local exposeArmor = {8647}
local ambush = {8676,8724,8725,11267,11268,11269,27441,48689,48690,48691}
local deadlyThrow = {26679,48673,48674}
local envenom = {32645,32684,57992,57993}
local mutilate = {1329,34411,34412,34413,48663,48666}
wt:AddOverriddenSpells(backstab,kidneyShot,garrote,sinisterStrike,kick,gouge,stealth,vanish,rupture,feint,sap,eviscerate,sprint,sliceandDice,evasion,exposeArmor,ambush,deadlyThrow,envenom,mutilate)
wt.SpellsByLevel = {
	[1] = {{id = 674, cost = 300},{id = 1784, cost = 10},},
	[4] = {{id = 53, cost = 100},{id = 921, cost = 100},},
	[6] = {{id = 1776, cost = 100},{id = 1757, cost = 100},},
	[8] = {{id = 6760, cost = 200, requiredIds = {2098}},{id = 5277, cost = 200},},
	[10] = {{id = 5171, cost = 300},{id = 2983, cost = 300},{id = 6770, cost = 300},},
	[12] = {{id = 2589, cost = 800, requiredIds = {53}},{id = 1766, cost = 800},{id = 3127, cost = 800},},
	[14] = {{id = 8647, cost = 1200},{id = 703, cost = 1200},{id = 1758, cost = 1200, requiredIds = {1757}},},
	[16] = {{id = 6761, cost = 1800, requiredIds = {6760}},{id = 1966, cost = 1800},{id = 1804, cost = 1800},},
	[18] = {{id = 8676, cost = 2900},},
	[20] = {{id = 51722, cost = 3000},{id = 1943, cost = 3000},{id = 2590, cost = 3000, requiredIds = {2589}},},
	[22] = {{id = 8631, cost = 4000, requiredIds = {703}},{id = 1759, cost = 4000, requiredIds = {1758}},{id = 1725, cost = 4000},{id = 1856, cost = 4000, requiredIds = {1784}},},
	[24] = {{id = 6762, cost = 5000, requiredIds = {6761}},{id = 2836, cost = 5000},},
	[26] = {{id = 8724, cost = 6000, requiredIds = {8676}},{id = 1833, cost = 6000},},
	[28] = {{id = 8639, cost = 8000, requiredIds = {1943}},{id = 2591, cost = 8000, requiredIds = {2590}},{id = 6768, cost = 8000, requiredIds = {1966}},{id = 2070, cost = 8000, requiredIds = {6770}},},
	[30] = {{id = 8632, cost = 10000, requiredIds = {8631}},{id = 408, cost = 10000},{id = 1760, cost = 10000, requiredIds = {1759}},{id = 1842, cost = 10000, requiredIds = {2836}},},
	[32] = {{id = 8623, cost = 12000, requiredIds = {6762}},},
	[34] = {{id = 8725, cost = 14000, requiredIds = {8724}},{id = 8696, cost = 14000, requiredIds = {2983}},{id = 2094, cost = 14000},},
	[36] = {{id = 8640, cost = 16000, requiredIds = {8639}},{id = 8721, cost = 16000, requiredIds = {2591}},},
	[38] = {{id = 8633, cost = 18000, requiredIds = {8632}},{id = 8621, cost = 18000, requiredIds = {1760}},},
	[40] = {{id = 8624, cost = 20000, requiredIds = {8623}},{id = 8637, cost = 20000, requiredIds = {6768}},{id = 1860, cost = 20000},},
	[42] = {{id = 11267, cost = 27000, requiredIds = {8725}},{id = 6774, cost = 27000, requiredIds = {5171}},{id = 1857, cost = 27000, requiredIds = {1856}},},
	[44] = {{id = 11273, cost = 29000, requiredIds = {8640}},{id = 11279, cost = 29000, requiredIds = {8721}},},
	[46] = {{id = 11289, cost = 31000, requiredIds = {8633}},{id = 11293, cost = 31000, requiredIds = {8621}},{id = 17347, cost = 384, requiredTalentId = 16511},},
	[48] = {{id = 11299, cost = 33000, requiredIds = {8624}},{id = 11297, cost = 33000, requiredIds = {2070}},},
	[50] = {{id = 11268, cost = 35000, requiredIds = {11267}},{id = 8643, cost = 35000, requiredIds = {408}},{id = 34411, cost = 5500, requiredIds = {1329}, requiredTalentId = 1329},{id = 26669, cost = 35000, requiredIds = {5277}},},
	[52] = {{id = 11274, cost = 46000, requiredIds = {11273}},{id = 11280, cost = 46000, requiredIds = {11279}},{id = 11303, cost = 46000, requiredIds = {8637}},},
	[54] = {{id = 11290, cost = 48000, requiredIds = {11289}},{id = 11294, cost = 48000, requiredIds = {11293}},},
	[56] = {{id = 11300, cost = 50000, requiredIds = {11299}},},
	[58] = {{id = 11269, cost = 52000, requiredIds = {11268}},{id = 11305, cost = 52000, requiredIds = {8696}},{id = 17348, cost = 650, requiredIds = {17347}, requiredTalentId = 16511},},
	[60] = {{id = 31016, cost = 65000, requiredIds = {11300}},{id = 34412, cost = 6500, requiredIds = {34411}, requiredTalentId = 1329},{id = 11275, cost = 54000, requiredIds = {11274}},{id = 11281, cost = 54000, requiredIds = {11280}},{id = 25300, cost = 72000, requiredIds = {11281}},{id = 25302, cost = 50000, requiredIds = {11303}},},
	[61] = {{id = 26839, cost = 50000, requiredIds = {11290}},},
	[62] = {{id = 32645, cost = 59000},{id = 26861, cost = 50000, requiredIds = {11294}},{id = 26889, cost = 59000, requiredIds = {1857}},},
	[64] = {{id = 26679, cost = 72000},{id = 26865, cost = 140000, requiredIds = {31016}},{id = 27448, cost = 72000, requiredIds = {25302}},},
	[66] = {{id = 27441, cost = 80000, requiredIds = {11269}},{id = 31224, cost = 89000},},
	[68] = {{id = 26867, cost = 120000, requiredIds = {11275}},{id = 26863, cost = 110000, requiredIds = {25300}},},
	[69] = {{id = 32684, cost = 100000, requiredIds = {32645}},},
	[70] = {{id = 48689, cost = 140000, requiredIds = {27441}},{id = 48673, cost = 100000, requiredIds = {26679}},{id = 26884, cost = 100000, requiredIds = {26839}},{id = 34413, cost = 7500, requiredIds = {34412}, requiredTalentId = 1329},{id = 5938, cost = 100000},{id = 26862, cost = 100000, requiredIds = {26861}},{id = 26864, cost = 2700, requiredIds = {17348}, requiredTalentId = 16511},},
	[71] = {{id = 51724, cost = 300000, requiredIds = {11297}},},
	[72] = {{id = 48658, cost = 300000, requiredIds = {27448}},},
	[73] = {{id = 48667, cost = 300000, requiredIds = {26865}},},
	[74] = {{id = 57992, cost = 300000, requiredIds = {32684}},{id = 48671, cost = 300000, requiredIds = {26867}},{id = 48656, cost = 300000, requiredIds = {26863}},},
	[75] = {{id = 48690, cost = 300000, requiredIds = {48689}},{id = 48675, cost = 300000, requiredIds = {26884}},{id = 48663, cost = 15000, requiredIds = {34413}, requiredTalentId = 1329},{id = 57934, cost = 300000},},
	[76] = {{id = 48674, cost = 300000, requiredIds = {48673}},{id = 48637, cost = 300000, requiredIds = {26862}},},
	[78] = {{id = 48659, cost = 300000, requiredIds = {48658}},},
	[79] = {{id = 48668, cost = 300000, requiredIds = {48667}},{id = 48672, cost = 300000, requiredIds = {48671}},},
	[80] = {{id = 48691, cost = 300000, requiredIds = {48690}},{id = 57993, cost = 300000, requiredIds = {57992}},{id = 48676, cost = 300000, requiredIds = {48675}},{id = 48666, cost = 15000, requiredIds = {48663}, requiredTalentId = 1329},{id = 48657, cost = 300000, requiredIds = {48656}},{id = 51723, cost = 300000},{id = 48638, cost = 300000, requiredIds = {48637}},{id = 48660, cost = 15000, requiredIds = {26864}, requiredTalentId = 16511},},
}