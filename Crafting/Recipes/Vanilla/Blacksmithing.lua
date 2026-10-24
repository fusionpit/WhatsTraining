local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[164] = {
    { spell = 2660, skill = 1, autoLearned = true, creates = 2862 }, -- Rough Sharpening Stone
    { spell = 2662, skill = 1, creates = 2852, source = { "trainer" }, cost = 50 }, -- Copper Chain Pants
    { spell = 2663, skill = 1, autoLearned = true, creates = 2853 }, -- Copper Bracers
    { spell = 3115, skill = 1, autoLearned = true, creates = 3239 }, -- Rough Weightstone
    { spell = 12260, skill = 1, autoLearned = true, creates = 10421 }, -- Rough Copper Vest
    { spell = 2737, skill = 15, creates = 2844, source = { "trainer" }, cost = 50 }, -- Copper Mace
    { spell = 2738, skill = 20, creates = 2845, source = { "trainer" }, cost = 50 }, -- Copper Axe
    { spell = 3319, skill = 20, creates = 3469, source = { "trainer" }, cost = 50 }, -- Copper Chain Boots
    { spell = 2739, skill = 25, creates = 2847, source = { "trainer" }, cost = 50 }, -- Copper Shortsword
    { spell = 3320, skill = 25, creates = 3470, source = { "trainer" }, cost = 100 }, -- Rough Grinding Stone
    { spell = 8880, skill = 30, creates = 7166, source = { "trainer" }, cost = 100 }, -- Copper Dagger
    { spell = 9983, skill = 30, creates = 7955, source = { "trainer" }, cost = 100 }, -- Copper Claymore
    { spell = 2661, skill = 35, creates = 2851, source = { "trainer" }, cost = 100 }, -- Copper Chain Belt
    { spell = 3293, skill = 35, creates = 3488, source = { "trainer" }, cost = 250 }, -- Copper Battle Axe
    { spell = 3321, skill = 35, creates = 3471, teach = 3609, source = { "drop", "quest" }, bound = false, quests = { { id = 1578, area = 1537, faction = "Alliance", level = 1 } } }, -- Copper Chain Vest
    { spell = 3323, skill = 40, creates = 3472, source = { "trainer" }, cost = 100 }, -- Runed Copper Gauntlets
    { spell = 3324, skill = 45, creates = 3473, source = { "trainer" }, cost = 200 }, -- Runed Copper Pants
    { spell = 3100, skill = 50, rank = "Journeyman", level = 10, source = { "trainer" }, cost = 500 }, -- Blacksmithing (Journeyman)
    { spell = 3325, skill = 60, creates = 3474, teach = 3610, source = { "drop" }, bound = false }, -- Gemmed Copper Gauntlets
    { spell = 2665, skill = 65, creates = 2863, source = { "trainer" }, cost = 100 }, -- Coarse Sharpening Stone
    { spell = 3116, skill = 65, creates = 3240, source = { "trainer" }, cost = 100 }, -- Coarse Weightstone
    { spell = 7408, skill = 65, creates = 6214, source = { "trainer" }, cost = 300 }, -- Heavy Copper Maul
    { spell = 2666, skill = 70, creates = 2857, source = { "trainer" }, cost = 200 }, -- Runed Copper Belt
    { spell = 3294, skill = 70, creates = 3489, source = { "trainer" }, cost = 500 }, -- Thick War Axe
    { spell = 3326, skill = 75, creates = 3478, source = { "trainer" }, cost = 250 }, -- Coarse Grinding Stone
    { spell = 2667, skill = 80, creates = 2864, teach = 2881, source = { "drop" }, bound = false }, -- Runed Copper Breastplate
    { spell = 2664, skill = 90, creates = 2854, source = { "trainer" }, cost = 500 }, -- Runed Copper Bracers
    { spell = 3292, skill = 95, creates = 3487, source = { "trainer" }, cost = 500 }, -- Heavy Copper Broadsword
    { spell = 7817, skill = 95, creates = 6350, source = { "trainer" }, cost = 200 }, -- Rough Bronze Boots
    { spell = 7818, skill = 100, creates = 6338, source = { "trainer" }, cost = 100 }, -- Silver Rod
    { spell = 8367, skill = 100, creates = 6731, teach = 6735, source = { "quest" }, bound = false, quests = { { id = 1618, area = 1537, faction = "Alliance", level = 1 } } }, -- Ironforge Breastplate
    { spell = 19666, skill = 100, creates = 15869, count = 2, source = { "trainer" }, cost = 100 }, -- Silver Skeleton Key
    { spell = 2668, skill = 105, creates = 2865, source = { "trainer" }, cost = 300 }, -- Rough Bronze Leggings
    { spell = 2670, skill = 105, creates = 2866, source = { "trainer" }, cost = 500 }, -- Rough Bronze Cuirass
    { spell = 3491, skill = 105, creates = 3848, source = { "trainer" }, cost = 600 }, -- Big Bronze Knife
    { spell = 2740, skill = 110, creates = 2848, source = { "trainer" }, cost = 200 }, -- Bronze Mace
    { spell = 3328, skill = 110, creates = 3480, source = { "trainer" }, cost = 500 }, -- Rough Bronze Shoulders
    { spell = 6517, skill = 110, creates = 5540, source = { "trainer" }, cost = 800 }, -- Pearl-handled Dagger
    { spell = 2741, skill = 115, creates = 2849, source = { "trainer" }, cost = 200 }, -- Bronze Axe
    { spell = 2672, skill = 120, creates = 2868, source = { "trainer" }, cost = 500 }, -- Patterned Bronze Bracers
    { spell = 2742, skill = 120, creates = 2850, source = { "trainer" }, cost = 200 }, -- Bronze Shortsword
    { spell = 2674, skill = 125, creates = 2871, source = { "trainer" }, cost = 1000 }, -- Heavy Sharpening Stone
    { spell = 3117, skill = 125, creates = 3241, source = { "trainer" }, cost = 1000 }, -- Heavy Weightstone
    { spell = 3295, skill = 125, creates = 3490, teach = 2883, source = { "drop" }, bound = false }, -- Deadly Bronze Poniard
    { spell = 3330, skill = 125, creates = 3481, teach = 2882, source = { "drop" }, bound = false }, -- Silvered Bronze Shoulders
    { spell = 3337, skill = 125, creates = 3486, source = { "trainer" }, cost = 1000 }, -- Heavy Grinding Stone
    { spell = 3538, skill = 125, rank = "Expert", level = 20, source = { "trainer" }, cost = 5000 }, -- Blacksmithing (Expert)
    { spell = 9985, skill = 125, creates = 7956, source = { "trainer" }, cost = 250 }, -- Bronze Warhammer
    { spell = 2673, skill = 130, creates = 2869, teach = 5578, source = { "drop" }, bound = false }, -- Silvered Bronze Breastplate
    { spell = 3296, skill = 130, creates = 3491, source = { "trainer" }, cost = 1000 }, -- Heavy Bronze Mace
    { spell = 3331, skill = 130, creates = 3482, source = { "trainer" }, cost = 500 }, -- Silvered Bronze Boots
    { spell = 9986, skill = 130, creates = 7957, source = { "trainer" }, cost = 500 }, -- Bronze Greatsword
    { spell = 3333, skill = 135, creates = 3483, source = { "trainer" }, cost = 1000 }, -- Silvered Bronze Gauntlets
    { spell = 9987, skill = 135, creates = 7958, source = { "trainer" }, cost = 500 }, -- Bronze Battle Axe
    { spell = 6518, skill = 140, creates = 5541, teach = 5543, source = { "drop" }, bound = false }, -- Iridescent Hammer
    { spell = 2675, skill = 145, creates = 2870, source = { "trainer" }, cost = 1000 }, -- Shining Silver Breastplate
    { spell = 3297, skill = 145, creates = 3492, teach = 3608, source = { "drop" }, bound = false }, -- Mighty Iron Hammer
    { spell = 3334, skill = 145, creates = 3484, teach = 3611, source = { "drop" }, bound = false }, -- Green Iron Boots
    { spell = 3336, skill = 150, creates = 3485, teach = 3612, source = { "drop" }, bound = false }, -- Green Iron Gauntlets
    { spell = 7221, skill = 150, creates = 6042, teach = 6044, source = { "drop" }, bound = false }, -- Iron Shield Spike
    { spell = 8768, skill = 150, creates = 7071, count = 2, source = { "trainer" }, cost = 250 }, -- Iron Buckle
    { spell = 14379, skill = 150, creates = 11128, source = { "trainer" }, cost = 250 }, -- Golden Rod
    { spell = 19667, skill = 150, creates = 15870, count = 2, source = { "trainer" }, cost = 250 }, -- Golden Skeleton Key
    { spell = 3494, skill = 155, creates = 3851, teach = 10858, source = { "vendor" }, bound = false, vendors = { { npc = 1471, area = 45, faction = "Alliance" }, { npc = 8878, area = 405, faction = "Horde" }, { npc = 9179, area = 3 } } }, -- Solid Iron Maul
    { spell = 3506, skill = 155, creates = 3842, source = { "trainer" }, cost = 5000 }, -- Green Iron Leggings
    { spell = 12259, skill = 155, creates = 10423, teach = 10424, source = { "drop" }, bound = false }, -- Silvered Bronze Leggings
    { spell = 3492, skill = 160, creates = 3849, teach = 12162, source = { "vendor" }, bound = false, vendors = { { npc = 2843, area = 33 }, { npc = 3356, area = 1637, faction = "Horde" }, { npc = 5512, area = 1519, faction = "Alliance" } } }, -- Hardened Iron Shortsword
    { spell = 3504, skill = 160, creates = 3840, teach = 3870, source = { "drop" }, bound = false }, -- Green Iron Shoulders
    { spell = 9811, skill = 160, creates = 7913, teach = 7978, source = { "quest" }, bound = false, quests = { { id = 2752, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Shoulders
    { spell = 9813, skill = 160, creates = 7914, teach = 7979, source = { "quest" }, bound = false, quests = { { id = 2751, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Breastplate
    { spell = 3501, skill = 165, creates = 3835, source = { "trainer" }, cost = 1000 }, -- Green Iron Bracers
    { spell = 7222, skill = 165, creates = 6043, teach = 6045, source = { "drop" }, bound = false }, -- Iron Counterweight
    { spell = 3495, skill = 170, creates = 3852, teach = 3867, source = { "drop" }, bound = false }, -- Golden Iron Destroyer
    { spell = 3502, skill = 170, creates = 3836, source = { "trainer" }, cost = 1250 }, -- Green Iron Helm
    { spell = 3507, skill = 170, creates = 3843, teach = 3872, source = { "drop" }, bound = false }, -- Golden Scale Leggings
    { spell = 3493, skill = 175, creates = 3850, teach = 3866, source = { "drop" }, bound = false }, -- Jade Serpentblade
    { spell = 3505, skill = 175, creates = 3841, teach = 3871, source = { "drop" }, bound = false }, -- Golden Scale Shoulders
    { spell = 9814, skill = 175, creates = 7915, teach = 7980, source = { "quest" }, bound = false, quests = { { id = 2754, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Helm
    { spell = 3496, skill = 180, creates = 3853, teach = 12163, source = { "vendor" }, bound = false, vendors = { { npc = 2482, area = 33 } } }, -- Moonsteel Broadsword
    { spell = 3508, skill = 180, creates = 3844, source = { "trainer" }, cost = 7500 }, -- Green Iron Hauberk
    { spell = 9818, skill = 180, creates = 7916, teach = 7981, source = { "quest" }, bound = false, quests = { { id = 2753, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Boots
    { spell = 15972, skill = 180, creates = 12259, source = { "trainer" }, cost = 7500 }, -- Glinting Steel Dagger
    { spell = 3498, skill = 185, creates = 3855, teach = 12164, source = { "vendor" }, bound = false, vendors = { { npc = 1146, area = 33, faction = "Horde" }, { npc = 2483, area = 33 } } }, -- Massive Iron Axe
    { spell = 3513, skill = 185, creates = 3846, teach = 3874, source = { "drop" }, bound = false }, -- Polished Steel Boots
    { spell = 7223, skill = 185, creates = 6040, source = { "trainer" }, cost = 1000 }, -- Golden Scale Bracers
    { spell = 9820, skill = 185, creates = 7917, teach = 7982, source = { "quest" }, bound = false, quests = { { id = 2755, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Gloves
    { spell = 3503, skill = 190, creates = 3837, teach = 6047, source = { "vendor" }, bound = false, vendors = { { npc = 5411, area = 440 } } }, -- Golden Scale Coif
    { spell = 7224, skill = 190, creates = 6041, teach = 6046, source = { "drop" }, bound = false }, -- Steel Weapon Chain
    { spell = 15973, skill = 190, creates = 12260, teach = 12261, source = { "drop" }, bound = false }, -- Searing Golden Blade
    { spell = 21913, skill = 190, creates = 17704, teach = 17706, source = { "drop" }, bound = false }, -- Edge of Winter
    { spell = 3511, skill = 195, creates = 3845, teach = 3873, source = { "drop" }, bound = false }, -- Golden Scale Cuirass
    { spell = 3497, skill = 200, creates = 3854, teach = 3868, source = { "drop" }, bound = false }, -- Frost Tiger Blade
    { spell = 3500, skill = 200, creates = 3856, teach = 3869, source = { "drop" }, bound = false }, -- Shadow Crescent Axe
    { spell = 3515, skill = 200, creates = 3847, teach = 3875, source = { "drop" }, bound = false }, -- Golden Scale Boots
    { spell = 9785, skill = 200, rank = "Artisan", level = 35, source = { "trainer" }, cost = 50000 }, -- Blacksmithing (Artisan)
    { spell = 9916, skill = 200, creates = 7963, source = { "trainer" }, cost = 2500 }, -- Steel Breastplate
    { spell = 9918, skill = 200, creates = 7964, source = { "trainer" }, cost = 2500 }, -- Solid Sharpening Stone
    { spell = 9920, skill = 200, creates = 7966, source = { "trainer" }, cost = 2500 }, -- Solid Grinding Stone
    { spell = 9921, skill = 200, creates = 7965, source = { "trainer" }, cost = 2500 }, -- Solid Weightstone
    { spell = 11454, skill = 200, creates = 9060, teach = 10713, source = { "crafted" }, bound = false }, -- Inlaid Mithril Cylinder
    { spell = 14380, skill = 200, creates = 11144, source = { "trainer" }, cost = 2500 }, -- Truesilver Rod
    { spell = 19668, skill = 200, creates = 15871, count = 2, source = { "trainer" }, cost = 2500 }, -- Truesilver Skeleton Key
    { spell = 9926, skill = 205, creates = 7918, source = { "trainer" }, cost = 5000 }, -- Heavy Mithril Shoulder
    { spell = 9928, skill = 205, creates = 7919, source = { "trainer" }, cost = 5000 }, -- Heavy Mithril Gauntlet
    { spell = 11643, skill = 205, creates = 9366, teach = 9367, source = { "quest" }, bound = false, quests = { { id = 2758, area = 1519, faction = "Alliance", level = 40 } } }, -- Golden Scale Gauntlets
    { spell = 9931, skill = 210, creates = 7920, source = { "trainer" }, cost = 5000 }, -- Mithril Scale Pants
    { spell = 9933, skill = 210, creates = 7921, teach = 7975, source = { "drop" }, bound = false }, -- Heavy Mithril Pants
    { spell = 9993, skill = 210, creates = 7941, source = { "trainer" }, cost = 10000 }, -- Heavy Mithril Axe
    { spell = 9935, skill = 215, creates = 7922, source = { "trainer" }, cost = 5000 }, -- Steel Plate Helm
    { spell = 9937, skill = 215, creates = 7924, teach = 7995, source = { "vendor" }, bound = false, vendors = { { npc = 8161, area = 47, faction = "Alliance" }, { npc = 8176, area = 8, faction = "Horde" } } }, -- Mithril Scale Bracers
    { spell = 9939, skill = 215, creates = 7967, teach = 7976, source = { "drop" }, bound = false }, -- Mithril Shield Spike
    { spell = 9945, skill = 220, creates = 7926, teach = 7983, source = { "quest" }, bound = true, quests = { { id = 2761, area = 33, level = 40 } } }, -- Ornate Mithril Pants
    { spell = 9950, skill = 220, creates = 7927, teach = 7984, source = { "quest" }, bound = true, quests = { { id = 2762, area = 33, level = 40 } } }, -- Ornate Mithril Gloves
    { spell = 9995, skill = 220, creates = 7942, teach = 7992, source = { "drop" }, bound = false }, -- Blue Glittering Axe
    { spell = 9952, skill = 225, creates = 7928, teach = 7985, source = { "quest" }, bound = true, quests = { { id = 2763, area = 33, level = 40 } } }, -- Ornate Mithril Shoulders
    { spell = 9954, skill = 225, creates = 7938, source = { "trainer" }, cost = 9000 }, -- Truesilver Gauntlets
    { spell = 9997, skill = 225, creates = 7943, teach = 8029, source = { "drop" }, bound = true }, -- Wicked Mithril Blade
    { spell = 9957, skill = 230, creates = 7929, teach = 7994, source = { "quest" }, bound = true, quests = { { id = 2756, area = 1637, faction = "Horde", level = 40 } } }, -- Orcish War Leggings
    { spell = 9959, skill = 230, creates = 7930, source = { "trainer" }, cost = 15000 }, -- Heavy Mithril Breastplate
    { spell = 9961, skill = 230, creates = 7931, source = { "trainer" }, cost = 15000 }, -- Mithril Coif
    { spell = 10001, skill = 230, creates = 7945, source = { "trainer" }, cost = 15000 }, -- Big Black Mace
    { spell = 9964, skill = 235, creates = 7969, teach = 7989, source = { "drop" }, bound = false }, -- Mithril Spurs
    { spell = 9966, skill = 235, creates = 7932, teach = 7991, source = { "drop" }, bound = false }, -- Mithril Scale Shoulders
    { spell = 9968, skill = 235, creates = 7933, source = { "trainer" }, cost = 20000 }, -- Heavy Mithril Boots
    { spell = 10003, skill = 235, creates = 7954, source = { "trainer" }, cost = 13500 }, -- The Shatterer
    { spell = 9972, skill = 240, creates = 7935, teach = 7986, source = { "quest" }, bound = true, quests = { { id = 2773, area = 440, level = 40 } } }, -- Ornate Mithril Breastplate
    { spell = 10005, skill = 240, creates = 7944, teach = 7993, source = { "drop" }, bound = false }, -- Dazzling Mithril Rapier
    { spell = 9970, skill = 245, creates = 7934, teach = 7990, source = { "drop" }, bound = false }, -- Heavy Mithril Helm
    { spell = 9974, skill = 245, creates = 7939, source = { "trainer" }, cost = 9000 }, -- Truesilver Breastplate
    { spell = 9979, skill = 245, creates = 7936, teach = 7988, source = { "quest" }, bound = true, quests = { { id = 2772, area = 440, level = 40 } } }, -- Ornate Mithril Boots
    { spell = 9980, skill = 245, creates = 7937, teach = 7987, source = { "quest" }, bound = true, quests = { { id = 2771, area = 440, level = 40 } } }, -- Ornate Mithril Helm
    { spell = 10007, skill = 245, creates = 7961, source = { "trainer" }, cost = 13500 }, -- Phantom Blade
    { spell = 10009, skill = 245, creates = 7946, teach = 8028, source = { "drop" }, bound = false }, -- Runed Mithril Hammer
    { spell = 10011, skill = 250, creates = 7959, source = { "trainer" }, cost = 13500 }, -- Blight
    { spell = 16639, skill = 250, creates = 12644, source = { "trainer" }, cost = 10000 }, -- Dense Grinding Stone
    { spell = 16640, skill = 250, creates = 12643, source = { "trainer" }, cost = 10000 }, -- Dense Weightstone
    { spell = 16641, skill = 250, creates = 12404, source = { "trainer" }, cost = 10000 }, -- Dense Sharpening Stone
    { spell = 16642, skill = 250, creates = 12405, teach = 12682, source = { "drop" }, bound = false }, -- Thorium Armor
    { spell = 16643, skill = 250, creates = 12406, teach = 12683, source = { "drop" }, bound = false }, -- Thorium Belt
    { spell = 10013, skill = 255, creates = 7947, teach = 8030, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Ebon Shiv
    { spell = 16644, skill = 255, creates = 12408, teach = 12684, source = { "drop" }, bound = false }, -- Thorium Bracers
    { spell = 10015, skill = 260, creates = 7960, source = { "trainer" }, cost = 13500 }, -- Truesilver Champion
    { spell = 16645, skill = 260, creates = 12416, teach = 12685, source = { "drop" }, bound = false }, -- Radiant Belt
    { spell = 15292, skill = 265, creates = 11608, teach = 11610, source = { "drop" }, bound = false }, -- Dark Iron Pulverizer
    { spell = 16646, skill = 265, creates = 12428, teach = 12687, source = { "quest" }, bound = true, quests = { { id = 7659, area = 440, level = 50 } } }, -- Imperial Plate Shoulders
    { spell = 16647, skill = 265, creates = 12424, teach = 12688, source = { "quest" }, bound = true, quests = { { id = 7653, area = 440, level = 50 } } }, -- Imperial Plate Belt
    { spell = 15293, skill = 270, creates = 11606, teach = 11614, source = { "drop" }, bound = true }, -- Dark Iron Mail
    { spell = 16648, skill = 270, creates = 12415, teach = 12689, source = { "drop" }, bound = false }, -- Radiant Breastplate
    { spell = 16649, skill = 270, creates = 12425, teach = 12690, source = { "quest" }, bound = true, quests = { { id = 7655, area = 440, level = 50 } } }, -- Imperial Plate Bracers
    { spell = 16650, skill = 270, creates = 12624, teach = 12691, source = { "drop" }, bound = false }, -- Wildthorn Mail
    { spell = 15294, skill = 275, creates = 11607, teach = 11611, source = { "drop" }, bound = false }, -- Dark Iron Sunderer
    { spell = 16651, skill = 275, creates = 12645, teach = 12692, source = { "drop" }, bound = false }, -- Thorium Shield Spike
    { spell = 16969, skill = 275, creates = 12773, teach = 12819, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Ornate Thorium Handaxe
    { spell = 16970, skill = 275, creates = 12774, teach = 12821, source = { "quest" }, bound = false, quests = { { id = 5306, area = 618, level = 50 }, { id = 85699, area = 618, level = 50 } } }, -- Dawn's Edge
    { spell = 19669, skill = 275, creates = 15872, count = 2, source = { "trainer" }, cost = 10000 }, -- Arcanite Skeleton Key
    { spell = 20201, skill = 275, creates = 16206, source = { "trainer" }, cost = 10000 }, -- Arcanite Rod
    { spell = 15295, skill = 280, creates = 11605, teach = 11615, source = { "drop" }, bound = true }, -- Dark Iron Shoulders
    { spell = 16652, skill = 280, creates = 12409, teach = 12693, source = { "drop" }, bound = false }, -- Thorium Boots
    { spell = 16653, skill = 280, creates = 12410, teach = 12694, source = { "drop" }, bound = false }, -- Thorium Helm
    { spell = 16971, skill = 280, creates = 12775, teach = 12823, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Huge Thorium Battleaxe
    { spell = 16973, skill = 280, creates = 12776, teach = 12824, source = { "quest" }, bound = false, quests = { { id = 5305, area = 618, level = 50 }, { id = 8869, area = 618, level = 50 } } }, -- Enchanted Battlehammer
    { spell = 16978, skill = 280, creates = 12777, teach = 12825, source = { "quest" }, bound = false, quests = { { id = 5307, area = 618, level = 50 }, { id = 85700, area = 618, level = 50 } } }, -- Blazing Rapier
    { spell = 15296, skill = 285, creates = 11604, teach = 11612, source = { "drop" }, bound = false }, -- Dark Iron Plate
    { spell = 16654, skill = 285, creates = 12418, teach = 12695, source = { "drop" }, bound = false }, -- Radiant Gloves
    { spell = 16667, skill = 285, creates = 12628, teach = 12696, source = { "quest" }, bound = true, quests = { { id = 5127, area = 618, level = 55 } } }, -- Demon Forged Breastplate
    { spell = 16983, skill = 285, creates = 12781, teach = 12827, source = { "drop" }, bound = false }, -- Serenity
    { spell = 16655, skill = 290, creates = 12631, teach = 12699, source = { "quest" }, bound = true, quests = { { id = 5124, area = 618, level = 55 } } }, -- Fiery Plate Gauntlets
    { spell = 16656, skill = 290, creates = 12419, teach = 12697, source = { "drop" }, bound = false }, -- Radiant Boots
    { spell = 16660, skill = 290, creates = 12625, teach = 12698, source = { "vendor" }, bound = false, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Dawnbringer Shoulders
    { spell = 16984, skill = 290, creates = 12792, teach = 12828, source = { "drop" }, bound = false }, -- Volcanic Hammer
    { spell = 16985, skill = 290, creates = 12782, teach = 12830, source = { "drop" }, bound = false }, -- Corruption
    { spell = 23628, skill = 290, creates = 19043, teach = 19202, reputation = { 576, 6, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Heavy Timbermaw Belt
    { spell = 23632, skill = 290, creates = 19051, teach = 19203, reputation = { 529, 6, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Girdle of the Dawn
    { spell = 16657, skill = 295, creates = 12426, teach = 12700, source = { "quest" }, bound = true, quests = { { id = 7654, area = 440, level = 50 } } }, -- Imperial Plate Boots
    { spell = 16658, skill = 295, creates = 12427, teach = 12701, source = { "quest" }, bound = true, quests = { { id = 7657, area = 440, level = 50 } } }, -- Imperial Plate Helm
    { spell = 16659, skill = 295, creates = 12417, teach = 12702, source = { "drop" }, bound = false }, -- Radiant Circlet
    { spell = 16661, skill = 295, creates = 12632, teach = 12703, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 11278, area = 28 } } }, -- Storm Gauntlets
    { spell = 20872, skill = 295, creates = 16989, teach = 17049, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Fiery Chain Girdle
    { spell = 20874, skill = 295, creates = 17014, teach = 17051, reputation = { 59, 5, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Bracers
    { spell = 16662, skill = 300, creates = 12414, teach = 12704, source = { "drop" }, bound = false }, -- Thorium Leggings
    { spell = 16663, skill = 300, creates = 12422, teach = 12705, source = { "quest" }, bound = true, quests = { { id = 7656, area = 440, level = 50 } } }, -- Imperial Plate Chest
    { spell = 16664, skill = 300, creates = 12610, teach = 12706, source = { "drop" }, bound = true }, -- Runic Plate Shoulders
    { spell = 16665, skill = 300, creates = 12611, teach = 12707, source = { "drop" }, bound = true }, -- Runic Plate Boots
    { spell = 16724, skill = 300, creates = 12633, teach = 12711, source = { "drop" }, bound = false }, -- Whitesoul Helm
    { spell = 16725, skill = 300, creates = 12420, teach = 12713, source = { "drop" }, bound = false }, -- Radiant Leggings
    { spell = 16726, skill = 300, creates = 12612, teach = 12714, source = { "drop" }, bound = true }, -- Runic Plate Helm
    { spell = 16728, skill = 300, creates = 12636, teach = 12716, source = { "drop" }, bound = false }, -- Helm of the Great Chief
    { spell = 16729, skill = 300, creates = 12640, teach = 12717, source = { "drop" }, bound = false }, -- Lionheart Helm
    { spell = 16730, skill = 300, creates = 12429, teach = 12715, source = { "quest" }, bound = true, quests = { { id = 7658, area = 440, level = 50 } } }, -- Imperial Plate Leggings
    { spell = 16731, skill = 300, creates = 12613, teach = 12718, source = { "drop" }, bound = true }, -- Runic Breastplate
    { spell = 16732, skill = 300, creates = 12614, teach = 12719, source = { "drop" }, bound = true }, -- Runic Plate Leggings
    { spell = 16741, skill = 300, creates = 12639, teach = 12720, source = { "drop" }, bound = false }, -- Stronghold Gauntlets
    { spell = 16742, skill = 300, creates = 12620, teach = 12725, source = { "quest" }, bound = true, quests = { { id = 7651, area = 2557, level = 50 } } }, -- Enchanted Thorium Helm
    { spell = 16744, skill = 300, creates = 12619, teach = 12726, source = { "quest" }, bound = true, quests = { { id = 7650, area = 2557, level = 50 } } }, -- Enchanted Thorium Leggings
    { spell = 16745, skill = 300, creates = 12618, teach = 12727, source = { "quest" }, bound = true, quests = { { id = 7649, area = 2557, level = 50 } } }, -- Enchanted Thorium Breastplate
    { spell = 16746, skill = 300, creates = 12641, teach = 12728, source = { "drop" }, bound = false }, -- Invulnerable Mail
    { spell = 16988, skill = 300, creates = 12796, teach = 12833, source = { "drop" }, bound = false }, -- Hammer of the Titans
    { spell = 16990, skill = 300, creates = 12790, teach = 12834, source = { "drop" }, bound = false }, -- Arcanite Champion
    { spell = 16991, skill = 300, creates = 12798, teach = 12835, source = { "drop" }, bound = false }, -- Annihilator
    { spell = 16992, skill = 300, creates = 12797, teach = 12836, source = { "drop" }, bound = false }, -- Frostguard
    { spell = 16993, skill = 300, creates = 12794, teach = 12837, source = { "drop" }, bound = false }, -- Masterwork Stormhammer
    { spell = 16994, skill = 300, creates = 12784, teach = 12838, source = { "drop" }, bound = false }, -- Arcanite Reaper
    { spell = 16995, skill = 300, creates = 12783, teach = 12839, source = { "drop" }, bound = false }, -- Heartseeker
    { spell = 20873, skill = 300, creates = 16988, teach = 17053, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Fiery Chain Shoulders
    { spell = 20876, skill = 300, creates = 17013, teach = 17052, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Leggings
    { spell = 20890, skill = 300, creates = 17015, teach = 17059, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Reaver
    { spell = 20897, skill = 300, creates = 17016, teach = 17060, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Destroyer
    { spell = 21161, skill = 300, creates = 17193, teach = 18592, source = { "quest" }, bound = false, quests = { { id = 7604, area = 1584, level = 60 } } }, -- Sulfuron Hammer
    { spell = 22757, skill = 300, creates = 18262, teach = 18264, source = { "drop" }, bound = true }, -- Elemental Sharpening Stone
    { spell = 23629, skill = 300, creates = 19048, teach = 19204, reputation = { 576, 7, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Heavy Timbermaw Boots
    { spell = 23633, skill = 300, creates = 19057, teach = 19205, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Gloves of the Dawn
    { spell = 23636, skill = 300, creates = 19148, teach = 19206, reputation = { 59, 6, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Helm
    { spell = 23637, skill = 300, creates = 19164, teach = 19207, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Gauntlets
    { spell = 23638, skill = 300, creates = 19166, teach = 19208, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Black Amnesty
    { spell = 23639, skill = 300, creates = 19167, teach = 19209, reputation = { 59, 7, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Blackfury
    { spell = 23650, skill = 300, creates = 19170, teach = 19210, reputation = { 59, 8, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Ebon Hand
    { spell = 23652, skill = 300, creates = 19168, teach = 19211, reputation = { 59, 8, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Blackguard
    { spell = 23653, skill = 300, creates = 19169, teach = 19212, reputation = { 59, 8, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Nightfall
    { spell = 24136, skill = 300, creates = 19690, teach = 19776, reputation = { 270, 7, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodsoul Breastplate
    { spell = 24137, skill = 300, creates = 19691, teach = 19777, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodsoul Shoulders
    { spell = 24138, skill = 300, creates = 19692, teach = 19778, reputation = { 270, 5, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodsoul Gauntlets
    { spell = 24139, skill = 300, creates = 19693, teach = 19779, reputation = { 270, 7, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Darksoul Breastplate
    { spell = 24140, skill = 300, creates = 19694, teach = 19780, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Darksoul Leggings
    { spell = 24141, skill = 300, creates = 19695, teach = 19781, reputation = { 270, 5, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Darksoul Shoulders
    { spell = 24399, skill = 300, creates = 20039, teach = 20040, reputation = { 59, 8, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Boots
    { spell = 24912, skill = 300, creates = 20549, teach = 20553, source = { "drop" }, bound = false }, -- Darkrune Gauntlets
    { spell = 24913, skill = 300, creates = 20551, teach = 20555, source = { "drop" }, bound = false }, -- Darkrune Helm
    { spell = 24914, skill = 300, creates = 20550, teach = 20554, source = { "drop" }, bound = false }, -- Darkrune Breastplate
    { spell = 27585, skill = 300, creates = 22197, teach = 22209, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Heavy Obsidian Belt
    { spell = 27586, skill = 300, creates = 22198, teach = 22219, source = { "vendor" }, bound = true, vendors = { { npc = 15471, area = 3429 } } }, -- Jagged Obsidian Shield
    { spell = 27587, skill = 300, creates = 22196, teach = 22222, source = { "drop" }, bound = false }, -- Thick Obsidian Breastplate
    { spell = 27588, skill = 300, creates = 22195, teach = 22214, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Light Obsidian Belt
    { spell = 27589, skill = 300, creates = 22194, teach = 22220, source = { "drop" }, bound = false }, -- Black Grasp of the Destroyer
    { spell = 27590, skill = 300, creates = 22191, teach = 22221, source = { "vendor" }, bound = true, vendors = { { npc = 15471, area = 3429 } } }, -- Obsidian Mail Tunic
    { spell = 27829, skill = 300, creates = 22385, teach = 22388, source = { "drop" }, bound = false }, -- Titanic Leggings
    { spell = 27830, skill = 300, creates = 22384, teach = 22390, source = { "drop" }, bound = false }, -- Persuader
    { spell = 27832, skill = 300, creates = 22383, teach = 22389, source = { "drop" }, bound = false }, -- Sageblade
    { spell = 28242, skill = 300, creates = 22669, teach = 22703, reputation = { 529, 8, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Icebane Breastplate
    { spell = 28243, skill = 300, creates = 22670, teach = 22704, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Icebane Gauntlets
    { spell = 28244, skill = 300, creates = 22671, teach = 22705, reputation = { 529, 7, ns.L.FACTION_529 }, source = { "trainer" }, bound = true }, -- Icebane Bracers
    { spell = 28461, skill = 300, creates = 22762, teach = 22766, source = { "vendor" }, reputation = { 609, 7, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Ironvine Breastplate
    { spell = 28462, skill = 300, creates = 22763, teach = 22767, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Ironvine Gloves
    { spell = 28463, skill = 300, creates = 22764, teach = 22768, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Ironvine Belt
}
