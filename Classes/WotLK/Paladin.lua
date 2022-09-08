local _, wt = ...
if (wt.currentClass ~= "PALADIN") then
	return
end
local devotionAura = {465,10290,643,10291,1032,10292,10293,27149,48941,48942}
local layonHands = {633,2800,10310,27154,48788}
local retributionAura = {7294,10298,10299,10300,10301,27150,54043}
local shadowResistanceAura = {19876,19895,19896,27151,48943}
local frostResistanceAura = {19888,19897,19898,27152,48945}
local fireResistanceAura = {19891,19899,19900,27153,48947}
local spiritualAttunement = {31785,33776}
wt:AddOverriddenSpells(devotionAura,layonHands,retributionAura,shadowResistanceAura,frostResistanceAura,fireResistanceAura,spiritualAttunement)
wt.SpellsByLevel = wt.FactionFilter({
	[1] = {{id = 465, cost = 10},},
	[4] = {{id = 19740, cost = 100},{id = 20271, cost = 100},},
	[6] = {{id = 639, cost = 100, requiredIds = {635}},{id = 498, cost = 100},},
	[8] = {{id = 3127, cost = 100},{id = 1152, cost = 100},{id = 853, cost = 100},},
	[10] = {{id = 633, cost = 300},{id = 10290, cost = 300, requiredIds = {465}},{id = 1022, cost = 300},},
	[12] = {{id = 19834, cost = 1000, requiredIds = {19740}},{id = 53408, cost = 1000},},
	[14] = {{id = 19742, cost = 2000},{id = 647, cost = 2000, requiredIds = {639}},{id = 31789, cost = 4000},},
	[16] = {{id = 62124, cost = 3000},{id = 25780, cost = 3000},{id = 7294, cost = 3000},},
	[18] = {{id = 1044, cost = 3500},},
	[20] = {{id = 26573, cost = 4000},{id = 879, cost = 4000},{id = 19750, cost = 4000},{id = 5502, cost = 4000},{id = 34769, cost = 3500, faction = "Horde"},{id = 20217, cost = 4000},{id = 643, cost = 4000, requiredIds = {10290}},},
	[22] = {{id = 19746, cost = 4000},{id = 1026, cost = 4000, requiredIds = {647}},{id = 20164, cost = 4000},{id = 19835, cost = 4000, requiredIds = {19834}},},
	[24] = {{id = 19850, cost = 5000, requiredIds = {19742}},{id = 10322, cost = 5000, requiredIds = {7328}},{id = 10326, cost = 5000},{id = 5588, cost = 5000, requiredIds = {853}},{id = 5599, cost = 5000, requiredIds = {1022}},},
	[26] = {{id = 19939, cost = 6000, requiredIds = {19750}},{id = 1038, cost = 6000},{id = 10298, cost = 6000, requiredIds = {7294}},},
	[28] = {{id = 5614, cost = 9000, requiredIds = {879}},{id = 19876, cost = 9000},{id = 53407, cost = 9000},},
	[30] = {{id = 20116, cost = 11000, requiredIds = {26573}},{id = 1042, cost = 11000, requiredIds = {1026}},{id = 2800, cost = 11000, requiredIds = {633}},{id = 20165, cost = 11000},{id = 10291, cost = 11000, requiredIds = {643}},{id = 19752, cost = 11000},},
	[32] = {{id = 19888, cost = 12000},{id = 19836, cost = 12000, requiredIds = {19835}},},
	[34] = {{id = 19852, cost = 13000, requiredIds = {19850}},{id = 19940, cost = 13000, requiredIds = {19939}},{id = 642, cost = 13000},},
	[36] = {{id = 5615, cost = 14000, requiredIds = {5614}},{id = 10324, cost = 14000, requiredIds = {10322}},{id = 19891, cost = 14000},{id = 10299, cost = 14000, requiredIds = {10298}},},
	[38] = {{id = 3472, cost = 16000, requiredIds = {1042}},{id = 20166, cost = 16000},{id = 10278, cost = 16000, requiredIds = {5599}},},
	[40] = {{id = 20922, cost = 20000, requiredIds = {20116}},{id = 34767, cost = 20000, requiredIds = {34769}, faction = "Horde"},{id = 750, cost = 20000},{id = 1032, cost = 20000, requiredIds = {10291}},{id = 5589, cost = 20000, requiredIds = {5588}},{id = 19895, cost = 20000, requiredIds = {19876}},},
	[42] = {{id = 4987, cost = 21000},{id = 19941, cost = 21000, requiredIds = {19940}},{id = 19837, cost = 21000, requiredIds = {19836}},},
	[44] = {{id = 19853, cost = 22000, requiredIds = {19852}},{id = 10312, cost = 22000, requiredIds = {5615}},{id = 19897, cost = 22000, requiredIds = {19888}},{id = 24275, cost = 22000},},
	[46] = {{id = 10328, cost = 24000, requiredIds = {3472}},{id = 6940, cost = 24000},{id = 10300, cost = 24000, requiredIds = {10299}},},
	[48] = {{id = 20929, cost = 1300, requiredTalentId = 20473},{id = 20772, cost = 26000, requiredIds = {10324}},{id = 19899, cost = 26000, requiredIds = {19891}},},
	[50] = {{id = 20923, cost = 28000, requiredIds = {20922}},{id = 19942, cost = 28000, requiredIds = {19941}},{id = 2812, cost = 28000},{id = 10310, cost = 28000, requiredIds = {2800}},{id = 10292, cost = 28000, requiredIds = {1032}},{id = 20927, cost = 1400, requiredTalentId = 20925},},
	[52] = {{id = 10313, cost = 34000, requiredIds = {10312}},{id = 19896, cost = 34000, requiredIds = {19895}},{id = 19838, cost = 34000, requiredIds = {19837}},{id = 25782, cost = 46000, requiredIds = {19838}},{id = 24274, cost = 34000, requiredIds = {24275}},},
	[54] = {{id = 19854, cost = 40000, requiredIds = {19853}},{id = 25894, cost = 46000, requiredIds = {19854}},{id = 10329, cost = 40000, requiredIds = {10328}},{id = 10308, cost = 40000, requiredIds = {5589}},},
	[56] = {{id = 20930, cost = 2100, requiredIds = {20929}, requiredTalentId = 20473},{id = 19898, cost = 42000, requiredIds = {19897}},{id = 10301, cost = 42000, requiredIds = {10300}},},
	[58] = {{id = 19943, cost = 44000, requiredIds = {19942}},},
	[60] = {{id = 25290, cost = 50000, requiredIds = {19854}},{id = 20924, cost = 46000, requiredIds = {20923}},{id = 10314, cost = 46000, requiredIds = {10313}},{id = 25918, cost = 46000, requiredIds = {25290,25894}},{id = 25292, cost = 46000, requiredIds = {10329}},{id = 10318, cost = 46000, requiredIds = {2812}},{id = 20773, cost = 46000, requiredIds = {20772}},{id = 32699, cost = 2300, requiredTalentId = 31935},{id = 10293, cost = 46000, requiredIds = {10292}},{id = 19900, cost = 46000, requiredIds = {19899}},{id = 25898, cost = 2300, requiredIds = {20217}},{id = 25899, cost = 2300, requiredIds = {20911}, requiredTalentId = 20911},{id = 20928, cost = 2300, requiredIds = {20927}, requiredTalentId = 20925},{id = 25291, cost = 50000, requiredIds = {19838}},{id = 25916, cost = 46000, requiredIds = {25291,25782}},{id = 24239, cost = 46000, requiredIds = {24274}},},
	[62] = {{id = 27135, cost = 55000, requiredIds = {25292}},{id = 32223, cost = 55000},},
	[63] = {{id = 27151, cost = 61000, requiredIds = {19896}},},
	[64] = {{id = 27174, cost = 3350, requiredIds = {20930}, requiredTalentId = 20473},{id = 348704, cost = 67000, faction = "Horde"},{id = 31801, cost = 67000, faction = "Alliance"},},
	[65] = {{id = 27142, cost = 75000, requiredIds = {25290}},{id = 27143, cost = 75000, requiredIds = {27142,25918}},},
	[66] = {{id = 27137, cost = 83000, requiredIds = {19943}},{id = 27150, cost = 83000, requiredIds = {10301}},},
	[68] = {{id = 27138, cost = 100000, requiredIds = {10314}},{id = 27152, cost = 100000, requiredIds = {19898}},{id = 27180, cost = 100000, requiredIds = {24239}},},
	[69] = {{id = 27139, cost = 110000, requiredIds = {10318}},{id = 27154, cost = 110000, requiredIds = {10310}},},
	[70] = {{id = 27173, cost = 130000, requiredIds = {20924}},{id = 27136, cost = 130000, requiredIds = {27135}},{id = 33072, cost = 6500, requiredIds = {27174}, requiredTalentId = 20473},{id = 32700, cost = 5000, requiredIds = {32699}, requiredTalentId = 31935},{id = 27149, cost = 130000, requiredIds = {10293}},{id = 27153, cost = 130000, requiredIds = {19900}},{id = 27179, cost = 6500, requiredIds = {20928}, requiredTalentId = 20925},{id = 31884, cost = 130000},{id = 27140, cost = 200000, requiredIds = {25291}},{id = 27141, cost = 100000, requiredIds = {27140,25916}},},
	[71] = {{id = 48935, cost = 200000, requiredIds = {27142}},{id = 54428, cost = 100000},{id = 48937, cost = 200000, requiredIds = {48935,27143}},},
	[72] = {{id = 48816, cost = 200000, requiredIds = {27139}},{id = 48949, cost = 200000, requiredIds = {20773}},},
	[73] = {{id = 48800, cost = 200000, requiredIds = {27138}},{id = 48931, cost = 200000, requiredIds = {27140}},{id = 48933, cost = 200000, requiredIds = {48931,27141}},},
	[74] = {{id = 48784, cost = 200000, requiredIds = {27137}},{id = 48941, cost = 200000, requiredIds = {27149}},{id = 48805, cost = 200000, requiredIds = {27180}},},
	[75] = {{id = 48818, cost = 200000, requiredIds = {27173}},{id = 48781, cost = 200000, requiredIds = {27136}},{id = 48824, cost = 10000, requiredIds = {33072}, requiredTalentId = 20473},{id = 48826, cost = 10000, requiredIds = {32700}, requiredTalentId = 31935},{id = 48951, cost = 10000, requiredIds = {27179}, requiredTalentId = 20925},{id = 53600, cost = 200000},},
	[76] = {{id = 48943, cost = 200000, requiredIds = {27151}},{id = 54043, cost = 200000, requiredIds = {27150}},},
	[77] = {{id = 48936, cost = 200000, requiredIds = {48935}},{id = 48938, cost = 200000, requiredIds = {48936,48937}},{id = 48945, cost = 200000, requiredIds = {27152}},},
	[78] = {{id = 48817, cost = 200000, requiredIds = {48816}},{id = 48788, cost = 200000, requiredIds = {27154}},{id = 48947, cost = 200000, requiredIds = {27153}},},
	[79] = {{id = 48801, cost = 200000, requiredIds = {48800}},{id = 48785, cost = 200000, requiredIds = {48784}},{id = 48950, cost = 200000, requiredIds = {48949}},{id = 48942, cost = 200000, requiredIds = {48941}},{id = 48932, cost = 200000, requiredIds = {48931}},{id = 48934, cost = 200000, requiredIds = {48932,48933}},},
	[80] = {{id = 48819, cost = 200000, requiredIds = {48818}},{id = 48782, cost = 200000, requiredIds = {48781}},{id = 48825, cost = 10000, requiredIds = {48824}, requiredTalentId = 20473},{id = 53601, cost = 100000},{id = 48827, cost = 10000, requiredIds = {48826}, requiredTalentId = 31935},{id = 48952, cost = 10000, requiredIds = {48951}, requiredTalentId = 20925},{id = 61411, cost = 200000, requiredIds = {53600}},{id = 48806, cost = 200000, requiredIds = {48805}},},
})
