local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[129] = {
    { spell = 3275, skill = 1, creates = 1251, autoLearned = true }, -- Linen Bandage
    { spell = 3276, skill = 40, creates = 2581, source = { "trainer" }, cost = 100 }, -- Heavy Linen Bandage
    { spell = 3274, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 0 }, -- First Aid (Journeyman)
    { spell = 1244431, skill = 55, creates = 118, source = { "trainer" }, cost = 100 }, -- Minor Healing Potion
    { spell = 3277, skill = 80, creates = 3530, source = { "trainer" }, cost = 250 }, -- Wool Bandage
    { spell = 7934, skill = 80, creates = 6452, count = 3, source = { "trainer" }, cost = 250 }, -- Anti-Venom
    { spell = 1244432, skill = 85, creates = 858, source = { "trainer" }, cost = 150 }, -- Lesser Healing Potion
    { spell = 1259342, skill = 90, creates = 255716, count = 3, source = { "trainer" }, cost = 250 }, -- Simple Poultice
    { spell = 3278, skill = 115, creates = 3531, source = { "trainer" }, cost = 1000 }, -- Heavy Wool Bandage
    { spell = 1259347, skill = 120, creates = 255720, source = { "trainer" }, cost = 1200 }, -- Woolen Tourniquet
    { spell = 7924, skill = 125, rank = "Expert", level = 0, teach = 16084, source = { "vendor" }, vendors = { { npc = 2805, area = 45, faction = "Alliance" }, { npc = 13476, area = 15, faction = "Horde" } } }, -- First Aid (Expert)
    { spell = 7935, skill = 130, creates = 6453, count = 3, teach = 6454, source = { "drop" } }, -- Strong Anti-Venom
    { spell = 1244433, skill = 135, creates = 929, source = { "trainer" }, cost = 800 }, -- Healing Potion
    { spell = 1262996, skill = 140, creates = 279940, teach = 273105, source = { "drop" } }, -- Toxin Study
    { spell = 7928, skill = 150, creates = 6450, source = { "trainer" }, cost = 5000 }, -- Silk Bandage
    { spell = 1259343, skill = 160, creates = 255717, count = 3, teach = 255724, source = { "drop" } }, -- Clever Poultice
    { spell = 1244434, skill = 175, creates = 1710, teach = 255723, source = { "drop" } }, -- Greater Healing Potion
    { spell = 7929, skill = 180, creates = 6451, teach = 16112, source = { "vendor" }, vendors = { { npc = 2805, area = 45, faction = "Alliance" }, { npc = 13476, area = 15, faction = "Horde" } } }, -- Heavy Silk Bandage
    { spell = 10840, skill = 210, creates = 8544, teach = 16113, source = { "vendor" }, vendors = { { npc = 2805, area = 45, faction = "Alliance" }, { npc = 13476, area = 15, faction = "Horde" } } }, -- Mageweave Bandage
    { spell = 1259348, skill = 200, creates = 255721, teach = 255726 }, -- Leather Tourniquet
    { spell = 1259344, skill = 210, creates = 255718, count = 3, teach = 255727 }, -- Superior Poultice
    { spell = 1244435, skill = 215, creates = 3928, teach = 255725 }, -- Superior Healing Potion
    { spell = 10846, skill = 225, rank = "Artisan", level = 35, source = { "quest" }, quests = { { id = 6622, area = 45, faction = "Horde", level = 35 }, { id = 6624, area = 15, faction = "Alliance", level = 35 } } }, -- First Aid (Artisan)
    { spell = 1259341, skill = 230, creates = 255715, count = 3, teach = 255728, source = { "drop" } }, -- Potent Anti-Venom
    { spell = 10841, skill = 240, creates = 8545 }, -- Heavy Mageweave Bandage
    { spell = 18629, skill = 260, creates = 14529 }, -- Runecloth Bandage
    { spell = 1259349, skill = 265, creates = 255722, teach = 255730 }, -- Surgical Tourniquet
    { spell = 18630, skill = 290, creates = 14530 }, -- Heavy Runecloth Bandage
    { spell = 1244436, skill = 290, creates = 13446, teach = 255729, source = { "vendor" }, vendors = { { npc = 266901, area = 616 } } }, -- Major Healing Potion
    { spell = 1259345, skill = 280, creates = 255719, count = 3, teach = 255731 }, -- Powerful Poultice
    { spell = 23787, skill = 300, creates = 19440, count = 3, teach = 19442, source = { "vendor" }, reputation = { 529, 6, ns.L.FACTION_529 }, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Powerful Anti-Venom
    { spell = 1263001, skill = 300, creates = 279951, teach = 273118 }, -- Plague Doctor's Laboratory
    { spell = 470349, skill = 315, creates = 232433, teach = 232434, source = { "vendor" }, vendors = { { npc = 17068, area = 1377, faction = "Alliance" }, { npc = 17070, area = 1377, faction = "Horde" } } }, -- Dense Runecloth Bandage
    { spell = 1230117, creates = 279968, source = { "quest", "trainer" }, cost = 100, skill = 20, quests = { { id = 96047, area = 1, faction = "Alliance", level = 4 }, { id = 97903, area = 14, faction = "Horde", level = 4 }, { id = 97919, area = 12, faction = "Alliance", level = 4 }, { id = 97931, area = 215, faction = "Horde", level = 4 }, { id = 97942, area = 141, faction = "Alliance", level = 4 }, { id = 97955, area = 85, faction = "Horde", level = 4 }, { id = 97965, area = 16593, level = 4 } } }, -- First Aid Kit
}
