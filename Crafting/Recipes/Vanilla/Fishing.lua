local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[356] = {
    { spell = 7731, skill = 50, rank = "Journeyman", level = 0, source = { "trainer" }, cost = 500 }, -- Fishing (Journeyman)
    { spell = 7732, skill = 125, rank = "Expert", level = 20, teach = 16083, source = { "vendor" }, vendors = { { npc = 2626, area = 33 } } }, -- Fishing (Expert)
    { spell = 18248, skill = 225, rank = "Artisan", level = 35, source = { "quest" }, quests = { { id = 6607, area = 15, level = 35 } } }, -- Fishing (Artisan)
}
