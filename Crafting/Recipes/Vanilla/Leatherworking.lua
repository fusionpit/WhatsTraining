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
    { spell = 3774, skill = 160, creates = 4257, source = { "trainer" }, cost = 900 }, -- Green Leather Belt
    { spell = 7147, skill = 160, creates = 5962, source = { "trainer" }, cost = 1000 }, -- Guardian Pants
    { spell = 4096, skill = 165, creates = 4455, teach = 13287, source = { "vendor" }, bound = false, side = "Horde", vendors = { { npc = 2819, area = 45, faction = "Horde" } } }, -- Raptor Hide Harness
    { spell = 4097, skill = 165, creates = 4456, teach = 13288, source = { "vendor" }, bound = false, side = "Alliance", vendors = { { npc = 2816, area = 45, faction = "Alliance" } } }, -- Raptor Hide Belt
    { spell = 9195, skill = 165, creates = 7373, teach = 7449, source = { "drop" }, bound = false }, -- Dusky Leather Leggings
    { spell = 3775, skill = 170, creates = 4258, teach = 4298, source = { "drop" }, bound = false }, -- Guardian Belt
    { spell = 6704, skill = 170, creates = 5782, teach = 5788, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2381, area = 267, faction = "Alliance" }, { npc = 2393, area = 267, faction = "Horde" }, { npc = 2846, area = 33 } } }, -- Thick Murloc Armor
    { spell = 7149, skill = 170, creates = 5963, teach = 5973, source = { "vendor" }, bound = false, vendors = { { npc = 2810, area = 45, faction = "Alliance" }, { npc = 2821, area = 45, faction = "Horde" }, { npc = 3958, area = 331, faction = "Alliance" }, { npc = 4877, area = 400, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Barbaric Leggings
    { spell = 3773, skill = 175, creates = 4256, teach = 4299, source = { "drop" }, bound = false }, -- Guardian Armor
    { spell = 7151, skill = 175, creates = 5964, source = { "trainer" }, cost = 1080 }, -- Barbaric Shoulders
    { spell = 9196, skill = 175, creates = 7374, source = { "trainer" }, cost = 1350 }, -- Dusky Leather Armor
    { spell = 9197, skill = 175, creates = 7375, teach = 7450, source = { "drop" }, bound = false }, -- Green Whelp Armor
    { spell = 3776, skill = 180, creates = 4259, source = { "trainer" }, cost = 1080 }, -- Green Leather Bracers
    { spell = 9198, skill = 180, creates = 7377, source = { "trainer" }, cost = 1800 }, -- Frost Leather Cloak
    { spell = 3778, skill = 185, creates = 4262, teach = 14635, source = { "vendor" }, bound = false, vendors = { { npc = 2699, area = 33 }, { npc = 12245, area = 405 } } }, -- Gem-studded Leather Belt
    { spell = 7153, skill = 185, creates = 5965, teach = 4295, source = { "drop" }, bound = false }, -- Guardian Cloak
    { spell = 9201, skill = 185, creates = 7378, source = { "trainer" }, cost = 1800 }, -- Dusky Bracers
    { spell = 6661, skill = 190, creates = 5739, source = { "trainer" }, cost = 1800 }, -- Barbaric Harness
    { spell = 6705, skill = 190, creates = 5783, teach = 5789, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2846, area = 33 }, { npc = 4897, area = 15, faction = "Alliance" } } }, -- Murloc Scale Bracers
    { spell = 7156, skill = 190, creates = 5966, source = { "trainer" }, cost = 2160 }, -- Guardian Gloves
    { spell = 9202, skill = 190, creates = 7386, teach = 7451, source = { "vendor" }, bound = false, vendors = { { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 4589, area = 1497, faction = "Horde" }, { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Green Whelp Bracers
    { spell = 21943, skill = 190, creates = 17721, teach = 17722, source = { "drop" }, bound = false }, -- Gloves of the Greatfather
    { spell = 3777, skill = 195, creates = 4260, teach = 4300, source = { "drop" }, bound = false }, -- Guardian Leather Bracers
    { spell = 9206, skill = 195, creates = 7387, source = { "trainer" }, cost = 2250 }, -- Dusky Belt
    { spell = 3779, skill = 200, creates = 4264, teach = 4301, source = { "drop" }, bound = false }, -- Barbaric Belt
    { spell = 9207, skill = 200, creates = 7390, teach = 7452, source = { "drop" }, bound = false }, -- Dusky Boots
    { spell = 9208, skill = 200, creates = 7391, teach = 7453, source = { "drop" }, bound = false }, -- Swift Boots
    { spell = 10482, skill = 200, creates = 8172, source = { "trainer" }, cost = 1800 }, -- Cured Thick Hide
    { spell = 10487, skill = 200, creates = 8173, source = { "trainer" }, cost = 1800 }, -- Thick Armor Kit
    { spell = 10490, skill = 200, creates = 8174, teach = 8384, source = { "drop" }, bound = false }, -- Comfortable Leather Hat
    { spell = 10662, skill = 200, rank = "Artisan", level = 35, source = { "trainer" }, cost = 50000 }, -- Leatherworking (Artisan)
    { spell = 20650, skill = 200, creates = 4304, source = { "trainer" }, cost = 4000 }, -- Thick Leather
    { spell = 22711, skill = 200, creates = 18238, teach = 18239, source = { "vendor" }, bound = false, vendors = { { npc = 2699, area = 33 } } }, -- Shadowskin Gloves
    { spell = 10499, skill = 205, creates = 8175, source = { "trainer" }, cost = 2700 }, -- Nightscape Tunic
    { spell = 10507, skill = 205, creates = 8176, source = { "trainer" }, cost = 2700 }, -- Nightscape Headband
    { spell = 10509, skill = 205, creates = 8187, teach = 8385, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Turtle Scale Gloves
    { spell = 10511, skill = 210, creates = 8189, source = { "trainer" }, cost = 3000 }, -- Turtle Scale Breastplate
    { spell = 10516, skill = 210, creates = 8192, teach = 8409, source = { "vendor" }, bound = false, vendors = { { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Nightscape Shoulders
    { spell = 10518, skill = 210, creates = 8198, source = { "trainer" }, cost = 3150 }, -- Turtle Scale Bracers
    { spell = 10520, skill = 215, creates = 8200, teach = 8386, source = { "drop" }, bound = false }, -- Big Voodoo Robe
    { spell = 10525, skill = 220, creates = 8203, teach = 8395, source = { "drop" }, bound = false }, -- Tough Scorpid Breastplate
    { spell = 10529, skill = 220, creates = 8210, teach = 8403, source = { "quest" }, bound = true, quests = { { id = 2848, area = 357, faction = "Alliance", level = 30 }, { id = 2855, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Shoulders
    { spell = 10531, skill = 220, creates = 8201, teach = 8387, source = { "drop" }, bound = false }, -- Big Voodoo Mask
    { spell = 10533, skill = 220, creates = 8205, teach = 8397, source = { "drop" }, bound = false }, -- Tough Scorpid Bracers
    { spell = 10542, skill = 225, creates = 8204, teach = 8398, source = { "drop" }, bound = false }, -- Tough Scorpid Gloves
    { spell = 10544, skill = 225, creates = 8211, teach = 8404, source = { "quest" }, bound = true, quests = { { id = 2849, area = 357, faction = "Alliance", level = 30 }, { id = 2856, area = 357, faction = "Horde", level = 30 }, { id = 82656, area = 357, faction = "Horde", level = 30 }, { id = 82657, area = 357, faction = "Alliance", level = 30 } } }, -- Wild Leather Vest
    { spell = 10546, skill = 225, creates = 8214, teach = 8405, source = { "quest" }, bound = true, quests = { { id = 2850, area = 357, faction = "Alliance", level = 30 }, { id = 2857, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Helmet
    { spell = 10619, skill = 225, creates = 8347, source = { "trainer" }, cost = 9000 }, -- Dragonscale Gauntlets
    { spell = 10621, skill = 225, creates = 8345, source = { "trainer" }, cost = 9000 }, -- Wolfshead Helm
    { spell = 14930, skill = 225, creates = 8217, source = { "trainer" }, cost = 3240 }, -- Quickdraw Quiver
    { spell = 14932, skill = 225, creates = 8218, source = { "trainer" }, cost = 3240 }, -- Thick Leather Ammo Pouch
    { spell = 10548, skill = 230, creates = 8193, source = { "trainer" }, cost = 4000 }, -- Nightscape Pants
    { spell = 10552, skill = 230, creates = 8191, source = { "trainer" }, cost = 4000 }, -- Turtle Scale Helm
    { spell = 10630, skill = 230, creates = 8346, source = { "trainer" }, cost = 9000 }, -- Gauntlets of the Sea
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
    { spell = 10574, skill = 250, creates = 8215, teach = 8408, source = { "quest" }, bound = true, quests = { { id = 2853, area = 357, faction = "Alliance", level = 30 }, { id = 2860, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Cloak
    { spell = 10632, skill = 250, creates = 8348, source = { "trainer" }, cost = 9000 }, -- Helm of Fire
    { spell = 10647, skill = 250, creates = 8349, source = { "trainer" }, cost = 9000 }, -- Feathered Breastplate
    { spell = 19047, skill = 250, creates = 15407, source = { "trainer" }, cost = 5000 }, -- Cured Rugged Hide
    { spell = 19058, skill = 250, creates = 15564, source = { "trainer" }, cost = 5000 }, -- Rugged Armor Kit
    { spell = 22331, skill = 250, creates = 8170, source = { "trainer" }, cost = 5000 }, -- Rugged Leather
    { spell = 10650, skill = 255, creates = 8367, source = { "trainer" }, cost = 9000 }, -- Dragonscale Breastplate
    { spell = 19048, skill = 255, creates = 15077, teach = 15724, source = { "vendor" }, bound = false, vendors = { { npc = 12956, area = 1377 } } }, -- Heavy Scorpid Bracers
    { spell = 19049, skill = 260, creates = 15083, teach = 15725, source = { "vendor" }, bound = false, vendors = { { npc = 12942, area = 28, faction = "Alliance" }, { npc = 12943, area = 85, faction = "Horde" } } }, -- Wicked Leather Gauntlets
    { spell = 19050, skill = 260, creates = 15045, teach = 15726, source = { "vendor" }, bound = false, vendors = { { npc = 11874, area = 8 } } }, -- Green Dragonscale Breastplate
    { spell = 19051, skill = 265, creates = 15076, teach = 15727, source = { "drop" }, bound = false }, -- Heavy Scorpid Vest
    { spell = 19052, skill = 265, creates = 15084, teach = 15728, source = { "drop" }, bound = false }, -- Wicked Leather Bracers
    { spell = 19053, skill = 265, creates = 15074, teach = 15729, source = { "vendor" }, bound = false, vendors = { { npc = 12957, area = 16 } } }, -- Chimeric Gloves
    { spell = 19055, skill = 270, creates = 15091, teach = 15731, source = { "drop" }, bound = false }, -- Runic Leather Gauntlets
    { spell = 19059, skill = 270, creates = 15054, teach = 15732, source = { "drop" }, bound = false }, -- Volcanic Leggings
    { spell = 19060, skill = 270, creates = 15046, teach = 15733, source = { "drop" }, bound = false }, -- Green Dragonscale Leggings
    { spell = 19061, skill = 270, creates = 15061, teach = 15734, source = { "vendor" }, bound = false, vendors = { { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Living Shoulders
    { spell = 19062, skill = 270, creates = 15067, teach = 15735, source = { "vendor" }, bound = false, vendors = { { npc = 12958, area = 47 } } }, -- Ironfeather Shoulders
    { spell = 19063, skill = 275, creates = 15073, teach = 15737, source = { "drop" }, bound = false }, -- Chimeric Boots
    { spell = 19064, skill = 275, creates = 15078, teach = 15738, source = { "drop" }, bound = false }, -- Heavy Scorpid Gauntlets
    { spell = 19065, skill = 275, creates = 15092, teach = 15739, source = { "drop" }, bound = false }, -- Runic Leather Bracers
    { spell = 19066, skill = 275, creates = 15071, teach = 15740, source = { "vendor" }, bound = false, vendors = { { npc = 11189, area = 618 } } }, -- Frostsaber Boots
    { spell = 19067, skill = 275, creates = 15057, teach = 15741, source = { "vendor" }, bound = false, vendors = { { npc = 12942, area = 28, faction = "Alliance" }, { npc = 12943, area = 85, faction = "Horde" } } }, -- Stormshroud Pants
    { spell = 19068, skill = 275, creates = 15064, teach = 15742, source = { "drop" }, bound = false }, -- Warbear Harness
    { spell = 22815, skill = 275, creates = 18258, source = { "trainer" } }, -- Gordok Ogre Suit
    { spell = 19070, skill = 280, creates = 15082, teach = 15743, source = { "drop" }, bound = false }, -- Heavy Scorpid Belt
    { spell = 19071, skill = 280, creates = 15086, teach = 15744, source = { "drop" }, bound = false }, -- Wicked Leather Headband
    { spell = 19072, skill = 280, creates = 15093, teach = 15745, source = { "drop" }, bound = false }, -- Runic Leather Belt
    { spell = 19073, skill = 280, creates = 15072, teach = 15746, source = { "drop" }, bound = false }, -- Chimeric Leggings
    { spell = 24655, skill = 280, creates = 20296, source = { "trainer" }, cost = 27000 }, -- Green Dragonscale Gauntlets
    { spell = 19074, skill = 285, creates = 15069, teach = 15747, source = { "drop" }, bound = false }, -- Frostsaber Leggings
    { spell = 19075, skill = 285, creates = 15079, teach = 15748, source = { "drop" }, bound = false }, -- Heavy Scorpid Leggings
    { spell = 19076, skill = 285, creates = 15053, teach = 15749, source = { "drop" }, bound = false }, -- Volcanic Breastplate
    { spell = 19077, skill = 285, creates = 15048, teach = 15751, source = { "vendor" }, bound = false, vendors = { { npc = 12957, area = 16 } } }, -- Blue Dragonscale Breastplate
    { spell = 19078, skill = 285, creates = 15060, teach = 15752, source = { "drop" }, bound = false }, -- Living Leggings
    { spell = 19079, skill = 285, creates = 15056, teach = 15753, source = { "drop" }, bound = false }, -- Stormshroud Armor
    { spell = 19080, skill = 285, creates = 15065, teach = 15754, source = { "vendor", "drop" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Warbear Woolies
    { spell = 19081, skill = 290, creates = 15075, teach = 15755, source = { "drop" }, bound = false }, -- Chimeric Vest
    { spell = 19082, skill = 290, creates = 15094, teach = 15756, source = { "vendor" }, bound = false, vendors = { { npc = 12941, area = 139 } } }, -- Runic Leather Headband
    { spell = 19083, skill = 290, creates = 15087, teach = 15757, source = { "drop" }, bound = false }, -- Wicked Leather Pants
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
    { spell = 19091, skill = 300, creates = 15095, teach = 15765, source = { "drop" }, bound = false }, -- Runic Leather Pants
    { spell = 19092, skill = 300, creates = 15088, teach = 15768, source = { "drop" }, bound = false }, -- Wicked Leather Belt
    { spell = 19093, skill = 300, creates = 15138, teach = 15769, source = { "quest" }, bound = false, quests = { { id = 7493, area = 1637, faction = "Horde", level = 60 }, { id = 7497, area = 1519, faction = "Alliance", level = 60 } } }, -- Onyxia Scale Cloak
    { spell = 19094, skill = 300, creates = 15051, teach = 15770, source = { "drop" }, bound = false }, -- Black Dragonscale Shoulders
    { spell = 19095, skill = 300, creates = 15059, teach = 15771, source = { "drop" }, bound = false }, -- Living Breastplate
    { spell = 19097, skill = 300, creates = 15062, teach = 15772, source = { "drop" }, bound = false }, -- Devilsaur Leggings
    { spell = 19098, skill = 300, creates = 15085, teach = 15773, source = { "drop" }, bound = false }, -- Wicked Leather Armor
    { spell = 19100, skill = 300, creates = 15081, teach = 15774, source = { "drop" }, bound = false }, -- Heavy Scorpid Shoulders
    { spell = 19101, skill = 300, creates = 15055, teach = 15775, source = { "drop" }, bound = false }, -- Volcanic Shoulders
    { spell = 19102, skill = 300, creates = 15090, teach = 15776, source = { "drop" }, bound = false }, -- Runic Leather Armor
    { spell = 19103, skill = 300, creates = 15096, teach = 15777, source = { "drop" }, bound = false }, -- Runic Leather Shoulders
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
    { spell = 24654, skill = 300, creates = 20295, source = { "trainer" }, cost = 45000 }, -- Blue Dragonscale Leggings
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
}
