local _, wt = ...
if (wt.currentClass ~= "WARRIOR") then
	return
end

-- ordered by rank
local shieldBash = {72,1671,1672,29704}
local heroicStrike = {78,284,285,1608,11564,11565,11566,11567,25286,29707,30324}
local charge = {100,6178,11578}
local mockingBlow = {694,7400,7402,20559,20560,25266}
local rend = {772,6546,6547,6548,11572,11573,11574,25208}
local cleave = {845,7369,11608,11609,20569,25231}
local demoralizingShout = {1160,6190,11554,11555,11556,25202,25203}
local slam = {1464,8820,11604,11605,25241,25242}
local hamstring = {1715,7372,7373,25212}
local battleShout = {6673,5242,6192,11549,11550,11551,25289,2048}
local execute = {5308,20658,20660,20661,20662,25234,25236}
local thunderClap = {6343,8198,8204,8205,11580,11581,25264}
local pummel = {6552,6554}
local revenge = {6572,6574,7379,11600,11601,25288,25269,30357}
local overpower = {7384,7887,11584,11585}
local sunderArmor = {7386,7405,8380,11596,11597,25225}
local intercept = {20252,20616,20617,25272,25275}
local mortalStrike = {12294,21551,21552,21553,25248,30330}
local devastate = {20243,30016,30022}
local bloodthirst = {23881,23892,23893,23894,25251,30335}
local shieldSlam = {23922,23923,23924,23925,25258,30356}
local rampage = {29801,30030,30033}
wt:AddOverriddenSpells(shieldBash,heroicStrike,charge,mockingBlow,rend,cleave,demoralizingShout,slam,hamstring,battleShout,execute,thunderClap,pummel,revenge,overpower,sunderArmor,intercept,mortalStrike,devastate,bloodthirst,shieldSlam,rampage)
wt.SpellsByLevel = {
	[1] = {{id = 6673, cost = 10},},
	[4] = {{id = 100, cost = 100},{id = 772, cost = 100},},
	[6] = {{id = 6343, cost = 100},{id = 3127, cost = 100},},
	[8] = {{id = 1715, cost = 200},{id = 284, cost = 200},},
	[10] = {{id = 6546, cost = 600, requiredIds = {772}},{id = 2687, cost = 600},},
	[12] = {{id = 7384, cost = 1000},{id = 5242, cost = 1000, requiredIds = {6673}},{id = 72, cost = 1000},},
	[14] = {{id = 1160, cost = 1500},{id = 6572, cost = 1500, requiredIds = {71}},},
	[16] = {{id = 285, cost = 2000, requiredIds = {284}},{id = 694, cost = 2000},{id = 2565, cost = 2000, requiredIds = {71}},},
	[18] = {{id = 8198, cost = 3000, requiredIds = {6343}},{id = 676, cost = 3000, requiredIds = {71}},},
	[20] = {{id = 6547, cost = 4000, requiredIds = {6546}},{id = 20230, cost = 4000},{id = 674, cost = 4000},{id = 845, cost = 4000},{id = 12678, cost = 4000},},
	[22] = {{id = 6192, cost = 6000, requiredIds = {5242}},{id = 5246, cost = 6000},{id = 7405, cost = 6000},},
	[24] = {{id = 1608, cost = 8000, requiredIds = {285}},{id = 6190, cost = 8000, requiredIds = {1160}},{id = 5308, cost = 8000},{id = 6574, cost = 8000, requiredIds = {6572}},},
	[26] = {{id = 6178, cost = 10000, requiredIds = {100}},{id = 7400, cost = 10000, requiredIds = {694}},{id = 1161, cost = 10000},},
	[28] = {{id = 7887, cost = 11000, requiredIds = {7384}},{id = 8204, cost = 11000, requiredIds = {8198}},{id = 871, cost = 11000, requiredIds = {71}},},
	[30] = {{id = 6548, cost = 12000, requiredIds = {6547}},{id = 7369, cost = 12000, requiredIds = {845}},{id = 1464, cost = 12000},},
	[32] = {{id = 7372, cost = 14000, requiredIds = {1715}},{id = 11564, cost = 14000, requiredIds = {1608}},{id = 11549, cost = 14000, requiredIds = {6192}},{id = 18499, cost = 14000, requiredIds = {2458}},{id = 20658, cost = 14000, requiredIds = {5308}},{id = 1671, cost = 14000, requiredIds = {72}},},
	[34] = {{id = 11554, cost = 16000, requiredIds = {6190}},{id = 7379, cost = 16000, requiredIds = {6574}},{id = 8380, cost = 16000, requiredIds = {7405}},},
	[36] = {{id = 7402, cost = 18000, requiredIds = {7400}},{id = 1680, cost = 18000, requiredIds = {2458}},},
	[38] = {{id = 8205, cost = 20000, requiredIds = {8204}},{id = 6552, cost = 20000, requiredIds = {2458}},{id = 8820, cost = 20000, requiredIds = {1464}},},
	[40] = {{id = 11565, cost = 22000, requiredIds = {11564}},{id = 11572, cost = 22000, requiredIds = {6548}},{id = 11608, cost = 22000, requiredIds = {7369}},{id = 20660, cost = 22000, requiredIds = {20658}},{id = 750, cost = 22000},},
	[42] = {{id = 11550, cost = 32000, requiredIds = {11549}},{id = 20616, cost = 32000},},
	[44] = {{id = 11584, cost = 34000, requiredIds = {7887}},{id = 11555, cost = 34000, requiredIds = {11554}},{id = 11600, cost = 34000, requiredIds = {7379}},},
	[46] = {{id = 11578, cost = 36000, requiredIds = {6178}},{id = 20559, cost = 36000, requiredIds = {7402}},{id = 11604, cost = 36000, requiredIds = {8820}},{id = 11596, cost = 36000, requiredIds = {8380}},},
	[48] = {{id = 11566, cost = 40000, requiredIds = {11565}},{id = 21551, cost = 2000, requiredIds = {12294}, requiredTalentId = 12294},{id = 11580, cost = 40000, requiredIds = {8205}},{id = 23892, cost = 2000, requiredIds = {23881}, requiredTalentId = 23881},{id = 20661, cost = 40000, requiredIds = {20660}},{id = 23923, cost = 2000, requiredIds = {23922}, requiredTalentId = 23922},},
	[50] = {{id = 11573, cost = 42000, requiredIds = {11572}},{id = 11609, cost = 42000, requiredIds = {11608}},{id = 1719, cost = 42000, requiredIds = {2458}},},
	[52] = {{id = 11551, cost = 54000, requiredIds = {11550}},{id = 20617, cost = 54000, requiredIds = {20616}},{id = 1672, cost = 54000, requiredIds = {1671}},},
	[54] = {{id = 7373, cost = 56000, requiredIds = {7372}},{id = 21552, cost = 2800, requiredIds = {21551}, requiredTalentId = 12294},{id = 23893, cost = 2800, requiredIds = {23892}, requiredTalentId = 23881},{id = 11556, cost = 56000, requiredIds = {11555}},{id = 11605, cost = 56000, requiredIds = {11604}},{id = 11601, cost = 56000, requiredIds = {11600}},{id = 23924, cost = 2800, requiredIds = {23923}, requiredTalentId = 23922},},
	[56] = {{id = 11567, cost = 58000, requiredIds = {11566}},{id = 20560, cost = 58000, requiredIds = {20559}},{id = 20662, cost = 58000, requiredIds = {20661}},},
	[58] = {{id = 11581, cost = 60000, requiredIds = {11580}},{id = 6554, cost = 60000, requiredIds = {6552}},{id = 11597, cost = 60000, requiredIds = {11596}},},
	[60] = {{id = 25286, cost = 60000, requiredIds = {11567}},{id = 21553, cost = 3100, requiredIds = {21552}, requiredTalentId = 12294},{id = 11585, cost = 62000, requiredIds = {11584}},{id = 11574, cost = 62000, requiredIds = {11573}},{id = 25289, cost = 65000, requiredIds = {11551}},{id = 23894, cost = 3100, requiredIds = {23893}, requiredTalentId = 23881},{id = 20569, cost = 62000, requiredIds = {11609}},{id = 30030, cost = 3100, requiredIds = {29801}, requiredTalentId = 29801},{id = 30016, cost = 3100, requiredIds = {20243}, requiredTalentId = 20243},{id = 25288, cost = 56000, requiredIds = {11601}},{id = 23925, cost = 3100, requiredIds = {23924}, requiredTalentId = 23922},},
	[61] = {{id = 25272, cost = 65000, requiredIds = {20617}},{id = 25241, cost = 65000, requiredIds = {11605}},},
	[62] = {{id = 25202, cost = 65000, requiredIds = {11556}},{id = 34428, cost = 58000},},
	[63] = {{id = 25269, cost = 65000, requiredIds = {25288}},},
	[64] = {{id = 29704, cost = 60000, requiredIds = {1672}},{id = 23920, cost = 65000},},
	[65] = {{id = 25266, cost = 65000, requiredIds = {20560}},{id = 25234, cost = 65000, requiredIds = {20662}},},
	[66] = {{id = 29707, cost = 65000, requiredIds = {25286}},{id = 25248, cost = 3250, requiredIds = {21553}, requiredTalentId = 12294},{id = 25251, cost = 3250, requiredIds = {23894}, requiredTalentId = 23881},{id = 25258, cost = 3250, requiredIds = {23925}, requiredTalentId = 23922},},
	[67] = {{id = 25212, cost = 65000, requiredIds = {7373}},{id = 25264, cost = 65000, requiredIds = {11581}},{id = 25225, cost = 65000, requiredIds = {11597}},},
	[68] = {{id = 25208, cost = 65000, requiredIds = {11574}},{id = 25231, cost = 65000, requiredIds = {20569}},{id = 469, cost = 65000},},
	[69] = {{id = 2048, cost = 65000, requiredIds = {25289}},{id = 25275, cost = 65000, requiredIds = {25272}},{id = 25242, cost = 65000, requiredIds = {25241}},},
	[70] = {{id = 30330, cost = 3250, requiredIds = {25248}, requiredTalentId = 12294},{id = 30335, cost = 3250, requiredIds = {25251}, requiredTalentId = 23881},{id = 25203, cost = 65000, requiredIds = {25202}},{id = 25236, cost = 65000, requiredIds = {25234}},{id = 30033, cost = 3250, requiredIds = {30030}, requiredTalentId = 29801},{id = 30022, cost = 3250, requiredIds = {30016}, requiredTalentId = 20243},{id = 3411, cost = 65000},{id = 30357, cost = 65000, requiredIds = {25269}},{id = 30356, cost = 3250, requiredIds = {25258}, requiredTalentId = 23922},},
}
