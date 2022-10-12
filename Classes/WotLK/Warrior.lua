local _, wt = ...
if (wt.currentClass ~= "WARRIOR") then
	return
end
local shieldBash = {72}
local heroicStrike = {78,284,285,1608,11564,11565,11566,11567,25286,29707,30324,47449,47450}
local charge = {100,6178,11578}
local commandingShout = {469,47439,47440}
local mockingBlow = {694}
local rend = {772,6546,6547,6548,11572,11573,11574,25208,46845,47465}
local cleave = {845,7369,11608,11609,20569,25231,47519,47520}
local demoralizingShout = {1160,6190,11554,11555,11556,25202,25203,47437}
local slam = {1464,8820,11604,11605,25241,25242,47474,47475}
local hamstring = {1715}
local battleShout = {6673,5242,6192,11549,11550,11551,25289,2048,47436}
local execute = {5308,20658,20660,20661,20662,25234,25236,47470,47471}
local thunderClap = {6343,8198,8204,8205,11580,11581,25264,47501,47502}
local pummel = {6552}
local revenge = {6572,6574,7379,11600,11601,25288,25269,30357,57823}
local overpower = {7384}
local sunderArmor = {7386}
local intercept = {20252}
local shieldSlam = {23922,23923,23924,23925,25258,30356,47487,47488}
local mortalStrike = {12294,21551,21552,21553,25248,30330,47485,47486}
local devastate = {20243,30016,30022,47497,47498}
local bloodthirst = {23881}
local rampage = {29801}
wt:AddOverriddenSpells(shieldBash,heroicStrike,charge,commandingShout,mockingBlow,rend,cleave,demoralizingShout,slam,hamstring,battleShout,execute,thunderClap,pummel,revenge,overpower,sunderArmor,intercept,shieldSlam,mortalStrike,devastate,bloodthirst,rampage)
wt.SpellsByLevel = {
	[1] = {{id = 6673, cost = 10},},
	[4] = {{id = 100, cost = 100},{id = 772, cost = 100},},
	[6] = {{id = 6343, cost = 100},{id = 3127, cost = 100},{id = 34428, cost = 100},},
	[8] = {{id = 1715, cost = 200},{id = 284, cost = 200},},
	[10] = {{id = 6546, cost = 600, requiredIds = {772}},{id = 2687, cost = 600},},
	[12] = {{id = 7384, cost = 1000},{id = 5242, cost = 1000, requiredIds = {6673}},{id = 72, cost = 1000},},
	[14] = {{id = 1160, cost = 1500},{id = 6572, cost = 1500, requiredIds = {71}},},
	[16] = {{id = 285, cost = 2000, requiredIds = {284}},{id = 694, cost = 2000},{id = 2565, cost = 2000, requiredIds = {71}},},
	[18] = {{id = 8198, cost = 3000, requiredIds = {6343}},{id = 676, cost = 3000, requiredIds = {71}},},
	[20] = {{id = 6547, cost = 4000, requiredIds = {6546}},{id = 20230, cost = 4000},{id = 674, cost = 4000},{id = 845, cost = 4000},{id = 12678, cost = 4000},},
	[22] = {{id = 6192, cost = 6000, requiredIds = {5242}},{id = 5246, cost = 6000},},
	[24] = {{id = 1608, cost = 8000, requiredIds = {285}},{id = 6190, cost = 8000, requiredIds = {1160}},{id = 5308, cost = 8000},{id = 6574, cost = 8000, requiredIds = {6572}},},
	[26] = {{id = 6178, cost = 10000, requiredIds = {100}},{id = 1161, cost = 10000},},
	[28] = {{id = 8204, cost = 11000, requiredIds = {8198}},{id = 871, cost = 11000, requiredIds = {71}},},
	[30] = {{id = 6548, cost = 12000, requiredIds = {6547}},{id = 7369, cost = 12000, requiredIds = {845}},{id = 20252, cost = 12000, requiredIds = {2458}},{id = 1464, cost = 12000},},
	[32] = {{id = 11564, cost = 14000, requiredIds = {1608}},{id = 11549, cost = 14000, requiredIds = {6192}},{id = 18499, cost = 14000},{id = 20658, cost = 14000, requiredIds = {5308}},},
	[34] = {{id = 11554, cost = 16000, requiredIds = {6190}},{id = 7379, cost = 16000, requiredIds = {6574}},},
	[36] = {{id = 1680, cost = 18000, requiredIds = {2458}},},
	[38] = {{id = 8205, cost = 20000, requiredIds = {8204}},{id = 6552, cost = 20000, requiredIds = {2458}},{id = 8820, cost = 20000, requiredIds = {1464}},},
	[40] = {{id = 11565, cost = 22000, requiredIds = {11564}},{id = 11572, cost = 22000, requiredIds = {6548}},{id = 11608, cost = 22000, requiredIds = {7369}},{id = 20660, cost = 22000, requiredIds = {20658}},{id = 750, cost = 22000},{id = 23922, cost = 22000},},
	[42] = {{id = 11550, cost = 32000, requiredIds = {11549}},},
	[44] = {{id = 11555, cost = 34000, requiredIds = {11554}},{id = 11600, cost = 34000, requiredIds = {7379}},},
	[46] = {{id = 11578, cost = 36000, requiredIds = {6178}},{id = 11604, cost = 36000, requiredIds = {8820}},},
	[48] = {{id = 11566, cost = 40000, requiredIds = {11565}},{id = 21551, cost = 2000, requiredIds = {12294}, requiredTalentId = 12294},{id = 11580, cost = 40000, requiredIds = {8205}},{id = 20661, cost = 40000, requiredIds = {20660}},{id = 23923, cost = 40000, requiredIds = {23922}},},
	[50] = {{id = 11573, cost = 42000, requiredIds = {11572}},{id = 11609, cost = 42000, requiredIds = {11608}},{id = 1719, cost = 42000, requiredIds = {2458}},},
	[52] = {{id = 11551, cost = 54000, requiredIds = {11550}},},
	[54] = {{id = 21552, cost = 2800, requiredIds = {21551}, requiredTalentId = 12294},{id = 11556, cost = 56000, requiredIds = {11555}},{id = 11605, cost = 56000, requiredIds = {11604}},{id = 11601, cost = 56000, requiredIds = {11600}},{id = 23924, cost = 56000, requiredIds = {23923}},},
	[56] = {{id = 11567, cost = 58000, requiredIds = {11566}},{id = 20662, cost = 58000, requiredIds = {20661}},},
	[58] = {{id = 11581, cost = 60000, requiredIds = {11580}},},
	[60] = {{id = 25286, cost = 60000, requiredIds = {11567}},{id = 21553, cost = 3100, requiredIds = {21552}, requiredTalentId = 12294},{id = 11574, cost = 62000, requiredIds = {11573}},{id = 25289, cost = 65000, requiredIds = {11551}},{id = 20569, cost = 62000, requiredIds = {11609}},{id = 30016, cost = 3100, requiredTalentId = 20243},{id = 25288, cost = 60000, requiredIds = {11601}},{id = 23925, cost = 62000, requiredIds = {23924}},},
	[61] = {{id = 25241, cost = 65000, requiredIds = {11605}},},
	[62] = {{id = 25202, cost = 65000, requiredIds = {11556}},},
	[63] = {{id = 25269, cost = 65000, requiredIds = {25288}},},
	[64] = {{id = 23920, cost = 65000},},
	[65] = {{id = 25234, cost = 65000, requiredIds = {20662}},},
	[66] = {{id = 29707, cost = 65000, requiredIds = {25286}},{id = 25248, cost = 3250, requiredIds = {21553}, requiredTalentId = 12294},{id = 25258, cost = 65000, requiredIds = {23925}},},
	[67] = {{id = 25264, cost = 65000, requiredIds = {11581}},},
	[68] = {{id = 25208, cost = 65000, requiredIds = {11574}},{id = 25231, cost = 65000, requiredIds = {20569}},{id = 469, cost = 65000},},
	[69] = {{id = 2048, cost = 71000, requiredIds = {25289}},{id = 25242, cost = 71000, requiredIds = {25241}},},
	[70] = {{id = 30324, cost = 100000, requiredIds = {29707}},{id = 30330, cost = 3500, requiredIds = {25248}, requiredTalentId = 12294},{id = 25203, cost = 71000, requiredIds = {25202}},{id = 25236, cost = 71000, requiredIds = {25234}},{id = 30022, cost = 3250, requiredIds = {30016}, requiredTalentId = 20243},{id = 3411, cost = 65000},{id = 30357, cost = 260000, requiredIds = {25269}},{id = 30356, cost = 71000, requiredIds = {25258}},},
	[71] = {{id = 46845, cost = 260000, requiredIds = {25208}},{id = 64382, cost = 260000},},
	[72] = {{id = 47449, cost = 260000, requiredIds = {30324}},{id = 47519, cost = 260000, requiredIds = {25231}},},
	[73] = {{id = 47501, cost = 260000, requiredIds = {25264}},{id = 47470, cost = 260000, requiredIds = {25236}},},
	[74] = {{id = 47439, cost = 100000, requiredIds = {469}},{id = 47474, cost = 260000, requiredIds = {25242}},},
	[75] = {{id = 47485, cost = 13000, requiredIds = {30330}, requiredTalentId = 12294},{id = 55694, cost = 100000},{id = 47497, cost = 5000, requiredIds = {30022}, requiredTalentId = 20243},{id = 47487, cost = 260000, requiredIds = {30356}},},
	[76] = {{id = 47450, cost = 260000, requiredIds = {47449}},{id = 47465, cost = 260000, requiredIds = {46845}},},
	[77] = {{id = 47520, cost = 260000, requiredIds = {47519}},},
	[78] = {{id = 47502, cost = 260000, requiredIds = {47501}},{id = 47436, cost = 260000, requiredIds = {2048}},},
	[79] = {{id = 47437, cost = 260000, requiredIds = {25203}},{id = 47475, cost = 260000, requiredIds = {47474}},},
	[80] = {{id = 57755, cost = 100000},{id = 47486, cost = 13000, requiredIds = {47485}, requiredTalentId = 12294},{id = 47440, cost = 260000, requiredIds = {47439}},{id = 47471, cost = 260000, requiredIds = {47470}},{id = 47498, cost = 5000, requiredIds = {47497}, requiredTalentId = 20243},{id = 57823, cost = 260000, requiredIds = {30357}},{id = 47488, cost = 260000, requiredIds = {47487}},},
}
