local _, wt = ...
if (wt.currentClass ~= "WARRIOR") then return end

-- ordered by rank
local rend = {772, 6546, 6547, 6548, 11572, 11573, 11574}
local heroicStrike = {78, 284, 285, 1608, 11564, 11565, 11566, 11567, 25286}

wt:SetPreviousAbilityMap({rend, heroicStrike})

wt.SpellsByLevel = {
	[1] = {{id = 6673, cost = 10}},
	[4] = {{id = 100, cost = 100}, {id = 772, cost = 100}},
	[6] = {{id = 3127, cost = 100}, {id = 6343, cost = 100}},
	[8] = {{id = 1715, cost = 200}, {id = 284, cost = 200, requiredIds = {78}}},
	[10] = {{id = 2687, cost = 600}, {id = 6546, cost = 600, requiredIds = {772}}},
	[12] = {{id = 5242, cost = 1000, requiredIds = {6673}}, {id = 7384, cost = 1000}, {id = 72, cost = 1000}},
	[14] = {{id = 1160, cost = 1500}, {id = 6572, cost = 1500}},
	[16] = {{id = 285, cost = 2000, requiredIds = {284}}, {id = 694, cost = 2000}, {id = 2565, cost = 2000}},
	[18] = {{id = 676, cost = 3000}, {id = 8198, cost = 3000, requiredIds = {6343}}},
	[20] = {
		{id = 845, cost = 4000},
		{id = 674, cost = 4000},
		{id = 5246, cost = 6000},
		{id = 6547, cost = 4000, requiredIds = {6546}},
		{id = 20230, cost = 4000}
	},
	[22] = {{id = 6192, cost = 6000, requiredIds = {5242}}, {id = 7405, cost = 6000}},
	[24] = {
		{id = 6190, cost = 8000, requiredIds = {1160}},
		{id = 5308, cost = 8000},
		{id = 1608, cost = 8000, requiredIds = {285}},
		{id = 6574, cost = 8000, requiredIds = {6572}}
	},
	[26] = {
		{id = 1161, cost = 10000},
		{id = 6178, cost = 10000, requiredIds = {100}},
		{id = 7400, cost = 10000, requiredIds = {694}}
	},
	[28] = {
		{id = 7887, cost = 11000, requiredIds = {7384}},
		{id = 871, cost = 11000},
		{id = 8204, cost = 11000, requiredIds = {8198}}
	},
	[30] = {
		{id = 7369, cost = 12000, requiredIds = {845}},
		{id = 6548, cost = 12000, requiredIds = {6547}},
		{id = 1464, cost = 12000}
	},
	[32] = {
		{id = 11549, cost = 14000, requiredIds = {6192}},
		{id = 18499, cost = 14000},
		{id = 20658, cost = 14000, requiredIds = {5308}},
		{id = 7372, cost = 14000, requiredIds = {1715}},
		{id = 11564, cost = 14000, requiredIds = {1608}},
		{id = 1671, cost = 14000, requiredIds = {72}}
	},
	[34] = {
		{id = 11554, cost = 16000, requiredIds = {6190}},
		{id = 7379, cost = 16000, requiredIds = {6574}},
		{id = 8380, cost = 16000, requiredIds = {7405}}
	},
	[36] = {{id = 7402, cost = 18000, requiredIds = {7400}}, {id = 1680, cost = 18000}},
	[38] = {
		{id = 6552, cost = 20000},
		{id = 8820, cost = 20000, requiredIds = {1464}},
		{id = 8205, cost = 20000, requiredIds = {8204}}
	},
	[40] = {
		{id = 11608, cost = 22000, requiredIds = {7369}},
		{id = 20660, cost = 22000, requiredIds = {20658}},
		{id = 11565, cost = 22000, requiredIds = {11564}},
		--{id = 750, cost = 22000},
		{id = 11572, cost = 22000, requiredIds = {6548}}
	},
	[42] = {{id = 11550, cost = 32000, requiredIds = {11549}}, {id = 20616, cost = 32000, requiredTalentId = 20252}},
	[44] = {
		{id = 11555, cost = 34000, requiredIds = {11554}},
		{id = 11584, cost = 34000, requiredIds = {7887}},
		{id = 11600, cost = 34000, requiredIds = {7379}}
	},
	[46] = {
		{id = 11578, cost = 36000, requiredIds = {6178}},
		{id = 20559, cost = 36000, requiredIds = {7402}},
		{id = 11604, cost = 36000, requiredIds = {8820}},
		{id = 11596, cost = 36000, requiredIds = {8380}}
	},
	[48] = {
		{id = 23892, cost = 2000, requiredTalentId = 23881},
		{id = 20661, cost = 40000, requiredIds = {20660}},
		{id = 11566, cost = 40000, requiredIds = {11565}},
		{id = 21551, cost = 200, requiredTalentId = 12294},
		{id = 23923, cost = 200, requiredTalentId = 23922},
		{id = 11580, cost = 40000, requiredIds = {8205}}
	},
	[50] = {
		{id = 11609, cost = 42000, requiredIds = {11608}},
		{id = 1719, cost = 42000},
		{id = 11573, cost = 42000, requiredIds = {11572}}
	},
	[52] = {
		{id = 11551, cost = 54000, requiredIds = {11550}},
		{id = 20617, cost = 54000, requiredIds = {20616}, requiredTalentId = 20252},
		{id = 1672, cost = 54000, requiredIds = {1671}}
	},
	[54] = {
		{id = 23893, cost = 2800, requiredIds = {23892}, requiredTalentId = 23881},
		{id = 11556, cost = 56000, requiredIds = {11555}},
		{id = 7373, cost = 56000, requiredIds = {7372}},
		{id = 21552, cost = 2800, requiredIds = {21551}, requiredTalentId = 12294},
		{id = 11601, cost = 56000, requiredIds = {11600}},
		{id = 23924, cost = 2800, requiredIds = {23923}, requiredTalentId = 23922},
		{id = 11605, cost = 56000, requiredIds = {11604}}
	},
	[56] = {
		{id = 20662, cost = 58000, requiredIds = {20661}},
		{id = 11567, cost = 58000, requiredIds = {11566}},
		{id = 20560, cost = 58000, requiredIds = {20559}}
	},
	[58] = {
		{id = 6554, cost = 60000, requiredIds = {6552}},
		{id = 11597, cost = 60000, requiredIds = {11596}},
		{id = 11581, cost = 60000, requiredIds = {11580}}
	},
	[60] = {
		{id = 23894, cost = 3100, requiredIds = {23893}, requiredTalentId = 23881},
		{id = 20569, cost = 62000, requiredIds = {11609}},
		{id = 21553, cost = 3100, requiredIds = {21552}, requiredTalentId = 12294},
		{id = 11585, cost = 62000, requiredIds = {11584}},
		{id = 11574, cost = 62000, requiredIds = {11573}},
		{id = 23925, cost = 3100, requiredIds = {23924}, requiredTalentId = 23922}
	}
}
