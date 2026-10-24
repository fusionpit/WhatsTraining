local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[129] = {
    { spell = 3275, skill = 1, autoLearned = true, creates = 1251 }, -- Linen Bandage
    { spell = 3276, skill = 40, creates = 2581, source = { "trainer" }, cost = 100 }, -- Heavy Linen Bandage
    { spell = 3274, skill = 50, rank = "Journeyman", level = 0, source = { "trainer" }, cost = 500 }, -- First Aid (Journeyman)
    { spell = 3277, skill = 80, creates = 3530, source = { "trainer" }, cost = 250 }, -- Wool Bandage
    { spell = 7934, skill = 80, creates = 6452, count = 3, source = { "trainer" }, cost = 250 }, -- Anti-Venom
    { spell = 3278, skill = 115, creates = 3531, source = { "trainer" }, cost = 1000 }, -- Heavy Wool Bandage
    { spell = 7924, skill = 125, rank = "Expert", level = 0, teach = 16084, source = { "vendor" } }, -- First Aid (Expert)
    { spell = 7935, skill = 130, creates = 6453, count = 3, teach = 6454, source = { "drop" }, bound = false }, -- Strong Anti-Venom
    { spell = 7928, skill = 150, creates = 6450, source = { "trainer" }, cost = 5000 }, -- Silk Bandage
    { spell = 7929, skill = 180, creates = 6451, teach = 16112, source = { "vendor" }, bound = false, vendors = { { npc = 2805, area = 45, faction = "Alliance" }, { npc = 13476, area = 15, faction = "Horde" } } }, -- Heavy Silk Bandage
    { spell = 10840, skill = 210, creates = 8544, teach = 16113, source = { "vendor" }, bound = false, vendors = { { npc = 2805, area = 45, faction = "Alliance" }, { npc = 13476, area = 15, faction = "Horde" } } }, -- Mageweave Bandage
    { spell = 10846, skill = 225, rank = "Artisan", level = 35, source = { "quest" }, quests = { { id = 6622, area = 45, faction = "Horde", level = 35 }, { id = 6624, area = 15, faction = "Alliance", level = 35 } } }, -- First Aid (Artisan)
    { spell = 10841, skill = 240, creates = 8545, source = { "trainer" } }, -- Heavy Mageweave Bandage
    { spell = 18629, skill = 260, creates = 14529, source = { "trainer" } }, -- Runecloth Bandage
    { spell = 27028, skill = 275, rank = "Master", teach = 22012, source = { "vendor" } }, -- First Aid (Master)
    { spell = 18630, skill = 290, creates = 14530, source = { "trainer" } }, -- Heavy Runecloth Bandage
    { spell = 23787, skill = 300, creates = 19440, teach = 19442, reputation = { 529, 6, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Powerful Anti-Venom
    { spell = 27032, skill = 330, creates = 21990, teach = 21992, source = { "vendor" }, bound = false, vendors = { { npc = 18990, area = 3483, faction = "Alliance" }, { npc = 18991, area = 3483, faction = "Horde" } } }, -- Netherweave Bandage
    { spell = 27033, skill = 360, creates = 21991, teach = 21993, source = { "vendor" }, bound = false, vendors = { { npc = 18990, area = 3483, faction = "Alliance" }, { npc = 18991, area = 3483, faction = "Horde" } } }, -- Heavy Netherweave Bandage
}
