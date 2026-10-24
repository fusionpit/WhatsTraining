local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[197] = {
    { spell = 2387, skill = 1, autoLearned = true, creates = 2570 }, -- Linen Cloak
    { spell = 2393, skill = 1, creates = 2576, source = { "trainer" }, cost = 25 }, -- White Linen Shirt
    { spell = 2963, skill = 1, autoLearned = true, creates = 2996 }, -- Bolt of Linen Cloth
    { spell = 3915, skill = 1, autoLearned = true, creates = 4344, source = { "trainer" } }, -- Brown Linen Shirt
    { spell = 12044, skill = 1, autoLearned = true, creates = 10045, source = { "trainer" } }, -- Simple Linen Pants
    { spell = 2385, skill = 10, creates = 2568, source = { "trainer" }, cost = 50 }, -- Brown Linen Vest
    { spell = 8776, skill = 15, creates = 7026, source = { "trainer" }, cost = 50 }, -- Linen Belt
    { spell = 12045, skill = 20, creates = 10046, source = { "trainer" }, cost = 50 }, -- Simple Linen Boots
    { spell = 3914, skill = 30, creates = 4343, source = { "trainer" }, cost = 50 }, -- Brown Linen Pants
    { spell = 7623, skill = 30, creates = 6238, source = { "trainer" }, cost = 50 }, -- Brown Linen Robe
    { spell = 7624, skill = 30, creates = 6241, source = { "trainer" }, cost = 50 }, -- White Linen Robe
    { spell = 3840, skill = 35, creates = 4307, source = { "trainer" }, cost = 100 }, -- Heavy Linen Gloves
    { spell = 2389, skill = 40, creates = 2572, teach = 2598, source = { "drop" }, bound = false }, -- Red Linen Robe
    { spell = 2392, skill = 40, creates = 2575, source = { "trainer" }, cost = 50 }, -- Red Linen Shirt
    { spell = 2394, skill = 40, creates = 2577, source = { "trainer" }, cost = 50 }, -- Blue Linen Shirt
    { spell = 8465, skill = 40, creates = 6786, source = { "trainer" }, cost = 50 }, -- Simple Dress
    { spell = 3755, skill = 45, creates = 4238, source = { "trainer" }, cost = 100 }, -- Linen Bag
    { spell = 3909, skill = 50, rank = "Journeyman", level = 10, source = { "trainer" }, cost = 500 }, -- Tailoring (Journeyman)
    { spell = 7629, skill = 55, creates = 6239, teach = 6271, source = { "drop" }, bound = false }, -- Red Linen Vest
    { spell = 7630, skill = 55, creates = 6240, teach = 6270, source = { "vendor" }, bound = false, vendors = { { npc = 66, area = 12, faction = "Alliance" }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 3522, area = 85, faction = "Horde" }, { npc = 4189, area = 148, faction = "Alliance" } } }, -- Blue Linen Vest
    { spell = 2397, skill = 60, creates = 2580, source = { "trainer" }, cost = 200 }, -- Reinforced Linen Cape
    { spell = 3841, skill = 60, creates = 4308, source = { "trainer" }, cost = 200 }, -- Green Linen Bracers
    { spell = 2386, skill = 65, creates = 2569, source = { "trainer" }, cost = 200 }, -- Linen Boots
    { spell = 2395, skill = 70, creates = 2578, source = { "trainer" }, cost = 300 }, -- Barbaric Linen Vest
    { spell = 2396, skill = 70, creates = 2579, source = { "trainer" }, cost = 200 }, -- Green Linen Shirt
    { spell = 3842, skill = 70, creates = 4309, source = { "trainer" }, cost = 300 }, -- Handstitched Linen Britches
    { spell = 6686, skill = 70, creates = 5762, teach = 5771, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4189, area = 148, faction = "Alliance" } } }, -- Red Linen Bag
    { spell = 7633, skill = 70, creates = 6242, teach = 6272, source = { "vendor" }, bound = false, vendors = { { npc = 1250, area = 12, faction = "Alliance" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 3499, area = 17 }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" } } }, -- Blue Linen Robe
    { spell = 2402, skill = 75, creates = 2584, source = { "trainer" }, cost = 250 }, -- Woolen Cape
    { spell = 2964, skill = 75, creates = 2997, source = { "trainer" }, cost = 100 }, -- Bolt of Woolen Cloth
    { spell = 12046, skill = 75, creates = 10047, source = { "trainer" }, cost = 300 }, -- Simple Kilt
    { spell = 3757, skill = 80, creates = 4240, source = { "trainer" }, cost = 200 }, -- Woolen Bag
    { spell = 3845, skill = 80, creates = 4312, source = { "trainer" }, cost = 300 }, -- Soft-soled Linen Boots
    { spell = 2399, skill = 85, creates = 2582, source = { "trainer" }, cost = 300 }, -- Green Woolen Vest
    { spell = 3843, skill = 85, creates = 4310, source = { "trainer" }, cost = 400 }, -- Heavy Woolen Gloves
    { spell = 6521, skill = 90, creates = 5542, source = { "trainer" }, cost = 400 }, -- Pearl-clasped Cloak
    { spell = 2401, skill = 95, creates = 2583, source = { "trainer" }, cost = 300 }, -- Woolen Boots
    { spell = 3758, skill = 95, creates = 4241, teach = 4292, source = { "drop" }, bound = false }, -- Green Woolen Bag
    { spell = 3847, skill = 95, creates = 4313, teach = 4345, source = { "drop" }, bound = false }, -- Red Woolen Boots
    { spell = 2406, skill = 100, creates = 2587, source = { "trainer" }, cost = 200 }, -- Gray Woolen Shirt
    { spell = 3844, skill = 100, creates = 4311, teach = 4346, source = { "drop" }, bound = false }, -- Heavy Woolen Cloak
    { spell = 7639, skill = 100, creates = 6263, teach = 6274, source = { "vendor" }, bound = false, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 1347, area = 1519, faction = "Alliance" }, { npc = 2394, area = 267, faction = "Horde" }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 5944, area = 17, faction = "Horde" } } }, -- Blue Overalls
    { spell = 2403, skill = 105, creates = 2585, teach = 2601, source = { "drop" }, bound = false }, -- Gray Woolen Robe
    { spell = 3848, skill = 110, creates = 4314, source = { "trainer" }, cost = 500 }, -- Double-stitched Woolen Shoulders
    { spell = 3850, skill = 110, creates = 4316, source = { "trainer" }, cost = 500 }, -- Heavy Woolen Pants
    { spell = 3866, skill = 110, creates = 4330, source = { "trainer" }, cost = 250 }, -- Stylish Red Shirt
    { spell = 8467, skill = 110, creates = 6787, source = { "trainer" }, cost = 250 }, -- White Woolen Dress
    { spell = 6688, skill = 115, creates = 5763, teach = 5772, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 777, area = 44, faction = "Alliance" }, { npc = 1454, area = 11, faction = "Alliance" }, { npc = 1474, area = 38, faction = "Alliance" }, { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3364, area = 1637, faction = "Horde" }, { npc = 3485, area = 17, faction = "Horde" }, { npc = 3537, area = 267 }, { npc = 3683, area = 17 }, { npc = 4189, area = 148, faction = "Alliance" }, { npc = 4577, area = 1497, faction = "Horde" }, { npc = 5944, area = 17, faction = "Horde" } } }, -- Red Woolen Bag
    { spell = 7643, skill = 115, creates = 6264, teach = 6275, source = { "vendor" }, bound = false, vendors = { { npc = 1454, area = 11, faction = "Alliance" }, { npc = 1474, area = 38, faction = "Alliance" }, { npc = 2669, area = 10, faction = "Alliance" }, { npc = 3499, area = 17 }, { npc = 4168, area = 1657, faction = "Alliance" }, { npc = 4577, area = 1497, faction = "Horde" } } }, -- Greater Adept's Robe
    { spell = 3849, skill = 120, creates = 4315, teach = 4347, source = { "drop" }, bound = false }, -- Reinforced Woolen Shoulders
    { spell = 7892, skill = 120, creates = 6384, teach = 6390, source = { "drop" }, bound = false }, -- Stylish Blue Shirt
    { spell = 7893, skill = 120, creates = 6385, teach = 6391, source = { "drop" }, bound = false }, -- Stylish Green Shirt
    { spell = 12047, skill = 120, creates = 10048, teach = 10316, source = { "drop" }, bound = false }, -- Colorful Kilt
    { spell = 3839, skill = 125, creates = 4305, source = { "trainer" }, cost = 500 }, -- Bolt of Silk Cloth
    { spell = 3851, skill = 125, creates = 4317, teach = 4349, source = { "drop" }, bound = false }, -- Phoenix Pants
    { spell = 3855, skill = 125, creates = 4320, source = { "trainer" }, cost = 750 }, -- Spidersilk Boots
    { spell = 3868, skill = 125, creates = 4331, teach = 4348, source = { "drop" }, bound = false }, -- Phoenix Gloves
    { spell = 3910, skill = 125, rank = "Expert", level = 20, source = { "trainer" }, cost = 5000 }, -- Tailoring (Expert)
    { spell = 3852, skill = 130, creates = 4318, source = { "trainer" }, cost = 750 }, -- Gloves of Meditation
    { spell = 3869, skill = 135, creates = 4332, teach = 14627, source = { "vendor" }, bound = false, vendors = { { npc = 2668, area = 10, faction = "Alliance" } } }, -- Bright Yellow Shirt
    { spell = 6690, skill = 135, creates = 5766, source = { "trainer" }, cost = 1000 }, -- Lesser Wizard's Robe
    { spell = 3856, skill = 140, creates = 4321, teach = 4350, source = { "drop" }, bound = false }, -- Spider Silk Slippers
    { spell = 8758, skill = 140, creates = 7046, source = { "trainer" }, cost = 600 }, -- Azure Silk Pants
    { spell = 3854, skill = 145, creates = 4319, teach = 7114, source = { "vendor" }, bound = false, vendors = { { npc = 2679, area = 11, faction = "Alliance" }, { npc = 9636, area = 405, faction = "Horde" } } }, -- Azure Silk Gloves
    { spell = 8760, skill = 145, creates = 7048, source = { "trainer" }, cost = 600 }, -- Azure Silk Hood
    { spell = 8780, skill = 145, creates = 7047, teach = 7092, source = { "drop" }, bound = false }, -- Hands of Darkness
    { spell = 3813, skill = 150, creates = 4245, source = { "trainer" }, cost = 800 }, -- Small Silk Pack
    { spell = 3859, skill = 150, creates = 4324, source = { "trainer" }, cost = 750 }, -- Azure Silk Vest
    { spell = 6692, skill = 150, creates = 5770, teach = 5773, source = { "drop" }, bound = false }, -- Robes of Arcana
    { spell = 8782, skill = 150, creates = 7049, teach = 7091, source = { "drop" }, bound = false }, -- Truefaith Gloves
    { spell = 3870, skill = 155, creates = 4333, teach = 6401, source = { "vendor" }, bound = false, vendors = { { npc = 2394, area = 267, faction = "Horde" }, { npc = 2669, area = 10, faction = "Alliance" }, { npc = 12246, area = 405 } } }, -- Dark Silk Shirt
    { spell = 8483, skill = 160, creates = 6795, source = { "trainer" }, cost = 450 }, -- White Swashbuckler's Shirt
    { spell = 8762, skill = 160, creates = 7050, source = { "trainer" }, cost = 675 }, -- Silk Headband
    { spell = 3857, skill = 165, creates = 4322, teach = 14630, source = { "vendor" }, bound = false, vendors = { { npc = 2670, area = 33 }, { npc = 12246, area = 405 } } }, -- Enchanter's Cowl
    { spell = 8784, skill = 165, creates = 7065, teach = 7090, source = { "drop" }, bound = false }, -- Green Silk Armor
    { spell = 3858, skill = 170, creates = 4323, teach = 4351, source = { "drop" }, bound = false }, -- Shadow Hood
    { spell = 3871, skill = 170, creates = 4334, source = { "trainer" }, cost = 450 }, -- Formal White Shirt
    { spell = 8764, skill = 170, creates = 7051, source = { "trainer" }, cost = 810 }, -- Earthen Vest
    { spell = 3860, skill = 175, creates = 4325, teach = 4352, source = { "drop" }, bound = false }, -- Boots of the Enchanter
    { spell = 3865, skill = 175, creates = 4339, source = { "trainer" }, cost = 1000 }, -- Bolt of Mageweave
    { spell = 6693, skill = 175, creates = 5764, teach = 5774, source = { "drop" }, bound = false }, -- Green Silk Pack
    { spell = 8489, skill = 175, creates = 6796, source = { "trainer" }, cost = 675 }, -- Red Swashbuckler's Shirt
    { spell = 8766, skill = 175, creates = 7052, source = { "trainer" }, cost = 900 }, -- Azure Silk Belt
    { spell = 8772, skill = 175, creates = 7055, source = { "trainer" }, cost = 900 }, -- Crimson Silk Belt
    { spell = 8786, skill = 175, creates = 7053, teach = 7089, source = { "vendor" }, bound = false, vendors = { { npc = 6574, area = 45, faction = "Horde" }, { npc = 6576, area = 357, faction = "Alliance" } } }, -- Azure Silk Cloak
    { spell = 3863, skill = 180, creates = 4328, teach = 4353, source = { "drop" }, bound = false }, -- Spider Belt
    { spell = 8774, skill = 180, creates = 7057, source = { "trainer" }, cost = 900 }, -- Green Silken Shoulders
    { spell = 8789, skill = 180, creates = 7056, teach = 7087, source = { "vendor" }, bound = false, vendors = { { npc = 2670, area = 33 }, { npc = 12246, area = 405 } } }, -- Crimson Silk Cloak
    { spell = 3861, skill = 185, creates = 4326, source = { "trainer" }, cost = 900 }, -- Long Silken Cloak
    { spell = 3872, skill = 185, creates = 4335, teach = 4354, source = { "drop" }, bound = false }, -- Rich Purple Silk Shirt
    { spell = 6695, skill = 185, creates = 5765, teach = 5775, source = { "drop" }, bound = false }, -- Black Silk Pack
    { spell = 8791, skill = 185, creates = 7058, source = { "trainer" }, cost = 2250 }, -- Crimson Silk Vest
    { spell = 8770, skill = 190, creates = 7054, source = { "trainer" }, cost = 900 }, -- Robe of Power
    { spell = 8793, skill = 190, creates = 7059, teach = 7084, source = { "drop" }, bound = false }, -- Crimson Silk Shoulders
    { spell = 8795, skill = 190, creates = 7060, teach = 7085, source = { "drop" }, bound = false }, -- Azure Shoulders
    { spell = 21945, skill = 190, creates = 17723, teach = 17724, source = { "drop" }, bound = false }, -- Green Holiday Shirt
    { spell = 8797, skill = 195, creates = 7061, teach = 7086, source = { "drop" }, bound = false }, -- Earthen Silk Belt
    { spell = 8799, skill = 195, creates = 7062, source = { "trainer" }, cost = 2700 }, -- Crimson Silk Pantaloons
    { spell = 3862, skill = 200, creates = 4327, teach = 4355, source = { "vendor" }, bound = false, vendors = { { npc = 2381, area = 267, faction = "Alliance" }, { npc = 6567, area = 15, faction = "Horde" } } }, -- Icy Cloak
    { spell = 3864, skill = 200, creates = 4329, teach = 4356, source = { "drop" }, bound = false }, -- Star Belt
    { spell = 3873, skill = 200, creates = 4336, teach = 10728, source = { "vendor" }, bound = false, vendors = { { npc = 2663, area = 33 } } }, -- Black Swashbuckler's Shirt
    { spell = 12180, skill = 200, rank = "Artisan", level = 0, source = { "trainer" }, cost = 50000 }, -- Tailoring (Artisan)
    { spell = 8802, skill = 205, creates = 7063, teach = 7088, source = { "vendor" }, bound = false, vendors = { { npc = 6568, area = 440 } } }, -- Crimson Silk Robe
    { spell = 12048, skill = 205, creates = 9998, source = { "trainer" }, cost = 3600 }, -- Black Mageweave Vest
    { spell = 12049, skill = 205, creates = 9999, source = { "trainer" }, cost = 3600 }, -- Black Mageweave Leggings
    { spell = 8804, skill = 210, creates = 7064, source = { "trainer" }, cost = 4500 }, -- Crimson Silk Gloves
    { spell = 12050, skill = 210, creates = 10001, source = { "trainer" }, cost = 3600 }, -- Black Mageweave Robe
    { spell = 12052, skill = 210, creates = 10002, source = { "trainer" }, cost = 4500 }, -- Shadoweave Pants
    { spell = 12053, skill = 215, creates = 10003, source = { "trainer" }, cost = 4500 }, -- Black Mageweave Gloves
    { spell = 12055, skill = 215, creates = 10004, source = { "trainer" }, cost = 4950 }, -- Shadoweave Robe
    { spell = 12056, skill = 215, creates = 10007, teach = 10300, source = { "drop" }, bound = false }, -- Red Mageweave Vest
    { spell = 12059, skill = 215, creates = 10008, teach = 10301, source = { "drop" }, bound = false }, -- White Bandit Mask
    { spell = 12060, skill = 215, creates = 10009, teach = 10302, source = { "drop" }, bound = false }, -- Red Mageweave Pants
    { spell = 12061, skill = 215, creates = 10056, source = { "trainer" }, cost = 2250 }, -- Orange Mageweave Shirt
    { spell = 12064, skill = 220, creates = 10052, teach = 10311, source = { "vendor" }, bound = false, vendors = { { npc = 3005, area = 1638, faction = "Horde" }, { npc = 4168, area = 1657, faction = "Alliance" } } }, -- Orange Martial Shirt
    { spell = 12065, skill = 225, creates = 10050, source = { "trainer" }, cost = 4500 }, -- Mageweave Bag
    { spell = 12066, skill = 225, creates = 10018, teach = 10312, source = { "drop" }, bound = false }, -- Red Mageweave Gloves
    { spell = 12067, skill = 225, creates = 10019, source = { "trainer" }, cost = 4500 }, -- Dreamweave Gloves
    { spell = 12069, skill = 225, creates = 10042, source = { "trainer" }, cost = 4500 }, -- Cindercloth Robe
    { spell = 12070, skill = 225, creates = 10021, source = { "trainer" }, cost = 4500 }, -- Dreamweave Vest
    { spell = 12071, skill = 225, creates = 10023, source = { "trainer" }, cost = 5400 }, -- Shadoweave Gloves
    { spell = 27658, skill = 225, creates = 22246, teach = 22307, source = { "vendor" }, bound = false, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 } } }, -- Enchanted Mageweave Pouch
    { spell = 12072, skill = 230, creates = 10024, source = { "trainer" }, cost = 6000 }, -- Black Mageweave Headband
    { spell = 12073, skill = 230, creates = 10026, source = { "trainer" }, cost = 6000 }, -- Black Mageweave Boots
    { spell = 12074, skill = 230, creates = 10027, source = { "trainer" }, cost = 6000 }, -- Black Mageweave Shoulders
    { spell = 12075, skill = 230, creates = 10054, teach = 10314, source = { "vendor" }, bound = false, vendors = { { npc = 3364, area = 1637, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Lavender Mageweave Shirt
    { spell = 12076, skill = 235, creates = 10028, source = { "trainer" }, cost = 5850 }, -- Shadoweave Shoulders
    { spell = 12077, skill = 235, creates = 10053, source = { "trainer" }, cost = 5000 }, -- Simple Black Dress
    { spell = 12078, skill = 235, creates = 10029, teach = 10315, source = { "drop" }, bound = false }, -- Red Mageweave Shoulders
    { spell = 12079, skill = 235, creates = 10051, source = { "trainer" }, cost = 6500 }, -- Red Mageweave Bag
    { spell = 12080, skill = 235, creates = 10055, teach = 10317, source = { "vendor" }, bound = false, vendors = { { npc = 3364, area = 1637, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Pink Mageweave Shirt
    { spell = 12081, skill = 240, creates = 10030, teach = 10318, source = { "vendor" }, bound = false, vendors = { { npc = 2672, area = 33 } } }, -- Admiral's Hat
    { spell = 12082, skill = 240, creates = 10031, source = { "trainer" }, cost = 6300 }, -- Shadoweave Boots
    { spell = 12084, skill = 240, creates = 10033, teach = 10320, source = { "drop" }, bound = false }, -- Red Mageweave Headband
    { spell = 12085, skill = 240, creates = 10034, teach = 10321, source = { "vendor" }, bound = false, vendors = { { npc = 4577, area = 1497, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Tuxedo Shirt
    { spell = 12086, skill = 245, creates = 10025, teach = 10463, source = { "quest" }, bound = false, quests = { { id = 3402, area = 51, level = 40 } } }, -- Shadoweave Mask
    { spell = 12088, skill = 245, creates = 10044, source = { "trainer" }, cost = 7500 }, -- Cindercloth Boots
    { spell = 12089, skill = 245, creates = 10035, teach = 10323, source = { "vendor" }, bound = false, vendors = { { npc = 4577, area = 1497, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Tuxedo Pants
    { spell = 12091, skill = 250, creates = 10040, teach = 10325, source = { "vendor" }, bound = false, vendors = { { npc = 1347, area = 1519, faction = "Alliance" }, { npc = 3005, area = 1638, faction = "Horde" } } }, -- White Wedding Dress
    { spell = 12092, skill = 250, creates = 10041, source = { "trainer" }, cost = 7500 }, -- Dreamweave Circlet
    { spell = 12093, skill = 250, creates = 10036, teach = 10326, source = { "vendor" }, bound = false, vendors = { { npc = 4577, area = 1497, faction = "Horde" }, { npc = 8681, area = 1537, faction = "Alliance" } } }, -- Tuxedo Jacket
    { spell = 18401, skill = 250, creates = 14048, source = { "trainer" }, cost = 10000 }, -- Bolt of Runecloth
    { spell = 18560, skill = 250, creates = 14342, teach = 14526, source = { "vendor" }, bound = false, vendors = { { npc = 11189, area = 618 } } }, -- Mooncloth
    { spell = 26403, skill = 250, creates = 21154, teach = 21722, source = { "quest" }, bound = false, quests = { { id = 8878, area = 493, level = 50 }, { id = 80170, area = 493, level = 1 } } }, -- Festive Red Dress
    { spell = 26407, skill = 250, creates = 21542, teach = 21723, source = { "quest" }, bound = false, quests = { { id = 8878, area = 493, level = 50 }, { id = 80170, area = 493, level = 1 } } }, -- Festive Red Pant Suit
    { spell = 18402, skill = 255, creates = 13856, source = { "trainer" }, cost = 10000 }, -- Runecloth Belt
    { spell = 18403, skill = 255, creates = 13869, teach = 14466, source = { "drop" }, bound = false }, -- Frostweave Tunic
    { spell = 18404, skill = 255, creates = 13868, teach = 14467, source = { "drop" }, bound = false }, -- Frostweave Robe
    { spell = 18405, skill = 260, creates = 14046, teach = 14468, source = { "vendor" }, bound = false, vendors = { { npc = 11189, area = 618 } } }, -- Runecloth Bag
    { spell = 18406, skill = 260, creates = 13858, teach = 14469, source = { "vendor" }, bound = false, vendors = { { npc = 7940, area = 493 } } }, -- Runecloth Robe
    { spell = 18407, skill = 260, creates = 13857, teach = 14470, source = { "drop" }, bound = false }, -- Runecloth Tunic
    { spell = 18408, skill = 260, creates = 14042, teach = 14471, source = { "drop" }, bound = false }, -- Cindercloth Vest
    { spell = 26085, skill = 260, creates = 21340, teach = 21358, source = { "vendor" }, bound = false, vendors = { { npc = 6568, area = 440 } } }, -- Soul Pouch
    { spell = 18409, skill = 265, creates = 13860, teach = 14472, source = { "vendor" }, bound = true, vendors = { { npc = 7940, area = 493 } } }, -- Runecloth Cloak
    { spell = 18410, skill = 265, creates = 14143, teach = 14473, source = { "drop" }, bound = false }, -- Ghostweave Belt
    { spell = 18411, skill = 265, creates = 13870, teach = 14474, source = { "drop" }, bound = false }, -- Frostweave Gloves
    { spell = 18412, skill = 270, creates = 14043, teach = 14476, source = { "drop" }, bound = false }, -- Cindercloth Gloves
    { spell = 18413, skill = 270, creates = 14142, teach = 14477, source = { "drop" }, bound = false }, -- Ghostweave Gloves
    { spell = 18414, skill = 270, creates = 14100, teach = 14478, source = { "drop" }, bound = false }, -- Brightcloth Robe
    { spell = 18415, skill = 270, creates = 14101, teach = 14479, source = { "drop" }, bound = false }, -- Brightcloth Gloves
    { spell = 18416, skill = 275, creates = 14141, teach = 14480, source = { "drop" }, bound = false }, -- Ghostweave Vest
    { spell = 18417, skill = 275, creates = 13863, teach = 14481, source = { "vendor" }, bound = false, vendors = { { npc = 11189, area = 618 } } }, -- Runecloth Gloves
    { spell = 18418, skill = 275, creates = 14044, teach = 14482, source = { "drop" }, bound = false }, -- Cindercloth Cloak
    { spell = 18419, skill = 275, creates = 14107, teach = 14483, source = { "vendor" }, bound = false, vendors = { { npc = 12022, area = 493 } } }, -- Felcloth Pants
    { spell = 18420, skill = 275, creates = 14103, teach = 14484, source = { "drop" }, bound = false }, -- Brightcloth Cloak
    { spell = 18421, skill = 275, creates = 14132, teach = 14485, source = { "drop" }, bound = false }, -- Wizardweave Leggings
    { spell = 18422, skill = 275, creates = 14134, teach = 14486, source = { "drop" }, bound = true }, -- Cloak of Fire
    { spell = 22813, skill = 275, creates = 18258, source = { "trainer" } }, -- Gordok Ogre Suit
    { spell = 27659, skill = 275, creates = 22248, teach = 22308, source = { "vendor" }, bound = false, vendors = { { npc = 12944, area = 1584 }, { npc = 15419, area = 1377 } } }, -- Enchanted Runecloth Bag
    { spell = 27724, skill = 275, creates = 22251, teach = 22310, reputation = { 609, 5, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15179, area = 1377 } } }, -- Cenarion Herb Bag
    { spell = 18423, skill = 280, creates = 13864, teach = 14488, source = { "vendor" }, bound = false, vendors = { { npc = 7940, area = 493 } } }, -- Runecloth Boots
    { spell = 18424, skill = 280, creates = 13871, teach = 14489, source = { "drop" }, bound = false }, -- Frostweave Pants
    { spell = 18434, skill = 280, creates = 14045, teach = 14490, source = { "drop" }, bound = false }, -- Cindercloth Pants
    { spell = 18436, skill = 285, creates = 14136, teach = 14493, source = { "drop" }, bound = true }, -- Robe of Winter Night
    { spell = 18437, skill = 285, creates = 14108, teach = 14492, source = { "drop" }, bound = false }, -- Felcloth Boots
    { spell = 18438, skill = 285, creates = 13865, teach = 14491, source = { "drop" }, bound = false }, -- Runecloth Pants
    { spell = 26086, skill = 285, creates = 21341, teach = 21369, source = { "trainer" }, bound = false }, -- Felcloth Bag
    { spell = 18439, skill = 290, creates = 14104, teach = 14494, source = { "drop" }, bound = false }, -- Brightcloth Pants
    { spell = 18440, skill = 290, creates = 14137, teach = 14497, source = { "drop" }, bound = false }, -- Mooncloth Leggings
    { spell = 18441, skill = 290, creates = 14144, teach = 14495, source = { "drop" }, bound = false }, -- Ghostweave Pants
    { spell = 18442, skill = 290, creates = 14111, teach = 14496, source = { "drop" }, bound = false }, -- Felcloth Hood
    { spell = 19435, skill = 290, creates = 15802, reputation = { 576, 5, ns.L.FACTION_576 }, source = { "quest" }, quests = { { id = 6032, area = 361, level = 50 } } }, -- Mooncloth Boots
    { spell = 23662, skill = 290, creates = 19047, teach = 19215, reputation = { 576, 6, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Wisdom of the Timbermaw
    { spell = 23664, skill = 290, creates = 19056, teach = 19216, reputation = { 529, 6, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Argent Boots
    { spell = 18444, skill = 295, creates = 13866, teach = 14498, source = { "drop" }, bound = false }, -- Runecloth Headband
    { spell = 18445, skill = 300, creates = 14155, teach = 14499, source = { "drop" }, bound = false }, -- Mooncloth Bag
    { spell = 18446, skill = 300, creates = 14128, teach = 14500, source = { "drop" }, bound = false }, -- Wizardweave Robe
    { spell = 18447, skill = 300, creates = 14138, teach = 14501, source = { "drop" }, bound = false }, -- Mooncloth Vest
    { spell = 18448, skill = 300, creates = 14139, teach = 14507, source = { "drop" }, bound = false }, -- Mooncloth Shoulders
    { spell = 18449, skill = 300, creates = 13867, teach = 14504, source = { "drop" }, bound = false }, -- Runecloth Shoulders
    { spell = 18450, skill = 300, creates = 14130, teach = 14505, source = { "drop" }, bound = false }, -- Wizardweave Turban
    { spell = 18451, skill = 300, creates = 14106, teach = 14506, source = { "drop" }, bound = false }, -- Felcloth Robe
    { spell = 18452, skill = 300, creates = 14140, teach = 14509, source = { "drop" }, bound = false }, -- Mooncloth Circlet
    { spell = 18453, skill = 300, creates = 14112, teach = 14508, source = { "drop" }, bound = false }, -- Felcloth Shoulders
    { spell = 18454, skill = 300, creates = 14146, teach = 14511, source = { "drop" }, bound = false }, -- Gloves of Spell Mastery
    { spell = 18455, skill = 300, creates = 14156, teach = 14510, source = { "drop" }, bound = false }, -- Bottomless Bag
    { spell = 18456, skill = 300, creates = 14154, teach = 14512, source = { "drop" }, bound = false }, -- Truefaith Vestments
    { spell = 18457, skill = 300, creates = 14152, teach = 14513, source = { "drop" }, bound = false }, -- Robe of the Archmage
    { spell = 18458, skill = 300, creates = 14153, teach = 14514, source = { "drop" }, bound = false }, -- Robe of the Void
    { spell = 20848, skill = 300, creates = 16980, teach = 17017, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Mantle
    { spell = 20849, skill = 300, creates = 16979, teach = 17018, reputation = { 59, 5, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Gloves
    { spell = 22759, skill = 300, creates = 18263, teach = 18265, source = { "drop" }, bound = false }, -- Flarecore Wraps
    { spell = 22866, skill = 300, creates = 18405, teach = 18414, source = { "drop" }, bound = false }, -- Belt of the Archmage
    { spell = 22867, skill = 300, creates = 18407, teach = 18415, source = { "drop" }, bound = true }, -- Felcloth Gloves
    { spell = 22868, skill = 300, creates = 18408, teach = 18416, source = { "drop" }, bound = true }, -- Inferno Gloves
    { spell = 22869, skill = 300, creates = 18409, teach = 18417, source = { "drop" }, bound = true }, -- Mooncloth Gloves
    { spell = 22870, skill = 300, creates = 18413, teach = 18418, source = { "drop" }, bound = true }, -- Cloak of Warding
    { spell = 22902, skill = 300, creates = 18486, teach = 18487, source = { "vendor" }, bound = false, vendors = { { npc = 14371, area = 2557 } } }, -- Mooncloth Robe
    { spell = 23663, skill = 300, creates = 19050, teach = 19218, reputation = { 576, 7, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Mantle of the Timbermaw
    { spell = 23665, skill = 300, creates = 19059, teach = 19217, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Argent Shoulders
    { spell = 23666, skill = 300, creates = 19156, teach = 19219, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Robe
    { spell = 23667, skill = 300, creates = 19165, teach = 19220, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Flarecore Leggings
    { spell = 24091, skill = 300, creates = 19682, teach = 19764, reputation = { 270, 7, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Vest
    { spell = 24092, skill = 300, creates = 19683, teach = 19765, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Leggings
    { spell = 24093, skill = 300, creates = 19684, teach = 19766, reputation = { 270, 5, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Boots
    { spell = 24901, skill = 300, creates = 20538, teach = 20546, source = { "drop" }, bound = false }, -- Runed Stygian Leggings
    { spell = 24902, skill = 300, creates = 20539, teach = 20548, source = { "drop" }, bound = false }, -- Runed Stygian Belt
    { spell = 24903, skill = 300, creates = 20537, teach = 20547, source = { "drop" }, bound = false }, -- Runed Stygian Boots
    { spell = 26087, skill = 300, creates = 21342, teach = 21371, source = { "drop" }, bound = false }, -- Core Felcloth Bag
    { spell = 27660, skill = 300, creates = 22249, teach = 22309, source = { "drop" }, bound = false }, -- Big Bag of Enchantment
    { spell = 27725, skill = 300, creates = 22252, teach = 22312, reputation = { 609, 7, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15179, area = 1377 } } }, -- Satchel of Cenarius
    { spell = 28205, skill = 300, creates = 22654, teach = 22684, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Glacial Gloves
    { spell = 28207, skill = 300, creates = 22652, teach = 22686, reputation = { 529, 8, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Glacial Vest
    { spell = 28208, skill = 300, creates = 22658, teach = 22685, reputation = { 529, 8, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Glacial Cloak
    { spell = 28209, skill = 300, creates = 22655, teach = 22687, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Glacial Wrists
    { spell = 28210, skill = 300, creates = 22660, teach = 22683, reputation = { 609, 7, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15179, area = 1377 } } }, -- Gaea's Embrace
    { spell = 28480, skill = 300, creates = 22756, teach = 22774, reputation = { 609, 7, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15179, area = 1377 } } }, -- Sylvan Vest
    { spell = 28481, skill = 300, creates = 22757, teach = 22773, reputation = { 609, 6, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15179, area = 1377 } } }, -- Sylvan Crown
    { spell = 28482, skill = 300, creates = 22758, teach = 22772, reputation = { 609, 5, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15179, area = 1377 } } }, -- Sylvan Shoulders
}
