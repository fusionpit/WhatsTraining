local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[356] = {
    { spell = 1229745, creates = 279967, source = { "quest", "trainer" }, cost = 100, skill = 20, quests = { { id = 96050, area = 1, faction = "Alliance", level = 4 }, { id = 97904, area = 14, faction = "Horde", level = 4 }, { id = 97920, area = 12, faction = "Alliance", level = 4 }, { id = 97932, area = 215, faction = "Horde", level = 4 }, { id = 97943, area = 141, faction = "Alliance", level = 4 }, { id = 97956, area = 85, faction = "Horde", level = 4 }, { id = 97967, area = 16593, level = 4 } } }, -- Fish Bowl
    { spell = 7731, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 10 }, -- Fishing (Journeyman)
    { spell = 7732, skill = 125, rank = "Expert", level = 20, teach = 16083, source = { "vendor" }, bound = false, vendors = { { npc = 2626, area = 33 } } }, -- Fishing (Expert)
    { spell = 1262990, skill = 140, creates = 279965, teach = 273141, source = { "drop" }, bound = false }, -- Fishing Rack
    { spell = 18248, skill = 225, rank = "Artisan", level = 35, source = { "quest" }, quests = { { id = 6607, area = 15, level = 35 } } }, -- Fishing (Artisan)
    { spell = 1262998, skill = 300, creates = 279966 }, -- Fishing Hut
}
