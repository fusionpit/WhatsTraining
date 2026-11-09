local _, wt = ...
local class = wt.forClass("PRIEST")

class.spellsByLevel = {
	[1] = {{id = 1243, cost = 10}},
	[4] = {{id = 2052, cost = 100, requiredIds = {2050}}, {id = 589, cost = 100}},
	[6] = {{id = 17, cost = 100}, {id = 591, cost = 100, requiredIds = {585}}},
	[8] = {{id = 586, cost = 200}, {id = 139, cost = 200}},
	[10] = {
		{id = 2053, cost = 300, requiredIds = {2052}},
		{id = 8092, cost = 300},
		{id = 2006, cost = 300},
		{id = 594, cost = 300, requiredIds = {589}}
	},
	[12] = {
		{id = 588, cost = 800},
		{id = 1244, cost = 800, requiredIds = {1243}},
		{id = 592, cost = 800, requiredIds = {17}}
	},
	[14] = {
		{id = 528, cost = 900},
		{id = 8122, cost = 900},
		{id = 6074, cost = 900, requiredIds = {139}},
		{id = 598, cost = 900, requiredIds = {591}}
	},
	[16] = {{id = 2054, cost = 1400}, {id = 8102, cost = 1400, requiredIds = {8092}}},
	[18] = {
		{id = 527, cost = 1500},
		{id = 1277371, cost = 1500, requiredIds = {1277370}, race = 1},
		{id = 600, cost = 1500, requiredIds = {592}},
		{id = 970, cost = 1500, requiredIds = {594}},
		{id = 19236, cost = 1500, requiredIds = {13908}, race = 3},
		{id = 19296, cost = 3000, requiredIds = {10797}, race = 4}
	},
	[20] = {
		{id = 2944, cost = 2100},
		{id = 9578, cost = 2100, requiredIds = {586}},
		{id = 6346, cost = 2100},
		{id = 2061, cost = 2100},
		{id = 14914, cost = 2100},
		{id = 7128, cost = 2100, requiredIds = {588}},
		{id = 453, cost = 2100},
		{id = 6075, cost = 2100, requiredIds = {6074}},
		{id = 9484, cost = 2100},
		{id = 19261, cost = 2000, requiredIds = {2652}, race = 5},
		{id = 19281, cost = 3000, requiredIds = {9035}, race = 8}
	},
	[22] = {
		{id = 2055, cost = 3300, requiredIds = {2054}},
		{id = 8103, cost = 3300, requiredIds = {8102}},
		{id = 2096, cost = 3300},
		{id = 2010, cost = 3300, requiredIds = {2006}},
		{id = 984, cost = 3300, requiredIds = {598}}
	},
	[24] = {
		{id = 15262, cost = 5000, requiredIds = {14914}},
		{id = 8129, cost = 5000},
		{id = 1245, cost = 5000, requiredIds = {1244}},
		{id = 3747, cost = 5000, requiredIds = {600}}
	},
	[26] = {
		{id = 1277372, cost = 5200, requiredIds = {1277371}, race = 1},
		{id = 9472, cost = 5200, requiredIds = {2061}},
		{id = 6076, cost = 5200, requiredIds = {6075}},
		{id = 992, cost = 5200, requiredIds = {970}},
		{id = 19238, cost = 5200, requiredIds = {19236}, race = 3},
		{id = 19299, cost = 10000, requiredIds = {19296}, race = 4}
	},
	[28] = {
		{id = 19276, cost = 5300, requiredIds = {2944}},
		{id = 6063, cost = 5300, requiredIds = {2055}},
		{id = 15430, cost = 5300, requiredIds = {15237}, requiredTalentId = 15237},
		{id = 8104, cost = 5300, requiredIds = {8103}},
		{id = 17311, cost = 5300, requiredIds = {15407}, requiredTalentId = 15407},
		{id = 8124, cost = 5300, requiredIds = {8122}},
		{id = 19308, cost = 5000, requiredIds = {18137}, race = 8}
	},
	[30] = {
		{id = 14752, cost = 5600},
		{id = 9579, cost = 5600, requiredIds = {9578}},
		{id = 19271, cost = 5600, requiredIds = {13896}, race = 1},
		{id = 15263, cost = 5600, requiredIds = {15262}},
		{id = 602, cost = 5600, requiredIds = {7128}},
		{id = 605, cost = 5600},
		{id = 6065, cost = 5600, requiredIds = {3747}},
		{id = 596, cost = 5600},
		{id = 976, cost = 5600},
		{id = 1004, cost = 5600, requiredIds = {984}},
		{id = 19262, cost = 6000, requiredIds = {19261}, race = 5},
		{id = 19282, cost = 5000, requiredIds = {19281}, race = 8},
		{id = 1277325, cost = 6000, requiredIds = {1277324}, race = 5},
		{id = 1277332, cost = 5600, requiredIds = {1277331}, race = 3},
		{id = 1277634, cost = 13000, requiredIds = {1277462}, race = 7}
	},
	[32] = {
		{id = 552, cost = 8000},
		{id = 9473, cost = 8000, requiredIds = {9472}},
		{id = 8131, cost = 8000, requiredIds = {8129}},
		{id = 6077, cost = 8000, requiredIds = {6076}},
		{id = 1309595, cost = 8000}
	},
	[34] = {
		{id = 1277374, cost = 9000, requiredIds = {1277372}, race = 1},
		{id = 6064, cost = 9000, requiredIds = {6063}},
		{id = 1706, cost = 9000},
		{id = 8105, cost = 9000, requiredIds = {8104}},
		{id = 10880, cost = 9000, requiredIds = {2010}},
		{id = 2767, cost = 9000, requiredIds = {992}},
		{id = 19240, cost = 9000, requiredIds = {19238}, race = 3},
		{id = 19302, cost = 16000, requiredIds = {19299}, race = 4}
	},
	[36] = {
		{id = 19277, cost = 10000, requiredIds = {19276}},
		{id = 988, cost = 10000, requiredIds = {527}},
		{id = 15264, cost = 10000, requiredIds = {15263}},
		{id = 15431, cost = 10000, requiredIds = {15430}, requiredTalentId = 15237},
		{id = 17312, cost = 10000, requiredIds = {17311}, requiredTalentId = 15407},
		{id = 8192, cost = 10000, requiredIds = {453}},
		{id = 2791, cost = 10000, requiredIds = {1245}},
		{id = 6066, cost = 10000, requiredIds = {6065}},
		{id = 19309, cost = 9000, requiredIds = {19308}, race = 8}
	},
	[38] = {
		{id = 9474, cost = 12000, requiredIds = {9473}},
		{id = 6078, cost = 12000, requiredIds = {6077}},
		{id = 6060, cost = 12000, requiredIds = {1004}}
	},
	[40] = {
		{id = 14818, cost = 13000, requiredIds = {14752}},
		{id = 9592, cost = 13000, requiredIds = {9579}},
		{id = 19273, cost = 13000, requiredIds = {19271}, race = 1},
		{id = 2060, cost = 13000},
		{id = 1006, cost = 13000, requiredIds = {602}},
		{id = 10874, cost = 13000, requiredIds = {8131}},
		{id = 8106, cost = 13000, requiredIds = {8105}},
		{id = 1240720, cost = 13000, requiredIds = {402174}, requiredTalentId = 402174},
		{id = 996, cost = 13000, requiredIds = {596}},
		{id = 9485, cost = 13000, requiredIds = {9484}},
		{id = 1309633, cost = 13000, requiredIds = {1309595}},
		{id = 19264, cost = 13000, requiredIds = {19262}, race = 5},
		{id = 19283, cost = 12000, requiredIds = {19282}, race = 8},
		{id = 1277326, cost = 13000, requiredIds = {1277325}, race = 5},
		{id = 1277333, cost = 13000, requiredIds = {1277332}, race = 3},
		{id = 1277638, cost = 27000, requiredIds = {1277634}, race = 7}
	},
	[42] = {
		{id = 1277376, cost = 14000, requiredIds = {1277374}, race = 1},
		{id = 15265, cost = 14000, requiredIds = {15264}},
		{id = 10898, cost = 14000, requiredIds = {6066}},
		{id = 10888, cost = 14000, requiredIds = {8124}},
		{id = 10957, cost = 14000, requiredIds = {976}},
		{id = 10892, cost = 14000, requiredIds = {2767}},
		{id = 19241, cost = 14000, requiredIds = {19240}, race = 3},
		{id = 19303, cost = 27000, requiredIds = {19302}, race = 4}
	},
	[44] = {
		{id = 19278, cost = 16000, requiredIds = {19277}},
		{id = 10915, cost = 16000, requiredIds = {9474}},
		{id = 27799, cost = 16000, requiredIds = {15431}, requiredTalentId = 15237},
		{id = 10911, cost = 16000, requiredIds = {605}},
		{id = 17313, cost = 16000, requiredIds = {17312}, requiredTalentId = 15407},
		{id = 10909, cost = 16000, requiredIds = {2096}},
		{id = 10927, cost = 16000, requiredIds = {6078}},
		{id = 19310, cost = 14000, requiredIds = {19309}, race = 8}
	},
	[46] = {
		{id = 10963, cost = 17000, requiredIds = {2060}},
		{id = 10945, cost = 17000, requiredIds = {8106}},
		{id = 10881, cost = 17000, requiredIds = {10880}},
		{id = 10933, cost = 17000, requiredIds = {6060}}
	},
	[48] = {
		{id = 15266, cost = 18000, requiredIds = {15265}},
		{id = 10875, cost = 18000, requiredIds = {10874}},
		{id = 10937, cost = 18000, requiredIds = {2791}},
		{id = 10899, cost = 18000, requiredIds = {10898}},
		{id = 1309635, cost = 18000, requiredIds = {1309633}}
	},
	[50] = {
		{id = 1277377, cost = 20000, requiredIds = {1277376}, race = 1},
		{id = 14819, cost = 20000, requiredIds = {14818}},
		{id = 10941, cost = 20000, requiredIds = {9592}},
		{id = 19274, cost = 20000, requiredIds = {19273}, race = 1},
		{id = 10916, cost = 20000, requiredIds = {10915}},
		{id = 10951, cost = 20000, requiredIds = {1006}},
		{id = 1240721, cost = 20000, requiredIds = {1240720}, requiredTalentId = 402174},
		{id = 10960, cost = 20000, requiredIds = {996}},
		{id = 1240826, cost = 20000, requiredIds = {401859}, requiredTalentId = 401859},
		{id = 10928, cost = 20000, requiredIds = {10927}},
		{id = 10893, cost = 20000, requiredIds = {10892}},
		{id = 19242, cost = 20000, requiredIds = {19241}, race = 3},
		{id = 19265, cost = 20000, requiredIds = {19264}, race = 5},
		{id = 19284, cost = 18000, requiredIds = {19283}, race = 8},
		{id = 19304, cost = 36000, requiredIds = {19303}, race = 4},
		{id = 1277327, cost = 20000, requiredIds = {1277326}, race = 5},
		{id = 1277334, cost = 20000, requiredIds = {1277333}, race = 3},
		{id = 1277639, cost = 40000, requiredIds = {1277638}, race = 7}
	},
	[52] = {
		{id = 19279, cost = 24000, requiredIds = {19278}},
		{id = 10964, cost = 24000, requiredIds = {10963}},
		{id = 27800, cost = 24000, requiredIds = {27799}, requiredTalentId = 15237},
		{id = 10946, cost = 24000, requiredIds = {10945}},
		{id = 17314, cost = 24000, requiredIds = {17313}, requiredTalentId = 15407},
		{id = 10953, cost = 24000, requiredIds = {8192}},
		{id = 19311, cost = 22000, requiredIds = {19310}, race = 8}
	},
	[54] = {
		{id = 15267, cost = 25000, requiredIds = {15266}},
		{id = 10900, cost = 25000, requiredIds = {10899}},
		{id = 10934, cost = 25000, requiredIds = {10933}}
	},
	[56] = {
		{id = 10917, cost = 26000, requiredIds = {10916}},
		{id = 10876, cost = 26000, requiredIds = {10875}},
		{id = 10890, cost = 26000, requiredIds = {10888}},
		{id = 10929, cost = 26000, requiredIds = {10928}},
		{id = 10958, cost = 26000, requiredIds = {10957}},
		{id = 1309636, cost = 26000, requiredIds = {1309635}}
	},
	[58] = {
		{id = 1277378, cost = 27000, requiredIds = {1277377}, race = 1},
		{id = 10965, cost = 27000, requiredIds = {10964}},
		{id = 10947, cost = 27000, requiredIds = {10946}},
		{id = 10912, cost = 27000, requiredIds = {10911}},
		{id = 20770, cost = 27000, requiredIds = {10881}},
		{id = 10894, cost = 27000, requiredIds = {10893}},
		{id = 19243, cost = 27000, requiredIds = {19242}, race = 3},
		{id = 19305, cost = 49000, requiredIds = {19304}, race = 4}
	},
	[60] = {
		{id = 19280, cost = 28000, requiredIds = {19279}},
		{id = 27841, cost = 28000, requiredIds = {14819}},
		{id = 10942, cost = 28000, requiredIds = {10941}},
		{id = 19275, cost = 28000, requiredIds = {19274}, race = 1},
		{id = 15261, cost = 28000, requiredIds = {15267}},
		{id = 27801, cost = 28000, requiredIds = {27800}, requiredTalentId = 15237},
		{id = 10952, cost = 28000, requiredIds = {10951}},
		{id = 18807, cost = 28000, requiredIds = {17314}, requiredTalentId = 15407},
		{id = 1316995, cost = 28000, requiredIds = {1240721}, requiredTalentId = 402174},
		{id = 10938, cost = 28000, requiredIds = {10937}},
		{id = 10901, cost = 28000, requiredIds = {10900}},
		{id = 10961, cost = 28000, requiredIds = {10960}},
		{id = 1240827, cost = 28000, requiredIds = {1240826}, requiredTalentId = 401859},
		{id = 27681, cost = 28000, requiredIds = {27841}},
		{id = 10955, cost = 28000, requiredIds = {9485}},
		{id = 19266, cost = 29000, requiredIds = {19265}, race = 5},
		{id = 19285, cost = 27000, requiredIds = {19284}, race = 8},
		{id = 19312, cost = 27000, requiredIds = {19311}, race = 8},
		{id = 1277328, cost = 29000, requiredIds = {1277327}, race = 5},
		{id = 1277335, cost = 28000, requiredIds = {1277334}, race = 3},
		{id = 1277640, cost = 60000, requiredIds = {1277639}, race = 7}
	}
}
