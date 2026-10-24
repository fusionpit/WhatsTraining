local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[186] = {
    { spell = 2657, skill = 1, autoLearned = true, creates = 2840 }, -- Smelt Copper
    { spell = 22967, skill = 1, creates = 17771, source = { "trainer" } }, -- Smelt Elementium
    { spell = 2576, skill = 50, rank = "Journeyman", level = 0, source = { "trainer" }, cost = 500 }, -- Mining (Journeyman)
    { spell = 2659, skill = 65, creates = 2841, count = 2, source = { "trainer" }, cost = 200 }, -- Smelt Bronze
    { spell = 3304, skill = 65, creates = 3576, source = { "trainer" }, cost = 50 }, -- Smelt Tin
    { spell = 2658, skill = 75, creates = 2842, source = { "trainer" }, cost = 200 }, -- Smelt Silver
    { spell = 3307, skill = 125, creates = 3575, source = { "trainer" }, cost = 500 }, -- Smelt Iron
    { spell = 3564, skill = 125, rank = "Expert", level = 0, source = { "trainer" }, cost = 5000 }, -- Mining (Expert)
    { spell = 3308, skill = 155, creates = 3577, source = { "trainer" }, cost = 2500 }, -- Smelt Gold
    { spell = 3569, skill = 165, creates = 3859, source = { "trainer" }, cost = 2500 }, -- Smelt Steel
    { spell = 10097, skill = 175, creates = 3860, source = { "trainer" }, cost = 5000 }, -- Smelt Mithril
    { spell = 10248, skill = 200, rank = "Artisan", level = 0, source = { "trainer" }, cost = 50000 }, -- Mining (Artisan)
    { spell = 10098, skill = 230, creates = 6037, source = { "trainer" } }, -- Smelt Truesilver
    { spell = 14891, skill = 230, creates = 11371, source = { "trainer" } }, -- Smelt Dark Iron
    { spell = 16153, skill = 250, creates = 12359, source = { "trainer" }, cost = 20000 }, -- Smelt Thorium
}
