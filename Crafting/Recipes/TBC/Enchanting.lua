local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[333] = {
    { spell = 7418, skill = 1, autoLearned = true }, -- Enchant Bracer - Minor Health
    { spell = 7421, skill = 1, autoLearned = true, creates = 6218 }, -- Runed Copper Rod
    { spell = 7428, skill = 1, autoLearned = true, source = { "trainer" } }, -- Enchant Bracer - Minor Deflection
    { spell = 14293, skill = 10, creates = 11287, source = { "trainer" }, cost = 50 }, -- Lesser Magic Wand
    { spell = 7420, skill = 15, source = { "trainer" }, cost = 50 }, -- Enchant Chest - Minor Health
    { spell = 7443, skill = 20, teach = 6342, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 16635, area = 3487, faction = "Horde" }, { npc = 16722, area = 3557, faction = "Alliance" }, { npc = 18753, area = 3483, faction = "Horde" }, { npc = 18773, area = 3483, faction = "Alliance" }, { npc = 18951, area = 3430, faction = "Horde" }, { npc = 19234, area = 3703 }, { npc = 19537, area = 3523 }, { npc = 19540, area = 3523 }, { npc = 19663, area = 3703 } } }, -- Enchant Chest - Minor Mana
    { spell = 7426, skill = 40, source = { "trainer" }, cost = 100 }, -- Enchant Chest - Minor Absorption
    { spell = 7454, skill = 45, source = { "trainer" }, cost = 100 }, -- Enchant Cloak - Minor Resistance
    { spell = 25124, skill = 45, creates = 20744, count = 0, teach = 20758, source = { "vendor" }, bound = false, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 16635, area = 3487, faction = "Horde" }, { npc = 16722, area = 3557, faction = "Alliance" }, { npc = 18753, area = 3483, faction = "Horde" }, { npc = 18773, area = 3483, faction = "Alliance" }, { npc = 18951, area = 3430, faction = "Horde" }, { npc = 19234, area = 3703 }, { npc = 19537, area = 3523 }, { npc = 19540, area = 3523 }, { npc = 19663, area = 3703 } } }, -- Minor Wizard Oil
    { spell = 7412, skill = 50, rank = "Journeyman", level = 10, source = { "trainer" }, cost = 500 }, -- Enchanting (Journeyman)
    { spell = 7457, skill = 50, source = { "trainer" }, cost = 250 }, -- Enchant Bracer - Minor Stamina
    { spell = 7748, skill = 60, source = { "trainer" }, cost = 250 }, -- Enchant Chest - Lesser Health
    { spell = 7766, skill = 60, teach = 6344, source = { "drop" }, bound = false }, -- Enchant Bracer - Minor Spirit
    { spell = 7771, skill = 70, teach = 6345, source = { "trainer" }, cost = 200, bound = false }, -- Enchant Cloak - Minor Protection
    { spell = 14807, skill = 70, creates = 11288, source = { "trainer" }, cost = 200 }, -- Greater Magic Wand
    { spell = 7776, skill = 80, teach = 6346, source = { "vendor" }, bound = false, vendors = { { npc = 3346, area = 1637, faction = "Horde" }, { npc = 5757, area = 130, faction = "Horde" } } }, -- Enchant Chest - Lesser Mana
    { spell = 7779, skill = 80, source = { "trainer" }, cost = 400 }, -- Enchant Bracer - Minor Agility
    { spell = 7782, skill = 80, teach = 6347, source = { "drop" }, bound = false }, -- Enchant Bracer - Minor Strength
    { spell = 7786, skill = 90, teach = 6348, source = { "drop" }, bound = false }, -- Enchant Weapon - Minor Beastslayer
    { spell = 7788, skill = 90, source = { "trainer" }, cost = 500 }, -- Enchant Weapon - Minor Striking
    { spell = 7745, skill = 100, source = { "trainer" }, cost = 500 }, -- Enchant 2H Weapon - Minor Impact
    { spell = 7793, skill = 100, teach = 6349, source = { "vendor" }, bound = false, vendors = { { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5758, area = 130, faction = "Horde" } } }, -- Enchant 2H Weapon - Lesser Intellect
    { spell = 7795, skill = 100, creates = 6339, source = { "trainer" }, cost = 1000 }, -- Runed Silver Rod
    { spell = 13378, skill = 105, source = { "trainer" }, cost = 600 }, -- Enchant Shield - Minor Stamina
    { spell = 13380, skill = 110, teach = 11038, source = { "drop" }, bound = false }, -- Enchant 2H Weapon - Lesser Spirit
    { spell = 13419, skill = 110, teach = 11039, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 3954, area = 331, faction = "Alliance" }, { npc = 12043, area = 406, faction = "Horde" } } }, -- Enchant Cloak - Minor Agility
    { spell = 13421, skill = 115, source = { "trainer" }, cost = 800 }, -- Enchant Cloak - Lesser Protection
    { spell = 13464, skill = 115, teach = 11081, source = { "drop" }, bound = false }, -- Enchant Shield - Lesser Protection
    { spell = 7857, skill = 120, source = { "trainer" }, cost = 1000 }, -- Enchant Chest - Health
    { spell = 7859, skill = 120, teach = 6375, source = { "drop" }, bound = false }, -- Enchant Bracer - Lesser Spirit
    { spell = 7413, skill = 125, rank = "Expert", level = 20, source = { "trainer" }, cost = 5000 }, -- Enchanting (Expert)
    { spell = 7861, skill = 125, source = { "trainer" }, cost = 1250 }, -- Enchant Cloak - Lesser Fire Resistance
    { spell = 7863, skill = 125, teach = 6376, source = { "trainer" }, cost = 1400, bound = false }, -- Enchant Boots - Minor Stamina
    { spell = 7867, skill = 125, teach = 6377, source = { "vendor" }, bound = false, vendors = { { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3537, area = 267 } } }, -- Enchant Boots - Minor Agility
    { spell = 13485, skill = 130, source = { "trainer" }, cost = 1500 }, -- Enchant Shield - Lesser Spirit
    { spell = 13501, skill = 130, source = { "trainer" }, cost = 1500 }, -- Enchant Bracer - Lesser Stamina
    { spell = 13522, skill = 135, teach = 11098, source = { "drop" }, bound = false }, -- Enchant Cloak - Lesser Shadow Resistance
    { spell = 13503, skill = 140, source = { "trainer" }, cost = 2000 }, -- Enchant Weapon - Lesser Striking
    { spell = 13536, skill = 140, teach = 11101, source = { "vendor" }, bound = false, vendors = { { npc = 3954, area = 331, faction = "Alliance" }, { npc = 12043, area = 406, faction = "Horde" } } }, -- Enchant Bracer - Lesser Strength
    { spell = 13538, skill = 140, source = { "trainer" }, cost = 2500 }, -- Enchant Chest - Lesser Absorption
    { spell = 13529, skill = 145, source = { "trainer" }, cost = 2400 }, -- Enchant 2H Weapon - Lesser Impact
    { spell = 13607, skill = 145, source = { "trainer" }, cost = 2400 }, -- Enchant Chest - Mana
    { spell = 13612, skill = 145, teach = 11150, source = { "drop" }, bound = false }, -- Enchant Gloves - Mining
    { spell = 13617, skill = 145, teach = 11151, source = { "drop" }, bound = false }, -- Enchant Gloves - Herbalism
    { spell = 13620, skill = 145, teach = 11152, source = { "drop" }, bound = false }, -- Enchant Gloves - Fishing
    { spell = 13622, skill = 150, source = { "trainer" }, cost = 2500 }, -- Enchant Bracer - Lesser Intellect
    { spell = 13626, skill = 150, source = { "trainer" }, cost = 2500 }, -- Enchant Chest - Minor Stats
    { spell = 13628, skill = 150, creates = 11130, source = { "trainer" }, cost = 2500 }, -- Runed Golden Rod
    { spell = 25125, skill = 150, creates = 20745, count = 0, teach = 20752, source = { "vendor" }, bound = false, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 16635, area = 3487, faction = "Horde" }, { npc = 16722, area = 3557, faction = "Alliance" }, { npc = 18753, area = 3483, faction = "Horde" }, { npc = 18773, area = 3483, faction = "Alliance" }, { npc = 18951, area = 3430, faction = "Horde" }, { npc = 19234, area = 3703 }, { npc = 19537, area = 3523 }, { npc = 19540, area = 3523 }, { npc = 19663, area = 3703 } } }, -- Minor Mana Oil
    { spell = 13631, skill = 155, source = { "trainer" }, cost = 2600 }, -- Enchant Shield - Lesser Stamina
    { spell = 13635, skill = 155, source = { "trainer" }, cost = 2600 }, -- Enchant Cloak - Defense
    { spell = 14809, skill = 155, creates = 11289, source = { "trainer" }, cost = 2600 }, -- Lesser Mystic Wand
    { spell = 13637, skill = 160, source = { "trainer" }, cost = 2800 }, -- Enchant Boots - Lesser Agility
    { spell = 13640, skill = 160, source = { "trainer" }, cost = 2700 }, -- Enchant Chest - Greater Health
    { spell = 13642, skill = 165, source = { "trainer" }, cost = 2800 }, -- Enchant Bracer - Spirit
    { spell = 13644, skill = 170, source = { "trainer" }, cost = 2800 }, -- Enchant Boots - Lesser Stamina
    { spell = 13646, skill = 170, teach = 11163, source = { "vendor" }, bound = false, vendors = { { npc = 2381, area = 267, faction = "Alliance" }, { npc = 2821, area = 45, faction = "Horde" } } }, -- Enchant Bracer - Lesser Deflection
    { spell = 13648, skill = 170, source = { "trainer" }, cost = 2800 }, -- Enchant Bracer - Stamina
    { spell = 13653, skill = 175, teach = 11164, source = { "drop" }, bound = false }, -- Enchant Weapon - Lesser Beastslayer
    { spell = 13655, skill = 175, teach = 11165, source = { "drop" }, bound = false }, -- Enchant Weapon - Lesser Elemental Slayer
    { spell = 13657, skill = 175, source = { "trainer" }, cost = 3000 }, -- Enchant Cloak - Fire Resistance
    { spell = 14810, skill = 175, creates = 11290, source = { "trainer" }, cost = 3000 }, -- Greater Mystic Wand
    { spell = 13659, skill = 180, source = { "trainer" }, cost = 3200 }, -- Enchant Shield - Spirit
    { spell = 13661, skill = 180, source = { "trainer" }, cost = 3600 }, -- Enchant Bracer - Strength
    { spell = 13663, skill = 185, source = { "trainer" }, cost = 3800 }, -- Enchant Chest - Greater Mana
    { spell = 13687, skill = 190, teach = 11167, source = { "drop" }, bound = false }, -- Enchant Boots - Lesser Spirit
    { spell = 21931, skill = 190, teach = 17725, source = { "drop" }, bound = false }, -- Enchant Weapon - Winter's Might
    { spell = 13689, skill = 195, teach = 11168, source = { "drop" }, bound = false }, -- Enchant Shield - Lesser Block
    { spell = 13693, skill = 195, source = { "trainer" }, cost = 4000 }, -- Enchant Weapon - Striking
    { spell = 13695, skill = 200, source = { "trainer" }, cost = 4000 }, -- Enchant 2H Weapon - Impact
    { spell = 13698, skill = 200, teach = 11166, source = { "drop" }, bound = false }, -- Enchant Gloves - Skinning
    { spell = 13700, skill = 200, source = { "trainer" }, cost = 4000 }, -- Enchant Chest - Lesser Stats
    { spell = 13702, skill = 200, creates = 11145, source = { "trainer" }, cost = 4000 }, -- Runed Truesilver Rod
    { spell = 13920, skill = 200, rank = "Artisan", level = 35, source = { "trainer" }, cost = 50000 }, -- Enchanting (Artisan)
    { spell = 25126, skill = 200, creates = 20746, count = 0, teach = 20753, source = { "vendor" }, bound = false, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 16635, area = 3487, faction = "Horde" }, { npc = 16722, area = 3557, faction = "Alliance" }, { npc = 18753, area = 3483, faction = "Horde" }, { npc = 18773, area = 3483, faction = "Alliance" }, { npc = 18951, area = 3430, faction = "Horde" }, { npc = 19234, area = 3703 }, { npc = 19537, area = 3523 }, { npc = 19540, area = 3523 }, { npc = 19663, area = 3703 } } }, -- Lesser Wizard Oil
    { spell = 13746, skill = 205, source = { "trainer" }, cost = 4200 }, -- Enchant Cloak - Greater Defense
    { spell = 13794, skill = 205, source = { "trainer" }, cost = 4200 }, -- Enchant Cloak - Resistance
    { spell = 13815, skill = 210, source = { "trainer" }, cost = 4400 }, -- Enchant Gloves - Agility
    { spell = 13817, skill = 210, teach = 11202, source = { "drop" }, bound = false }, -- Enchant Shield - Stamina
    { spell = 13822, skill = 210, source = { "trainer" }, cost = 4400 }, -- Enchant Bracer - Intellect
    { spell = 13836, skill = 215, source = { "trainer" }, cost = 4600 }, -- Enchant Boots - Stamina
    { spell = 13841, skill = 215, teach = 11203, source = { "drop" }, bound = false }, -- Enchant Gloves - Advanced Mining
    { spell = 13846, skill = 220, teach = 11204, source = { "drop" }, bound = false }, -- Enchant Bracer - Greater Spirit
    { spell = 13858, skill = 220, source = { "trainer" }, cost = 4800 }, -- Enchant Chest - Superior Health
    { spell = 13868, skill = 225, teach = 11205, source = { "drop" }, bound = false }, -- Enchant Gloves - Advanced Herbalism
    { spell = 13882, skill = 225, teach = 11206, source = { "drop" }, bound = false }, -- Enchant Cloak - Lesser Agility
    { spell = 13887, skill = 225, source = { "trainer" }, cost = 5000 }, -- Enchant Gloves - Strength
    { spell = 13890, skill = 225, source = { "trainer" }, cost = 5000 }, -- Enchant Boots - Minor Speed
    { spell = 13905, skill = 230, source = { "trainer" }, cost = 5400 }, -- Enchant Shield - Greater Spirit
    { spell = 13915, skill = 230, teach = 11208, source = { "drop" }, bound = false }, -- Enchant Weapon - Demonslaying
    { spell = 13917, skill = 230, source = { "trainer" }, cost = 5400 }, -- Enchant Chest - Superior Mana
    { spell = 13931, skill = 235, teach = 11223, source = { "vendor" }, bound = false, vendors = { { npc = 989, area = 8, faction = "Horde" }, { npc = 4229, area = 1657, faction = "Alliance" } } }, -- Enchant Bracer - Deflection
    { spell = 13933, skill = 235, teach = 11224, source = { "drop" }, bound = false }, -- Enchant Shield - Frost Resistance
    { spell = 13935, skill = 235, source = { "trainer" }, cost = 5800 }, -- Enchant Boots - Agility
    { spell = 13937, skill = 240, source = { "trainer" }, cost = 6200 }, -- Enchant 2H Weapon - Greater Impact
    { spell = 13939, skill = 240, source = { "trainer" }, cost = 6200 }, -- Enchant Bracer - Greater Strength
    { spell = 13941, skill = 245, source = { "trainer" }, cost = 6200 }, -- Enchant Chest - Stats
    { spell = 13943, skill = 245, source = { "trainer" }, cost = 6200 }, -- Enchant Weapon - Greater Striking
    { spell = 13945, skill = 245, teach = 11225, source = { "drop" }, bound = false }, -- Enchant Bracer - Greater Stamina
    { spell = 13947, skill = 250, teach = 11226, source = { "drop" }, bound = false }, -- Enchant Gloves - Riding Skill
    { spell = 13948, skill = 250, source = { "trainer" }, cost = 6500 }, -- Enchant Gloves - Minor Haste
    { spell = 17180, skill = 250, creates = 12655, source = { "trainer" }, cost = 10000 }, -- Enchanted Thorium
    { spell = 17181, skill = 250, creates = 12810, source = { "trainer" }, cost = 10000 }, -- Enchanted Leather
    { spell = 25127, skill = 250, creates = 20747, count = 0, teach = 20754, source = { "vendor" }, bound = false, vendors = { { npc = 15419, area = 1377 } } }, -- Lesser Mana Oil
    { spell = 20008, skill = 255, teach = 16214, source = { "drop" }, cost = 10000, bound = false }, -- Enchant Bracer - Greater Intellect
    { spell = 20020, skill = 260, teach = 16215, source = { "drop" }, bound = false }, -- Enchant Boots - Greater Stamina
    { spell = 13898, skill = 265, teach = 11207, source = { "drop" }, bound = false }, -- Enchant Weapon - Fiery Weapon
    { spell = 15596, skill = 265, creates = 11811, teach = 11813, source = { "drop" }, bound = false }, -- Smoking Heart of the Mountain
    { spell = 20014, skill = 265, teach = 16216, source = { "drop" }, cost = 10000, bound = false }, -- Enchant Cloak - Greater Resistance
    { spell = 20017, skill = 265, teach = 16217, source = { "vendor" }, bound = true, vendors = { { npc = 4229, area = 1657, faction = "Alliance" }, { npc = 4561, area = 1497, faction = "Horde" } } }, -- Enchant Shield - Greater Stamina
    { spell = 20009, skill = 270, teach = 16218, source = { "drop" }, bound = false }, -- Enchant Bracer - Superior Spirit
    { spell = 20012, skill = 270, teach = 16219, source = { "drop" }, cost = 10000, bound = false }, -- Enchant Gloves - Greater Agility
    { spell = 20024, skill = 275, teach = 16220, source = { "drop" }, bound = false }, -- Enchant Boots - Spirit
    { spell = 20026, skill = 275, teach = 16221, source = { "vendor" }, bound = false, vendors = { { npc = 11189, area = 618 } } }, -- Enchant Chest - Major Health
    { spell = 25128, skill = 275, creates = 20750, count = 0, teach = 20755, source = { "vendor" }, bound = false, vendors = { { npc = 15419, area = 1377 } } }, -- Wizard Oil
    { spell = 28029, skill = 275, rank = "Master", level = 50, source = { "trainer" }, cost = 100000 }, -- Enchanting (Master)
    { spell = 20016, skill = 280, teach = 16222, source = { "drop" }, cost = 15000, bound = false }, -- Enchant Shield - Superior Spirit
    { spell = 20015, skill = 285, teach = 16224, source = { "vendor" }, bound = false, vendors = { { npc = 12022, area = 493 } } }, -- Enchant Cloak - Superior Defense
    { spell = 20029, skill = 285, teach = 16223, source = { "drop" }, bound = false }, -- Enchant Weapon - Icy Chill
    { spell = 20028, skill = 290, teach = 16242, source = { "drop" }, cost = 15000, bound = false }, -- Enchant Chest - Major Mana
    { spell = 20051, skill = 290, creates = 16207, teach = 16243, source = { "vendor" }, bound = false, vendors = { { npc = 12022, area = 493 } } }, -- Runed Arcanite Rod
    { spell = 23799, skill = 290, teach = 19444, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Enchant Weapon - Strength
    { spell = 23800, skill = 290, teach = 19445, reputation = { 576, 6, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Enchant Weapon - Agility
    { spell = 23801, skill = 290, teach = 19446, reputation = { 529, 6, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Enchant Bracer - Mana Regeneration
    { spell = 27837, skill = 290, teach = 22392, reputation = { 576, 5, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Enchant 2H Weapon - Agility
    { spell = 20010, skill = 295, teach = 16246, source = { "drop" }, bound = false }, -- Enchant Bracer - Superior Strength
    { spell = 20013, skill = 295, teach = 16244, source = { "drop" }, cost = 20000, bound = false }, -- Enchant Gloves - Greater Strength
    { spell = 20023, skill = 295, teach = 16245, source = { "drop" }, cost = 20000, bound = false }, -- Enchant Boots - Greater Agility
    { spell = 20030, skill = 295, teach = 16247, source = { "drop" }, bound = false }, -- Enchant 2H Weapon - Superior Impact
    { spell = 20033, skill = 295, teach = 16248, source = { "drop" }, bound = false }, -- Enchant Weapon - Unholy Weapon
    { spell = 20011, skill = 300, teach = 16251, source = { "drop" }, bound = false }, -- Enchant Bracer - Superior Stamina
    { spell = 20025, skill = 300, teach = 16253, source = { "drop" }, bound = false }, -- Enchant Chest - Greater Stats
    { spell = 20031, skill = 300, teach = 16250, source = { "drop" }, bound = false }, -- Enchant Weapon - Superior Striking
    { spell = 20032, skill = 300, teach = 16254, source = { "drop" }, bound = false }, -- Enchant Weapon - Lifestealing
    { spell = 20034, skill = 300, teach = 16252, source = { "drop" }, bound = false }, -- Enchant Weapon - Crusader
    { spell = 20035, skill = 300, teach = 16255, source = { "drop" }, bound = false }, -- Enchant 2H Weapon - Major Spirit
    { spell = 20036, skill = 300, teach = 16249, source = { "drop" }, bound = false }, -- Enchant 2H Weapon - Major Intellect
    { spell = 22749, skill = 300, teach = 18259, source = { "drop" }, bound = true }, -- Enchant Weapon - Spell Power
    { spell = 22750, skill = 300, teach = 18260, source = { "drop" }, bound = true }, -- Enchant Weapon - Healing Power
    { spell = 23802, skill = 300, teach = 19447, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Enchant Bracer - Healing Power
    { spell = 23803, skill = 300, teach = 19448, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Enchant Weapon - Mighty Spirit
    { spell = 23804, skill = 300, teach = 19449, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Enchant Weapon - Mighty Intellect
    { spell = 25072, skill = 300, teach = 20726, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Enchant Gloves - Threat
    { spell = 25073, skill = 300, teach = 20727, source = { "drop" }, bound = true }, -- Enchant Gloves - Shadow Power
    { spell = 25074, skill = 300, teach = 20728, source = { "drop" }, bound = true }, -- Enchant Gloves - Frost Power
    { spell = 25078, skill = 300, teach = 20729, source = { "drop" }, bound = true }, -- Enchant Gloves - Fire Power
    { spell = 25079, skill = 300, teach = 20730, source = { "drop" }, bound = true }, -- Enchant Gloves - Healing Power
    { spell = 25080, skill = 300, teach = 20731, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 21643, area = 440 } } }, -- Enchant Gloves - Superior Agility
    { spell = 25081, skill = 300, teach = 20732, reputation = { 609, 5, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15419, area = 1377 } } }, -- Enchant Cloak - Greater Fire Resistance
    { spell = 25082, skill = 300, teach = 20733, reputation = { 609, 6, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15419, area = 1377 } } }, -- Enchant Cloak - Greater Nature Resistance
    { spell = 25083, skill = 300, teach = 20734, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Enchant Cloak - Stealth
    { spell = 25084, skill = 300, teach = 20735, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 17585, area = 3483 }, { npc = 17657, area = 3483 } } }, -- Enchant Cloak - Subtlety
    { spell = 25086, skill = 300, teach = 20736, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 21655, area = 3703 } } }, -- Enchant Cloak - Dodge
    { spell = 25129, skill = 300, creates = 20749, count = 0, teach = 20756, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Brilliant Wizard Oil
    { spell = 25130, skill = 300, creates = 20748, count = 0, teach = 20757, reputation = { 270, 5, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Brilliant Mana Oil
    { spell = 32664, skill = 300, creates = 22461, source = { "trainer" }, cost = 10000 }, -- Runed Fel Iron Rod
    { spell = 33991, skill = 300, source = { "trainer" }, cost = 12500 }, -- Enchant Chest - Restore Mana Prime
    { spell = 34002, skill = 300, source = { "trainer" }, cost = 12500 }, -- Enchant Bracer - Assault
    { spell = 42613, skill = 300, creates = 22448, source = { "trainer" }, cost = 10000 }, -- Nexus Transformation
    { spell = 27899, skill = 305, source = { "trainer" }, cost = 12500 }, -- Enchant Bracer - Brawn
    { spell = 27948, skill = 305, teach = 22542, source = { "drop" }, bound = false }, -- Enchant Boots - Vitality
    { spell = 33993, skill = 305, source = { "trainer" }, cost = 12500 }, -- Enchant Gloves - Blasting
    { spell = 34001, skill = 305, source = { "trainer" }, cost = 12500 }, -- Enchant Bracer - Major Intellect
    { spell = 27944, skill = 310, source = { "trainer" }, cost = 15000 }, -- Enchant Shield - Tough Shield
    { spell = 27961, skill = 310, source = { "trainer" }, cost = 15000 }, -- Enchant Cloak - Major Armor
    { spell = 28016, skill = 310, creates = 22521, count = 0, teach = 22562, source = { "vendor" }, bound = false, vendors = { { npc = 16635, area = 3487, faction = "Horde" }, { npc = 16722, area = 3557, faction = "Alliance" }, { npc = 19663, area = 3703 } } }, -- Superior Mana Oil
    { spell = 33996, skill = 310, source = { "trainer" }, cost = 15000 }, -- Enchant Gloves - Assault
    { spell = 34004, skill = 310, source = { "trainer" }, cost = 15000 }, -- Enchant Cloak - Greater Agility
    { spell = 27905, skill = 315, source = { "trainer" }, cost = 12500 }, -- Enchant Bracer - Stats
    { spell = 27957, skill = 315, source = { "trainer" }, cost = 17500 }, -- Enchant Chest - Exceptional Health
    { spell = 27906, skill = 320, teach = 22530, source = { "drop" }, bound = true }, -- Enchant Bracer - Major Defense
    { spell = 27950, skill = 320, teach = 22543, source = { "drop" }, bound = true }, -- Enchant Boots - Fortitude
    { spell = 33990, skill = 320, source = { "trainer" }, cost = 20000 }, -- Enchant Chest - Major Spirit
    { spell = 27911, skill = 325, teach = 22531, reputation = { 946, 5, ns.L.FACTION_946, 947, 5, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17657, area = 3483, faction = "Alliance" }, { npc = 17585, area = 3483 } } }, -- Enchant Bracer - Superior Healing
    { spell = 27945, skill = 325, teach = 22539, source = { "vendor" }, bound = false, vendors = { { npc = 18664 } } }, -- Enchant Shield - Intellect
    { spell = 27958, skill = 325, teach = 22546, bound = true }, -- Enchant Chest - Exceptional Mana
    { spell = 28027, skill = 325, creates = 22460, source = { "trainer" }, cost = 40000 }, -- Prismatic Sphere
    { spell = 34003, skill = 325, teach = 28274, reputation = { 933, 5, ns.L.FACTION_933 }, source = { "vendor" }, bound = true, vendors = { { npc = 20242, area = 3523 }, { npc = 23007, area = 3518 } } }, -- Enchant Cloak - Spell Penetration
    { spell = 34009, skill = 325, teach = 28282, source = { "vendor" }, bound = false, vendors = { { npc = 19663, area = 3703 } } }, -- Enchant Shield - Major Stamina
    { spell = 27962, skill = 330, teach = 22548, source = { "drop" }, bound = false }, -- Enchant Cloak - Major Resistance
    { spell = 44383, skill = 330, source = { "trainer" }, cost = 25000 }, -- Enchant Shield - Resilience
    { spell = 27913, skill = 335, teach = 22532, source = { "drop" }, bound = false }, -- Enchant Bracer - Restore Mana Prime
    { spell = 28022, skill = 335, creates = 22449, teach = 22565, source = { "vendor" }, bound = false, vendors = { { npc = 16635, area = 3487, faction = "Horde" }, { npc = 16722, area = 3557, faction = "Alliance" }, { npc = 19663, area = 3703 } } }, -- Large Prismatic Shard
    { spell = 42615, skill = 335, creates = 22448, count = 3, source = { "trainer" }, cost = 40000 }, -- Small Prismatic Shard
    { spell = 27946, skill = 340, teach = 22540, source = { "drop" }, bound = false }, -- Enchant Shield - Shield Block
    { spell = 27951, skill = 340, teach = 22544, source = { "drop" }, bound = true }, -- Enchant Boots - Dexterity
    { spell = 27967, skill = 340, teach = 22552, reputation = { 933, 6, ns.L.FACTION_933 }, source = { "vendor" }, bound = true, vendors = { { npc = 20242, area = 3523 }, { npc = 23007, area = 3518 } } }, -- Enchant Weapon - Major Striking
    { spell = 27968, skill = 340, teach = 22551, source = { "drop" }, bound = true }, -- Enchant Weapon - Major Intellect
    { spell = 28019, skill = 340, creates = 22522, count = 0, teach = 22563, source = { "vendor" }, bound = false, vendors = { { npc = 16635, area = 3487, faction = "Horde" }, { npc = 16722, area = 3557, faction = "Alliance" }, { npc = 19663, area = 3703 } } }, -- Superior Wizard Oil
    { spell = 33995, skill = 340, source = { "trainer" }, cost = 25000 }, -- Enchant Gloves - Major Strength
    { spell = 27960, skill = 345, teach = 22547, reputation = { 946, 7, ns.L.FACTION_946, 947, 7, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17657, area = 3483, faction = "Alliance" }, { npc = 17585, area = 3483 } } }, -- Enchant Chest - Exceptional Stats
    { spell = 33992, skill = 345, teach = 28270, source = { "drop" }, bound = false }, -- Enchant Chest - Major Resilience
    { spell = 27914, skill = 350, teach = 22533, source = { "drop" }, bound = true }, -- Enchant Bracer - Fortitude
    { spell = 27971, skill = 350, teach = 22554, source = { "drop" }, bound = true }, -- Enchant 2H Weapon - Savagery
    { spell = 27972, skill = 350, teach = 22553, source = { "drop" }, bound = false }, -- Enchant Weapon - Potency
    { spell = 27975, skill = 350, teach = 22555, source = { "drop" }, bound = true }, -- Enchant Weapon - Major Spellpower
    { spell = 28028, skill = 350, creates = 22459, source = { "trainer" }, cost = 80000 }, -- Void Sphere
    { spell = 32665, skill = 350, creates = 22462, teach = 25848, source = { "vendor" }, bound = false, vendors = { { npc = 18960, area = 3519, faction = "Horde" }, { npc = 19004, area = 3483, faction = "Alliance" } } }, -- Runed Adamantite Rod
    { spell = 33999, skill = 350, teach = 28273, reputation = { 935, 6, ns.L.FACTION_935 }, source = { "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Enchant Gloves - Major Healing
    { spell = 34005, skill = 350, teach = 28276, source = { "drop" }, bound = true }, -- Enchant Cloak - Greater Arcane Resistance
    { spell = 34006, skill = 350, teach = 28277, source = { "drop" }, bound = true }, -- Enchant Cloak - Greater Shadow Resistance
    { spell = 34010, skill = 350, teach = 28281, reputation = { 935, 7, ns.L.FACTION_935 }, source = { "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Enchant Weapon - Major Healing
    { spell = 42620, skill = 350, teach = 33165, reputation = { 967, 8, ns.L.FACTION_967 }, source = { "vendor" }, bound = true, vendors = { { npc = 18255, area = 41 } } }, -- Enchant Weapon - Greater Agility
    { spell = 46578, skill = 350, teach = 35498, source = { "drop" }, bound = true }, -- Enchant Weapon - Deathfrost
    { spell = 27917, skill = 360, teach = 22534, source = { "drop" }, bound = true }, -- Enchant Bracer - Spellpower
    { spell = 27920, skill = 360, teach = 22535, reputation = { 933, 7, ns.L.FACTION_933 }, source = { "vendor" }, bound = true, vendors = { { npc = 17518, area = 3457 } } }, -- Enchant Ring - Striking
    { spell = 27924, skill = 360, teach = 22536, reputation = { 989, 6, ns.L.FACTION_989 }, source = { "vendor" }, bound = true, vendors = { { npc = 21643, area = 440 } } }, -- Enchant Ring - Spellpower
    { spell = 27947, skill = 360, teach = 22541, source = { "drop" }, bound = false }, -- Enchant Shield - Resistance
    { spell = 27977, skill = 360, teach = 22556, source = { "drop" }, bound = true }, -- Enchant 2H Weapon - Major Agility
    { spell = 28003, skill = 360, teach = 22558, source = { "drop" }, bound = false }, -- Enchant Weapon - Spellsurge
    { spell = 28004, skill = 360, teach = 22557, source = { "drop" }, bound = false }, -- Enchant Weapon - Battlemaster
    { spell = 33994, skill = 360, teach = 28271, reputation = { 942, 7, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Enchant Gloves - Spell Strike
    { spell = 33997, skill = 360, teach = 28272, reputation = { 989, 6, ns.L.FACTION_989 }, source = { "vendor" }, bound = true, vendors = { { npc = 21643, area = 440 } } }, -- Enchant Gloves - Major Spellpower
    { spell = 34007, skill = 360, teach = 28279, source = { "drop" }, bound = false }, -- Enchant Boots - Cat's Swiftness
    { spell = 34008, skill = 360, teach = 28280, source = { "drop" }, bound = false }, -- Enchant Boots - Boar's Speed
    { spell = 46594, skill = 360, teach = 35500, reputation = { 1077, 6, ns.L.FACTION_1077 }, source = { "vendor" }, bound = true, vendors = { { npc = 25032, area = 4080 } } }, -- Enchant Chest - Defense
    { spell = 27926, skill = 370, teach = 22537, reputation = { 935, 7, ns.L.FACTION_935 }, source = { "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Enchant Ring - Healing Power
    { spell = 27954, skill = 370, teach = 22545, source = { "drop" }, bound = true }, -- Enchant Boots - Surefooted
    { spell = 27927, skill = 375, teach = 22538, reputation = { 1011, 6, ns.L.FACTION_1011 }, source = { "vendor" }, bound = true, vendors = { { npc = 21655, area = 3703 } } }, -- Enchant Ring - Stats
    { spell = 27981, skill = 375, teach = 22560, source = { "drop" }, bound = true }, -- Enchant Weapon - Sunfire
    { spell = 27982, skill = 375, teach = 22561, source = { "drop" }, bound = true }, -- Enchant Weapon - Soulfrost
    { spell = 27984, skill = 375, teach = 22559, source = { "drop" }, bound = true }, -- Enchant Weapon - Mongoose
    { spell = 32667, skill = 375, creates = 22463, teach = 25849, source = { "vendor" }, bound = false, vendors = { { npc = 19663, area = 3703 } } }, -- Runed Eternium Rod
    { spell = 42974, skill = 375, teach = 33307, source = { "drop" }, bound = true }, -- Enchant Weapon - Executioner
    { spell = 45765, skill = 375, creates = 22449, count = 2, teach = 34872, reputation = { 1077, 6, ns.L.FACTION_1077 }, source = { "vendor" }, bound = true, vendors = { { npc = 25032, area = 4080 } } }, -- Void Shatter
    { spell = 47051, skill = 375, teach = 35756, source = { "drop" }, bound = true }, -- Enchant Cloak - Steelweave
}
