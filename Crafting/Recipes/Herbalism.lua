local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[182] = {
    { spell = 2368, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 0 }, -- Herbalism (Journeyman)
    { spell = 3570, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 0 }, -- Herbalism (Expert)
    { spell = 1262980, skill = 140, creates = 279964, teach = 273106, source = { "drop" } }, -- Greenhouse
    { spell = 11993, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 0 }, -- Herbalism (Artisan)
    { spell = 1263070, skill = 300, creates = 279947, teach = 273120 }, -- Seed Hybridizer
    { spell = 1229705, creates = 279962, source = { "quest", "trainer" }, cost = 100, skill = 20, quests = { { id = 96055, area = 1, faction = "Alliance", level = 4 }, { id = 97905, area = 14, faction = "Horde", level = 4 }, { id = 97921, area = 12, faction = "Alliance", level = 4 }, { id = 97933, area = 215, faction = "Horde", level = 4 }, { id = 97944, area = 141, faction = "Alliance", level = 4 }, { id = 97957, area = 85, faction = "Horde", level = 4 }, { id = 97968, area = 16593, level = 4 } } }, -- Incense Candle
}
