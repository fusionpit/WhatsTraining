local _, wt = ...
if (wt.currentClass ~= "DEATHKNIGHT") then
	return
end
local deathandDecay = {43265,49936,49937,49938}
local plagueStrike = {45462,49917,49918,49919,49920,49921}
local deathStrike = {49998,49999,45463,49923,49924}
local icyTouch = {45477,49896,49903,49904,49909}
local bloodStrike = {45902,49926,49927,49928,49929,49930}
local deathCoil = {47541,49892,49893,49894,49895}
local bloodBoil = {48721,49939,49940,49941}
local obliterate = {49020,51423,51424,51425}
local hornofWinter = {57330,57623}
local frostStrike = {49143,51416,51417,51418,51419,55268}
local corpseExplosion = {49158,51325,51326,51327,51328}
local howlingBlast = {49184,51409,51410,51411}
local heartStrike = {55050,55258,55259,55260,55261,55262}
local scourgeStrike = {55090,55265,55270,55271}
wt:AddOverriddenSpells(deathandDecay,plagueStrike,deathStrike,icyTouch,bloodStrike,deathCoil,bloodBoil,obliterate,hornofWinter,frostStrike,corpseExplosion,howlingBlast,heartStrike,scourgeStrike)
wt.SpellsByLevel = {
	[55] = {{id = 53341, cost = 55000},{id = 53343, cost = 55000},},
	[56] = {{id = 50842, cost = 5600},{id = 49998, cost = 5600},{id = 46584, cost = 5600},},
	[57] = {{id = 48263, cost = 5700},{id = 47528, cost = 5700},{id = 54447, cost = 5700},{id = 53342, cost = 5700},},
	[58] = {{id = 48721, cost = 5800},{id = 45524, cost = 5800},},
	[59] = {{id = 49926, cost = 5900, requiredIds = {45902}},{id = 55258, cost = 5900, requiredIds = {55050}, requiredTalentId = 55050},{id = 47476, cost = 5900},},
	[60] = {{id = 51416, cost = 6200, requiredIds = {49143}, requiredTalentId = 49143},{id = 53331, cost = 6000},{id = 51325, cost = 300, requiredIds = {49158}, requiredTalentId = 49158},{id = 43265, cost = 6000},{id = 49917, cost = 5800, requiredIds = {45462}},},
	[61] = {{id = 49896, cost = 61000, requiredIds = {45477}},{id = 49020, cost = 61000},{id = 3714, cost = 61000},},
	[62] = {{id = 48792, cost = 62000},{id = 49892, cost = 59000, requiredIds = {47541}},},
	[63] = {{id = 54446, cost = 68000},{id = 53323, cost = 63000},{id = 49999, cost = 65000, requiredIds = {49998}},},
	[64] = {{id = 49927, cost = 64000, requiredIds = {49926}},{id = 45529, cost = 64000},{id = 55259, cost = 3200, requiredIds = {55258}, requiredTalentId = 55050},},
	[65] = {{id = 56222, cost = 65000},{id = 51417, cost = 3250, requiredIds = {51416}, requiredTalentId = 49143},{id = 57330, cost = 65000},{id = 49918, cost = 65000, requiredIds = {49917}},},
	[66] = {{id = 49939, cost = 66000, requiredIds = {48721}},{id = 48743, cost = 66000},},
	[67] = {{id = 49903, cost = 67000, requiredIds = {49896}},{id = 51423, cost = 67000, requiredIds = {49020}},{id = 56815, cost = 67000},{id = 49936, cost = 68000, requiredIds = {43265}},{id = 55265, cost = 18000, requiredIds = {55090}, requiredTalentId = 55090},},
	[68] = {{id = 48707, cost = 68000},{id = 49893, cost = 68000, requiredIds = {49892}},},
	[69] = {{id = 49928, cost = 69000, requiredIds = {49927}},{id = 55260, cost = 3450, requiredIds = {55259}, requiredTalentId = 55050},},
	[70] = {{id = 51418, cost = 18000, requiredIds = {51417}, requiredTalentId = 49143},{id = 51409, cost = 3350, requiredIds = {49184}, requiredTalentId = 49184},{id = 53344, cost = 360000},{id = 51326, cost = 18000, requiredIds = {51325}, requiredTalentId = 49158},{id = 45463, cost = 63000, requiredIds = {49999}},{id = 49919, cost = 360000, requiredIds = {49918}},{id = 48265, cost = 360000},},
	[72] = {{id = 49940, cost = 360000, requiredIds = {49939}},{id = 70164, cost = 360000},{id = 62158, cost = 360000},{id = 61999, cost = 360000},},
	[73] = {{id = 49904, cost = 360000, requiredIds = {49903}},{id = 51424, cost = 360000, requiredIds = {51423}},{id = 49937, cost = 360000, requiredIds = {49936}},{id = 55270, cost = 18000, requiredIds = {55265}, requiredTalentId = 55090},},
	[74] = {{id = 49929, cost = 360000, requiredIds = {49928}},{id = 55261, cost = 18000, requiredIds = {55260}, requiredTalentId = 55050},},
	[75] = {{id = 47568, cost = 360000},{id = 51419, cost = 18000, requiredIds = {51418}, requiredTalentId = 49143},{id = 57623, cost = 360000, requiredIds = {57330}},{id = 51410, cost = 18000, requiredIds = {51409}, requiredTalentId = 49184},{id = 51327, cost = 18000, requiredIds = {51326}, requiredTalentId = 49158},{id = 49923, cost = 360000, requiredIds = {45463}},{id = 49920, cost = 360000, requiredIds = {49919}},},
	[76] = {{id = 49894, cost = 360000, requiredIds = {49893}},},
	[78] = {{id = 49941, cost = 360000, requiredIds = {49940}},{id = 49909, cost = 360000, requiredIds = {49904}},},
	[79] = {{id = 51425, cost = 360000, requiredIds = {51424}},{id = 55271, cost = 18000, requiredIds = {55270}, requiredTalentId = 55090},},
	[80] = {{id = 49930, cost = 360000, requiredIds = {49929}},{id = 55262, cost = 18000, requiredIds = {55261}, requiredTalentId = 55050},{id = 55268, cost = 18000, requiredIds = {51419}, requiredTalentId = 49143},{id = 51411, cost = 18000, requiredIds = {51410}, requiredTalentId = 49184},{id = 42650, cost = 360000},{id = 51328, cost = 18000, requiredIds = {51327}, requiredTalentId = 49158},{id = 49895, cost = 360000, requiredIds = {49894}},{id = 49924, cost = 360000, requiredIds = {49923}},{id = 49938, cost = 360000, requiredIds = {49937}},{id = 49921, cost = 360000, requiredIds = {49920}},},
}