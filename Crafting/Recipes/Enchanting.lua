local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[333] = {
    { spell = 7421, skill = 1, creates = 6218 }, -- Runed Copper Rod
    { spell = 14293, skill = 10, creates = 11287, source = { "trainer" }, cost = 50 }, -- Lesser Magic Wand
    { spell = 1245320, skill = 10, creates = 247786, count = 3 }, -- Dust to Motes
    { spell = 1245321, skill = 10, creates = 247789 }, -- Novice's Practice Wand
    { spell = 7420, skill = 15, source = { "trainer" }, cost = 50 }, -- Enchant Chest - Inferior Stamina
    { spell = 7418, skill = 20 }, -- Enchant Bracer - Inferior Stamina
    { spell = 7443, skill = 20, teach = 6342, source = { "drop", "vendor" }, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5695, area = 85, faction = "Horde" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 257004, area = 16593 }, { npc = 257020, area = 16593 } } }, -- Enchant Chest - Minor Intellect
    { spell = 1230643, skill = 20, creates = 279976, source = { "quest", "trainer" }, cost = 100, quests = { { id = 96059, area = 1537, faction = "Alliance", level = 4 }, { id = 97901, area = 14, faction = "Horde", level = 4 }, { id = 97917, area = 12, faction = "Alliance", level = 4 }, { id = 97929, area = 215, faction = "Horde", level = 4 }, { id = 97940, area = 141, faction = "Alliance", level = 4 }, { id = 97953, area = 85, faction = "Horde", level = 4 }, { id = 98284, area = 16593, faction = "Horde", level = 4 }, { id = 98286, area = 16593, faction = "Alliance", level = 4 } } }, -- Enchanted Lute
    { spell = 7426, skill = 40, source = { "trainer" }, cost = 100 }, -- Enchant Chest - Minor Absorption
    { spell = 7454, skill = 45, source = { "trainer" }, cost = 100 }, -- Enchant Cloak - Minor Resistance
    { spell = 25124, skill = 45, creates = 20744, teach = 20758, source = { "vendor" }, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 257020, area = 16593 } } }, -- Minor Wizard Oil
    { spell = 7412, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 10 }, -- Enchanting (Journeyman)
    { spell = 7457, skill = 50, source = { "trainer" }, cost = 250 }, -- Enchant Bracer - Minor Stamina
    { spell = 7748, skill = 60, source = { "trainer" }, cost = 250 }, -- Enchant Chest - Lesser Stamina
    { spell = 7766, skill = 60, teach = 6344, source = { "drop" } }, -- Enchant Bracer - Minor Spirit
    { spell = 7771, skill = 70, teach = 6345, source = { "trainer" }, cost = 200 }, -- Enchant Cloak - Minor Protection
    { spell = 14807, skill = 70, creates = 11288, source = { "trainer" }, cost = 200 }, -- Greater Magic Wand
    { spell = 1248458, skill = 70, teach = 249474, source = { "drop" } }, -- Enchant Bracer - Minor Intellect
    { spell = 7428, skill = 80 }, -- Enchant Bracer - Minor Deflect
    { spell = 7776, skill = 80, teach = 6346, source = { "drop", "vendor" }, vendors = { { npc = 3346, area = 1637, faction = "Horde" }, { npc = 5757, area = 130, faction = "Horde" } } }, -- Enchant Chest - Lesser Intellect
    { spell = 7779, skill = 80, source = { "trainer" }, cost = 400 }, -- Enchant Bracer - Minor Agility
    { spell = 7782, skill = 80, teach = 6347, source = { "drop" } }, -- Enchant Bracer - Minor Strength
    { spell = 7786, skill = 90, teach = 6348, source = { "drop" } }, -- Enchant Weapon - Minor Beastslayer
    { spell = 7788, skill = 90, source = { "trainer" }, cost = 500 }, -- Enchant Weapon - Minor Striking
    { spell = 1248459, skill = 90, teach = 249475, source = { "drop" } }, -- Enchant Bracer - Minor Healing Power
    { spell = 7745, skill = 100, source = { "trainer" }, cost = 500 }, -- Enchant 2H Weapon - Minor Impact
    { spell = 7793, skill = 100, teach = 6349, source = { "vendor" }, vendors = { { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5758, area = 130, faction = "Horde" } } }, -- Enchant 2H Weapon - Lesser Intellect
    { spell = 7795, skill = 100, creates = 6339, source = { "trainer" }, cost = 1000 }, -- Runed Silver Rod
    { spell = 430409, skill = 100, creates = 211848 }, -- Blackfathom Mana Oil
    { spell = 13378, skill = 105, source = { "trainer" }, cost = 600 }, -- Enchant Shield - Minor Stamina
    { spell = 13380, skill = 110, teach = 11038, source = { "drop" } }, -- Enchant 2H Weapon - Lesser Spirit
    { spell = 13419, skill = 110, teach = 11039, source = { "drop", "vendor" }, vendors = { { npc = 3954, area = 331, faction = "Alliance" }, { npc = 12043, area = 406, faction = "Horde" } } }, -- Enchant Cloak - Minor Agility
    { spell = 13421, skill = 115, source = { "trainer" }, cost = 800 }, -- Enchant Cloak - Lesser Protection
    { spell = 13464, skill = 115, teach = 11081, source = { "drop" } }, -- Enchant Shield - Lesser Protection
    { spell = 7857, skill = 120, source = { "trainer" }, cost = 1000 }, -- Enchant Chest - Stamina
    { spell = 7859, skill = 120, teach = 6375, source = { "drop" } }, -- Enchant Bracer - Lesser Spirit
    { spell = 448624, skill = 120, creates = 220792, teach = 223163, source = { "drop" } }, -- Scroll of Spatial Mending
    { spell = 7413, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 20 }, -- Enchanting (Expert)
    { spell = 7861, skill = 125, source = { "trainer" }, cost = 1250 }, -- Enchant Cloak - Lesser Fire Resistance
    { spell = 7863, skill = 125, teach = 6376, source = { "trainer" }, cost = 1400 }, -- Enchant Boots - Minor Stamina
    { spell = 7867, skill = 125, teach = 6377, source = { "vendor" }, vendors = { { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3537, area = 267 } } }, -- Enchant Boots - Minor Agility
    { spell = 13485, skill = 130, source = { "trainer" }, cost = 1500 }, -- Enchant Shield - Lesser Spirit
    { spell = 13501, skill = 130, source = { "trainer" }, cost = 1500 }, -- Enchant Bracer - Lesser Stamina
    { spell = 1248752, skill = 130, creates = 249396, teach = 249476, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Mystic Mushroom
    { spell = 1248754, skill = 130, creates = 249397, teach = 249477, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Tenets of the Silver Hand
    { spell = 1248755, skill = 130, creates = 249398, teach = 249478, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Polished Driftwood Icon
    { spell = 13522, skill = 135, teach = 11098, source = { "drop" } }, -- Enchant Cloak - Lesser Shadow Resistance
    { spell = 13503, skill = 140, source = { "trainer" }, cost = 2000 }, -- Enchant Weapon - Lesser Striking
    { spell = 13536, skill = 140, teach = 11101, source = { "vendor" }, vendors = { { npc = 3954, area = 331, faction = "Alliance" }, { npc = 12043, area = 406, faction = "Horde" } } }, -- Enchant Bracer - Lesser Strength
    { spell = 13538, skill = 140, source = { "trainer" }, cost = 2500 }, -- Enchant Chest - Lesser Absorption
    { spell = 1248460, skill = 140, teach = 249486, source = { "quest", "vendor" }, reputation = { 93, 8, ns.L.FACTION_93, 92, 6, ns.L.FACTION_92 }, quests = { { id = 92755, area = 405, faction = "Alliance", level = 30 } }, vendors = { { npc = 253140, area = 405 }, { npc = 253139, area = 405 } } }, -- Enchant Bracer - Lesser Agility
    { spell = 1248703, skill = 140, creates = 249392, teach = 249482, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Glimmering Staff
    { spell = 1248739, skill = 140, creates = 249393, teach = 249483, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Soulstaff
    { spell = 1248745, skill = 140, creates = 249394, teach = 249484, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Orb of Mystic Insight
    { spell = 1248748, skill = 140, creates = 249395, teach = 249485, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Orb of Souls
    { spell = 1248757, skill = 140, teach = 249479, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Weapon - Insight
    { spell = 1248760, skill = 140, teach = 249480, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Weapon - Recovery
    { spell = 1248805, skill = 140, teach = 249481, source = { "vendor" }, merchantFavor = 45, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Weapon - Revelation
    { spell = 1263056, skill = 140, creates = 279985, teach = 273103, source = { "drop" } }, -- Arcane Salvager
    { spell = 13529, skill = 145, source = { "trainer" }, cost = 2400 }, -- Enchant 2H Weapon - Lesser Impact
    { spell = 13607, skill = 145, source = { "trainer" }, cost = 2400 }, -- Enchant Chest - Intellect
    { spell = 13612, skill = 145, teach = 11150, source = { "drop" } }, -- Enchant Gloves - Mining
    { spell = 13617, skill = 145, teach = 11151, source = { "drop" } }, -- Enchant Gloves - Herbalism
    { spell = 13620, skill = 145, teach = 11152, source = { "drop" } }, -- Enchant Gloves - Fishing
    { spell = 13622, skill = 150, source = { "trainer" }, cost = 2500 }, -- Enchant Bracer - Lesser Intellect
    { spell = 13626, skill = 150, source = { "trainer" }, cost = 2500 }, -- Enchant Chest - Minor Stats
    { spell = 13628, skill = 150, creates = 11130, source = { "trainer" }, cost = 2500 }, -- Runed Golden Rod
    { spell = 25125, skill = 150, creates = 20745, teach = 20752, source = { "vendor" }, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 257020, area = 16593 } } }, -- Minor Mana Oil
    { spell = 13631, skill = 155, source = { "trainer" }, cost = 2600 }, -- Enchant Shield - Lesser Stamina
    { spell = 13635, skill = 155, source = { "trainer" }, cost = 2600 }, -- Enchant Cloak - Defense
    { spell = 14809, skill = 155, creates = 11289, source = { "trainer" }, cost = 2600 }, -- Lesser Mystic Wand
    { spell = 13637, skill = 160, source = { "trainer" }, cost = 2800 }, -- Enchant Boots - Lesser Agility
    { spell = 13640, skill = 160, source = { "trainer" }, cost = 2700 }, -- Enchant Chest - Greater Stamina
    { spell = 13642, skill = 165, source = { "trainer" }, cost = 2800 }, -- Enchant Bracer - Spirit
    { spell = 13644, skill = 170, source = { "trainer" }, cost = 2800 }, -- Enchant Boots - Lesser Stamina
    { spell = 13646, skill = 170, teach = 11163, source = { "vendor" }, vendors = { { npc = 2381, area = 267, faction = "Alliance" }, { npc = 2821, area = 45, faction = "Horde" } } }, -- Enchant Bracer - Lesser Deflection
    { spell = 13648, skill = 170, source = { "trainer" }, cost = 2800 }, -- Enchant Bracer - Stamina
    { spell = 13653, skill = 175, teach = 11164, source = { "drop" } }, -- Enchant Weapon - Lesser Beastslayer
    { spell = 13655, skill = 175, teach = 11165, source = { "drop" } }, -- Enchant Weapon - Lesser Elemental Slayer
    { spell = 13657, skill = 175, source = { "trainer" }, cost = 3000 }, -- Enchant Cloak - Fire Resistance
    { spell = 14810, skill = 175, creates = 217287, source = { "trainer" }, cost = 3000 }, -- Greater Mystic Wand
    { spell = 439134, skill = 175, creates = 217287, source = { "trainer" }, cost = 2666 }, -- Greater Mystic Wand
    { spell = 13659, skill = 180, source = { "trainer" }, cost = 3200 }, -- Enchant Shield - Spirit
    { spell = 13661, skill = 180, source = { "trainer" }, cost = 3600 }, -- Enchant Bracer - Strength
    { spell = 13663, skill = 185, source = { "trainer" }, cost = 3800 }, -- Enchant Chest - Greater Intellect
    { spell = 1248461, skill = 185, creates = 249144, teach = 249487 }, -- Twisted Nether Wand
    { spell = 13687, skill = 190, teach = 11167, source = { "drop" } }, -- Enchant Boots - Lesser Spirit
    { spell = 21931, skill = 190, teach = 17725, source = { "drop" } }, -- Enchant Weapon - Winter's Might
    { spell = 1248497, skill = 190, teach = 249488 }, -- Enchant Bracer - Agility
    { spell = 13689, skill = 195, teach = 11168, source = { "drop" } }, -- Enchant Shield - Lesser Block
    { spell = 13693, skill = 195, source = { "trainer" }, cost = 4000 }, -- Enchant Weapon - Striking
    { spell = 13695, skill = 200, source = { "trainer" }, cost = 4000 }, -- Enchant 2H Weapon - Impact
    { spell = 13698, skill = 200, teach = 11166, source = { "drop" } }, -- Enchant Gloves - Skinning
    { spell = 13700, skill = 200, source = { "trainer" }, cost = 4000 }, -- Enchant Chest - Lesser Stats
    { spell = 13702, skill = 200, creates = 11145, source = { "trainer" }, cost = 4000 }, -- Runed Truesilver Rod
    { spell = 13920, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 35 }, -- Enchanting (Artisan)
    { spell = 25126, skill = 200, creates = 20746, teach = 20753, source = { "vendor" }, vendors = { { npc = 1318, area = 1519, faction = "Alliance" }, { npc = 3012, area = 1638, faction = "Horde" }, { npc = 3346, area = 1637, faction = "Horde" }, { npc = 4228, area = 1657, faction = "Alliance" }, { npc = 4617, area = 1497, faction = "Horde" }, { npc = 5158, area = 1537, faction = "Alliance" }, { npc = 5757, area = 130, faction = "Horde" }, { npc = 5758, area = 130, faction = "Horde" }, { npc = 15419, area = 1377 }, { npc = 257020, area = 16593 } } }, -- Lesser Wizard Oil
    { spell = 13746, skill = 205, source = { "trainer" }, cost = 4200 }, -- Enchant Cloak - Greater Defense
    { spell = 13794, skill = 205, source = { "trainer" }, cost = 4200 }, -- Enchant Cloak - Resistance
    { spell = 1248498, skill = 205, teach = 249489, source = { "quest", "vendor" }, reputation = { 93, 8, ns.L.FACTION_93, 92, 6, ns.L.FACTION_92 }, quests = { { id = 92755, area = 405, faction = "Alliance", level = 30 } }, vendors = { { npc = 253140, area = 405 }, { npc = 253139, area = 405 } } }, -- Enchant Bracer - Lesser Healing Power
    { spell = 13815, skill = 210, source = { "trainer" }, cost = 4400 }, -- Enchant Gloves - Agility
    { spell = 13817, skill = 210, teach = 11202, source = { "drop" } }, -- Enchant Shield - Stamina
    { spell = 13822, skill = 210, source = { "trainer" }, cost = 4400 }, -- Enchant Bracer - Intellect
    { spell = 1248510, skill = 210, teach = 249511 }, -- Enchant 2H Weapon - Lesser Agility
    { spell = 1248974, skill = 210, creates = 249441, teach = 249493, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Talons of Wrath
    { spell = 1249006, skill = 210, creates = 249442, teach = 249494, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Libram of Invocation
    { spell = 1249015, skill = 210, creates = 249443, teach = 249495, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Totem of Ancestral Protection
    { spell = 1249019, skill = 210, teach = 249496, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Necklace - Strength
    { spell = 1249057, skill = 210, teach = 249502, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Necklace - Spell Power
    { spell = 1249058, skill = 210, teach = 249503, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Necklace - Healing Power
    { spell = 1249059, skill = 210, teach = 249504, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Necklace - Agility
    { spell = 1249060, skill = 210, teach = 249505, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Necklace - Deflection
    { spell = 13836, skill = 215, source = { "trainer" }, cost = 4600 }, -- Enchant Boots - Stamina
    { spell = 13841, skill = 215, teach = 11203, source = { "drop" } }, -- Enchant Gloves - Advanced Mining
    { spell = 1248509, skill = 215, creates = 249234, teach = 249512 }, -- Dreambough Wand
    { spell = 13846, skill = 220, teach = 11204, source = { "drop" } }, -- Enchant Bracer - Greater Spirit
    { spell = 13858, skill = 220, source = { "trainer" }, cost = 4800 }, -- Enchant Chest - Superior Stamina
    { spell = 1248511, skill = 220, teach = 249513 }, -- Enchant 2H Weapon - Lesser Strength
    { spell = 1249061, skill = 220, creates = 249453, teach = 249506, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Radiant Staff
    { spell = 1249064, skill = 220, creates = 249454, teach = 249507, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Dreamstaff
    { spell = 1249069, skill = 220, creates = 249455, teach = 249508, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Truesilver Conduit
    { spell = 1249070, skill = 220, creates = 249456, teach = 249509, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Twisting Essence Jar
    { spell = 1249071, skill = 220, teach = 249510, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Chest - Absorption
    { spell = 13868, skill = 225, teach = 11205, source = { "drop" } }, -- Enchant Gloves - Advanced Herbalism
    { spell = 13882, skill = 225, teach = 11206, source = { "drop" } }, -- Enchant Cloak - Lesser Agility
    { spell = 13887, skill = 225, source = { "trainer" }, cost = 5000 }, -- Enchant Gloves - Strength
    { spell = 13890, skill = 225, source = { "trainer" }, cost = 5000 }, -- Enchant Boots - Minor Speed
    { spell = 435481, skill = 225, teach = 215129, source = { "vendor" }, vendors = { { npc = 217689, area = 721 } } }, -- Enchant Weapon - Dismantle
    { spell = 435903, skill = 225, teach = 215138, source = { "vendor" }, vendors = { { npc = 217689, area = 721 } } }, -- Enchant Chest - Retricutioner
    { spell = 439156, skill = 225, creates = 217308, teach = 215141, source = { "vendor" }, vendors = { { npc = 217689, area = 721 } } }, -- Sigil of Innovation
    { spell = 13905, skill = 230, source = { "trainer" }, cost = 5400 }, -- Enchant Shield - Greater Spirit
    { spell = 13915, skill = 230, teach = 11208, source = { "drop" } }, -- Enchant Weapon - Demonslaying
    { spell = 13917, skill = 230, source = { "trainer" }, cost = 5400 }, -- Enchant Chest - Superior Intellect
    { spell = 13931, skill = 235, teach = 11223, source = { "vendor" }, vendors = { { npc = 989, area = 8, faction = "Horde" }, { npc = 4229, area = 1657, faction = "Alliance" } } }, -- Enchant Bracer - Deflection
    { spell = 13933, skill = 235, teach = 11224, source = { "drop" } }, -- Enchant Shield - Frost Resistance
    { spell = 13935, skill = 235, source = { "trainer" }, cost = 5800 }, -- Enchant Boots - Agility
    { spell = 13937, skill = 240, source = { "trainer" }, cost = 6200 }, -- Enchant 2H Weapon - Greater Impact
    { spell = 13939, skill = 240, source = { "trainer" }, cost = 6200 }, -- Enchant Bracer - Greater Strength
    { spell = 1248500, skill = 240, teach = 249514 }, -- Enchant Bracer - Greater Agility
    { spell = 13941, skill = 245, source = { "trainer" }, cost = 6200 }, -- Enchant Chest - Stats
    { spell = 13943, skill = 245, source = { "trainer" }, cost = 6200 }, -- Enchant Weapon - Greater Striking
    { spell = 13945, skill = 245, teach = 11225, source = { "drop" } }, -- Enchant Bracer - Greater Stamina
    { spell = 1248505, skill = 245, creates = 249232, teach = 249515 }, -- Lesser Eternal Wand
    { spell = 13947, skill = 250, teach = 11226, source = { "drop" } }, -- Enchant Gloves - Riding Skill
    { spell = 13948, skill = 250, source = { "trainer" }, cost = 6500 }, -- Enchant Gloves - Minor Haste
    { spell = 17180, skill = 250, creates = 12655, source = { "trainer" }, cost = 10000 }, -- Enchanted Thorium
    { spell = 17181, skill = 250, creates = 12810, source = { "trainer" }, cost = 10000 }, -- Enchanted Leather
    { spell = 25127, skill = 250, creates = 20747, teach = 20754, source = { "vendor" }, vendors = { { npc = 12944, area = 1584 }, { npc = 15419, area = 1377 } } }, -- Lesser Mana Oil
    { spell = 446243, skill = 250, creates = 221028 }, -- Sigil of Living Dreams
    { spell = 1248528, skill = 250, teach = 249516 }, -- Enchant Gloves - Advanced Skinning
    { spell = 20008, skill = 255, teach = 16214, source = { "drop" } }, -- Enchant Bracer - Greater Intellect
    { spell = 20020, skill = 260, teach = 16215, source = { "drop" } }, -- Enchant Boots - Greater Stamina
    { spell = 13898, skill = 265, teach = 11207, source = { "drop" } }, -- Enchant Weapon - Fiery Weapon
    { spell = 15596, skill = 265, creates = 11811, teach = 11813, source = { "drop" } }, -- Smoking Heart of the Mountain
    { spell = 20014, skill = 265, teach = 16216, source = { "drop" } }, -- Enchant Cloak - Greater Resistance
    { spell = 20017, skill = 265, teach = 16217, source = { "vendor" }, vendors = { { npc = 4229, area = 1657, faction = "Alliance" }, { npc = 4561, area = 1497, faction = "Horde" } } }, -- Enchant Shield - Greater Stamina
    { spell = 20009, skill = 270, teach = 16218, source = { "drop" } }, -- Enchant Bracer - Superior Spirit
    { spell = 20012, skill = 270, teach = 16219, source = { "drop" } }, -- Enchant Gloves - Greater Agility
    { spell = 20024, skill = 275, teach = 16220, source = { "drop" } }, -- Enchant Boots - Spirit
    { spell = 20026, skill = 275, teach = 16221, source = { "vendor" }, vendors = { { npc = 11189, area = 618 } } }, -- Enchant Chest - Major Stamina
    { spell = 25128, skill = 275, creates = 20750, teach = 20755, source = { "vendor" }, vendors = { { npc = 12944, area = 1584 }, { npc = 15419, area = 1377 } } }, -- Wizard Oil
    { spell = 463869, skill = 275, creates = 228980, teach = 228981, source = { "vendor" }, vendors = { { npc = 12944, area = 1584 } } }, -- Conductive Shield Coating
    { spell = 1248515, skill = 275, creates = 249237, teach = 249522 }, -- Greater Eternal Wand
    { spell = 1248650, skill = 275, creates = 249385, teach = 249537, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Brilliant Wand
    { spell = 20016, skill = 280, teach = 16222, source = { "drop" } }, -- Enchant Shield - Superior Spirit
    { spell = 20015, skill = 285, teach = 16224, source = { "vendor" }, vendors = { { npc = 12022, area = 493 } } }, -- Enchant Cloak - Superior Defense
    { spell = 20029, skill = 285, teach = 16223, source = { "drop" } }, -- Enchant Weapon - Icy Chill
    { spell = 1249107, skill = 285, creates = 249469 }, -- Frozen Heart of the Mountain
    { spell = 1249112, skill = 285, creates = 249470 }, -- Molten Heart of the Mountain
    { spell = 1249114, skill = 285, creates = 249473 }, -- Dormant Heart of the Mountain
    { spell = 20028, skill = 290, teach = 16242, source = { "drop" } }, -- Enchant Chest - Major Intellect
    { spell = 20051, skill = 290, creates = 16207, teach = 16243, source = { "vendor" }, vendors = { { npc = 12022, area = 493 } } }, -- Runed Arcanite Rod
    { spell = 23799, skill = 290, teach = 19444, source = { "vendor" }, reputation = { 59, 5, ns.L.FACTION_59 }, vendors = { { npc = 12944, area = 1584 } } }, -- Enchant Weapon - Strength
    { spell = 23800, skill = 290, teach = 19445, source = { "vendor" }, reputation = { 576, 6, ns.L.FACTION_576 }, vendors = { { npc = 11557, area = 361 } } }, -- Enchant Weapon - Agility
    { spell = 23801, skill = 290, teach = 19446, source = { "vendor" }, reputation = { 529, 6, ns.L.FACTION_529 }, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Enchant Bracer - Mana Regeneration
    { spell = 27837, skill = 290, teach = 22392, source = { "vendor" }, reputation = { 576, 5, ns.L.FACTION_576 }, vendors = { { npc = 11557, area = 361 } } }, -- Enchant 2H Weapon - Agility
    { spell = 463866, skill = 290, creates = 228978, teach = 228979, source = { "vendor" }, reputation = { 749, 7, ns.L.FACTION_749 }, vendors = { { npc = 13278, area = 16 } } }, -- Sigil of Flowing Waters
    { spell = 1248668, skill = 290, teach = 249523 }, -- Enchant 2H Weapon - Strength
    { spell = 20010, skill = 295, teach = 16246, source = { "drop" } }, -- Enchant Bracer - Superior Strength
    { spell = 20013, skill = 295, teach = 16244, source = { "drop" } }, -- Enchant Gloves - Greater Strength
    { spell = 20023, skill = 295, teach = 16245, source = { "drop" } }, -- Enchant Boots - Greater Agility
    { spell = 20030, skill = 295, teach = 16247, source = { "drop" } }, -- Enchant 2H Weapon - Superior Impact
    { spell = 20033, skill = 295, teach = 16248, source = { "drop" } }, -- Enchant Weapon - Unholy Weapon
    { spell = 1248599, skill = 295, teach = 249524 }, -- Enchant Bracer - Superior Agility
    { spell = 1294054, skill = 295, teach = 274424, source = { "vendor" }, reputation = { 2747, 6, ns.L.FACTION_2747 }, vendors = { { npc = 256629, area = 616 } } }, -- Enchant Gloves - Lotus Claw
    { spell = 20011, skill = 300, teach = 16251, source = { "drop" } }, -- Enchant Bracer - Superior Stamina
    { spell = 20025, skill = 300, teach = 16253, source = { "drop" } }, -- Enchant Chest - Greater Stats
    { spell = 20031, skill = 300, teach = 16250, source = { "drop" } }, -- Enchant Weapon - Superior Striking
    { spell = 20032, skill = 300, teach = 16254, source = { "drop" } }, -- Enchant Weapon - Lifestealing
    { spell = 20034, skill = 300, teach = 16252, source = { "drop" } }, -- Enchant Weapon - Crusader
    { spell = 20035, skill = 300, teach = 16255, source = { "drop" } }, -- Enchant 2H Weapon - Major Spirit
    { spell = 20036, skill = 300, teach = 16249, source = { "drop" } }, -- Enchant 2H Weapon - Major Intellect
    { spell = 22749, skill = 300, teach = 18259, source = { "drop" } }, -- Enchant Weapon - Spell Power
    { spell = 22750, skill = 300, teach = 18260, source = { "drop" } }, -- Enchant Weapon - Healing Power
    { spell = 23802, skill = 300, teach = 19447, source = { "vendor" }, reputation = { 529, 7, ns.L.FACTION_529 }, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Enchant Bracer - Healing Power
    { spell = 23803, skill = 300, teach = 19448, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, vendors = { { npc = 12944, area = 1584 } } }, -- Enchant Weapon - Mighty Spirit
    { spell = 23804, skill = 300, teach = 19449, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, vendors = { { npc = 12944, area = 1584 } } }, -- Enchant Weapon - Mighty Intellect
    { spell = 25072, skill = 300, teach = 20726, source = { "drop" } }, -- Enchant Gloves - Threat
    { spell = 25073, skill = 300, teach = 20727, source = { "drop" } }, -- Enchant Gloves - Shadow Power
    { spell = 25074, skill = 300, teach = 20728, source = { "drop" } }, -- Enchant Gloves - Frost Power
    { spell = 25078, skill = 300, teach = 20729, source = { "drop" } }, -- Enchant Gloves - Fire Power
    { spell = 25079, skill = 300, teach = 20730, source = { "drop" } }, -- Enchant Gloves - Healing Power
    { spell = 25080, skill = 300, teach = 20731, source = { "drop" } }, -- Enchant Gloves - Superior Agility
    { spell = 25081, skill = 300, teach = 20732, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609, 59, 6, ns.L.FACTION_59 }, vendors = { { npc = 15419, area = 1377 } } }, -- Enchant Cloak - Greater Fire Resistance
    { spell = 25082, skill = 300, teach = 20733, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609, 59, 6, ns.L.FACTION_59 }, vendors = { { npc = 15419, area = 1377 } } }, -- Enchant Cloak - Greater Nature Resistance
    { spell = 25083, skill = 300, teach = 20734, source = { "drop" } }, -- Enchant Cloak - Stealth
    { spell = 25084, skill = 300, teach = 20735, source = { "drop" } }, -- Enchant Cloak - Subtlety
    { spell = 25086, skill = 300, teach = 20736, source = { "drop" } }, -- Enchant Cloak - Dodge
    { spell = 25129, skill = 300, creates = 20749, teach = 20756, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, vendors = { { npc = 14921, area = 33 } } }, -- Brilliant Wizard Oil
    { spell = 25130, skill = 300, creates = 20748, teach = 20757, source = { "vendor" }, reputation = { 270, 5, ns.L.FACTION_270 }, vendors = { { npc = 14921, area = 33 } } }, -- Brilliant Mana Oil
    { spell = 463871, skill = 300, teach = 228982, source = { "vendor" }, reputation = { 576, 7, ns.L.FACTION_576 }, vendors = { { npc = 11557, area = 361 } } }, -- Enchant Shield - Law of Nature
    { spell = 471400, skill = 300, creates = 232611, teach = 232610, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, vendors = { { npc = 14921, area = 33 } } }, -- Magnificent Trollshine
    { spell = 1213607, skill = 300, teach = 234271, source = { "drop", "vendor" }, creates = 233995, reputation = { 609, 5, ns.L.FACTION_609 }, vendors = { { npc = 15419, area = 1377 } } }, -- Scroll: Wrath of the Swarm
    { spell = 1213610, skill = 300, teach = 234272, source = { "vendor" }, creates = 233996, reputation = { 609, 5, ns.L.FACTION_609 }, vendors = { { npc = 15419, area = 1377 } } }, -- Enchanted Repellent
    { spell = 1213622, skill = 300, teach = 249536, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Gloves - Holy Power
    { spell = 1213626, skill = 300, teach = 249534, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Gloves - Arcane Power
    { spell = 1219577, skill = 300, teach = 274391 }, -- Enchant Off-Hand - Superior Intellect
    { spell = 1219578, skill = 300, teach = 274392 }, -- Enchant Off-Hand - Excellent Spirit
    { spell = 1219579, skill = 300, teach = 274393, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Off-Hand - Wisdom
    { spell = 1219580, skill = 300, teach = 274394, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant 2H Weapon - Spellblasting
    { spell = 1219581, skill = 300, teach = 274395 }, -- Enchant Shield - Excellent Stamina
    { spell = 1219587, skill = 300, teach = 274399, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Cloak - Agility
    { spell = 1220623, skill = 300, teach = 274400 }, -- Enchant Shield - Critical Strike
    { spell = 1220624, skill = 300, teach = 274401, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Bracer - Greater Spellpower
    { spell = 1248607, skill = 300, teach = 249525, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant 2H Weapon - Mighty Spell Power
    { spell = 1248636, skill = 300, teach = 249526, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant 2H Weapon - Mighty Healing Power
    { spell = 1248640, skill = 300, teach = 274398, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Gloves - Superior Strength
    { spell = 1248645, skill = 300, teach = 249535, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Gloves - Natural Power
    { spell = 1248661, skill = 300, teach = 249538, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Bracer - Superior Intellect
    { spell = 1248665, skill = 300, teach = 249539, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Enchant Bracer - Superior Deflection
    { spell = 1249128, skill = 300, creates = 220606, teach = 249529, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Idol of the Dream
    { spell = 1249152, skill = 300, creates = 228175, teach = 249530, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Libram of Holy Alacrity
    { spell = 1249154, skill = 300, creates = 228176, teach = 249532, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, vendors = { { npc = 248199, area = 17, faction = "Horde" }, { npc = 256732, area = 44, faction = "Alliance" } } }, -- Totem of Thunder
    { spell = 1263082, skill = 300, creates = 279987, teach = 273116 }, -- Arcane Forge
    { spell = 1306520, skill = 300, creates = 279246, teach = 279295 }, -- Torch of Light
    { spell = 1306521, skill = 300, creates = 279247, teach = 279296 }, -- Steadfast Libram
    { spell = 1306522, skill = 300, creates = 279248, teach = 279297 }, -- Libram of Infusion
    { spell = 1306523, skill = 300, creates = 279249, teach = 279298 }, -- Totem of Urgency
    { spell = 1306524, skill = 300, creates = 279250, teach = 279299 }, -- Idol of Swiftness
    { spell = 1306525, skill = 300, creates = 279251, teach = 279300 }, -- Idol of the Ursine Twins
    { spell = 1213616, skill = 320 }, -- Enchant Chest - Living Stats
    { spell = 1217189, skill = 320 }, -- Enchant Bracer - Spell Power
    { spell = 1217203, skill = 320 }, -- Enchant Bracer - Agility
}
