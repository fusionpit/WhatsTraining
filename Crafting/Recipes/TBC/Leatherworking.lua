local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[165] = {
    { spell = 2149, skill = 1, autoLearned = true, creates = 2302 }, -- Handstitched Leather Boots
    { spell = 2152, skill = 1, autoLearned = true, creates = 2304 }, -- Light Armor Kit
    { spell = 2881, skill = 1, autoLearned = true, creates = 2318 }, -- Light Leather
    { spell = 7126, skill = 1, autoLearned = true, creates = 5957 }, -- Handstitched Leather Vest
    { spell = 9058, skill = 1, autoLearned = true, creates = 7276 }, -- Handstitched Leather Cloak
    { spell = 9059, skill = 1, autoLearned = true, creates = 7277 }, -- Handstitched Leather Bracers
    { spell = 2153, skill = 15, creates = 2303, source = { "trainer" }, cost = 50 }, -- Handstitched Leather Pants
    { spell = 3753, skill = 25, creates = 4237, source = { "trainer" }, cost = 75 }, -- Handstitched Leather Belt
    { spell = 9060, skill = 30, creates = 7278, source = { "trainer" }, cost = 100 }, -- Light Leather Quiver
    { spell = 9062, skill = 30, creates = 7279, source = { "trainer" }, cost = 100 }, -- Small Leather Ammo Pouch
    { spell = 3816, skill = 35, creates = 4231, source = { "trainer" }, cost = 50 }, -- Cured Light Hide
    { spell = 9064, skill = 35, creates = 7280, teach = 7288, source = { "drop" }, bound = false }, -- Rugged Leather Pants
    { spell = 2160, skill = 40, creates = 2300, source = { "trainer" }, cost = 100 }, -- Embossed Leather Vest
    { spell = 5244, skill = 40, creates = 5081, teach = 5083, source = { "quest" }, bound = false, quests = { { id = 769, area = 1638, faction = "Horde", level = 4 } } }, -- Kodo Hide Bag
    { spell = 3104, skill = 50, rank = "Journeyman", level = 10, source = { "trainer" }, cost = 500 }, -- Leatherworking (Journeyman)
    { spell = 2161, skill = 55, creates = 2309, source = { "trainer" }, cost = 100 }, -- Embossed Leather Boots
    { spell = 3756, skill = 55, creates = 4239, source = { "trainer" }, cost = 150 }, -- Embossed Leather Gloves
    { spell = 2162, skill = 60, creates = 2310, source = { "trainer" }, cost = 100 }, -- Embossed Leather Cloak
    { spell = 2163, skill = 60, creates = 2311, teach = 2407, source = { "drop" }, bound = false }, -- White Leather Jerkin
    { spell = 9065, skill = 70, creates = 7281, source = { "trainer" }, cost = 150 }, -- Light Leather Bracers
    { spell = 2164, skill = 75, creates = 2312, teach = 2408, source = { "drop" }, bound = false }, -- Fine Leather Gloves
    { spell = 3759, skill = 75, creates = 4242, source = { "trainer" }, cost = 200 }, -- Embossed Leather Pants
    { spell = 3763, skill = 80, creates = 4246, source = { "trainer" }, cost = 300 }, -- Fine Leather Belt
    { spell = 2159, skill = 85, creates = 2308, source = { "trainer" }, cost = 250 }, -- Fine Leather Cloak
    { spell = 3761, skill = 85, creates = 4243, source = { "trainer" }, cost = 350 }, -- Fine Leather Tunic
    { spell = 2158, skill = 90, creates = 2307, teach = 2406, source = { "drop" }, bound = false }, -- Fine Leather Boots
    { spell = 6702, skill = 90, creates = 5780, teach = 5786, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4186, area = 148, faction = "Alliance" } } }, -- Murloc Scale Belt
    { spell = 7953, skill = 90, creates = 6466, teach = 6474, source = { "vendor" }, bound = false, vendors = { { npc = 5783, area = -6 } } }, -- Deviate Scale Cloak
    { spell = 8322, skill = 90, creates = 6709, teach = 6710, source = { "quest" }, bound = false, quests = { { id = 1582, area = 1657, faction = "Alliance", level = 8 } } }, -- Moonglow Vest
    { spell = 6703, skill = 95, creates = 5781, teach = 5787, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4186, area = 148, faction = "Alliance" } } }, -- Murloc Scale Breastplate
    { spell = 9068, skill = 95, creates = 7282, source = { "trainer" }, cost = 400 }, -- Light Leather Pants
    { spell = 2165, skill = 100, creates = 2313, source = { "trainer" }, cost = 250 }, -- Medium Armor Kit
    { spell = 2167, skill = 100, creates = 2315, source = { "trainer" }, cost = 350 }, -- Dark Leather Boots
    { spell = 2169, skill = 100, creates = 2317, teach = 2409, source = { "drop" }, bound = false }, -- Dark Leather Tunic
    { spell = 3762, skill = 100, creates = 4244, teach = 4293, source = { "drop" }, bound = false }, -- Hillman's Leather Vest
    { spell = 3817, skill = 100, creates = 4233, source = { "trainer" }, cost = 200 }, -- Cured Medium Hide
    { spell = 9070, skill = 100, creates = 7283, teach = 7289, source = { "vendor" }, bound = false, vendors = { { npc = 2697, area = 44, faction = "Alliance" } } }, -- Black Whelp Cloak
    { spell = 20648, skill = 100, creates = 2319, source = { "trainer" }, cost = 500 }, -- Medium Leather
    { spell = 24940, skill = 100, creates = 20575, teach = 20576, source = { "vendor" }, bound = false, vendors = { { npc = 777, area = 44, faction = "Alliance" } } }, -- Black Whelp Tunic
    { spell = 7133, skill = 105, creates = 5958, teach = 5972, source = { "drop" }, bound = false }, -- Fine Leather Pants
    { spell = 7954, skill = 105, creates = 6467, teach = 6475, source = { "vendor" }, bound = false, vendors = { { npc = 5783, area = -6 } } }, -- Deviate Scale Gloves
    { spell = 2168, skill = 110, creates = 2316, source = { "trainer" }, cost = 350 }, -- Dark Leather Cloak
    { spell = 7135, skill = 115, creates = 5961, source = { "trainer" }, cost = 400 }, -- Dark Leather Pants
    { spell = 7955, skill = 115, creates = 6468, teach = 6476, source = { "quest" }, bound = false, quests = { { id = 1487, level = 15 } } }, -- Deviate Scale Belt
    { spell = 2166, skill = 120, creates = 2314, source = { "trainer" }, cost = 450 }, -- Toughened Leather Armor
    { spell = 3765, skill = 120, creates = 4248, teach = 7360, source = { "drop" }, bound = false }, -- Dark Leather Gloves
    { spell = 3767, skill = 120, creates = 4250, teach = 4294, source = { "drop" }, bound = false }, -- Hillman's Belt
    { spell = 9072, skill = 120, creates = 7284, teach = 7290, source = { "vendor" }, bound = false, vendors = { { npc = 2679, area = 11, faction = "Alliance" } } }, -- Red Whelp Gloves
    { spell = 9074, skill = 120, creates = 7285, source = { "trainer" }, cost = 500 }, -- Nimble Leather Gloves
    { spell = 3766, skill = 125, creates = 4249, source = { "trainer" }, cost = 400 }, -- Dark Leather Belt
    { spell = 3811, skill = 125, rank = "Expert", level = 20, source = { "trainer" }, cost = 5000 }, -- Leatherworking (Expert)
    { spell = 9145, skill = 125, creates = 7348, source = { "trainer" }, cost = 500 }, -- Fletcher's Gloves
    { spell = 3768, skill = 130, creates = 4251, source = { "trainer" }, cost = 500 }, -- Hillman's Shoulders
    { spell = 3770, skill = 135, creates = 4253, source = { "trainer" }, cost = 500 }, -- Toughened Leather Gloves
    { spell = 9146, skill = 135, creates = 7349, teach = 7361, source = { "vendor" }, bound = false, vendors = { { npc = 6731, area = 331, faction = "Alliance" } } }, -- Herbalist's Gloves
    { spell = 9147, skill = 135, creates = 7352, teach = 7362, source = { "vendor" }, bound = false, vendors = { { npc = 3537, area = 267 } } }, -- Earthen Leather Shoulders
    { spell = 3769, skill = 140, creates = 4252, teach = 4296, source = { "drop" }, bound = false }, -- Dark Leather Shoulders
    { spell = 9148, skill = 140, creates = 7358, teach = 7363, source = { "drop" }, bound = false }, -- Pilferer's Gloves
    { spell = 3764, skill = 145, creates = 4247, source = { "trainer" }, cost = 500 }, -- Hillman's Leather Gloves
    { spell = 9149, skill = 145, creates = 7359, teach = 7364, source = { "drop" }, bound = false }, -- Heavy Earthen Gloves
    { spell = 3760, skill = 150, creates = 3719, source = { "trainer" }, cost = 600 }, -- Hillman's Cloak
    { spell = 3771, skill = 150, creates = 4254, teach = 4297, source = { "drop" }, bound = false }, -- Barbaric Gloves
    { spell = 3780, skill = 150, creates = 4265, source = { "trainer" }, cost = 750 }, -- Heavy Armor Kit
    { spell = 3818, skill = 150, creates = 4236, source = { "trainer" }, cost = 500 }, -- Cured Heavy Hide
    { spell = 9193, skill = 150, creates = 7371, source = { "trainer" }, cost = 500 }, -- Heavy Quiver
    { spell = 9194, skill = 150, creates = 7372, source = { "trainer" }, cost = 500 }, -- Heavy Leather Ammo Pouch
    { spell = 20649, skill = 150, creates = 4234, source = { "trainer" }, cost = 1000 }, -- Heavy Leather
    { spell = 23190, skill = 150, creates = 18662, teach = 18731, source = { "vendor" }, bound = false, vendors = { { npc = 3366, area = 1637, faction = "Horde" }, { npc = 5128, area = 1537, faction = "Alliance" } } }, -- Heavy Leather Ball
    { spell = 3772, skill = 155, creates = 4255, teach = 7613, source = { "vendor" }, bound = false, vendors = { { npc = 2679, area = 11, faction = "Alliance" }, { npc = 2698, area = 267, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Green Leather Armor
    { spell = 23399, skill = 155, creates = 18948, teach = 18949, source = { "vendor" }, bound = false, vendors = { { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 4589, area = 1497, faction = "Horde" } } }, -- Barbaric Bracers
    { spell = 3774, skill = 160, creates = 4257, source = { "trainer" }, cost = 1000 }, -- Green Leather Belt
    { spell = 7147, skill = 160, creates = 5962, source = { "trainer" }, cost = 1000 }, -- Guardian Pants
    { spell = 4096, skill = 165, creates = 4455, teach = 13287, source = { "vendor" }, bound = false, vendors = { { npc = 2819, area = 45, faction = "Horde" } } }, -- Raptor Hide Harness
    { spell = 4097, skill = 165, creates = 4456, teach = 13288, source = { "vendor" }, bound = false, vendors = { { npc = 2816, area = 45, faction = "Alliance" } } }, -- Raptor Hide Belt
    { spell = 9195, skill = 165, creates = 7373, teach = 7449, source = { "drop" }, bound = false }, -- Dusky Leather Leggings
    { spell = 3775, skill = 170, creates = 4258, teach = 4298, source = { "drop" }, bound = false }, -- Guardian Belt
    { spell = 6704, skill = 170, creates = 5782, teach = 5788, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2381, area = 267, faction = "Alliance" }, { npc = 2393, area = 267, faction = "Horde" }, { npc = 2846, area = 33 } } }, -- Thick Murloc Armor
    { spell = 7149, skill = 170, creates = 5963, teach = 5973, source = { "vendor" }, bound = false, vendors = { { npc = 2810, area = 45, faction = "Alliance" }, { npc = 2821, area = 45, faction = "Horde" }, { npc = 3958, area = 331, faction = "Alliance" }, { npc = 4877, area = 400, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Barbaric Leggings
    { spell = 3773, skill = 175, creates = 4256, teach = 4299, source = { "drop" }, bound = false }, -- Guardian Armor
    { spell = 7151, skill = 175, creates = 5964, source = { "trainer" }, cost = 1200 }, -- Barbaric Shoulders
    { spell = 9196, skill = 175, creates = 7374, source = { "trainer" }, cost = 1500 }, -- Dusky Leather Armor
    { spell = 9197, skill = 175, creates = 7375, teach = 7450, source = { "drop" }, bound = false }, -- Green Whelp Armor
    { spell = 3776, skill = 180, creates = 4259, source = { "trainer" }, cost = 1200 }, -- Green Leather Bracers
    { spell = 9198, skill = 180, creates = 7377, source = { "trainer" }, cost = 2000 }, -- Frost Leather Cloak
    { spell = 3778, skill = 185, creates = 4262, teach = 14635, source = { "vendor" }, bound = false, vendors = { { npc = 2699, area = 33 }, { npc = 12245, area = 405 } } }, -- Gem-studded Leather Belt
    { spell = 7153, skill = 185, creates = 5965, teach = 4295, source = { "drop" }, bound = false }, -- Guardian Cloak
    { spell = 9201, skill = 185, creates = 7378, source = { "trainer" }, cost = 2000 }, -- Dusky Bracers
    { spell = 6661, skill = 190, creates = 5739, source = { "trainer" }, cost = 2000 }, -- Barbaric Harness
    { spell = 6705, skill = 190, creates = 5783, teach = 5789, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2846, area = 33 }, { npc = 4897, area = 15, faction = "Alliance" } } }, -- Murloc Scale Bracers
    { spell = 7156, skill = 190, creates = 5966, source = { "trainer" }, cost = 2400 }, -- Guardian Gloves
    { spell = 9202, skill = 190, creates = 7386, teach = 7451, source = { "vendor" }, bound = false, vendors = { { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 4589, area = 1497, faction = "Horde" }, { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Green Whelp Bracers
    { spell = 21943, skill = 190, creates = 17721, teach = 17722, source = { "drop" }, bound = false }, -- Gloves of the Greatfather
    { spell = 3777, skill = 195, creates = 4260, teach = 4300, source = { "drop" }, bound = false }, -- Guardian Leather Bracers
    { spell = 9206, skill = 195, creates = 7387, source = { "trainer" }, cost = 2500 }, -- Dusky Belt
    { spell = 3779, skill = 200, creates = 4264, teach = 4301, source = { "drop" }, bound = false }, -- Barbaric Belt
    { spell = 9207, skill = 200, creates = 7390, teach = 7452, source = { "drop" }, bound = false }, -- Dusky Boots
    { spell = 9208, skill = 200, creates = 7391, teach = 7453, source = { "drop" }, bound = false }, -- Swift Boots
    { spell = 10482, skill = 200, creates = 8172, source = { "trainer" }, cost = 2000 }, -- Cured Thick Hide
    { spell = 10487, skill = 200, creates = 8173, source = { "trainer" }, cost = 2000 }, -- Thick Armor Kit
    { spell = 10490, skill = 200, creates = 8174, teach = 8384, source = { "drop" }, bound = false }, -- Comfortable Leather Hat
    { spell = 10662, skill = 200, rank = "Artisan", level = 35, source = { "trainer" }, cost = 50000 }, -- Leatherworking (Artisan)
    { spell = 20650, skill = 200, creates = 4304, source = { "trainer" }, cost = 4000 }, -- Thick Leather
    { spell = 22711, skill = 200, creates = 18238, teach = 18239, source = { "vendor" }, bound = false, vendors = { { npc = 2699, area = 33 } } }, -- Shadowskin Gloves
    { spell = 10499, skill = 205, creates = 8175, source = { "trainer" }, cost = 3000 }, -- Nightscape Tunic
    { spell = 10507, skill = 205, creates = 8176, source = { "trainer" }, cost = 3000 }, -- Nightscape Headband
    { spell = 10509, skill = 205, creates = 8187, teach = 8385, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Turtle Scale Gloves
    { spell = 10511, skill = 210, creates = 8189, source = { "trainer" }, cost = 3000 }, -- Turtle Scale Breastplate
    { spell = 10516, skill = 210, creates = 8192, teach = 8409, source = { "vendor" }, bound = false, vendors = { { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Nightscape Shoulders
    { spell = 10518, skill = 210, creates = 8198, source = { "trainer" }, cost = 3500 }, -- Turtle Scale Bracers
    { spell = 10520, skill = 215, creates = 8200, teach = 8386, source = { "drop" }, bound = false }, -- Big Voodoo Robe
    { spell = 10525, skill = 220, creates = 8203, teach = 8395, source = { "drop" }, bound = false }, -- Tough Scorpid Breastplate
    { spell = 10529, skill = 220, creates = 8210, teach = 8403, source = { "quest" }, bound = true, quests = { { id = 2848, area = 357, faction = "Alliance", level = 30 }, { id = 2855, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Shoulders
    { spell = 10531, skill = 220, creates = 8201, teach = 8387, source = { "drop" }, bound = false }, -- Big Voodoo Mask
    { spell = 10533, skill = 220, creates = 8205, teach = 8397, source = { "drop" }, bound = false }, -- Tough Scorpid Bracers
    { spell = 10542, skill = 225, creates = 8204, teach = 8398, source = { "drop" }, bound = false }, -- Tough Scorpid Gloves
    { spell = 10544, skill = 225, creates = 8211, teach = 8404, source = { "quest" }, bound = true, quests = { { id = 2849, area = 357, faction = "Alliance", level = 30 }, { id = 2856, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Vest
    { spell = 10546, skill = 225, creates = 8214, teach = 8405, source = { "quest" }, bound = true, quests = { { id = 2850, area = 357, faction = "Alliance", level = 30 }, { id = 2857, area = 357, level = 30 } } }, -- Wild Leather Helmet
    { spell = 10619, skill = 225, creates = 8347, source = { "trainer" }, cost = 10000 }, -- Dragonscale Gauntlets
    { spell = 10621, skill = 225, creates = 8345, source = { "trainer" }, cost = 10000 }, -- Wolfshead Helm
    { spell = 14930, skill = 225, creates = 8217, source = { "trainer" }, cost = 3600 }, -- Quickdraw Quiver
    { spell = 14932, skill = 225, creates = 8218, source = { "trainer" }, cost = 3600 }, -- Thick Leather Ammo Pouch
    { spell = 10548, skill = 230, creates = 8193, source = { "trainer" }, cost = 4000 }, -- Nightscape Pants
    { spell = 10552, skill = 230, creates = 8191, source = { "trainer" }, cost = 4000 }, -- Turtle Scale Helm
    { spell = 10630, skill = 230, creates = 8346, source = { "trainer" }, cost = 10000 }, -- Gauntlets of the Sea
    { spell = 10554, skill = 235, creates = 8209, teach = 8399, source = { "drop" }, bound = false }, -- Tough Scorpid Boots
    { spell = 10556, skill = 235, creates = 8185, source = { "trainer" }, cost = 4500 }, -- Turtle Scale Leggings
    { spell = 10558, skill = 235, creates = 8197, source = { "trainer" }, cost = 4500 }, -- Nightscape Boots
    { spell = 10560, skill = 240, creates = 8202, teach = 8389, source = { "drop" }, bound = false }, -- Big Voodoo Pants
    { spell = 10562, skill = 240, creates = 8216, teach = 8390, source = { "drop" }, bound = false }, -- Big Voodoo Cloak
    { spell = 10564, skill = 240, creates = 8207, teach = 8400, source = { "drop" }, bound = false }, -- Tough Scorpid Shoulders
    { spell = 10566, skill = 245, creates = 8213, teach = 8406, source = { "quest" }, bound = true, quests = { { id = 2851, area = 357, faction = "Alliance", level = 30 }, { id = 2858, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Boots
    { spell = 10568, skill = 245, creates = 8206, teach = 8401, source = { "drop" }, bound = false }, -- Tough Scorpid Leggings
    { spell = 10570, skill = 250, creates = 8208, teach = 8402, source = { "drop" }, bound = false }, -- Tough Scorpid Helm
    { spell = 10572, skill = 250, creates = 8212, teach = 8407, source = { "quest" }, bound = true, quests = { { id = 2852, area = 357, faction = "Alliance", level = 30 }, { id = 2859, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Leggings
    { spell = 10574, skill = 250, creates = 8215, teach = 8408, source = { "quest" }, bound = true, quests = { { id = 2853, area = 357, level = 30 }, { id = 2860, area = 357, level = 30 } } }, -- Wild Leather Cloak
    { spell = 10632, skill = 250, creates = 8348, source = { "trainer" }, cost = 10000 }, -- Helm of Fire
    { spell = 10647, skill = 250, creates = 8349, source = { "trainer" }, cost = 10000 }, -- Feathered Breastplate
    { spell = 19047, skill = 250, creates = 15407, source = { "trainer" }, cost = 5000 }, -- Cured Rugged Hide
    { spell = 19058, skill = 250, creates = 15564, source = { "trainer" }, cost = 5000 }, -- Rugged Armor Kit
    { spell = 22331, skill = 250, creates = 8170, source = { "trainer" }, cost = 5000 }, -- Rugged Leather
    { spell = 10650, skill = 255, creates = 8367, source = { "trainer" }, cost = 10000 }, -- Dragonscale Breastplate
    { spell = 19048, skill = 255, creates = 15077, teach = 15724, source = { "vendor" }, bound = false, vendors = { { npc = 12956, area = 1377 } } }, -- Heavy Scorpid Bracers
    { spell = 19049, skill = 260, creates = 15083, teach = 15725, source = { "vendor" }, bound = false, vendors = { { npc = 12942, area = 28, faction = "Alliance" }, { npc = 12943, area = 85, faction = "Horde" } } }, -- Wicked Leather Gauntlets
    { spell = 19050, skill = 260, creates = 15045, teach = 15726, source = { "vendor" }, bound = false, vendors = { { npc = 11874, area = 8 } } }, -- Green Dragonscale Breastplate
    { spell = 36074, skill = 260, creates = 29964, source = { "trainer" }, cost = 10000 }, -- Blackstorm Leggings
    { spell = 36075, skill = 260, creates = 29970, source = { "trainer" }, cost = 10000 }, -- Wildfeather Leggings
    { spell = 36076, skill = 260, creates = 29971, source = { "trainer" }, cost = 10000 }, -- Dragonstrike Leggings
    { spell = 19051, skill = 265, creates = 15076, teach = 15727, source = { "drop" }, bound = false }, -- Heavy Scorpid Vest
    { spell = 19052, skill = 265, creates = 15084, teach = 15728, source = { "drop" }, cost = 10000, bound = false }, -- Wicked Leather Bracers
    { spell = 19053, skill = 265, creates = 15074, teach = 15729, source = { "vendor" }, bound = false, vendors = { { npc = 12957, area = 16 } } }, -- Chimeric Gloves
    { spell = 22815, skill = 265, creates = 18258, source = { "trainer" } }, -- Gordok Ogre Suit
    { spell = 19055, skill = 270, creates = 15091, teach = 15731, source = { "drop" }, cost = 10000, bound = false }, -- Runic Leather Gauntlets
    { spell = 19059, skill = 270, creates = 15054, teach = 15732, source = { "drop" }, bound = false }, -- Volcanic Leggings
    { spell = 19060, skill = 270, creates = 15046, teach = 15733, source = { "drop" }, bound = false }, -- Green Dragonscale Leggings
    { spell = 19061, skill = 270, creates = 15061, teach = 15734, source = { "vendor" }, bound = false, vendors = { { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Living Shoulders
    { spell = 19062, skill = 270, creates = 15067, teach = 15735, source = { "vendor" }, bound = false, vendors = { { npc = 12958, area = 47 } } }, -- Ironfeather Shoulders
    { spell = 19063, skill = 275, creates = 15073, teach = 15737, source = { "drop" }, bound = false }, -- Chimeric Boots
    { spell = 19064, skill = 275, creates = 15078, teach = 15738, source = { "drop" }, bound = false }, -- Heavy Scorpid Gauntlets
    { spell = 19065, skill = 275, creates = 15092, teach = 15739, source = { "drop" }, cost = 10000, bound = false }, -- Runic Leather Bracers
    { spell = 19066, skill = 275, creates = 15071, teach = 15740, source = { "vendor" }, bound = false, vendors = { { npc = 11189, area = 618 } } }, -- Frostsaber Boots
    { spell = 19067, skill = 275, creates = 15057, teach = 15741, source = { "vendor" }, bound = false, vendors = { { npc = 12942, area = 28, faction = "Alliance" }, { npc = 12943, area = 85, faction = "Horde" } } }, -- Stormshroud Pants
    { spell = 19068, skill = 275, creates = 15064, teach = 15742, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 11557, area = 361 } } }, -- Warbear Harness
    { spell = 32549, skill = 275, rank = "Master", level = 50, source = { "trainer" }, cost = 100000 }, -- Leatherworking (Master)
    { spell = 19070, skill = 280, creates = 15082, teach = 15743, source = { "drop" }, bound = false }, -- Heavy Scorpid Belt
    { spell = 19071, skill = 280, creates = 15086, teach = 15744, source = { "drop" }, cost = 10000, bound = false }, -- Wicked Leather Headband
    { spell = 19072, skill = 280, creates = 15093, teach = 15745, source = { "drop" }, cost = 10000, bound = false }, -- Runic Leather Belt
    { spell = 19073, skill = 280, creates = 15072, teach = 15746, source = { "drop" }, bound = false }, -- Chimeric Leggings
    { spell = 24655, skill = 280, creates = 20296, source = { "trainer" }, cost = 30000 }, -- Green Dragonscale Gauntlets
    { spell = 19074, skill = 285, creates = 15069, teach = 15747, source = { "drop" }, bound = false }, -- Frostsaber Leggings
    { spell = 19075, skill = 285, creates = 15079, teach = 15748, source = { "drop" }, bound = false }, -- Heavy Scorpid Leggings
    { spell = 19076, skill = 285, creates = 15053, teach = 15749, source = { "drop" }, bound = false }, -- Volcanic Breastplate
    { spell = 19077, skill = 285, creates = 15048, teach = 15751, source = { "vendor" }, bound = false, vendors = { { npc = 12957, area = 16 } } }, -- Blue Dragonscale Breastplate
    { spell = 19078, skill = 285, creates = 15060, teach = 15752, source = { "drop" }, bound = false }, -- Living Leggings
    { spell = 19079, skill = 285, creates = 15056, teach = 15753, source = { "drop" }, bound = false }, -- Stormshroud Armor
    { spell = 19080, skill = 285, creates = 15065, teach = 15754, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Warbear Woolies
    { spell = 44953, skill = 285, creates = 34086, teach = 34262, source = { "vendor" }, bound = true, vendors = { { npc = 13420, area = 1637, faction = "Horde" }, { npc = 13433, area = 1537, faction = "Alliance" } } }, -- Winter Boots
    { spell = 19081, skill = 290, creates = 15075, teach = 15755, source = { "drop" }, bound = false }, -- Chimeric Vest
    { spell = 19082, skill = 290, creates = 15094, teach = 15756, source = { "vendor" }, cost = 15000, bound = false, vendors = { { npc = 12941, area = 139 } } }, -- Runic Leather Headband
    { spell = 19083, skill = 290, creates = 15087, teach = 15757, source = { "drop" }, cost = 15000, bound = false }, -- Wicked Leather Pants
    { spell = 19084, skill = 290, creates = 15063, teach = 15758, source = { "vendor" }, bound = false, vendors = { { npc = 12959, area = 490 } } }, -- Devilsaur Gauntlets
    { spell = 19085, skill = 290, creates = 15050, teach = 15759, source = { "vendor" }, bound = false, vendors = { { npc = 9499, area = 1584 } } }, -- Black Dragonscale Breastplate
    { spell = 19086, skill = 290, creates = 15066, teach = 15760, source = { "drop" }, bound = false }, -- Ironfeather Breastplate
    { spell = 23703, skill = 290, creates = 19044, teach = 19326, reputation = { 576, 6, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Might of the Timbermaw
    { spell = 23705, skill = 290, creates = 19052, teach = 19328, reputation = { 529, 6, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Dawn Treaders
    { spell = 19087, skill = 295, creates = 15070, teach = 15761, source = { "drop" }, bound = false }, -- Frostsaber Gloves
    { spell = 19088, skill = 295, creates = 15080, teach = 15762, source = { "vendor" }, bound = false, vendors = { { npc = 12956, area = 1377 } } }, -- Heavy Scorpid Helm
    { spell = 19089, skill = 295, creates = 15049, teach = 15763, source = { "drop" }, bound = false }, -- Blue Dragonscale Shoulders
    { spell = 19090, skill = 295, creates = 15058, teach = 15764, source = { "drop" }, bound = false }, -- Stormshroud Shoulders
    { spell = 20853, skill = 295, creates = 16982, teach = 17022, reputation = { 59, 5, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Corehound Boots
    { spell = 19054, skill = 300, creates = 15047, teach = 15730, source = { "drop" }, bound = true }, -- Red Dragonscale Breastplate
    { spell = 19091, skill = 300, creates = 15095, teach = 15765, source = { "drop" }, cost = 15000, bound = false }, -- Runic Leather Pants
    { spell = 19092, skill = 300, creates = 15088, teach = 15768, source = { "drop" }, cost = 15000, bound = false }, -- Wicked Leather Belt
    { spell = 19093, skill = 300, creates = 15138, teach = 15769, source = { "quest" }, bound = false, quests = { { id = 7493, area = 1637, faction = "Horde", level = 60 }, { id = 7497, area = 1519, faction = "Alliance", level = 60 } } }, -- Onyxia Scale Cloak
    { spell = 19094, skill = 300, creates = 15051, teach = 15770, source = { "drop" }, bound = false }, -- Black Dragonscale Shoulders
    { spell = 19095, skill = 300, creates = 15059, teach = 15771, source = { "drop" }, bound = false }, -- Living Breastplate
    { spell = 19097, skill = 300, creates = 15062, teach = 15772, source = { "drop" }, bound = false }, -- Devilsaur Leggings
    { spell = 19098, skill = 300, creates = 15085, teach = 15773, source = { "drop" }, cost = 15000, bound = false }, -- Wicked Leather Armor
    { spell = 19100, skill = 300, creates = 15081, teach = 15774, source = { "drop" }, bound = false }, -- Heavy Scorpid Shoulders
    { spell = 19101, skill = 300, creates = 15055, teach = 15775, source = { "drop" }, bound = false }, -- Volcanic Shoulders
    { spell = 19102, skill = 300, creates = 15090, teach = 15776, source = { "drop" }, cost = 15000, bound = false }, -- Runic Leather Armor
    { spell = 19103, skill = 300, creates = 15096, teach = 15777, source = { "drop" }, cost = 15000, bound = false }, -- Runic Leather Shoulders
    { spell = 19104, skill = 300, creates = 15068, teach = 15779, source = { "drop" }, bound = false }, -- Frostsaber Tunic
    { spell = 19107, skill = 300, creates = 15052, teach = 15781, source = { "drop" }, bound = false }, -- Black Dragonscale Leggings
    { spell = 20854, skill = 300, creates = 16983, teach = 17023, reputation = { 59, 5, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Molten Helm
    { spell = 20855, skill = 300, creates = 16984, teach = 17025, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Black Dragonscale Boots
    { spell = 22727, skill = 300, creates = 18251, teach = 18252, source = { "drop" }, bound = true }, -- Core Armor Kit
    { spell = 22921, skill = 300, creates = 18504, teach = 18514, source = { "drop" }, bound = true }, -- Girdle of Insight
    { spell = 22922, skill = 300, creates = 18506, teach = 18515, source = { "drop" }, bound = true }, -- Mongoose Boots
    { spell = 22923, skill = 300, creates = 18508, teach = 18516, source = { "drop" }, bound = true }, -- Swift Flight Bracers
    { spell = 22926, skill = 300, creates = 18509, teach = 18517, source = { "drop" }, bound = false }, -- Chromatic Cloak
    { spell = 22927, skill = 300, creates = 18510, teach = 18518, source = { "drop" }, bound = false }, -- Hide of the Wild
    { spell = 22928, skill = 300, creates = 18511, teach = 18519, source = { "drop" }, bound = false }, -- Shifting Cloak
    { spell = 23704, skill = 300, creates = 19049, teach = 19327, reputation = { 576, 7, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Timbermaw Brawlers
    { spell = 23706, skill = 300, creates = 19058, teach = 19329, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Golden Mantle of the Dawn
    { spell = 23707, skill = 300, creates = 19149, teach = 19330, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Lava Belt
    { spell = 23708, skill = 300, creates = 19157, teach = 19331, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Chromatic Gauntlets
    { spell = 23709, skill = 300, creates = 19162, teach = 19332, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Corehound Belt
    { spell = 23710, skill = 300, creates = 19163, teach = 19333, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Molten Belt
    { spell = 24121, skill = 300, creates = 19685, teach = 19769, reputation = { 270, 7, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Primal Batskin Jerkin
    { spell = 24122, skill = 300, creates = 19686, teach = 19770, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Primal Batskin Gloves
    { spell = 24123, skill = 300, creates = 19687, teach = 19771, reputation = { 270, 5, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Primal Batskin Bracers
    { spell = 24124, skill = 300, creates = 19688, teach = 19772, reputation = { 270, 7, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Blood Tiger Breastplate
    { spell = 24125, skill = 300, creates = 19689, teach = 19773, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Blood Tiger Shoulders
    { spell = 24654, skill = 300, creates = 20295, source = { "trainer" }, cost = 50000 }, -- Blue Dragonscale Leggings
    { spell = 24703, skill = 300, creates = 20380, teach = 20382, reputation = { 609, 8, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Dreamscale Breastplate
    { spell = 24846, skill = 300, creates = 20481, teach = 20506, reputation = { 609, 5, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Spitfire Bracers
    { spell = 24847, skill = 300, creates = 20480, teach = 20507, reputation = { 609, 6, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Spitfire Gauntlets
    { spell = 24848, skill = 300, creates = 20479, teach = 20508, reputation = { 609, 7, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Spitfire Breastplate
    { spell = 24849, skill = 300, creates = 20476, teach = 20509, reputation = { 609, 5, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Sandstalker Bracers
    { spell = 24850, skill = 300, creates = 20477, teach = 20510, reputation = { 609, 6, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Sandstalker Gauntlets
    { spell = 24851, skill = 300, creates = 20478, teach = 20511, reputation = { 609, 7, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Sandstalker Breastplate
    { spell = 26279, skill = 300, creates = 21278, teach = 21548, source = { "drop" }, bound = false }, -- Stormshroud Gloves
    { spell = 28219, skill = 300, creates = 22661, teach = 22692, reputation = { 529, 8, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Polar Tunic
    { spell = 28220, skill = 300, creates = 22662, teach = 22694, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Polar Gloves
    { spell = 28221, skill = 300, creates = 22663, teach = 22695, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Polar Bracers
    { spell = 28222, skill = 300, creates = 22664, teach = 22696, reputation = { 529, 8, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Icy Scale Breastplate
    { spell = 28223, skill = 300, creates = 22666, teach = 22697, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Icy Scale Gauntlets
    { spell = 28224, skill = 300, creates = 22665, teach = 22698, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Icy Scale Bracers
    { spell = 28472, skill = 300, creates = 22759, teach = 22771, reputation = { 609, 7, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Bramblewood Helm
    { spell = 28473, skill = 300, creates = 22760, teach = 22770, reputation = { 609, 6, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Bramblewood Boots
    { spell = 28474, skill = 300, creates = 22761, teach = 22769, reputation = { 609, 5, ns.L.FACTION_609 }, source = { "vendor" }, bound = true, vendors = { { npc = 15293, area = 1377 } } }, -- Bramblewood Belt
    { spell = 32454, skill = 300, creates = 21887, source = { "trainer" }, cost = 10000 }, -- Knothide Leather
    { spell = 32456, skill = 300, creates = 25650, source = { "trainer" }, cost = 15000 }, -- Knothide Armor Kit
    { spell = 32462, skill = 300, creates = 25654, source = { "trainer" }, cost = 15000 }, -- Felscale Gloves
    { spell = 32466, skill = 300, creates = 25662, source = { "trainer" }, cost = 15000 }, -- Scaled Draenic Pants
    { spell = 32470, skill = 300, creates = 25669, source = { "trainer" }, cost = 15000 }, -- Thick Draenic Gloves
    { spell = 32478, skill = 300, creates = 25673, source = { "trainer" }, cost = 15000 }, -- Wild Draenish Boots
    { spell = 32482, skill = 300, creates = 25679, teach = 25726, source = { "vendor" }, bound = false, vendors = { { npc = 16689, area = 3487, faction = "Horde" }, { npc = 16748, area = 3557, faction = "Alliance" } } }, -- Comfortable Insoles
    { spell = 45100, skill = 300, creates = 34482, source = { "trainer" }, cost = 15000 }, -- Leatherworker's Satchel
    { spell = 32463, skill = 310, creates = 25655, source = { "trainer" }, cost = 18000 }, -- Felscale Boots
    { spell = 32467, skill = 310, creates = 25661, source = { "trainer" }, cost = 18000 }, -- Scaled Draenic Gloves
    { spell = 32479, skill = 310, creates = 25674, source = { "trainer" }, cost = 18000 }, -- Wild Draenish Gloves
    { spell = 32471, skill = 315, creates = 25670, source = { "trainer" }, cost = 18000 }, -- Thick Draenic Pants
    { spell = 44343, skill = 315, creates = 34099, source = { "trainer" }, cost = 18000 }, -- Knothide Ammo Pouch
    { spell = 44344, skill = 315, creates = 34100, source = { "trainer" }, cost = 18000 }, -- Knothide Quiver
    { spell = 32464, skill = 320, creates = 25656, source = { "trainer" }, cost = 20000 }, -- Felscale Pants
    { spell = 32472, skill = 320, creates = 25668, source = { "trainer" }, cost = 20000 }, -- Thick Draenic Boots
    { spell = 32480, skill = 320, creates = 25675, source = { "trainer" }, cost = 20000 }, -- Wild Draenish Leggings
    { spell = 32455, skill = 325, creates = 23793, teach = 25720, source = { "vendor" }, bound = false, vendors = { { npc = 16689, area = 3487, faction = "Horde" }, { npc = 16748, area = 3557, faction = "Alliance" }, { npc = 19196, area = 3703 } } }, -- Heavy Knothide Leather
    { spell = 32457, skill = 325, creates = 25651, teach = 25721, reputation = { 932, 7, ns.L.FACTION_932 }, source = { "vendor" }, bound = true, vendors = { { npc = 19321, area = 3703 } } }, -- Vindicator's Armor Kit
    { spell = 32458, skill = 325, creates = 25652, teach = 25722, reputation = { 934, 7, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Magister's Armor Kit
    { spell = 32468, skill = 325, creates = 25660, source = { "trainer" }, cost = 20000 }, -- Scaled Draenic Vest
    { spell = 35530, skill = 325, creates = 29540, teach = 29664, reputation = { 941, 6, ns.L.FACTION_941, 978, 6, ns.L.FACTION_978 }, source = { "vendor" }, bound = true, vendors = { { npc = 20241, area = 3518, faction = "Horde" }, { npc = 20240, area = 3518 } } }, -- Reinforced Mining Bag
    { spell = 32473, skill = 330, creates = 25671, source = { "trainer" }, cost = 25000 }, -- Thick Draenic Vest
    { spell = 32481, skill = 330, creates = 25676, source = { "trainer" }, cost = 25000 }, -- Wild Draenish Vest
    { spell = 36077, skill = 330, creates = 29973, source = { "trainer" }, cost = 20000 }, -- Primalstorm Breastplate
    { spell = 36078, skill = 330, creates = 29974, source = { "trainer" }, cost = 20000 }, -- Living Crystal Breastplate
    { spell = 36079, skill = 330, creates = 29975, source = { "trainer" }, cost = 40000 }, -- Golden Dragonstrike Breastplate
    { spell = 32465, skill = 335, creates = 25657, source = { "trainer" }, cost = 25000 }, -- Felscale Breastplate
    { spell = 32469, skill = 335, creates = 25659, source = { "trainer" }, cost = 25000 }, -- Scaled Draenic Boots
    { spell = 35549, skill = 335, creates = 29533, teach = 29719, reputation = { 946, 6, ns.L.FACTION_946, 947, 6, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17657, area = 3483, faction = "Alliance" }, { npc = 17585, area = 3483 } } }, -- Cobrahide Leg Armor
    { spell = 35555, skill = 335, creates = 29534, teach = 29720, reputation = { 942, 6, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Clefthide Leg Armor
    { spell = 32490, skill = 340, creates = 25685, teach = 25732, reputation = { 933, 5, ns.L.FACTION_933 }, source = { "vendor" }, bound = true, vendors = { { npc = 20242, area = 3523 }, { npc = 23007, area = 3518 } } }, -- Fel Leather Gloves
    { spell = 32501, skill = 340, creates = 25694, teach = 25741, reputation = { 941, 5, ns.L.FACTION_941, 978, 5, ns.L.FACTION_978 }, source = { "vendor" }, bound = true, vendors = { { npc = 20241, area = 3518, faction = "Horde" }, { npc = 20240, area = 3518 } } }, -- Netherfury Belt
    { spell = 32502, skill = 340, creates = 25692, teach = 25742, reputation = { 941, 6, ns.L.FACTION_941, 978, 6, ns.L.FACTION_978 }, source = { "vendor" }, bound = true, vendors = { { npc = 20241, area = 3518, faction = "Horde" }, { npc = 20240, area = 3518 } } }, -- Netherfury Leggings
    { spell = 35520, skill = 340, creates = 29483, teach = 29669, source = { "drop" }, bound = true }, -- Shadow Armor Kit
    { spell = 35521, skill = 340, creates = 29485, teach = 29672, source = { "drop" }, bound = true }, -- Flame Armor Kit
    { spell = 35522, skill = 340, creates = 29486, teach = 29673, source = { "drop" }, bound = true }, -- Frost Armor Kit
    { spell = 35523, skill = 340, creates = 29487, teach = 29674, source = { "drop" }, bound = true }, -- Nature Armor Kit
    { spell = 35524, skill = 340, creates = 29488, teach = 29675, source = { "drop" }, bound = true }, -- Arcane Armor Kit
    { spell = 35540, skill = 340, creates = 29528, source = { "trainer" }, cost = 20000 }, -- Drums of War
    { spell = 351766, skill = 340, creates = 185852, teach = 185922, cost = 20000, bound = true }, -- Greater Drums of War
    { spell = 35544, skill = 345, creates = 29530, teach = 29718, reputation = { 941, 6, ns.L.FACTION_941, 978, 6, ns.L.FACTION_978 }, source = { "vendor" }, bound = false, vendors = { { npc = 20240, area = 3518 }, { npc = 20241, area = 3518 } } }, -- Drums of Speed
    { spell = 351768, skill = 345, creates = 185851, teach = 185923, source = { "vendor" }, bound = true, vendors = { { npc = 20241, area = 3518, faction = "Horde" } } }, -- Greater Drums of Speed
    { spell = 32461, skill = 350, creates = 25653, teach = 25725, source = { "vendor" }, bound = false, vendors = { { npc = 18672 } } }, -- Riding Crop
    { spell = 32485, skill = 350, creates = 25680, teach = 25728, source = { "drop" }, bound = true }, -- Stylin' Purple Hat
    { spell = 32487, skill = 350, creates = 25681, teach = 25729, source = { "drop" }, bound = true }, -- Stylin' Adventure Hat
    { spell = 32488, skill = 350, creates = 25683, teach = 25731, source = { "drop" }, bound = true }, -- Stylin' Crimson Hat
    { spell = 32489, skill = 350, creates = 25682, teach = 25730, source = { "drop" }, bound = true }, -- Stylin' Jungle Hat
    { spell = 32493, skill = 350, creates = 25686, teach = 25733, reputation = { 933, 6, ns.L.FACTION_933 }, source = { "vendor" }, bound = true, vendors = { { npc = 20242, area = 3523 }, { npc = 23007, area = 3518 } } }, -- Fel Leather Boots
    { spell = 32494, skill = 350, creates = 25687, teach = 25734, reputation = { 933, 7, ns.L.FACTION_933 }, source = { "vendor" }, bound = true, vendors = { { npc = 20242, area = 3523 }, { npc = 23007, area = 3518 } } }, -- Fel Leather Leggings
    { spell = 32498, skill = 350, creates = 25695, teach = 25738, reputation = { 946, 5, ns.L.FACTION_946, 947, 5, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17585, area = 3483, faction = "Horde" }, { npc = 17657, area = 3483 } } }, -- Felstalker Belt
    { spell = 32503, skill = 350, creates = 25693, teach = 25743, reputation = { 941, 7, ns.L.FACTION_941, 978, 7, ns.L.FACTION_978 }, source = { "vendor" }, bound = true, vendors = { { npc = 20241, area = 3518, faction = "Horde" }, { npc = 20240, area = 3518 } } }, -- Netherfury Boots
    { spell = 35525, skill = 350, creates = 29489, teach = 29677, reputation = { 934, 8, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Enchanted Felscale Leggings
    { spell = 35526, skill = 350, creates = 29490, teach = 29682, reputation = { 934, 6, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Enchanted Felscale Gloves
    { spell = 35527, skill = 350, creates = 29491, teach = 29684, reputation = { 934, 7, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Enchanted Felscale Boots
    { spell = 35528, skill = 350, creates = 29493, teach = 29691, reputation = { 932, 7, ns.L.FACTION_932 }, source = { "vendor" }, bound = true, vendors = { { npc = 19321, area = 3703 } } }, -- Flamescale Boots
    { spell = 35529, skill = 350, creates = 29492, teach = 29689, reputation = { 932, 8, ns.L.FACTION_932 }, source = { "vendor" }, bound = true, vendors = { { npc = 19321, area = 3703 } } }, -- Flamescale Leggings
    { spell = 35531, skill = 350, creates = 29494, teach = 29693, reputation = { 932, 6, ns.L.FACTION_932 }, source = { "vendor" }, bound = true, vendors = { { npc = 19321, area = 3703 } } }, -- Flamescale Belt
    { spell = 35532, skill = 350, creates = 29495, teach = 29698, reputation = { 934, 8, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Enchanted Clefthoof Leggings
    { spell = 35533, skill = 350, creates = 29496, teach = 29700, reputation = { 934, 7, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Enchanted Clefthoof Gloves
    { spell = 35534, skill = 350, creates = 29497, teach = 29701, reputation = { 934, 6, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Enchanted Clefthoof Boots
    { spell = 35535, skill = 350, creates = 29498, teach = 29702, reputation = { 932, 8, ns.L.FACTION_932 }, source = { "vendor" }, bound = true, vendors = { { npc = 19321, area = 3703 } } }, -- Blastguard Pants
    { spell = 35536, skill = 350, creates = 29499, teach = 29703, reputation = { 932, 7, ns.L.FACTION_932 }, source = { "vendor" }, bound = true, vendors = { { npc = 19321, area = 3703 } } }, -- Blastguard Boots
    { spell = 35537, skill = 350, creates = 29500, teach = 29704, reputation = { 932, 6, ns.L.FACTION_932 }, source = { "vendor" }, bound = true, vendors = { { npc = 19321, area = 3703 } } }, -- Blastguard Belt
    { spell = 35539, skill = 350, creates = 29531, teach = 29714, reputation = { 941, 6, ns.L.FACTION_941, 978, 6, ns.L.FACTION_978 }, source = { "vendor" }, bound = false, vendors = { { npc = 20240, area = 3518 }, { npc = 20241, area = 3518 } } }, -- Drums of Restoration
    { spell = 44359, skill = 350, creates = 34105, reputation = { 1011, 7, ns.L.FACTION_1011 }, source = { "vendor" }, vendors = { { npc = 21655, area = 3703 } } }, -- Quiver of a Thousand Feathers
    { spell = 44768, skill = 350, creates = 34106, teach = 34201, reputation = { 946, 7, ns.L.FACTION_946, 947, 7, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17585, area = 3483, faction = "Horde" }, { npc = 17657, area = 3483 } } }, -- Netherscale Ammo Pouch
    { spell = 44770, skill = 350, creates = 34207, source = { "trainer" }, cost = 50000 }, -- Glove Reinforcements
    { spell = 44970, skill = 350, creates = 34330, source = { "trainer" }, cost = 50000 }, -- Heavy Knothide Armor Kit
    { spell = 351769, skill = 350, creates = 185850, teach = 185924, source = { "vendor" }, bound = true, vendors = { { npc = 20241, area = 3518, faction = "Horde" } } }, -- Greater Drums of Restoration
    { spell = 32496, skill = 355, creates = 25690, teach = 25736, reputation = { 942, 6, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Heavy Clefthoof Leggings
    { spell = 32497, skill = 355, creates = 25691, teach = 25737, reputation = { 942, 5, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Heavy Clefthoof Boots
    { spell = 32495, skill = 360, creates = 25689, teach = 25735, reputation = { 942, 6, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Heavy Clefthoof Vest
    { spell = 32499, skill = 360, creates = 25697, teach = 25739, reputation = { 946, 6, ns.L.FACTION_946, 947, 6, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17585, area = 3483, faction = "Horde" }, { npc = 17657, area = 3483 } } }, -- Felstalker Bracer
    { spell = 32500, skill = 360, creates = 25696, teach = 25740, reputation = { 946, 6, ns.L.FACTION_946, 947, 6, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17585, area = 3483, faction = "Horde" }, { npc = 17657, area = 3483 } } }, -- Felstalker Breastplate
    { spell = 42546, skill = 360, creates = 33122, teach = 33124, reputation = { 967, 8, ns.L.FACTION_967 }, source = { "vendor" }, bound = true, vendors = { { npc = 18255, area = 41 } } }, -- Cloak of Darkness
    { spell = 45117, skill = 360, creates = 34490, teach = 34491, source = { "drop" }, bound = true }, -- Bag of Many Hides
    { spell = 35543, skill = 365, creates = 29529, teach = 29717, reputation = { 935, 6, ns.L.FACTION_935 }, source = { "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Drums of Battle
    { spell = 35554, skill = 365, creates = 29535, teach = 29722, reputation = { 946, 8, ns.L.FACTION_946, 947, 8, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17657, area = 3483, faction = "Alliance" }, { npc = 17585, area = 3483 } } }, -- Nethercobra Leg Armor
    { spell = 35557, skill = 365, creates = 29536, teach = 29721, reputation = { 942, 8, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Nethercleft Leg Armor
    { spell = 35558, skill = 365, creates = 29502, teach = 29723, source = { "drop" }, bound = false }, -- Cobrascale Hood
    { spell = 35559, skill = 365, creates = 29503, teach = 29724, source = { "drop" }, bound = false }, -- Cobrascale Gloves
    { spell = 35560, skill = 365, creates = 29504, teach = 29725, source = { "drop" }, bound = false }, -- Windscale Hood
    { spell = 35561, skill = 365, creates = 29505, teach = 29726, source = { "drop" }, bound = false }, -- Hood of Primal Life
    { spell = 35562, skill = 365, creates = 29506, teach = 29727, source = { "drop" }, bound = false }, -- Gloves of the Living Touch
    { spell = 35563, skill = 365, creates = 29507, teach = 29728, source = { "drop" }, bound = false }, -- Windslayer Wraps
    { spell = 35564, skill = 365, creates = 29508, teach = 29729, source = { "drop" }, bound = false }, -- Living Dragonscale Helm
    { spell = 35567, skill = 365, creates = 29512, teach = 29730, source = { "drop" }, bound = false }, -- Earthen Netherscale Boots
    { spell = 35568, skill = 365, creates = 29509, teach = 29731, source = { "drop" }, bound = false }, -- Windstrike Gloves
    { spell = 35572, skill = 365, creates = 29510, teach = 29732, source = { "drop" }, bound = false }, -- Netherdrake Helm
    { spell = 35573, skill = 365, creates = 29511, teach = 29733, source = { "drop" }, bound = false }, -- Netherdrake Gloves
    { spell = 35574, skill = 365, creates = 29514, teach = 29734, source = { "drop" }, bound = false }, -- Thick Netherscale Breastplate
    { spell = 42731, skill = 365, creates = 33204, teach = 33205, reputation = { 967, 7, ns.L.FACTION_967 }, source = { "vendor" }, bound = true, vendors = { { npc = 18255, area = 41 } } }, -- Shadowprowler's Chestguard
    { spell = 46132, skill = 365, creates = 34372, teach = 35212, source = { "drop" }, bound = true }, -- Leather Gauntlets of the Sun
    { spell = 46133, skill = 365, creates = 34374, teach = 35213, source = { "drop" }, bound = true }, -- Fletcher's Gloves of the Phoenix
    { spell = 46134, skill = 365, creates = 34370, teach = 35214, source = { "drop" }, bound = true }, -- Gloves of Immortal Dusk
    { spell = 46135, skill = 365, creates = 34376, teach = 35215, source = { "drop" }, bound = true }, -- Sun-Drenched Scale Gloves
    { spell = 46136, skill = 365, creates = 34371, teach = 35216, source = { "drop" }, bound = false }, -- Leather Chestguard of the Sun
    { spell = 46137, skill = 365, creates = 34373, teach = 35217, source = { "drop" }, bound = false }, -- Embrace of the Phoenix
    { spell = 46138, skill = 365, creates = 34369, teach = 35218, source = { "drop" }, bound = false }, -- Carapace of Sun and Shadow
    { spell = 46139, skill = 365, creates = 34375, teach = 35219, source = { "drop" }, bound = false }, -- Sun-Drenched Scale Chestguard
    { spell = 351771, skill = 365, creates = 185848, teach = 185926, source = { "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Greater Drums of Battle
    { spell = 35538, skill = 370, creates = 29532, teach = 29713, reputation = { 989, 6, ns.L.FACTION_989 }, source = { "vendor" }, bound = true, vendors = { { npc = 21643, area = 440 } } }, -- Drums of Panic
    { spell = 351770, skill = 370, creates = 185849, teach = 185925, source = { "vendor" }, bound = true, vendors = { { npc = 21643, area = 440 } } }, -- Greater Drums of Panic
    { spell = 35575, skill = 375, creates = 29515, source = { "trainer" }, cost = 100000 }, -- Ebon Netherscale Breastplate
    { spell = 35576, skill = 375, creates = 29516, source = { "trainer" }, cost = 100000 }, -- Ebon Netherscale Belt
    { spell = 35577, skill = 375, creates = 29517, source = { "trainer" }, cost = 100000 }, -- Ebon Netherscale Bracers
    { spell = 35580, skill = 375, creates = 29519, source = { "trainer" }, cost = 100000 }, -- Netherstrike Breastplate
    { spell = 35582, skill = 375, creates = 29520, source = { "trainer" }, cost = 100000 }, -- Netherstrike Belt
    { spell = 35584, skill = 375, creates = 29521, source = { "trainer" }, cost = 100000 }, -- Netherstrike Bracers
    { spell = 35585, skill = 375, creates = 29522, source = { "trainer" }, cost = 100000 }, -- Windhawk Hauberk
    { spell = 35587, skill = 375, creates = 29524, source = { "trainer" }, cost = 100000 }, -- Windhawk Belt
    { spell = 35588, skill = 375, creates = 29523, source = { "trainer" }, cost = 100000 }, -- Windhawk Bracers
    { spell = 35589, skill = 375, creates = 29525, source = { "trainer" }, cost = 100000 }, -- Primalstrike Vest
    { spell = 35590, skill = 375, creates = 29526, source = { "trainer" }, cost = 100000 }, -- Primalstrike Belt
    { spell = 35591, skill = 375, creates = 29527, source = { "trainer" }, cost = 100000 }, -- Primalstrike Bracers
    { spell = 36349, skill = 375, creates = 30042, teach = 30301, source = { "drop" }, bound = true }, -- Belt of Natural Power
    { spell = 36351, skill = 375, creates = 30040, teach = 30302, source = { "drop" }, bound = true }, -- Belt of Deep Shadow
    { spell = 36352, skill = 375, creates = 30046, teach = 30303, source = { "drop" }, bound = true }, -- Belt of the Black Eagle
    { spell = 36353, skill = 375, creates = 30044, teach = 30304, source = { "drop" }, bound = true }, -- Monsoon Belt
    { spell = 36355, skill = 375, creates = 30041, teach = 30305, source = { "drop" }, bound = false }, -- Boots of Natural Grace
    { spell = 36357, skill = 375, creates = 30039, teach = 30306, source = { "drop" }, bound = false }, -- Boots of Utter Darkness
    { spell = 36358, skill = 375, creates = 30045, teach = 30307, source = { "drop" }, bound = false }, -- Boots of the Crimson Hawk
    { spell = 36359, skill = 375, creates = 30043, teach = 30308, source = { "drop" }, bound = false }, -- Hurricane Boots
    { spell = 39997, skill = 375, creates = 32398, teach = 32429, reputation = { 1012, 5, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Boots of Shackled Souls
    { spell = 40000, skill = 375, creates = 32399, teach = 32430, reputation = { 1012, 5, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Bracers of Shackled Souls
    { spell = 40001, skill = 375, creates = 32400, teach = 32431, reputation = { 1012, 6, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Greaves of Shackled Souls
    { spell = 40002, skill = 375, creates = 32397, teach = 32432, reputation = { 1012, 6, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Waistguard of Shackled Souls
    { spell = 40003, skill = 375, creates = 32394, teach = 32433, reputation = { 1012, 6, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Redeemed Soul Moccasins
    { spell = 40004, skill = 375, creates = 32395, teach = 32434, reputation = { 1012, 6, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Redeemed Soul Wristguards
    { spell = 40005, skill = 375, creates = 32396, teach = 32435, reputation = { 1012, 5, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Redeemed Soul Legguards
    { spell = 40006, skill = 375, creates = 32393, teach = 32436, reputation = { 1012, 5, ns.L.FACTION_1012 }, source = { "vendor" }, bound = true, vendors = { { npc = 23159, area = 3959 } } }, -- Redeemed Soul Cinch
    { spell = 41156, skill = 375, creates = 32582, teach = 32744, source = { "drop" }, bound = true }, -- Bracers of Renewed Life
    { spell = 41157, skill = 375, creates = 32583, teach = 32745, source = { "drop" }, bound = false }, -- Shoulderpads of Renewed Life
    { spell = 41158, skill = 375, creates = 32580, teach = 32746, source = { "drop" }, bound = true }, -- Swiftstrike Bracers
    { spell = 41160, skill = 375, creates = 32581, teach = 32747, source = { "drop" }, bound = false }, -- Swiftstrike Shoulders
    { spell = 41161, skill = 375, creates = 32574, teach = 32748, source = { "drop" }, bound = true }, -- Bindings of Lightning Reflexes
    { spell = 41162, skill = 375, creates = 32575, teach = 32749, source = { "drop" }, bound = false }, -- Shoulders of Lightning Reflexes
    { spell = 41163, skill = 375, creates = 32577, teach = 32750, source = { "drop" }, bound = true }, -- Living Earth Bindings
    { spell = 41164, skill = 375, creates = 32579, teach = 32751, source = { "drop" }, bound = false }, -- Living Earth Shoulders
}
