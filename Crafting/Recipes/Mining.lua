local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[186] = {
    { spell = 1230161, creates = 279960, source = { "quest", "trainer" }, cost = 100, skill = 20, quests = { { id = 96046, area = 1, faction = "Alliance", level = 4 }, { id = 97907, area = 14, faction = "Horde", level = 4 }, { id = 97923, area = 12, faction = "Alliance", level = 4 }, { id = 97935, area = 215, faction = "Horde", level = 4 }, { id = 97948, area = 141, faction = "Alliance", level = 4 }, { id = 97959, area = 85, faction = "Horde", level = 4 }, { id = 97970, area = 16593, level = 4 } } }, -- Lodestone
    { spell = 2657, skill = 25, creates = 2840, autoLearned = true }, -- Smelt Copper
    { spell = 2576, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 0 }, -- Mining (Journeyman)
    { spell = 2659, skill = 65, creates = 2841, count = 2, source = { "trainer" }, cost = 200 }, -- Smelt Bronze
    { spell = 3304, skill = 65, creates = 3576, source = { "trainer" }, cost = 50 }, -- Smelt Tin
    { spell = 2658, skill = 75, creates = 2842, source = { "trainer" }, cost = 200 }, -- Smelt Silver
    { spell = 3307, skill = 125, creates = 3575, source = { "trainer" }, cost = 500 }, -- Smelt Iron
    { spell = 3564, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 0 }, -- Mining (Expert)
    { spell = 1262975, skill = 140, creates = 279948, teach = 273097, source = { "drop" }, bound = false }, -- Rock Garden
    { spell = 3308, skill = 155, creates = 3577, source = { "trainer" }, cost = 2500 }, -- Smelt Gold
    { spell = 3569, skill = 165, creates = 3859, source = { "trainer" }, cost = 2500 }, -- Smelt Steel
    { spell = 10097, skill = 175, creates = 3860, source = { "trainer" }, cost = 5000 }, -- Smelt Mithril
    { spell = 10248, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 0 }, -- Mining (Artisan)
    { spell = 10098, skill = 230, creates = 6037, source = { "trainer" }, cost = 10000 }, -- Smelt Truesilver
    { spell = 14891, skill = 230, creates = 11371 }, -- Smelt Dark Iron
    { spell = 16153, skill = 250, creates = 12359, source = { "trainer" }, cost = 20000 }, -- Smelt Thorium
    { spell = 1249637, skill = 275, creates = 249726, source = { "trainer" }, cost = 50000 }, -- Smelt Azerothium
    { spell = 1263071, skill = 300, creates = 279952, teach = 273122, bound = false }, -- Molten Foundry
    { spell = 1306126, skill = 300, creates = 251291, source = { "trainer" }, cost = 50000 }, -- Smelt Heavy Thorium
    { spell = 22967, skill = 310, creates = 17771 }, -- Smelt Elementium
}
