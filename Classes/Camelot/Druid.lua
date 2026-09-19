local _, wt = ...
if (wt.currentClass ~= "DRUID") then
	return
end

local demoralizingRoar = {99, 1735, 9490, 9747, 9898}
local bash = {5211, 6798, 8983}
local swipe = {779, 780, 769, 9754, 9908}
local maul = {6807, 6808, 6809, 8972, 9745, 9880, 9881}
local rip = {1079, 9492, 9493, 9752, 9894, 9896}
local claw = {1082, 3029, 5201, 9849, 9850}
local prowl = {5215, 6783, 9913}
local shred = {5221, 6800, 8992, 9829, 9830}
local rake = {1822, 1823, 1824, 9904}
local dash = {1850, 9821}
local cower = {8998, 9000, 9892}
local ferociousBite = {22568, 22827, 22828, 22829}
local ravage = {6785, 6787, 9866, 9867}
local pounce = {9005, 9823, 9827}

wt:AddOverriddenSpells(
	demoralizingRoar,
	bash,
	swipe,
	maul,
	rip,
	claw,
	prowl,
	shred,
	rake,
	dash,
	cower,
	ferociousBite,
	ravage,
	pounce
)

wt.SpellsByLevel = {
	[1] = {{id = 1126, cost = 10}},
	[4] = {{id = 8921, cost = 100}, {id = 774, cost = 100}},
	[6] = {{id = 467, cost = 100}, {id = 5177, cost = 100, requiredIds = {5176}}},
	[8] = {{id = 339, cost = 200}, {id = 5186, cost = 200, requiredIds = {5185}}},
	[10] = {
		{id = 99, cost = 300, requiredIds = {5487}},
		{id = 5232, cost = 300, requiredIds = {1126}},
		{id = 8924, cost = 300, requiredIds = {8921}},
		{id = 16689, cost = 300, requiredIds = {339}},
		{id = 1058, cost = 300, requiredIds = {774}}
	},
	[12] = {{id = 5229, cost = 800, requiredIds = {5487}}, {id = 8936, cost = 800}, {id = 437138, cost = 800}},
	[14] = {
		{id = 5211, cost = 900, requiredIds = {5487}},
		{id = 5187, cost = 900, requiredIds = {5186}},
		{id = 782, cost = 900, requiredIds = {467}},
		{id = 5178, cost = 900, requiredIds = {5177}}
	},
	[16] = {
		{id = 8925, cost = 1400, requiredIds = {8924}},
		{id = 1430, cost = 1400, requiredIds = {1058}},
		{id = 779, cost = 1400, requiredIds = {5487}}
	},
	[18] = {
		{id = 1062, cost = 1500, requiredIds = {339}},
		{id = 770, cost = 1500},
		{id = 2637, cost = 1500},
		{id = 6808, cost = 1500, requiredIds = {6807}},
		{id = 16810, cost = 1500, requiredIds = {16689, 1062}},
		{id = 8938, cost = 1500, requiredIds = {8936}}
	},
	[20] = {
		{id = 1735, cost = 2400, requiredIds = {99}},
		{id = 5188, cost = 2400, requiredIds = {5187}},
		{id = 6756, cost = 2400, requiredIds = {5232}},
		{id = 16864, cost = 2400},
		{id = 20484, cost = 2400},
		{id = 2912, cost = 2400},
		{id = 768, cost = 2000},
		{id = 1079, cost = 2000},
		{id = 1082, cost = 2000},
		{id = 5215, cost = 2000}
	},
	[22] = {
		{id = 8926, cost = 3300, requiredIds = {8925}},
		{id = 2090, cost = 3300, requiredIds = {1430}},
		{id = 5221, cost = 3300, requiredIds = {768}},
		{id = 2908, cost = 3300},
		{id = 5179, cost = 3300, requiredIds = {5178}}
	},
	[24] = {
		{id = 1822, cost = 3800, requiredIds = {768}},
		{id = 8939, cost = 3800, requiredIds = {8938}},
		{id = 2782, cost = 3800},
		{id = 1237948, cost = 3800, requiredIds = {437138}},
		{id = 780, cost = 3800, requiredIds = {779}},
		{id = 1075, cost = 3800, requiredIds = {782}},
		{id = 5217, cost = 3800, requiredIds = {768}}
	},
	[26] = {
		{id = 2893, cost = 4400},
		{id = 1850, cost = 4400, requiredIds = {768}},
		{id = 5189, cost = 4400, requiredIds = {5188}},
		{id = 6809, cost = 4400, requiredIds = {6808}},
		{id = 8949, cost = 4400, requiredIds = {2912}}
	},
	[28] = {
		{id = 5209, cost = 4500, requiredIds = {5487}},
		{id = 3029, cost = 4500, requiredIds = {16942}, requiredTalentId = 16942},
		{id = 8998, cost = 4500, requiredIds = {768}},
		{id = 5195, cost = 4500, requiredIds = {1062}},
		{id = 8927, cost = 4500, requiredIds = {8926}},
		{id = 16811, cost = 4500, requiredIds = {16810, 5195}},
		{id = 2091, cost = 4500, requiredIds = {2090}},
		{id = 9492, cost = 4500, requiredIds = {1079}}
	},
	[30] = {
		{id = 6798, cost = 4600, requiredIds = {5211}},
		{id = 778, cost = 4600, requiredIds = {770}},
		{id = 24974, cost = 4600, requiredIds = {5570}, requiredTalentId = 5570},
		{id = 5234, cost = 4600, requiredIds = {6756}},
		{id = 20739, cost = 4600, requiredIds = {20484}},
		{id = 8940, cost = 4600, requiredIds = {8939}},
		{id = 6800, cost = 4600, requiredIds = {5221}},
		{id = 740, cost = 4600},
		{id = 783, cost = 4600},
		{id = 5180, cost = 4600, requiredIds = {5179}}
	},
	[32] = {
		{id = 9490, cost = 5000, requiredIds = {1735}},
		{id = 22568, cost = 5000, requiredIds = {768}},
		{id = 6778, cost = 5000, requiredIds = {5189}},
		{id = 6785, cost = 5000, requiredIds = {768}},
		{id = 5225, cost = 5000, requiredIds = {768}}
	},
	[34] = {
		{id = 8972, cost = 7000, requiredIds = {6809}},
		{id = 8928, cost = 7000, requiredIds = {8927}},
		{id = 1823, cost = 7000, requiredIds = {1822}},
		{id = 3627, cost = 7000, requiredIds = {2091}},
		{id = 8950, cost = 7000, requiredIds = {8949}},
		{id = 769, cost = 7000, requiredIds = {780}},
		{id = 8914, cost = 7000, requiredIds = {1075}}
	},
	[36] = {
		{id = 22842, cost = 8000, requiredIds = {5487}},
		{id = 9005, cost = 8000, requiredIds = {768}},
		{id = 8941, cost = 8000, requiredIds = {8940}},
		{id = 1237949, cost = 8000, requiredIds = {1237948}},
		{id = 9493, cost = 8000, requiredIds = {9492}}
	},
	[38] = {
		{id = 5201, cost = 10000, requiredIds = {3029}, requiredTalentId = 16942},
		{id = 5196, cost = 10000, requiredIds = {5195}},
		{id = 8903, cost = 10000, requiredIds = {6778}},
		{id = 18657, cost = 10000, requiredIds = {2637}},
		{id = 16812, cost = 10000, requiredIds = {16811, 5196}},
		{id = 8992, cost = 10000, requiredIds = {6800}},
		{id = 8955, cost = 10000, requiredIds = {2908}},
		{id = 6780, cost = 10000, requiredIds = {5180}}
	},
	[40] = {
		{id = 9000, cost = 11000, requiredIds = {8998}},
		{id = 9634, cost = 11000, requiredIds = {5487}},
		{id = 20719, cost = 11000, requiredIds = {768}},
		{id = 22827, cost = 11000, requiredIds = {22568}},
		{id = 16914, cost = 11000},
		{id = 29166, cost = 11000},
		{id = 24975, cost = 11000, requiredIds = {24974}, requiredTalentId = 5570},
		{id = 8907, cost = 11000, requiredIds = {5234}},
		{id = 8929, cost = 11000, requiredIds = {8928}},
		{id = 6783, cost = 11000, requiredIds = {5215}},
		{id = 20742, cost = 11000, requiredIds = {20739}},
		{id = 8910, cost = 11000, requiredIds = {3627}},
		{id = 8918, cost = 11000, requiredIds = {740}}
	},
	[42] = {
		{id = 9747, cost = 12000, requiredIds = {9490}},
		{id = 9749, cost = 12000, requiredIds = {778}},
		{id = 414644, cost = 12000, requiredIds = {9634}},
		{id = 9745, cost = 12000, requiredIds = {8972}},
		{id = 6787, cost = 12000, requiredIds = {6785}},
		{id = 9750, cost = 12000, requiredIds = {8941}},
		{id = 8951, cost = 12000, requiredIds = {8950}}
	},
	[44] = {
		{id = 22812, cost = 13000},
		{id = 9758, cost = 13000, requiredIds = {8903}},
		{id = 1824, cost = 13000, requiredIds = {1823}},
		{id = 9752, cost = 13000, requiredIds = {9493}},
		{id = 9754, cost = 13000, requiredIds = {769}},
		{id = 9756, cost = 13000, requiredIds = {8914}}
	},
	[46] = {
		{id = 8983, cost = 16000, requiredIds = {6798}},
		{id = 9821, cost = 16000, requiredIds = {1850}},
		{id = 9833, cost = 16000, requiredIds = {8929}},
		{id = 9823, cost = 16000, requiredIds = {9005}},
		{id = 9839, cost = 16000, requiredIds = {8910}},
		{id = 9829, cost = 16000, requiredIds = {8992}},
		{id = 8905, cost = 16000, requiredIds = {6780}}
	},
	[48] = {
		{id = 9849, cost = 17000, requiredIds = {5201}, requiredTalentId = 16942},
		{id = 9852, cost = 17000, requiredIds = {5196}},
		{id = 22828, cost = 17000, requiredIds = {22827}},
		{id = 16813, cost = 17000, requiredIds = {16812, 9852}},
		{id = 9856, cost = 17000, requiredIds = {9750}},
		{id = 1237950, cost = 17000, requiredIds = {1237949}}
	},
	[50] = {
		{id = 9888, cost = 18000, requiredIds = {9758}},
		{id = 17401, cost = 18000, requiredIds = {16914}},
		{id = 24976, cost = 18000, requiredIds = {24975}, requiredTalentId = 5570},
		{id = 1235826, cost = 18000, requiredIds = {414644}},
		{id = 9884, cost = 18000, requiredIds = {8907}},
		{id = 9880, cost = 18000, requiredIds = {9745}},
		{id = 9866, cost = 18000, requiredIds = {6787}},
		{id = 20747, cost = 18000, requiredIds = {20742}},
		{id = 9875, cost = 18000, requiredIds = {8951}},
		{id = 9862, cost = 18000, requiredIds = {8918}},
		{id = 1238214, cost = 18000, requiredIds = {408120}, requiredTalentId = 408120}
	},
	[52] = {
		{id = 9892, cost = 19000, requiredIds = {9000}},
		{id = 9898, cost = 19000, requiredIds = {9747}},
		{id = 9834, cost = 19000, requiredIds = {9833}},
		{id = 9840, cost = 19000, requiredIds = {9839}},
		{id = 9894, cost = 19000, requiredIds = {9752}}
	},
	[54] = {
		{id = 9907, cost = 20000, requiredIds = {9749}},
		{id = 9904, cost = 20000, requiredIds = {1824}},
		{id = 9857, cost = 20000, requiredIds = {9856}},
		{id = 9830, cost = 20000, requiredIds = {9829}},
		{id = 9901, cost = 20000, requiredIds = {8955}},
		{id = 9908, cost = 20000, requiredIds = {9754}},
		{id = 9910, cost = 20000, requiredIds = {9756}},
		{id = 9912, cost = 20000, requiredIds = {8905}}
	},
	[56] = {
		{id = 22829, cost = 21000, requiredIds = {22828}},
		{id = 9889, cost = 21000, requiredIds = {9888}},
		{id = 9827, cost = 21000, requiredIds = {9823}}
	},
	[58] = {
		{id = 9850, cost = 22000, requiredIds = {9849}, requiredTalentId = 16942},
		{id = 9853, cost = 22000, requiredIds = {9852}},
		{id = 18658, cost = 22000, requiredIds = {18657}},
		{id = 1235827, cost = 22000, requiredIds = {1235826}},
		{id = 9881, cost = 22000, requiredIds = {9880}},
		{id = 9835, cost = 22000, requiredIds = {9834}},
		{id = 17329, cost = 22000, requiredIds = {16813, 9853}},
		{id = 9867, cost = 22000, requiredIds = {9866}},
		{id = 9841, cost = 22000, requiredIds = {9840}},
		{id = 9876, cost = 22000, requiredIds = {9875}}
	},
	[60] = {
		{id = 17402, cost = 24000, requiredIds = {17401}},
		{id = 24977, cost = 24000, requiredIds = {24976}, requiredTalentId = 5570},
		{id = 9885, cost = 24000, requiredIds = {9884}},
		{id = 9913, cost = 24000, requiredIds = {6783}},
		{id = 20748, cost = 24000, requiredIds = {20747}},
		{id = 9858, cost = 24000, requiredIds = {9857}},
		{id = 1237951, cost = 24000, requiredIds = {1237950}},
		{id = 9896, cost = 24000, requiredIds = {9894}},
		{id = 9863, cost = 24000, requiredIds = {9862}},
		{id = 1238215, cost = 24000, requiredIds = {1238214}, requiredTalentId = 408120}
	}
}
