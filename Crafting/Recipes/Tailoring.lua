local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[197] = {
    { spell = 2387, skill = 1, creates = 2570 }, -- Linen Cloak
    { spell = 2393, skill = 1, creates = 2576, source = { "trainer" }, cost = 25 }, -- White Linen Shirt
    { spell = 2963, skill = 1, creates = 2996 }, -- Bolt of Linen Cloth
    { spell = 3915, skill = 1, creates = 4344 }, -- Brown Linen Shirt
    { spell = 12044, skill = 1, creates = 10045 }, -- Simple Linen Pants
    { spell = 1257013, skill = 5, creates = 253664, teach = 253665, source = { "vendor" }, vendors = { { npc = 1347, area = 1519, faction = "Alliance" }, { npc = 1454, area = 11, faction = "Alliance" }, { npc = 1474, area = 38, faction = "Alliance" }, { npc = 1672, area = 10, faction = "Alliance" }, { npc = 2394, area = 267, faction = "Horde" }, { npc = 2668, area = 10, faction = "Alliance" }, { npc = 2669, area = 10, faction = "Alliance" }, { npc = 2670, area = 33 }, { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3091, area = 44, faction = "Alliance" }, { npc = 3096, area = 44 }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" }, { npc = 4189, area = 148, faction = "Alliance" }, { npc = 4577, area = 1497, faction = "Horde" }, { npc = 5154, area = 1537, faction = "Alliance" }, { npc = 5944, area = 17, faction = "Horde" }, { npc = 6567, area = 15, faction = "Horde" }, { npc = 6568, area = 440 }, { npc = 6574, area = 45, faction = "Horde" }, { npc = 6576, area = 357, faction = "Alliance" }, { npc = 7940, area = 493 }, { npc = 8681, area = 1537, faction = "Alliance" }, { npc = 242498, areas = { 40, 38, 17, -1 } }, { npc = 251973, area = 36 }, { npc = 251991, area = 16593 }, { npc = 252380, area = 16593 }, { npc = 254695, areas = { 11, 130, 10, -1 } }, { npc = 258415, area = 1497, faction = "Horde" }, { npc = 258463, area = 1637, faction = "Horde" }, { npc = 258466, area = 1638, faction = "Horde" }, { npc = 258548, area = 1537, faction = "Alliance" }, { npc = 258568, area = 1519, faction = "Alliance" }, { npc = 258572, area = 1657, faction = "Alliance" }, { npc = 260570, area = 16591 } } }, -- Linen Reagent Bag
    { spell = 2385, skill = 10, creates = 2568, source = { "trainer" }, cost = 50 }, -- Brown Linen Vest
    { spell = 8776, skill = 15, creates = 7026, source = { "trainer" }, cost = 50 }, -- Linen Belt
    { spell = 12045, skill = 20, creates = 10046, source = { "trainer" }, cost = 50 }, -- Simple Linen Boots
    { spell = 1229504, skill = 20, creates = 279972, source = { "quest", "trainer" }, cost = 100, faction = "Horde", quests = { { id = 96102, area = 14, faction = "Horde", level = 4 }, { id = 97937, area = 215, faction = "Horde", level = 4 }, { id = 97961, area = 85, faction = "Horde", level = 4 }, { id = 97972, area = 16593, faction = "Horde", level = 4 } } }, -- Faction Banner
    { spell = 1263425, skill = 20, creates = 279973, source = { "quest", "trainer" }, cost = 100, faction = "Alliance", quests = { { id = 96057, area = 1, faction = "Alliance", level = 4 }, { id = 97925, area = 12, faction = "Alliance", level = 4 }, { id = 97950, area = 141, faction = "Alliance", level = 4 }, { id = 97973, area = 16593, faction = "Alliance", level = 4 } } }, -- Faction Banner
    { spell = 3914, skill = 30, creates = 4343, source = { "trainer" }, cost = 50 }, -- Brown Linen Pants
    { spell = 7623, skill = 30, creates = 6238, source = { "trainer" }, cost = 50 }, -- Brown Linen Robe
    { spell = 7624, skill = 30, creates = 6241, source = { "trainer" }, cost = 50 }, -- White Linen Robe
    { spell = 3840, skill = 35, creates = 4307, source = { "trainer" }, cost = 100 }, -- Heavy Linen Gloves
    { spell = 2389, skill = 40, creates = 2572, teach = 2598, source = { "drop" } }, -- Red Linen Robe
    { spell = 2392, skill = 40, creates = 2575, source = { "trainer" }, cost = 50 }, -- Red Linen Shirt
    { spell = 2394, skill = 40, creates = 2577, source = { "trainer" }, cost = 50 }, -- Blue Linen Shirt
    { spell = 8465, skill = 40, creates = 6786, source = { "trainer" }, cost = 50 }, -- Simple Dress
    { spell = 3755, skill = 45, creates = 4238, source = { "trainer" }, cost = 100 }, -- Linen Bag
    { spell = 3909, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 10 }, -- Tailoring (Journeyman)
    { spell = 1257368, skill = 50, creates = 253885, teach = 253886, source = { "trainer" }, cost = 526 }, -- Novice Arcanist's Sash
    { spell = 1257369, skill = 50, creates = 253887, teach = 253888, source = { "trainer" }, cost = 526 }, -- Novice Ardent's Sash
    { spell = 1301440, skill = 50, creates = 277011, teach = 276947, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Stormsewn Cuffs
    { spell = 1301442, skill = 50, creates = 277013, teach = 276949, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Stormsewn Cord
    { spell = 1301464, skill = 50, creates = 277035, teach = 276971, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Stormsewn Cuffs
    { spell = 1301466, skill = 50, creates = 277037, teach = 276973, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Stormsewn Cord
    { spell = 7629, skill = 55, creates = 6239, teach = 6271, source = { "drop" } }, -- Red Linen Vest
    { spell = 7630, skill = 55, creates = 6240, teach = 6270, source = { "vendor" }, vendors = { { npc = 66, area = 12, faction = "Alliance" }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 3522, area = 85, faction = "Horde" }, { npc = 4189, area = 148, faction = "Alliance" } } }, -- Blue Linen Vest
    { spell = 1301441, skill = 55, creates = 277012, teach = 276948, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Stormsewn Handwraps
    { spell = 1301444, skill = 55, creates = 277015, teach = 276951, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Stormsewn Shoes
    { spell = 1301465, skill = 55, creates = 277036, teach = 276972, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Stormsewn Handwraps
    { spell = 1301469, skill = 55, creates = 277039, teach = 276975, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Stormsewn Shoes
    { spell = 2397, skill = 60, creates = 2580, source = { "trainer" }, cost = 200 }, -- Reinforced Linen Cape
    { spell = 3841, skill = 60, creates = 4308, source = { "trainer" }, cost = 200 }, -- Green Linen Bracers
    { spell = 1257370, skill = 60, creates = 253889, teach = 253890, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pristine Boots
    { spell = 1257371, skill = 60, creates = 253891, teach = 253892, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Silky Boots
    { spell = 1257372, skill = 60, creates = 253893, teach = 253894, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Flame Boots
    { spell = 1257373, skill = 60, creates = 253895, teach = 253896, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shadow Boots
    { spell = 1257374, skill = 60, creates = 253897, teach = 253898, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pearly Boots
    { spell = 1257375, skill = 60, creates = 253899, teach = 253900, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shining Boots
    { spell = 1301439, skill = 60, creates = 277010, teach = 276946, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Stormsewn Vest
    { spell = 1301443, skill = 60, creates = 277014, teach = 276950, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Stormsewn Leggings
    { spell = 1301463, skill = 60, creates = 277034, teach = 276970, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Stormsewn Vest
    { spell = 1301468, skill = 60, creates = 277038, teach = 276974, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Stormsewn Leggings
    { spell = 2386, skill = 65, creates = 2569, source = { "trainer" }, cost = 200 }, -- Linen Boots
    { spell = 2395, skill = 70, creates = 2578, source = { "trainer" }, cost = 300 }, -- Barbaric Linen Vest
    { spell = 2396, skill = 70, creates = 2579, source = { "trainer" }, cost = 200 }, -- Green Linen Shirt
    { spell = 3842, skill = 70, creates = 4309, source = { "trainer" }, cost = 300 }, -- Handstitched Linen Britches
    { spell = 6686, skill = 70, creates = 5762, teach = 5771, source = { "drop", "vendor" }, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4189, area = 148, faction = "Alliance" } } }, -- Red Linen Bag
    { spell = 7633, skill = 70, creates = 6242, teach = 6272, source = { "vendor" }, vendors = { { npc = 1250, area = 12, faction = "Alliance" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 3499, area = 17 }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" } } }, -- Blue Linen Robe
    { spell = 1257017, skill = 70, creates = 253667, teach = 253668, source = { "vendor" }, vendors = { { npc = 1347, area = 1519, faction = "Alliance" }, { npc = 1454, area = 11, faction = "Alliance" }, { npc = 1474, area = 38, faction = "Alliance" }, { npc = 1672, area = 10, faction = "Alliance" }, { npc = 2394, area = 267, faction = "Horde" }, { npc = 2668, area = 10, faction = "Alliance" }, { npc = 2669, area = 10, faction = "Alliance" }, { npc = 2670, area = 33 }, { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3091, area = 44, faction = "Alliance" }, { npc = 3096, area = 44 }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" }, { npc = 4189, area = 148, faction = "Alliance" }, { npc = 4577, area = 1497, faction = "Horde" }, { npc = 5154, area = 1537, faction = "Alliance" }, { npc = 5944, area = 17, faction = "Horde" }, { npc = 6567, area = 15, faction = "Horde" }, { npc = 6568, area = 440 }, { npc = 6574, area = 45, faction = "Horde" }, { npc = 6576, area = 357, faction = "Alliance" }, { npc = 7940, area = 493 }, { npc = 8681, area = 1537, faction = "Alliance" }, { npc = 242498, areas = { 40, 38, 17, -1 } }, { npc = 251973, area = 36 }, { npc = 251991, area = 16593 }, { npc = 252380, area = 16593 }, { npc = 254695, areas = { 11, 130, 10, -1 } }, { npc = 258415, area = 1497, faction = "Horde" }, { npc = 258463, area = 1637, faction = "Horde" }, { npc = 258466, area = 1638, faction = "Horde" }, { npc = 258548, area = 1537, faction = "Alliance" }, { npc = 258568, area = 1519, faction = "Alliance" }, { npc = 258572, area = 1657, faction = "Alliance" }, { npc = 260570, area = 16591 } } }, -- Woolen Reagent Bag
    { spell = 2402, skill = 75, creates = 2584, source = { "trainer" }, cost = 250 }, -- Woolen Cape
    { spell = 2964, skill = 75, creates = 2997, source = { "trainer" }, cost = 100 }, -- Bolt of Woolen Cloth
    { spell = 12046, skill = 75, creates = 10047, source = { "trainer" }, cost = 300 }, -- Simple Kilt
    { spell = 1257376, skill = 75, creates = 253901, teach = 253902, source = { "drop" } }, -- Filigreed Pristine Gown
    { spell = 1257377, skill = 75, creates = 253903, teach = 253904, source = { "drop" } }, -- Filigreed Silky Gown
    { spell = 1257378, skill = 75, creates = 253905, teach = 253906, source = { "drop" } }, -- Filigreed Flame Gown
    { spell = 1257379, skill = 75, creates = 253907, teach = 253908, source = { "drop" } }, -- Filigreed Shadow Gown
    { spell = 1257380, skill = 75, creates = 253909, teach = 253910, source = { "drop" } }, -- Filigreed Pearly Gown
    { spell = 1257381, skill = 75, creates = 253911, teach = 253912, source = { "drop" } }, -- Filigreed Shining Gown
    { spell = 1257382, skill = 75, creates = 253913, teach = 253914, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pristine Gloves
    { spell = 1257383, skill = 75, creates = 253915, teach = 253916, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Silky Gloves
    { spell = 1257384, skill = 75, creates = 253917, teach = 253918, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Flame Gloves
    { spell = 1257385, skill = 75, creates = 253919, teach = 253920, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shadow Gloves
    { spell = 1257386, skill = 75, creates = 253921, teach = 253922, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pearly Gloves
    { spell = 1257387, skill = 75, creates = 253923, teach = 253924, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shining Gloves
    { spell = 3757, skill = 80, creates = 4240, source = { "trainer" }, cost = 200 }, -- Woolen Bag
    { spell = 3845, skill = 80, creates = 4312, source = { "trainer" }, cost = 300 }, -- Soft-soled Linen Boots
    { spell = 2399, skill = 85, creates = 2582, source = { "trainer" }, cost = 300 }, -- Green Woolen Vest
    { spell = 3843, skill = 85, creates = 4310, source = { "trainer" }, cost = 400 }, -- Heavy Woolen Gloves
    { spell = 1257388, skill = 85, creates = 253925, teach = 253926, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pristine Sash
    { spell = 1257389, skill = 85, creates = 253927, teach = 253928, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Silky Sash
    { spell = 1257390, skill = 85, creates = 253929, teach = 253930, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Flame Sash
    { spell = 1257391, skill = 85, creates = 253931, teach = 253932, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shadow Sash
    { spell = 1257392, skill = 85, creates = 253933, teach = 253934, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pearly Sash
    { spell = 1257393, skill = 85, creates = 253935, teach = 253936, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shining Sash
    { spell = 6521, skill = 90, creates = 5542, source = { "trainer" }, cost = 400 }, -- Pearl-clasped Cloak
    { spell = 2401, skill = 95, creates = 2583, source = { "trainer" }, cost = 300 }, -- Woolen Boots
    { spell = 3758, skill = 95, creates = 4241, teach = 4292, source = { "drop" } }, -- Green Woolen Bag
    { spell = 3847, skill = 95, creates = 4313, teach = 4345, source = { "drop" } }, -- Red Woolen Boots
    { spell = 2406, skill = 100, creates = 2587, source = { "trainer" }, cost = 200 }, -- Gray Woolen Shirt
    { spell = 3844, skill = 100, creates = 4311, teach = 4346, source = { "drop" } }, -- Heavy Woolen Cloak
    { spell = 7639, skill = 100, creates = 6263, teach = 6274, source = { "vendor" }, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 1347, area = 1519, faction = "Alliance" }, { npc = 2394, area = 267, faction = "Horde" }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 5944, area = 17, faction = "Horde" } } }, -- Blue Overalls
    { spell = 1257394, skill = 100, creates = 253937, teach = 253938, source = { "drop" } }, -- Filigreed Pristine Leggings
    { spell = 1257395, skill = 100, creates = 253939, teach = 253940, source = { "drop" } }, -- Filigreed Silky Leggings
    { spell = 1257396, skill = 100, creates = 253941, teach = 253942, source = { "drop" } }, -- Filigreed Flame Leggings
    { spell = 1257397, skill = 100, creates = 253943, teach = 253944, source = { "drop" } }, -- Filigreed Shadow Leggings
    { spell = 1257398, skill = 100, creates = 253945, teach = 253946, source = { "drop" } }, -- Filigreed Pearly Leggings
    { spell = 1257399, skill = 100, creates = 253947, teach = 253948, source = { "drop" } }, -- Filigreed Shining Leggings
    { spell = 1257400, skill = 100, creates = 253949, teach = 253950, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pristine Circlet
    { spell = 1257401, skill = 100, creates = 253951, teach = 253952, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Silky Circlet
    { spell = 1257402, skill = 100, creates = 253953, teach = 253954, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Flame Circlet
    { spell = 1257403, skill = 100, creates = 253955, teach = 253956, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shadow Circlet
    { spell = 1257404, skill = 100, creates = 253957, teach = 253958, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pearly Circlet
    { spell = 1257405, skill = 100, creates = 253959, teach = 253960, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shining Circlet
    { spell = 2403, skill = 105, creates = 2585, teach = 2601, source = { "drop" } }, -- Gray Woolen Robe
    { spell = 3848, skill = 110, creates = 4314, source = { "trainer" }, cost = 500 }, -- Double-stitched Woolen Shoulders
    { spell = 3850, skill = 110, creates = 4316, source = { "trainer" }, cost = 500 }, -- Heavy Woolen Pants
    { spell = 3866, skill = 110, creates = 4330, source = { "trainer" }, cost = 250 }, -- Stylish Red Shirt
    { spell = 8467, skill = 110, creates = 6787, source = { "trainer" }, cost = 250 }, -- White Woolen Dress
    { spell = 1257406, skill = 110, creates = 253961, teach = 253962, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pristine Gown
    { spell = 1257407, skill = 110, creates = 253963, teach = 253964, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Silky Gown
    { spell = 1257408, skill = 110, creates = 253965, teach = 253966, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Flame Gown
    { spell = 1257409, skill = 110, creates = 253967, teach = 253968, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shadow Gown
    { spell = 1257410, skill = 110, creates = 253969, teach = 253970, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pearly Gown
    { spell = 1257411, skill = 110, creates = 253971, teach = 253972, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shining Gown
    { spell = 6688, skill = 115, creates = 5763, teach = 5772, source = { "drop", "vendor" }, vendors = { { npc = 777, area = 44, faction = "Alliance" }, { npc = 1454, area = 11, faction = "Alliance" }, { npc = 1474, area = 38, faction = "Alliance" }, { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 3537, area = 267 }, { npc = 3683, area = 17 }, { npc = 4189, area = 148, faction = "Alliance" }, { npc = 4577, area = 1497, faction = "Horde" }, { npc = 5944, area = 17, faction = "Horde" } } }, -- Red Woolen Bag
    { spell = 7643, skill = 115, creates = 6264, teach = 6275, source = { "vendor" }, vendors = { { npc = 1454, area = 11, faction = "Alliance" }, { npc = 1474, area = 38, faction = "Alliance" }, { npc = 2669, area = 10, faction = "Alliance" }, { npc = 3499, area = 17 }, { npc = 4168, area = 1657, faction = "Alliance" }, { npc = 4577, area = 1497, faction = "Horde" } } }, -- Greater Adept's Robe
    { spell = 3849, skill = 120, creates = 4315, teach = 4347, source = { "drop" } }, -- Reinforced Woolen Shoulders
    { spell = 7892, skill = 120, creates = 6384, teach = 6390, source = { "drop" } }, -- Stylish Blue Shirt
    { spell = 7893, skill = 120, creates = 6385, teach = 6391, source = { "drop" } }, -- Stylish Green Shirt
    { spell = 12047, skill = 120, creates = 10048, teach = 10316, source = { "drop" } }, -- Colorful Kilt
    { spell = 3839, skill = 125, creates = 4305, source = { "trainer" }, cost = 500 }, -- Bolt of Silk Cloth
    { spell = 3851, skill = 125, creates = 4317, teach = 4349, source = { "drop" } }, -- Phoenix Pants
    { spell = 3855, skill = 125, creates = 4320, source = { "trainer" }, cost = 750 }, -- Spidersilk Boots
    { spell = 3868, skill = 125, creates = 4331, teach = 4348, source = { "drop" } }, -- Phoenix Gloves
    { spell = 3910, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 20 }, -- Tailoring (Expert)
    { spell = 428424, skill = 125, creates = 210781, teach = 211247, source = { "vendor" }, vendors = { { npc = 213077, area = 1519, faction = "Alliance" }, { npc = 214070, area = 1637, faction = "Horde" }, { npc = 214096, area = 1638, faction = "Horde" }, { npc = 214098, area = 1497, faction = "Horde" }, { npc = 214099, area = 1537, faction = "Alliance" }, { npc = 214101, area = 1657, faction = "Alliance" } } }, -- Phoenix Bindings
    { spell = 1257412, skill = 125, creates = 253973, teach = 253974, source = { "quest", "vendor" }, reputation = { 93, 8, ns.L.FACTION_93, 92, 6, ns.L.FACTION_92 }, quests = { { id = 92814, area = 405, level = 30 } }, vendors = { { npc = 253140, area = 405 }, { npc = 253139, area = 405 } } }, -- Silk Reagent Bag
    { spell = 1257413, skill = 125, creates = 253975, teach = 253976, source = { "drop" } }, -- Filigreed Pristine Circlet
    { spell = 1257414, skill = 125, creates = 253977, teach = 253978, source = { "drop" } }, -- Filigreed Silky Circlet
    { spell = 1257415, skill = 125, creates = 253979, teach = 253980, source = { "drop" } }, -- Filigreed Flame Circlet
    { spell = 1257416, skill = 125, creates = 253981, teach = 253982, source = { "drop" } }, -- Filigreed Shadow Circlet
    { spell = 1257417, skill = 125, creates = 253983, teach = 253984, source = { "drop" } }, -- Filigreed Pearly Circlet
    { spell = 1257418, skill = 125, creates = 253985, teach = 253986, source = { "drop" } }, -- Filigreed Shining Circlet
    { spell = 1257419, skill = 125, creates = 253987, teach = 253988, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pristine Leggings
    { spell = 1257420, skill = 125, creates = 253989, teach = 253990, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Silky Leggings
    { spell = 1257421, skill = 125, creates = 253991, teach = 253992, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Flame Leggings
    { spell = 1257422, skill = 125, creates = 253993, teach = 253994, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shadow Leggings
    { spell = 1257423, skill = 125, creates = 253995, teach = 253996, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Pearly Leggings
    { spell = 1257424, skill = 125, creates = 253997, teach = 253998, source = { "vendor" }, merchantFavor = 30, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Shining Leggings
    { spell = 3852, skill = 130, creates = 4318, source = { "trainer" }, cost = 750 }, -- Gloves of Meditation
    { spell = 3869, skill = 135, creates = 4332, teach = 14627, source = { "vendor" }, vendors = { { npc = 2668, area = 10, faction = "Alliance" } } }, -- Bright Yellow Shirt
    { spell = 6690, skill = 135, creates = 5766, source = { "trainer" }, cost = 1000 }, -- Lesser Wizard's Robe
    { spell = 3856, skill = 140, creates = 4321, teach = 4350, source = { "drop" } }, -- Spider Silk Slippers
    { spell = 8758, skill = 140, creates = 7046, source = { "trainer" }, cost = 600 }, -- Azure Silk Pants
    { spell = 1257425, skill = 140, creates = 253999, teach = 254000 }, -- Earthen Leggings
    { spell = 1257426, skill = 140, creates = 254001, teach = 254002, source = { "trainer" }, cost = 1450 }, -- Gilded Slippers
    { spell = 1257427, skill = 140, creates = 254003, teach = 254004, source = { "trainer" }, cost = 1450 }, -- Frothing Slippers
    { spell = 1257428, skill = 140, creates = 254005, teach = 254006, source = { "trainer" }, cost = 1450 }, -- Fiery Slippers
    { spell = 1257429, skill = 140, creates = 254007, teach = 254008, source = { "trainer" }, cost = 1450 }, -- Black Slippers
    { spell = 1257430, skill = 140, creates = 254009, teach = 254010, source = { "trainer" }, cost = 1450 }, -- Golden Slippers
    { spell = 1257431, skill = 140, creates = 254011, teach = 254012, source = { "trainer" }, cost = 1450 }, -- Radiant Slippers
    { spell = 1263032, skill = 140, creates = 279943, teach = 273099, source = { "drop" } }, -- Spinning Wheel
    { spell = 3854, skill = 145, creates = 4319, teach = 7114, source = { "vendor" }, vendors = { { npc = 2679, area = 11, faction = "Alliance" }, { npc = 9636, area = 405, faction = "Horde" } } }, -- Azure Silk Gloves
    { spell = 8760, skill = 145, creates = 7048, source = { "trainer" }, cost = 600 }, -- Azure Silk Hood
    { spell = 8780, skill = 145, creates = 7047, teach = 7092, source = { "drop" } }, -- Hands of Darkness
    { spell = 1257432, skill = 145, creates = 254013, teach = 254014 }, -- Earthen Silk Slippers
    { spell = 3813, skill = 150, creates = 4245, source = { "trainer" }, cost = 800 }, -- Small Silk Pack
    { spell = 3859, skill = 150, creates = 4324, source = { "trainer" }, cost = 750 }, -- Azure Silk Vest
    { spell = 6692, skill = 150, creates = 5770, teach = 5773, source = { "drop" } }, -- Robes of Arcana
    { spell = 8782, skill = 150, creates = 7049, teach = 7091, source = { "drop" } }, -- Truefaith Gloves
    { spell = 429351, skill = 150, creates = 210795 }, -- Extraplanar Spidersilk Boots
    { spell = 435841, skill = 150, creates = 215366, teach = 215369, source = { "drop", "vendor" }, vendors = { { npc = 3364, area = 1637, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" } } }, -- Invoker's Cord
    { spell = 435848, skill = 150, creates = 215365, teach = 215370, source = { "drop", "vendor" }, vendors = { { npc = 3364, area = 1637, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" } } }, -- Invoker's Mantle
    { spell = 1257433, skill = 150, creates = 254015, teach = 254016 }, -- Earthen Silk Hood
    { spell = 3870, skill = 155, creates = 4333, teach = 6401, source = { "vendor" }, vendors = { { npc = 2394, area = 267, faction = "Horde" }, { npc = 2669, area = 10, faction = "Alliance" }, { npc = 12246, area = 405 } } }, -- Dark Silk Shirt
    { spell = 8483, skill = 160, creates = 6795, source = { "trainer" }, cost = 500 }, -- White Swashbuckler's Shirt
    { spell = 8762, skill = 160, creates = 7050, source = { "trainer" }, cost = 750 }, -- Silk Headband
    { spell = 1257434, skill = 160, creates = 254017, teach = 254018 }, -- Earthen Silk Gloves
    { spell = 3857, skill = 165, creates = 4322, teach = 14630, source = { "vendor" }, vendors = { { npc = 2670, area = 33 }, { npc = 12246, area = 405 } } }, -- Enchanter's Cowl
    { spell = 8784, skill = 165, creates = 7065, teach = 7090, source = { "drop" } }, -- Green Silk Armor
    { spell = 439102, skill = 165, teach = 217258, source = { "vendor" }, creates = 217257, vendors = { { npc = 2670, area = 33 }, { npc = 12246, area = 405 } } }, -- Enchanter's Cowl
    { spell = 1257435, skill = 165, creates = 254019, teach = 254020, source = { "drop" } }, -- Earthen Silk Cuffs
    { spell = 1257436, skill = 165, creates = 254021, teach = 254022 }, -- Gilded Handwraps
    { spell = 1257437, skill = 165, creates = 254023, teach = 254024, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Frothing Handwraps
    { spell = 1257438, skill = 165, creates = 254025, teach = 254026, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Fiery Handwraps
    { spell = 1257439, skill = 165, creates = 254027, teach = 254028, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Black Handwraps
    { spell = 1257440, skill = 165, creates = 254029, teach = 254030, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Golden Handwraps
    { spell = 1257441, skill = 165, creates = 254031, teach = 254032, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Radiant Handwraps
    { spell = 3858, skill = 170, creates = 4323, teach = 4351, source = { "drop" } }, -- Shadow Hood
    { spell = 3871, skill = 170, creates = 4334, source = { "trainer" }, cost = 500 }, -- Formal White Shirt
    { spell = 8764, skill = 170, creates = 7051, source = { "trainer" }, cost = 900 }, -- Earthen Vest
    { spell = 439100, skill = 170, source = { "trainer" }, cost = 900, creates = 217256 }, -- Earthen Vest
    { spell = 1257442, skill = 170, creates = 254033, teach = 254034, source = { "drop" } }, -- Earthen Silk Shoulders
    { spell = 3860, skill = 175, creates = 4325, teach = 4352, source = { "drop" } }, -- Boots of the Enchanter
    { spell = 3865, skill = 175, creates = 4339, source = { "trainer" }, cost = 1000 }, -- Bolt of Mageweave
    { spell = 6693, skill = 175, creates = 5764, teach = 5774, source = { "drop" } }, -- Green Silk Pack
    { spell = 8489, skill = 175, creates = 6796, source = { "trainer" }, cost = 750 }, -- Red Swashbuckler's Shirt
    { spell = 8766, skill = 175, creates = 7052, source = { "trainer" }, cost = 1000 }, -- Azure Silk Belt
    { spell = 8772, skill = 175, creates = 7055, source = { "trainer" }, cost = 1000 }, -- Crimson Silk Belt
    { spell = 8786, skill = 175, creates = 7053, teach = 7089, source = { "vendor" }, vendors = { { npc = 6574, area = 45, faction = "Horde" }, { npc = 6576, area = 357, faction = "Alliance" }, { npc = 251997, area = 36, faction = "Alliance" } } }, -- Azure Silk Cloak
    { spell = 439097, skill = 175, teach = 217254, source = { "drop" }, creates = 217253 }, -- Boots of the Enchanter
    { spell = 439098, skill = 175, source = { "trainer" }, cost = 1000, creates = 217255 }, -- Crimson Silk Belt
    { spell = 1301532, skill = 175, creates = 277046, teach = 276982, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Stormsewn Cowl
    { spell = 1301533, skill = 175, creates = 277047, teach = 276983, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Stormsewn Epaulets
    { spell = 1301540, skill = 175, creates = 277054, teach = 276990, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Stormsewn Cowl
    { spell = 1301541, skill = 175, creates = 277055, teach = 276991, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Stormsewn Epaulets
    { spell = 3863, skill = 180, creates = 4328, teach = 4353, source = { "drop" } }, -- Spider Belt
    { spell = 8774, skill = 180, creates = 7057, source = { "trainer" }, cost = 1000 }, -- Green Silken Shoulders
    { spell = 8789, skill = 180, creates = 7056, teach = 7087, source = { "vendor" }, vendors = { { npc = 2670, area = 33 }, { npc = 12246, area = 405 }, { npc = 251997, area = 36, faction = "Alliance" } } }, -- Crimson Silk Cloak
    { spell = 3861, skill = 185, creates = 4326, source = { "trainer" }, cost = 1000 }, -- Long Silken Cloak
    { spell = 3872, skill = 185, creates = 4335, teach = 4354, source = { "drop" } }, -- Rich Purple Silk Shirt
    { spell = 6695, skill = 185, creates = 5765, teach = 5775, source = { "drop" } }, -- Black Silk Pack
    { spell = 8791, skill = 185, creates = 7058, source = { "trainer" }, cost = 2500 }, -- Crimson Silk Vest
    { spell = 439094, skill = 185, source = { "trainer" }, cost = 1000, creates = 217252 }, -- Long Silken Cloak
    { spell = 8770, skill = 190, creates = 7054, source = { "trainer" }, cost = 1000 }, -- Robe of Power
    { spell = 8793, skill = 190, creates = 7059, teach = 7084, source = { "drop" } }, -- Crimson Silk Shoulders
    { spell = 8795, skill = 190, creates = 7060, teach = 7085, source = { "drop" } }, -- Azure Shoulders
    { spell = 21945, skill = 190, creates = 17723, teach = 17724, source = { "drop" } }, -- Green Holiday Shirt
    { spell = 439093, skill = 190, teach = 217251, source = { "drop" }, creates = 217250 }, -- Crimson Silk Shoulders
    { spell = 1257443, skill = 190, creates = 254035, teach = 254036, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Mageweave Reagent Bag
    { spell = 1257444, skill = 190, creates = 254037, teach = 254038 }, -- Gilded Cord
    { spell = 1257445, skill = 190, creates = 254039, teach = 254040 }, -- Frothing Cord
    { spell = 1257446, skill = 190, creates = 254041, teach = 254042 }, -- Fiery Cord
    { spell = 1257447, skill = 190, creates = 254043, teach = 254044, source = { "drop" } }, -- Black Cord
    { spell = 1257448, skill = 190, creates = 254045, teach = 254046 }, -- Golden Cord
    { spell = 1257449, skill = 190, creates = 254047, teach = 254048 }, -- Radiant Cord
    { spell = 8797, skill = 195, creates = 7061, teach = 7086, source = { "drop" } }, -- Earthen Silk Belt
    { spell = 8799, skill = 195, creates = 7062, source = { "trainer" }, cost = 3000 }, -- Crimson Silk Pantaloons
    { spell = 439091, skill = 195, teach = 217249, source = { "drop" }, creates = 217248 }, -- Earthen Silk Belt
    { spell = 1257450, skill = 195, creates = 254049, teach = 254050, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Nethergeld Shoulders
    { spell = 1257451, skill = 195, creates = 254051, teach = 254052, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherfroth Shoulders
    { spell = 1257452, skill = 195, creates = 254053, teach = 254054, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherflame Shoulders
    { spell = 1257453, skill = 195, creates = 254055, teach = 254056, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherpearl Shoulders
    { spell = 1257454, skill = 195, creates = 254057, teach = 254058, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Nethershine Shoulders
    { spell = 1257455, skill = 195, creates = 254059, teach = 254060, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherlight Shoulders
    { spell = 3862, skill = 200, creates = 4327, teach = 4355, source = { "vendor" }, vendors = { { npc = 2381, area = 267, faction = "Alliance" }, { npc = 6567, area = 15, faction = "Horde" } } }, -- Icy Cloak
    { spell = 3864, skill = 200, creates = 4329, teach = 4356, source = { "drop" } }, -- Star Belt
    { spell = 3873, skill = 200, creates = 4336, teach = 10728, source = { "vendor" }, vendors = { { npc = 2663, area = 33 } } }, -- Black Swashbuckler's Shirt
    { spell = 12180, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 35 }, -- Tailoring (Artisan)
    { spell = 435827, skill = 200, creates = 213379, teach = 215368, source = { "vendor" }, vendors = { { npc = 217689, area = 721 } } }, -- Hyperconductive Arcano-Filament
    { spell = 8802, skill = 205, creates = 7063, teach = 7088, source = { "vendor" }, vendors = { { npc = 6568, area = 440 }, { npc = 260570, area = 16591 } } }, -- Crimson Silk Robe
    { spell = 12048, skill = 205, creates = 9998, source = { "trainer" }, cost = 4000 }, -- Black Mageweave Vest
    { spell = 12049, skill = 205, creates = 9999, source = { "trainer" }, cost = 4000 }, -- Black Mageweave Leggings
    { spell = 439085, skill = 205, teach = 217244, source = { "vendor" }, creates = 217245, vendors = { { npc = 6568, area = 440 } } }, -- Crimson Silk Robe
    { spell = 439086, skill = 205, source = { "trainer" }, cost = 4000, creates = 217246 }, -- Black Mageweave Vest
    { spell = 439088, skill = 205, source = { "trainer" }, cost = 4000, creates = 217247 }, -- Black Mageweave Leggings
    { spell = 1257456, skill = 205, creates = 254061, teach = 254062, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Nethergeld Cuffs
    { spell = 1257457, skill = 205, creates = 254063, teach = 254064, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherfroth Cuffs
    { spell = 1257458, skill = 205, creates = 254065, teach = 254066, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherflame Cuffs
    { spell = 1257459, skill = 205, creates = 254067, teach = 254068, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherpearl Cuffs
    { spell = 1257460, skill = 205, creates = 254069, teach = 254070, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Nethershine Cuffs
    { spell = 1257461, skill = 205, creates = 254071, teach = 254072, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Netherlight Cuffs
    { spell = 8804, skill = 210, creates = 7064, source = { "trainer" }, cost = 5000 }, -- Crimson Silk Gloves
    { spell = 12050, skill = 210, creates = 10001, source = { "trainer" }, cost = 4000 }, -- Black Mageweave Robe
    { spell = 12052, skill = 210, creates = 10002, cost = 4500, source = { "trainer" } }, -- Shadoweave Pants
    { spell = 12053, skill = 215, creates = 10003, source = { "trainer" }, cost = 5000 }, -- Black Mageweave Gloves
    { spell = 12055, skill = 215, creates = 10004, cost = 4950, source = { "trainer" } }, -- Shadoweave Robe
    { spell = 12056, skill = 215, creates = 10007, teach = 10300, source = { "drop" } }, -- Red Mageweave Vest
    { spell = 12059, skill = 215, creates = 10008, teach = 10301, source = { "drop" } }, -- White Bandit Mask
    { spell = 12060, skill = 215, creates = 10009, teach = 10302, source = { "drop" } }, -- Red Mageweave Pants
    { spell = 12061, skill = 215, creates = 10056, source = { "trainer" }, cost = 2500 }, -- Orange Mageweave Shirt
    { spell = 1257462, skill = 215, creates = 254073, teach = 254074 }, -- Ghostweave Cord
    { spell = 1257463, skill = 215, creates = 254075, teach = 254076 }, -- Earthenweave Gloves
    { spell = 1257464, skill = 215, creates = 254077, teach = 254078 }, -- Earthenweave Cord
    { spell = 1257465, skill = 215, creates = 254079, teach = 254080, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Runecloth Reagent Bag
    { spell = 1257466, skill = 215, creates = 254081, teach = 254082, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Gilded Waistcord
    { spell = 1257467, skill = 215, creates = 254083, teach = 254084, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Frothing Waistcord
    { spell = 1257468, skill = 215, creates = 254085, teach = 254086, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Fiery Waistcord
    { spell = 1257469, skill = 215, creates = 254087, teach = 254088, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Black Waistcord
    { spell = 1257470, skill = 215, creates = 254089, teach = 254090, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Golden Waistcord
    { spell = 1257471, skill = 215, creates = 254091, teach = 254092, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Radiant Waistcord
    { spell = 12064, skill = 220, creates = 10052, teach = 10311, source = { "vendor" }, vendors = { { npc = 3005, area = 1638, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" } } }, -- Orange Martial Shirt
    { spell = 12065, skill = 225, creates = 10050, source = { "trainer" }, cost = 5000 }, -- Mageweave Bag
    { spell = 12066, skill = 225, creates = 10018, teach = 10312, source = { "drop" } }, -- Red Mageweave Gloves
    { spell = 12067, skill = 225, creates = 10019, source = { "trainer" }, cost = 5000 }, -- Dreamweave Gloves
    { spell = 12069, skill = 225, creates = 10042, source = { "trainer" }, cost = 5000 }, -- Cindercloth Robe
    { spell = 12070, skill = 225, creates = 10021, source = { "trainer" }, cost = 5000 }, -- Dreamweave Vest
    { spell = 12071, skill = 225, creates = 10023, cost = 5400, source = { "trainer" } }, -- Shadoweave Gloves
    { spell = 27658, skill = 225, creates = 22246, teach = 22307, source = { "vendor" }, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 257020, area = 16593 } } }, -- Enchanted Mageweave Pouch
    { spell = 435610, skill = 225, teach = 215149, source = { "vendor" }, creates = 215111, vendors = { { npc = 217689, area = 721 } } }, -- Gneuro-Linked Arcano-Filament Monocle
    { spell = 1257472, skill = 225, creates = 254093, teach = 254094 }, -- Earthenweave Boots
    { spell = 12072, skill = 230, creates = 10024, source = { "trainer" }, cost = 6000 }, -- Black Mageweave Headband
    { spell = 12073, skill = 230, creates = 10026, source = { "trainer" }, cost = 6000 }, -- Black Mageweave Boots
    { spell = 12074, skill = 230, creates = 10027, source = { "trainer" }, cost = 6000 }, -- Black Mageweave Shoulders
    { spell = 12075, skill = 230, creates = 10054, teach = 10314, source = { "vendor" }, vendors = { { npc = 3364, area = 1637, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Lavender Mageweave Shirt
    { spell = 12076, skill = 235, creates = 10028, cost = 5850, source = { "trainer" } }, -- Shadoweave Shoulders
    { spell = 12077, skill = 235, creates = 10053, source = { "trainer" }, cost = 5000 }, -- Simple Black Dress
    { spell = 12078, skill = 235, creates = 10029, teach = 10315, source = { "drop" } }, -- Red Mageweave Shoulders
    { spell = 12079, skill = 235, creates = 10051, source = { "trainer" }, cost = 6500 }, -- Red Mageweave Bag
    { spell = 12080, skill = 235, creates = 10055, teach = 10317, source = { "vendor" }, vendors = { { npc = 3364, area = 1637, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Pink Mageweave Shirt
    { spell = 1257473, skill = 235, creates = 254095, teach = 254096 }, -- Gilded Gloves
    { spell = 1257474, skill = 235, creates = 254097, teach = 254098 }, -- Frothing Gloves
    { spell = 1257475, skill = 235, creates = 254099, teach = 254100 }, -- Fiery Gloves
    { spell = 1257476, skill = 235, creates = 254101, teach = 254102 }, -- Black Gloves
    { spell = 1257477, skill = 235, creates = 254103, teach = 254104 }, -- Golden Gloves
    { spell = 1257478, skill = 235, creates = 254105, teach = 254106 }, -- Radiant Gloves
    { spell = 1257479, skill = 235, creates = 254107, teach = 254108, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Gilded Sandals
    { spell = 1257480, skill = 235, creates = 254109, teach = 254110, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Frothing Sandals
    { spell = 1257481, skill = 235, creates = 254111, teach = 254112, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Fiery Sandals
    { spell = 1257482, skill = 235, creates = 254113, teach = 254114, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Black Sandals
    { spell = 1257483, skill = 235, creates = 254115, teach = 254116, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Golden Sandals
    { spell = 1257484, skill = 235, creates = 254117, teach = 254118, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, vendors = { { npc = 248202, area = 17, faction = "Horde" }, { npc = 256735, area = 44, faction = "Alliance" } } }, -- Radiant Sandals
    { spell = 12081, skill = 240, creates = 10030, teach = 10318, source = { "vendor" }, vendors = { { npc = 2672, area = 33 } } }, -- Admiral's Hat
    { spell = 12082, skill = 240, creates = 10031, cost = 6300, source = { "trainer" } }, -- Shadoweave Boots
    { spell = 12084, skill = 240, creates = 10033, teach = 10320, source = { "drop" } }, -- Red Mageweave Headband
    { spell = 12085, skill = 240, creates = 10034, teach = 10321, source = { "vendor" }, vendors = { { npc = 4577, area = 1497, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Tuxedo Shirt
    { spell = 1257485, skill = 240, creates = 254119, teach = 254120 }, -- Earthenweave Mantle
    { spell = 12086, skill = 245, creates = 10025, teach = 10463, source = { "quest" }, quests = { { id = 3402, area = 51, level = 40 } } }, -- Shadoweave Mask
    { spell = 12088, skill = 245, creates = 10044, source = { "trainer" }, cost = 7500 }, -- Cindercloth Boots
    { spell = 12089, skill = 245, creates = 10035, teach = 10323, source = { "vendor" }, vendors = { { npc = 4577, area = 1497, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Tuxedo Pants
    { spell = 1257488, skill = 245, creates = 254125, teach = 254126 }, -- Earthenweave Leggings
    { spell = 12091, skill = 250, creates = 10040, teach = 10325, source = { "vendor" }, vendors = { { npc = 1347, area = 1519, faction = "Alliance" }, { npc = 3005, area = 1638, faction = "Horde" } } }, -- White Wedding Dress
    { spell = 12092, skill = 250, creates = 10041, source = { "trainer" }, cost = 7500 }, -- Dreamweave Circlet
    { spell = 12093, skill = 250, creates = 10036, teach = 10326, source = { "vendor" }, vendors = { { npc = 4577, area = 1497, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Tuxedo Jacket
    { spell = 18401, skill = 250, creates = 14048, source = { "trainer" }, cost = 10000 }, -- Bolt of Runecloth
    { spell = 18560, skill = 250, creates = 14342, teach = 14526, source = { "vendor" }, vendors = { { npc = 11189, area = 618 } } }, -- Mooncloth
    { spell = 26403, skill = 250, creates = 21154, teach = 21722, source = { "quest" }, quests = { { id = 8878, area = 493, level = 50 } } }, -- Festival Dress
    { spell = 26407, skill = 250, creates = 21542, teach = 21723, source = { "quest" }, quests = { { id = 8878, area = 493, level = 50 } } }, -- Festival Suit
    { spell = 44950, skill = 250, creates = 34087, teach = 34261, source = { "vendor" } }, -- Green Winter Clothes
    { spell = 44958, skill = 250, creates = 34085, teach = 34319, source = { "vendor" } }, -- Red Winter Clothes
    { spell = 446193, skill = 250, creates = 220750 }, -- Fractured Mind Pauldrons
    { spell = 446194, skill = 250, creates = 220749 }, -- Mantle of Insanity
    { spell = 446195, skill = 250, creates = 220751 }, -- Shoulderpads of the Deranged
    { spell = 1224610, skill = 250, teach = 238301, source = { "drop" }, creates = 238267 }, -- Scarlet Augur's Cuffs
    { spell = 1224612, skill = 250, teach = 238303, source = { "drop" }, creates = 238269 }, -- Scarlet Augur's Strap
    { spell = 1227723, skill = 250, creates = 239147, teach = 239149 }, -- Crusader's Knapsack
    { spell = 1257486, skill = 250, creates = 254121, teach = 254122 }, -- Earthenweave Vest
    { spell = 1257487, skill = 250, creates = 254123, teach = 254124, source = { "vendor" }, vendors = { { npc = 266901, area = 616 } } }, -- Runecloth Cuffs
    { spell = 1257489, skill = 250, creates = 254127, teach = 254128 }, -- Ghostweave Mantle
    { spell = 18402, skill = 255, creates = 13856, source = { "trainer" }, cost = 10000 }, -- Runecloth Belt
    { spell = 18403, skill = 255, creates = 13869, teach = 14466, source = { "drop" } }, -- Frostweave Tunic
    { spell = 18404, skill = 255, creates = 13868, teach = 14467, source = { "drop" } }, -- Frostweave Robe
    { spell = 1257490, skill = 255, creates = 254129, teach = 254130 }, -- Ghostweave Boots
    { spell = 1257491, skill = 255, creates = 254131, teach = 254132 }, -- Earthenweave Cuffs
    { spell = 1257492, skill = 255, creates = 254133, teach = 254134, source = { "vendor" }, reputation = { 2747, 6, ns.L.FACTION_2747 }, vendors = { { npc = 256629, area = 616 } } }, -- Mooncloth Reagent Bag
    { spell = 18405, skill = 260, creates = 14046, teach = 14468, source = { "vendor" }, vendors = { { npc = 11189, area = 618 } } }, -- Runecloth Bag
    { spell = 18406, skill = 260, creates = 13858, teach = 14469, source = { "vendor" }, vendors = { { npc = 7940, area = 493 } } }, -- Runecloth Robe
    { spell = 18407, skill = 260, creates = 13857, teach = 14470, source = { "drop" } }, -- Runecloth Tunic
    { spell = 18408, skill = 260, creates = 14042, teach = 14471, source = { "drop" } }, -- Cindercloth Vest
    { spell = 26085, skill = 260, creates = 21340, teach = 21358, source = { "vendor" }, vendors = { { npc = 6568, area = 440 }, { npc = 260570, area = 16591 } } }, -- Soul Pouch
    { spell = 1224611, skill = 260, teach = 238302, source = { "drop" }, creates = 238268 }, -- Scarlet Augur's Mitts
    { spell = 1224614, skill = 260, teach = 238305, source = { "drop" }, creates = 238271 }, -- Scarlet Augur's Soles
    { spell = 1257493, skill = 260, creates = 254135, teach = 254136 }, -- Ghostweave Hood
    { spell = 1257494, skill = 260, creates = 254137, teach = 254138 }, -- Earthenweave Crown
    { spell = 18409, skill = 265, creates = 13860, teach = 14472, source = { "vendor" }, vendors = { { npc = 7940, area = 493 } } }, -- Runecloth Cloak
    { spell = 18410, skill = 265, creates = 14143, teach = 14473, source = { "drop" } }, -- Ghostweave Belt
    { spell = 18411, skill = 265, creates = 13870, teach = 14474, source = { "drop" } }, -- Frostweave Gloves
    { spell = 18412, skill = 270, creates = 14043, teach = 14476, source = { "drop" } }, -- Cindercloth Gloves
    { spell = 18413, skill = 270, creates = 14142, teach = 14477, source = { "drop" } }, -- Ghostweave Gloves
    { spell = 18414, skill = 270, creates = 14100, teach = 14478, source = { "drop" } }, -- Brightcloth Robe
    { spell = 18415, skill = 270, creates = 14101, teach = 14479, source = { "drop" } }, -- Brightcloth Gloves
    { spell = 1224613, skill = 270, teach = 238304, source = { "drop" }, creates = 238270 }, -- Scarlet Augur's Leggings
    { spell = 18416, skill = 275, creates = 14141, teach = 14480, source = { "drop" } }, -- Ghostweave Vest
    { spell = 18417, skill = 275, creates = 13863, teach = 14481, source = { "vendor" }, vendors = { { npc = 11189, area = 618 } } }, -- Runecloth Gloves
    { spell = 18418, skill = 275, creates = 14044, teach = 14482, source = { "drop" } }, -- Cindercloth Cloak
    { spell = 18419, skill = 275, creates = 14107, teach = 14483, source = { "vendor" }, vendors = { { npc = 12022, area = 493 } } }, -- Felcloth Pants
    { spell = 18420, skill = 275, creates = 14103, teach = 14484, source = { "drop" } }, -- Brightcloth Cloak
    { spell = 18421, skill = 275, creates = 14132, teach = 14485, source = { "drop" } }, -- Wizardweave Leggings
    { spell = 18422, skill = 275, creates = 14134, teach = 14486, source = { "drop" } }, -- Cloak of Fire
    { spell = 27659, skill = 275, creates = 22248, teach = 22308, source = { "vendor" }, vendors = { { npc = 12944, area = 1584 }, { npc = 15419, area = 1377 } } }, -- Enchanted Runecloth Bag
    { spell = 27724, skill = 275, creates = 22251, teach = 22310, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Cenarion Herb Bag
    { spell = 18423, skill = 280, creates = 13864, teach = 14488, source = { "vendor" }, vendors = { { npc = 7940, area = 493 } } }, -- Runecloth Boots
    { spell = 18424, skill = 280, creates = 13871, teach = 14489, source = { "drop" } }, -- Frostweave Pants
    { spell = 18434, skill = 280, creates = 14045, teach = 14490, source = { "drop" } }, -- Cindercloth Pants
    { spell = 1224607, skill = 280, teach = 238298, source = { "drop" }, creates = 238264 }, -- Scarlet Augur's Hood
    { spell = 1224608, skill = 280, teach = 238299, source = { "drop" }, creates = 238265 }, -- Scarlet Augur's Mantle
    { spell = 1224609, skill = 280, teach = 238300, source = { "drop" }, creates = 238266 }, -- Scarlet Augur's Vestments
    { spell = 18436, skill = 285, creates = 14136, teach = 14493, source = { "drop" } }, -- Robe of Winter Night
    { spell = 18437, skill = 285, creates = 14108, teach = 14492, source = { "drop" } }, -- Felcloth Boots
    { spell = 18438, skill = 285, creates = 13865, teach = 14491, source = { "drop" } }, -- Runecloth Pants
    { spell = 22813, skill = 285, creates = 18258 }, -- Gordok Ogre Suit
    { spell = 26086, skill = 285, creates = 21341 }, -- Felcloth Bag
    { spell = 461692, skill = 285, creates = 227855 }, -- Synthetic Gordok Ogre Suit
    { spell = 1297120, skill = 285, creates = 275604, teach = 275580, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Venomspew Gloves
    { spell = 1297123, skill = 285, creates = 275607, teach = 275583, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Swarmtender's Gloves
    { spell = 18439, skill = 290, creates = 14104, teach = 14494, source = { "drop" } }, -- Brightcloth Pants
    { spell = 18440, skill = 290, creates = 14137, teach = 14497, source = { "drop" } }, -- Mooncloth Leggings
    { spell = 18441, skill = 290, creates = 14144, teach = 14495, source = { "drop" } }, -- Ghostweave Pants
    { spell = 18442, skill = 290, creates = 14111, teach = 14496, source = { "drop" } }, -- Felcloth Hood
    { spell = 19435, skill = 290, creates = 15802, source = { "quest" }, reputation = { 576, 5, ns.L.FACTION_576 }, quests = { { id = 6032, area = 361, level = 50 } } }, -- Mooncloth Boots
    { spell = 23662, skill = 290, creates = 19047, teach = 19215, source = { "vendor" }, reputation = { 576, 6, ns.L.FACTION_576 }, vendors = { { npc = 11557, area = 361 } } }, -- Wisdom of the Timbermaw
    { spell = 23664, skill = 290, creates = 19056, teach = 19216, source = { "vendor" }, reputation = { 529, 6, ns.L.FACTION_529 }, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Argent Boots
    { spell = 461752, skill = 290, teach = 228318, source = { "drop" }, creates = 227864 }, -- Incandescent Mooncloth Leggings
    { spell = 1227724, skill = 290, creates = 239148, teach = 239150 }, -- Crimson Dawnwoven Bag
    { spell = 1297121, skill = 290, creates = 275605, teach = 275581, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Venomspew Cord
    { spell = 1297124, skill = 290, creates = 275608, teach = 275584, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Swarmtender's Cord
    { spell = 18444, skill = 295, creates = 13866, teach = 14498, source = { "drop" } }, -- Runecloth Headband
    { spell = 1297122, skill = 295, creates = 275606, teach = 275582, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Venomspew Footpads
    { spell = 1297125, skill = 295, creates = 275609, teach = 275585, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Swarmtender's Footpads
    { spell = 18445, skill = 300, creates = 14155, teach = 14499, source = { "drop" } }, -- Mooncloth Bag
    { spell = 18446, skill = 300, creates = 14128, teach = 14500, source = { "drop" } }, -- Wizardweave Robe
    { spell = 18447, skill = 300, creates = 14138, teach = 14501, source = { "drop" } }, -- Mooncloth Vest
    { spell = 18448, skill = 300, creates = 14139, teach = 14507, source = { "drop" } }, -- Mooncloth Shoulders
    { spell = 18449, skill = 300, creates = 13867, teach = 14504, source = { "drop" } }, -- Runecloth Shoulders
    { spell = 18450, skill = 300, creates = 14130, teach = 14505, source = { "drop" } }, -- Wizardweave Turban
    { spell = 18451, skill = 300, creates = 14106, teach = 14506, source = { "drop" } }, -- Felcloth Robe
    { spell = 18452, skill = 300, creates = 14140, teach = 14509, source = { "drop" } }, -- Mooncloth Circlet
    { spell = 18453, skill = 300, creates = 14112, teach = 14508, source = { "drop" } }, -- Felcloth Shoulders
    { spell = 18454, skill = 300, creates = 14146, teach = 14511, source = { "drop" } }, -- Gloves of Spell Mastery
    { spell = 18455, skill = 300, creates = 14156, teach = 14510, source = { "drop" } }, -- Bottomless Bag
    { spell = 18456, skill = 300, creates = 14154, teach = 14512, source = { "drop" } }, -- Truefaith Vestments
    { spell = 18457, skill = 300, creates = 14152, teach = 14513, source = { "drop" } }, -- Robe of the Archmage
    { spell = 18458, skill = 300, creates = 14153, teach = 14514, source = { "drop" } }, -- Robe of the Void
    { spell = 20848, skill = 300, creates = 16980, teach = 17017, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Mantle
    { spell = 20849, skill = 300, creates = 16979, teach = 17018, source = { "vendor" }, reputation = { 59, 5, ns.L.FACTION_59 }, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Gloves
    { spell = 22759, skill = 300, creates = 18263, teach = 18265, source = { "drop" } }, -- Flarecore Wraps
    { spell = 22866, skill = 300, creates = 18405, teach = 18414, source = { "drop" } }, -- Belt of the Archmage
    { spell = 22867, skill = 300, creates = 18407, teach = 18415, source = { "drop" } }, -- Felcloth Gloves
    { spell = 22868, skill = 300, creates = 18408, teach = 18416, source = { "drop" } }, -- Inferno Gloves
    { spell = 22869, skill = 300, creates = 18409, teach = 18417, source = { "drop" } }, -- Mooncloth Gloves
    { spell = 22870, skill = 300, creates = 18413, teach = 18418, source = { "drop" } }, -- Cloak of Warding
    { spell = 22902, skill = 300, creates = 18486, teach = 18487, source = { "vendor" }, vendors = { { npc = 14371, area = 2557 } } }, -- Mooncloth Robe
    { spell = 23663, skill = 300, creates = 19050, teach = 19218, source = { "vendor" }, reputation = { 576, 7, ns.L.FACTION_576 }, vendors = { { npc = 11557, area = 361 } } }, -- Mantle of the Timbermaw
    { spell = 23665, skill = 300, creates = 19059, teach = 19217, source = { "vendor" }, reputation = { 529, 7, ns.L.FACTION_529 }, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Argent Shoulders
    { spell = 23666, skill = 300, creates = 19156, teach = 19219, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Robe
    { spell = 23667, skill = 300, creates = 19165, teach = 19220, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Leggings
    { spell = 24091, skill = 300, creates = 19682, teach = 19764, source = { "vendor" }, reputation = { 270, 7, ns.L.FACTION_270 }, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Vest
    { spell = 24092, skill = 300, creates = 19683, teach = 19765, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Leggings
    { spell = 24093, skill = 300, creates = 19684, teach = 19766, source = { "vendor" }, reputation = { 270, 5, ns.L.FACTION_270 }, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Boots
    { spell = 24901, skill = 300, creates = 20538, teach = 20546, source = { "drop" } }, -- Runed Stygian Leggings
    { spell = 24902, skill = 300, creates = 20539, teach = 20548, source = { "drop" } }, -- Runed Stygian Belt
    { spell = 24903, skill = 300, creates = 20537, teach = 20547, source = { "drop" } }, -- Runed Stygian Boots
    { spell = 26087, skill = 300, creates = 21342, teach = 21371, source = { "drop" } }, -- Core Felcloth Bag
    { spell = 27660, skill = 300, creates = 22249, teach = 22309, source = { "drop" } }, -- Big Bag of Enchantment
    { spell = 27725, skill = 300, creates = 22252, teach = 22312, source = { "vendor" }, reputation = { 609, 7, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Satchel of Cenarius
    { spell = 28205, skill = 300, creates = 22654, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 } }, -- Glacial Gloves
    { spell = 28207, skill = 300, creates = 22652, source = { "trainer" }, reputation = { 529, 8, ns.L.FACTION_529 } }, -- Glacial Vest
    { spell = 28208, skill = 300, creates = 22658, source = { "trainer" }, reputation = { 529, 8, ns.L.FACTION_529 } }, -- Glacial Cloak
    { spell = 28209, skill = 300, creates = 22655, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 } }, -- Glacial Wrists
    { spell = 28210, skill = 300, creates = 22660, teach = 22683, source = { "vendor" }, reputation = { 609, 7, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Gaea's Embrace
    { spell = 28480, skill = 300, creates = 22756, teach = 22774, source = { "vendor" }, reputation = { 609, 7, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Sylvan Vest
    { spell = 28481, skill = 300, creates = 22757, teach = 22773, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Sylvan Crown
    { spell = 28482, skill = 300, creates = 22758, teach = 22772, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, vendors = { { npc = 15179, area = 1377 } } }, -- Sylvan Shoulders
    { spell = 461708, skill = 300, teach = 228303, source = { "vendor" }, creates = 227861, vendors = { { npc = 14371, area = 2557 } } }, -- Incandescent Mooncloth Robe
    { spell = 461727, skill = 300, creates = 227844, teach = 228121, source = { "vendor" }, vendors = { { npc = 227853, area = 33 } } }, -- Leather-Reinforced Runecloth Bag
    { spell = 461747, skill = 300, teach = 228316, source = { "drop" }, creates = 227860 }, -- Incandescent Mooncloth Vest
    { spell = 461750, skill = 300, teach = 228317, source = { "drop" }, creates = 227863 }, -- Incandescent Mooncloth Circlet
    { spell = 462282, skill = 300, teach = 228477, source = { "drop" }, creates = 228476 }, -- Embroidered Belt of the Archmage
    { spell = 463972, skill = 300, teach = 228993, source = { "drop" }, creates = 228994 }, -- Bottomless Bag
    { spell = 1257495, skill = 300, creates = 254139, teach = 254140 }, -- Bottomless Reagent Bag
    { spell = 1263080, skill = 300, creates = 279959, teach = 273124 }, -- Loom
    { spell = 1306540, skill = 300, creates = 279266, teach = 279315 }, -- Robes of Fiery Devastation
    { spell = 1306541, skill = 300, creates = 279267, teach = 279316 }, -- Mana-infused Cord
    { spell = 1306542, skill = 300, creates = 279268, teach = 279317 }, -- Rime-encrusted Boots
    { spell = 1306543, skill = 300, creates = 279269, teach = 279318 }, -- Fel Cape
    { spell = 1306544, skill = 300, creates = 279270, teach = 279319 }, -- Cloak of Earth and Sky
    { spell = 1306545, skill = 300, creates = 279271, teach = 279320 }, -- Felblood Soul Bag
}
