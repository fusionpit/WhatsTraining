local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[164] = {
    { spell = 2660, skill = 1, creates = 2862 }, -- Rough Sharpening Stone
    { spell = 2662, skill = 15, creates = 2852, source = { "trainer" }, cost = 50 }, -- Copper Chain Pants
    { spell = 2663, skill = 1, creates = 2853 }, -- Copper Bracers
    { spell = 3115, skill = 1, creates = 3239 }, -- Rough Weightstone
    { spell = 12260, skill = 1, creates = 10421 }, -- Rough Copper Vest
    { spell = 1245287, skill = 10, creates = 6217 }, -- Copper Rod
    { spell = 2737, skill = 15, creates = 2844, source = { "trainer" }, cost = 50 }, -- Copper Mace
    { spell = 2738, skill = 20, creates = 2845, source = { "trainer" }, cost = 50 }, -- Copper Axe
    { spell = 3319, skill = 20, creates = 3469, source = { "trainer" }, cost = 50 }, -- Copper Chain Boots
    { spell = 1230171, skill = 20, creates = 279944, source = { "trainer" }, cost = 100 }, -- Sharpening Wheel
    { spell = 2739, skill = 25, creates = 2847, source = { "trainer" }, cost = 50 }, -- Copper Shortsword
    { spell = 3320, skill = 25, creates = 3470, source = { "trainer" }, cost = 100 }, -- Rough Grinding Stone
    { spell = 8880, skill = 25, creates = 7166, source = { "trainer" }, cost = 100 }, -- Copper Dagger
    { spell = 9983, skill = 25, creates = 7955, source = { "trainer" }, cost = 100 }, -- Copper Claymore
    { spell = 2661, skill = 30, creates = 2851, source = { "trainer" }, cost = 100 }, -- Copper Chain Belt
    { spell = 3293, skill = 30, creates = 3488, source = { "trainer" }, cost = 250 }, -- Copper Battle Axe
    { spell = 3321, skill = 30, creates = 3471, teach = 3609, source = { "drop", "quest" }, bound = false, quests = { { id = 1578, area = 1537, faction = "Alliance", level = 1 } } }, -- Copper Chain Vest
    { spell = 1252229, skill = 35, creates = 250620, teach = 251332, source = { "trainer" }, cost = 100, bound = true }, -- Gemmed Copper Boots
    { spell = 1252230, skill = 35, creates = 250621, teach = 251333, source = { "trainer" }, cost = 100, bound = true }, -- Strange Copper Boots
    { spell = 1252231, skill = 35, creates = 250482, teach = 251334, source = { "trainer" }, cost = 100, bound = true }, -- Glowing Copper Boots
    { spell = 3323, skill = 35, creates = 3472, source = { "trainer" }, cost = 100 }, -- Runed Copper Gauntlets
    { spell = 3324, skill = 35, creates = 3473, source = { "trainer" }, cost = 200 }, -- Runed Copper Pants
    { spell = 1252262, skill = 45, creates = 250513, teach = 251365, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Veteran's Chain Belt
    { spell = 1252263, skill = 45, creates = 250514, teach = 251366, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Guard's Chain Belt
    { spell = 1252264, skill = 45, creates = 250515, teach = 251367, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Protector's Chain Belt
    { spell = 1252265, skill = 45, creates = 250516, teach = 251368, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Acolyte's Chain Belt
    { spell = 1252266, skill = 45, creates = 250517, teach = 251369, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Crusader's Chain Belt
    { spell = 3100, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 10 }, -- Blacksmithing (Journeyman)
    { spell = 1301422, skill = 50, creates = 276993, teach = 276929, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Skyforged Wristguards
    { spell = 1301424, skill = 50, creates = 276995, teach = 276931, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Skyforged Chain
    { spell = 1301446, skill = 50, creates = 277017, teach = 276953, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Skyforged Wristguards
    { spell = 1301448, skill = 50, creates = 277019, teach = 276955, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Skyforged Chain
    { spell = 1302598, skill = 50, creates = 277672, teach = 277673, source = { "quest" }, bound = true, quests = { { id = 95217, area = 1, faction = "Alliance", level = 7 }, { id = 96874, area = 1637, faction = "Horde", level = 6 } } }, -- Rough Copper Chain Boots
    { spell = 1301423, skill = 55, creates = 276994, teach = 276930, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Skyforged Gauntlets
    { spell = 1301426, skill = 55, creates = 276997, teach = 276933, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Skyforged Greaves
    { spell = 1301447, skill = 55, creates = 277018, teach = 276954, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Skyforged Gauntlets
    { spell = 1301450, skill = 55, creates = 277021, teach = 276957, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Skyforged Greaves
    { spell = 3325, skill = 35, creates = 3474, teach = 3610, source = { "drop" }, bound = false }, -- Gemmed Copper Gauntlets
    { spell = 1301421, skill = 60, creates = 276992, teach = 276928, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Skyforged Chainmail
    { spell = 1301425, skill = 60, creates = 276996, teach = 276932, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Skyforged Legguards
    { spell = 1301445, skill = 60, creates = 277016, teach = 276952, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Skyforged Chainmail
    { spell = 1301449, skill = 60, creates = 277020, teach = 276956, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Skyforged Legguards
    { spell = 2665, skill = 40, creates = 2863, source = { "trainer" }, cost = 100 }, -- Coarse Sharpening Stone
    { spell = 3116, skill = 40, creates = 3240, source = { "trainer" }, cost = 100 }, -- Coarse Weightstone
    { spell = 7408, skill = 40, creates = 6214, source = { "trainer" }, cost = 300 }, -- Heavy Copper Maul
    { spell = 2666, skill = 45, creates = 2857, source = { "trainer" }, cost = 200 }, -- Runed Copper Belt
    { spell = 3294, skill = 45, creates = 3489, source = { "trainer" }, cost = 500 }, -- Thick War Axe
    { spell = 3326, skill = 50, creates = 3478, source = { "trainer" }, cost = 250 }, -- Coarse Grinding Stone
    { spell = 2667, skill = 80, creates = 2864, teach = 2881, source = { "drop" }, bound = false }, -- Runed Copper Breastplate
    { spell = 1252238, skill = 80, creates = 250489, teach = 251341, source = { "drop" }, bound = true }, -- Guard's Chain Shirt
    { spell = 1252257, skill = 80, creates = 250508, teach = 251360, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Veteran's Gloves
    { spell = 1252258, skill = 80, creates = 250509, teach = 251361, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Guard's Gloves
    { spell = 1252259, skill = 80, creates = 250510, teach = 251362, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Protector's Gloves
    { spell = 1252260, skill = 80, creates = 250511, teach = 251363, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Acolyte's Gloves
    { spell = 1252261, skill = 80, creates = 250512, teach = 251364, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Crusader's Gloves
    { spell = 1252351, skill = 80, creates = 250602, teach = 251454, source = { "drop" }, bound = true }, -- Brass Knuckles
    { spell = 1252237, skill = 85, creates = 250488 }, -- Veteran's Chain Shirt
    { spell = 1252239, skill = 85, creates = 250490 }, -- Protector's Chain Shirt
    { spell = 1252240, skill = 85, creates = 250491 }, -- Acolyte's Chain Shirt
    { spell = 1252241, skill = 85, creates = 250492 }, -- Crusader's Chain Shirt
    { spell = 1252252, skill = 85, creates = 250503, teach = 251355, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Veteran's Boots
    { spell = 1252253, skill = 85, creates = 250504, teach = 251356, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Guard's Boots
    { spell = 1252254, skill = 85, creates = 250505, teach = 251357, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Protector's Boots
    { spell = 1252255, skill = 85, creates = 250506, teach = 251358, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Acolyte's Boots
    { spell = 1252256, skill = 85, creates = 250507, teach = 251359, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Crusader's Boots
    { spell = 2664, skill = 65, creates = 2854, source = { "trainer" }, cost = 500 }, -- Runed Copper Bracers
    { spell = 3292, skill = 70, creates = 3487, source = { "trainer" }, cost = 500 }, -- Heavy Copper Broadsword
    { spell = 7817, skill = 70, creates = 6350, source = { "trainer" }, cost = 200 }, -- Rough Bronze Boots
    { spell = 1252277, skill = 95, creates = 250528, teach = 251380, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Veteran's Silvered Chain Helm
    { spell = 1252278, skill = 95, creates = 250529, teach = 251381, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Guard's Silvered Chain Helm
    { spell = 1252279, skill = 95, creates = 250530, teach = 251382, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Protector's Silvered Chain Helm
    { spell = 1252280, skill = 95, creates = 250531, teach = 251383, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Acolyte's Silvered Chain Helm
    { spell = 1252281, skill = 95, creates = 250532, teach = 251384, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Crusader's Silvered Chain Helm
    { spell = 1252352, skill = 95, creates = 250603, teach = 251455, source = { "drop" }, bound = true }, -- Bronze Dory
    { spell = 7818, skill = 75, creates = 6338, source = { "trainer" }, cost = 100 }, -- Silver Rod
    { spell = 8367, skill = 100, creates = 6731, teach = 6735, source = { "quest" }, bound = false, quests = { { id = 1618, area = 1537, faction = "Alliance", level = 1 } } }, -- Ironforge Breastplate
    { spell = 19666, skill = 75, creates = 15869, count = 2, source = { "trainer" }, cost = 100 }, -- Silver Skeleton Key
    { spell = 430397, skill = 100, creates = 211845 }, -- Blackfathom Sharpening Stone
    { spell = 1252232, skill = 100, creates = 250483, teach = 251335, source = { "drop" }, bound = true }, -- Sterling Silver Boots
    { spell = 1252242, skill = 100, creates = 250493 }, -- Veteran's Chain Leggings
    { spell = 1252243, skill = 100, creates = 250494 }, -- Guard's Chain Leggings
    { spell = 1252244, skill = 100, creates = 250495 }, -- Protector's Chain Leggings
    { spell = 1252245, skill = 100, creates = 250496 }, -- Acolyte's Chain Leggings
    { spell = 1252246, skill = 100, creates = 250497 }, -- Crusader's Chain Leggings
    { spell = 2668, skill = 80, creates = 2865, source = { "trainer" }, cost = 300 }, -- Rough Bronze Leggings
    { spell = 2670, skill = 80, creates = 2866, source = { "trainer" }, cost = 500 }, -- Rough Bronze Cuirass
    { spell = 3491, skill = 80, creates = 3848, source = { "trainer" }, cost = 600 }, -- Big Bronze Knife
    { spell = 1252233, skill = 105, creates = 250484, teach = 251336, source = { "drop" }, bound = true }, -- Sterling Silver Leggings
    { spell = 1252234, skill = 105, creates = 250485, teach = 251337, source = { "drop" }, bound = true }, -- Sterling Silver Gauntlet
    { spell = 2740, skill = 85, creates = 2848, source = { "trainer" }, cost = 200 }, -- Bronze Mace
    { spell = 3328, skill = 85, creates = 3480, source = { "trainer" }, cost = 500 }, -- Rough Bronze Shoulders
    { spell = 6517, skill = 85, creates = 5540, source = { "trainer" }, cost = 800 }, -- Pearl-handled Dagger
    { spell = 1252235, skill = 110, creates = 250486, teach = 251338, source = { "drop" }, bound = true }, -- Sterling Silver Shoulders
    { spell = 1252267, skill = 110, creates = 250518, teach = 251370, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Veteran's Silvered Chain Shirt
    { spell = 1252268, skill = 110, creates = 250519, teach = 251371, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Guard's Silvered Chain Shirt
    { spell = 1252269, skill = 110, creates = 250520, teach = 251372, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Protector's Silvered Chain Shirt
    { spell = 1252270, skill = 110, creates = 250521, teach = 251373, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Acolyte's Silvered Chain Shirt
    { spell = 1252271, skill = 110, creates = 250522, teach = 251374, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Crusader's Silvered Chain Shirt
    { spell = 1317962, skill = 110, creates = 285279, teach = 285289, bound = true }, -- Cracked Blacksmith Hammer
    { spell = 2741, skill = 90, creates = 2849, source = { "trainer" }, cost = 200 }, -- Bronze Axe
    { spell = 2672, skill = 95, creates = 2868, source = { "trainer" }, cost = 500 }, -- Patterned Bronze Bracers
    { spell = 2742, skill = 95, creates = 2850, source = { "trainer" }, cost = 200 }, -- Bronze Shortsword
    { spell = 2674, skill = 100, creates = 2871, source = { "trainer" }, cost = 1000 }, -- Heavy Sharpening Stone
    { spell = 3117, skill = 100, creates = 3241, source = { "trainer" }, cost = 1000 }, -- Heavy Weightstone
    { spell = 3295, skill = 125, creates = 3490, teach = 2883, source = { "drop" }, bound = false }, -- Deadly Bronze Poniard
    { spell = 3330, skill = 125, creates = 3481, teach = 2882, source = { "drop" }, bound = false }, -- Silvered Bronze Shoulders
    { spell = 3337, skill = 100, creates = 3486, source = { "trainer" }, cost = 1000 }, -- Heavy Grinding Stone
    { spell = 3538, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 20 }, -- Blacksmithing (Expert)
    { spell = 9985, skill = 100, creates = 7956, source = { "trainer" }, cost = 250 }, -- Bronze Warhammer
    { spell = 1252236, skill = 125, creates = 250487, teach = 251339, source = { "drop" }, bound = true }, -- Sterling Silver Breastplate
    { spell = 1252272, skill = 125, creates = 250523, teach = 251375, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Veteran's Silvered Chain Leggings
    { spell = 1252273, skill = 125, creates = 250524, teach = 251376, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Guard's Silvered Chain Leggings
    { spell = 1252274, skill = 125, creates = 250525, teach = 251377, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Protector's Silvered Chain Leggings
    { spell = 1252275, skill = 125, creates = 250526, teach = 251378, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Acolyte's Silvered Chain Leggings
    { spell = 1252276, skill = 125, creates = 250527, teach = 251379, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Crusader's Silvered Chain Leggings
    { spell = 2673, skill = 130, creates = 2869, teach = 5578, source = { "drop" }, bound = false }, -- Silvered Bronze Breastplate
    { spell = 3296, skill = 105, creates = 3491, source = { "trainer" }, cost = 1000 }, -- Heavy Bronze Mace
    { spell = 3331, skill = 105, creates = 3482, source = { "trainer" }, cost = 500 }, -- Silvered Bronze Boots
    { spell = 9986, skill = 105, creates = 7957, source = { "trainer" }, cost = 500 }, -- Bronze Greatsword
    { spell = 1252247, skill = 130, creates = 250498 }, -- Veteran's Chain Helm
    { spell = 1252248, skill = 130, creates = 250499 }, -- Guard's Chain Helm
    { spell = 1252249, skill = 130, creates = 250500 }, -- Protector's Chain Helm
    { spell = 1252250, skill = 130, creates = 250501 }, -- Acolyte's Chain Helm
    { spell = 1252251, skill = 130, creates = 250502 }, -- Crusader's Chain Helm
    { spell = 1252353, skill = 130, creates = 250604, teach = 251456, source = { "drop" }, bound = true }, -- Iron Fists
    { spell = 3333, skill = 110, creates = 3483, source = { "trainer" }, cost = 1000 }, -- Silvered Bronze Gauntlets
    { spell = 9987, skill = 110, creates = 7958, source = { "trainer" }, cost = 500 }, -- Bronze Battle Axe
    { spell = 6518, skill = 140, creates = 5541, teach = 5543, source = { "drop" }, bound = false }, -- Iridescent Hammer
    { spell = 1263041, skill = 140, creates = 279988, teach = 273086, source = { "drop" }, bound = false }, -- Anvil
    { spell = 2675, skill = 120, creates = 2870, source = { "trainer" }, cost = 1000 }, -- Shining Silver Breastplate
    { spell = 3297, skill = 145, creates = 3492, teach = 3608, source = { "drop" }, bound = false }, -- Mighty Iron Hammer
    { spell = 3334, skill = 145, creates = 3484, teach = 3611, source = { "drop" }, bound = false }, -- Green Iron Boots
    { spell = 1252282, skill = 145, creates = 250533, teach = 251385, source = { "drop" }, bound = true }, -- Hard Gold Cuirass
    { spell = 3336, skill = 150, creates = 3485, teach = 3612, source = { "drop" }, bound = false }, -- Green Iron Gauntlets
    { spell = 7221, skill = 150, creates = 6042, teach = 6044, source = { "drop" }, bound = false }, -- Iron Shield Spike
    { spell = 8768, skill = 125, creates = 7071, count = 2, source = { "trainer" }, cost = 250 }, -- Iron Buckle
    { spell = 14379, skill = 125, creates = 11128, source = { "trainer" }, cost = 250 }, -- Golden Rod
    { spell = 19667, skill = 125, creates = 15870, count = 2, source = { "trainer" }, cost = 250 }, -- Golden Skeleton Key
    { spell = 427061, skill = 150, teach = 210779, source = { "vendor" }, creates = 210773, bound = true, vendors = { { npc = 213077, area = 1519, faction = "Alliance" }, { npc = 214070, area = 1637, faction = "Horde" }, { npc = 214096, area = 1638, faction = "Horde" }, { npc = 214098, area = 1497, faction = "Horde" }, { npc = 214099, area = 1537, faction = "Alliance" }, { npc = 214101, area = 1657, faction = "Alliance" } } }, -- Mantle of the Second War
    { spell = 1252283, skill = 150, creates = 250534, teach = 251386, source = { "drop" }, bound = true }, -- Hard Gold Boots
    { spell = 1252305, skill = 150, creates = 250556, teach = 251408, source = { "trainer" }, cost = 4250, bound = true }, -- Officer's Belt
    { spell = 1252306, skill = 150, creates = 250557, teach = 251409, source = { "trainer" }, cost = 4250, bound = true }, -- Sentinel's Belt
    { spell = 1252307, skill = 150, creates = 250558, teach = 251410, source = { "trainer" }, cost = 4250, bound = true }, -- Warder's Belt
    { spell = 1252308, skill = 150, creates = 250559, teach = 251411, source = { "trainer" }, cost = 4250, bound = true }, -- Prefect's Belt
    { spell = 1252309, skill = 150, creates = 250560, teach = 251412, source = { "trainer" }, cost = 4250, bound = true }, -- Justicar's Belt
    { spell = 3494, skill = 155, creates = 3851, teach = 10858, source = { "vendor" }, bound = true, vendors = { { npc = 1471, area = 45, faction = "Alliance" }, { npc = 8878, area = 405, faction = "Horde" }, { npc = 9179, area = 3 } } }, -- Solid Iron Maul
    { spell = 3506, skill = 130, creates = 3842, source = { "trainer" }, cost = 5000 }, -- Green Iron Leggings
    { spell = 12259, skill = 155, creates = 10423, teach = 10424, source = { "drop" }, bound = false }, -- Silvered Bronze Leggings
    { spell = 3492, skill = 160, creates = 3849, teach = 12162, source = { "vendor" }, bound = false, vendors = { { npc = 2843, area = 33 }, { npc = 3356, area = 1637, faction = "Horde" }, { npc = 5512, area = 1519, faction = "Alliance" } } }, -- Hardened Iron Shortsword
    { spell = 3504, skill = 160, creates = 3840, teach = 3870, source = { "drop" }, bound = false }, -- Green Iron Shoulders
    { spell = 9811, skill = 160, creates = 7913, teach = 7978, source = { "quest" }, bound = false, quests = { { id = 2752, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Shoulders
    { spell = 9813, skill = 160, creates = 7914, teach = 7979, source = { "quest" }, bound = false, quests = { { id = 2751, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Breastplate
    { spell = 1252284, skill = 160, creates = 250535, teach = 251387, bound = true }, -- Hard Gold Bracers
    { spell = 1252354, skill = 160, creates = 250605, teach = 251457, source = { "drop" }, bound = true }, -- Steel Spear
    { spell = 3501, skill = 140, creates = 3835, source = { "trainer" }, cost = 1000 }, -- Green Iron Bracers
    { spell = 7222, skill = 165, creates = 6043, teach = 6045, source = { "drop" }, bound = false }, -- Iron Counterweight
    { spell = 1252285, skill = 165, creates = 250536, teach = 251388, bound = true }, -- Hard Gold Leggings
    { spell = 1252355, skill = 165, creates = 250606, teach = 251458, source = { "quest", "vendor" }, reputation = { 93, 6, ns.L.FACTION_93, 92, 8, ns.L.FACTION_92 }, bound = true, quests = { { id = 92818, area = 405, faction = "Alliance", level = 30 } }, vendors = { { npc = 253139, area = 405 }, { npc = 253140, area = 405 } } }, -- Iron Morningstar
    { spell = 3495, skill = 170, creates = 3852, teach = 3867, source = { "drop" }, bound = false }, -- Golden Iron Destroyer
    { spell = 3502, skill = 145, creates = 3836, source = { "trainer" }, cost = 1250 }, -- Green Iron Helm
    { spell = 3507, skill = 170, creates = 3843, teach = 3872, source = { "drop" }, bound = false }, -- Golden Scale Leggings
    { spell = 439132, skill = 170, teach = 217286, source = { "drop" }, creates = 217285, bound = false }, -- Golden Scale Leggings
    { spell = 1252286, skill = 170, creates = 250537, teach = 251389, source = { "drop" }, bound = true }, -- Hard Gold Coif
    { spell = 3493, skill = 175, creates = 3850, teach = 3866, source = { "drop" }, bound = false }, -- Jade Serpentblade
    { spell = 3505, skill = 175, creates = 3841, teach = 3871, source = { "drop" }, bound = false }, -- Golden Scale Shoulders
    { spell = 9814, skill = 175, creates = 7915, teach = 7980, source = { "quest" }, bound = false, quests = { { id = 2754, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Helm
    { spell = 429348, skill = 175, creates = 210794 }, -- Shifting Silver Breastplate
    { spell = 439130, skill = 175, teach = 217284, source = { "drop" }, creates = 217283, bound = false }, -- Golden Scale Shoulders
    { spell = 1252287, skill = 175, creates = 250538, teach = 251390, source = { "quest", "vendor" }, reputation = { 93, 6, ns.L.FACTION_93, 92, 8, ns.L.FACTION_92 }, bound = true, quests = { { id = 92818, area = 405, faction = "Alliance", level = 30 } }, vendors = { { npc = 253139, area = 405 }, { npc = 253140, area = 405 } } }, -- Hard Gold Gauntlet
    { spell = 1252288, skill = 175, creates = 250539, teach = 251391, source = { "drop" }, bound = true }, -- Hard Gold Pauldrons
    { spell = 1252315, skill = 175, creates = 250566, teach = 251418, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Officer's Gauntlet
    { spell = 1252316, skill = 175, creates = 250567, teach = 251419, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Sentinel's Gauntlet
    { spell = 1252317, skill = 175, creates = 250568, teach = 251420, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Warder's Gauntlet
    { spell = 1252318, skill = 175, creates = 250569, teach = 251421, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Prefect's Gauntlet
    { spell = 1252319, skill = 175, creates = 250570, teach = 251422, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Justicar's Gauntlet
    { spell = 1301526, skill = 175, creates = 277040, teach = 276976, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", bound = true, vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Skyforged Helm
    { spell = 1301527, skill = 175, creates = 277041, teach = 276977, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", bound = true, vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Skyforged Pauldrons
    { spell = 1301534, skill = 175, creates = 277048, teach = 276984, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", bound = true, vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Skyforged Helm
    { spell = 1301535, skill = 175, creates = 277049, teach = 276985, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", bound = true, vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Skyforged Pauldrons
    { spell = 3496, skill = 180, creates = 3853, teach = 12163, source = { "vendor" }, bound = true, vendors = { { npc = 2482, area = 33 } } }, -- Moonsteel Broadsword
    { spell = 3508, skill = 155, creates = 3844, source = { "trainer" }, cost = 7500 }, -- Green Iron Hauberk
    { spell = 9818, skill = 180, creates = 7916, teach = 7981, source = { "quest" }, bound = false, quests = { { id = 2753, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Boots
    { spell = 15972, skill = 155, creates = 12259, source = { "trainer" }, cost = 7500 }, -- Glinting Steel Dagger
    { spell = 439128, skill = 180, teach = 217282, source = { "vendor" }, creates = 217281, bound = false, vendors = { { npc = 2482, area = 33 } } }, -- Moonsteel Broadsword
    { spell = 1252356, skill = 180, creates = 250607, teach = 251459, source = { "drop" }, bound = true }, -- Mithril Shortsword
    { spell = 3498, skill = 185, creates = 3855, teach = 12164, source = { "vendor" }, bound = true, vendors = { { npc = 1146, area = 33, faction = "Horde" }, { npc = 2483, area = 33 } } }, -- Massive Iron Axe
    { spell = 3513, skill = 185, creates = 3846, teach = 3874, source = { "drop" }, bound = false }, -- Polished Steel Boots
    { spell = 7223, skill = 160, creates = 6040, source = { "trainer" }, cost = 1000 }, -- Golden Scale Bracers
    { spell = 9820, skill = 185, creates = 7917, teach = 7982, source = { "quest" }, bound = false, quests = { { id = 2755, area = 1637, faction = "Horde", level = 32 } } }, -- Barbaric Iron Gloves
    { spell = 3503, skill = 190, creates = 3837, teach = 6047, source = { "vendor" }, bound = true, vendors = { { npc = 5411, area = 440 } } }, -- Golden Scale Coif
    { spell = 7224, skill = 190, creates = 6041, teach = 6046, source = { "drop" }, bound = false }, -- Steel Weapon Chain
    { spell = 15973, skill = 190, creates = 12260, teach = 12261, source = { "drop" }, bound = false }, -- Searing Golden Blade
    { spell = 21913, skill = 190, creates = 17704, teach = 17706, source = { "drop" }, bound = false }, -- Edge of Winter
    { spell = 439126, skill = 190, teach = 217280, source = { "vendor" }, creates = 217279, bound = false, vendors = { { npc = 5411, area = 440 } } }, -- Golden Scale Coif
    { spell = 1252357, skill = 190, creates = 250608, teach = 251460, source = { "vendor" }, bound = true, vendors = { { npc = 259860, area = 16591, faction = "Alliance" } } }, -- Mithril Warhammer
    { spell = 3511, skill = 195, creates = 3845, teach = 3873, source = { "drop" }, bound = false }, -- Golden Scale Cuirass
    { spell = 439124, skill = 195, teach = 217278, source = { "drop" }, creates = 217277, bound = false }, -- Golden Scale Cuirass
    { spell = 1252289, skill = 195, creates = 250540, teach = 251392, bound = true }, -- Shining Mithril Breastplate
    { spell = 1252290, skill = 195, creates = 250541, teach = 251393, bound = true }, -- Shining Mithril Pauldrons
    { spell = 1252358, skill = 195, creates = 250609, teach = 251461, source = { "drop" }, bound = true }, -- Mithril Claws
    { spell = 1252359, skill = 195, creates = 250610, teach = 251462, bound = true }, -- Mithril Claymore
    { spell = 1317963, skill = 195, creates = 285280, teach = 285290, bound = true }, -- Mithril Blacksmith Hammer
    { spell = 3497, skill = 200, creates = 3854, teach = 3868, source = { "drop" }, bound = false }, -- Frost Tiger Blade
    { spell = 3500, skill = 200, creates = 3856, teach = 3869, source = { "drop" }, bound = false }, -- Shadow Crescent Axe
    { spell = 3515, skill = 200, creates = 3847, teach = 3875, source = { "drop" }, bound = false }, -- Golden Scale Boots
    { spell = 9785, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 35 }, -- Blacksmithing (Artisan)
    { spell = 9916, skill = 175, creates = 7963, source = { "trainer" }, cost = 2500 }, -- Steel Breastplate
    { spell = 9918, skill = 175, creates = 7964, source = { "trainer" }, cost = 2500 }, -- Solid Sharpening Stone
    { spell = 9920, skill = 175, creates = 7966, source = { "trainer" }, cost = 2500 }, -- Solid Grinding Stone
    { spell = 9921, skill = 175, creates = 7965, source = { "trainer" }, cost = 2500 }, -- Solid Weightstone
    { spell = 11454, skill = 200, creates = 9060, teach = 10713, source = { "crafted" }, bound = false }, -- Inlaid Mithril Cylinder
    { spell = 14380, skill = 175, creates = 11144, source = { "trainer" }, cost = 2500 }, -- Truesilver Rod
    { spell = 19668, skill = 175, creates = 15871, count = 2, source = { "trainer" }, cost = 2500 }, -- Truesilver Skeleton Key
    { spell = 435910, skill = 200, creates = 213376, teach = 215384, source = { "vendor" }, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Low-Background Truesilver Plates
    { spell = 439122, skill = 200, teach = 217276, source = { "drop" }, creates = 217275, bound = false }, -- Golden Scale Boots
    { spell = 1252291, skill = 200, creates = 250542, teach = 251394, source = { "drop" }, bound = true }, -- Shining Mithril Boots
    { spell = 1252295, skill = 200, creates = 250546, teach = 251398, bound = true }, -- Officer's Boots
    { spell = 1252296, skill = 200, creates = 250547, teach = 251399, bound = true }, -- Sentinel's Boots
    { spell = 1252297, skill = 200, creates = 250548, teach = 251400, source = { "drop" }, bound = true }, -- Warder's Boots
    { spell = 1252298, skill = 200, creates = 250549, teach = 251401, bound = true }, -- Prefect's Boots
    { spell = 1252299, skill = 200, creates = 250550, teach = 251402, bound = true }, -- Justicar's Boots
    { spell = 9926, skill = 180, creates = 7918, source = { "trainer" }, cost = 5000 }, -- Heavy Mithril Shoulder
    { spell = 9928, skill = 180, creates = 7919, source = { "trainer" }, cost = 5000 }, -- Heavy Mithril Gauntlet
    { spell = 11643, skill = 205, creates = 9366, teach = 9367, source = { "quest" }, bound = false, quests = { { id = 2758, area = 1519, faction = "Alliance", level = 40 } } }, -- Golden Scale Gauntlets
    { spell = 439120, skill = 205, creates = 217273, teach = 217274, bound = false }, -- Golden Scale Gauntlets
    { spell = 9931, skill = 185, creates = 7920, source = { "trainer" }, cost = 5000 }, -- Mithril Plate Pants
    { spell = 9933, skill = 210, creates = 7921, teach = 7975, source = { "drop" }, bound = false }, -- Heavy Mithril Pants
    { spell = 9993, skill = 185, creates = 7941, source = { "trainer" }, cost = 10000 }, -- Heavy Mithril Axe
    { spell = 1252325, skill = 210, creates = 250576, teach = 251428, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Officer's Pauldrons
    { spell = 1252326, skill = 210, creates = 250577, teach = 251429, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Sentinel's Pauldrons
    { spell = 1252327, skill = 210, creates = 250578, teach = 251430, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Warder's Pauldrons
    { spell = 1252328, skill = 210, creates = 250579, teach = 251431, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Prefect's Pauldrons
    { spell = 1252329, skill = 210, creates = 250580, teach = 251432, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Justicar's Pauldrons
    { spell = 1252360, skill = 210, creates = 250611, teach = 251463, source = { "drop" }, bound = true }, -- Mithril Stiletto
    { spell = 9935, skill = 190, creates = 7922, source = { "trainer" }, cost = 5000 }, -- Steel Plate Helm
    { spell = 9937, skill = 215, creates = 7924, teach = 7995, source = { "vendor" }, bound = true, vendors = { { npc = 8161, area = 47, faction = "Alliance" }, { npc = 8176, area = 8, faction = "Horde" } } }, -- Mithril Plate Bracers
    { spell = 9939, skill = 215, creates = 7967, teach = 7976, source = { "drop" }, bound = false }, -- Mithril Shield Spike
    { spell = 1252361, skill = 215, creates = 250612, teach = 251464, bound = true }, -- Charged Mithril Battleaxe
    { spell = 9945, skill = 195, creates = 7926, teach = 7983, source = { "quest" }, bound = true, quests = { { id = 2761, area = 33, level = 40 } } }, -- Ornate Mithril Pants
    { spell = 9950, skill = 220, creates = 7927, teach = 7984, source = { "quest" }, bound = true, quests = { { id = 2762, area = 33, level = 40 } } }, -- Ornate Mithril Gloves
    { spell = 9995, skill = 220, creates = 7942, teach = 7992, source = { "drop" }, bound = false }, -- Blue Glittering Axe
    { spell = 1252293, skill = 220, creates = 250544, teach = 251396, bound = true }, -- Shining Mithril Pants
    { spell = 1252294, skill = 220, creates = 250545, teach = 251397, bound = true }, -- Shining Mithril Gauntlet
    { spell = 9952, skill = 225, creates = 7928, teach = 7985, source = { "quest" }, bound = true, quests = { { id = 2763, area = 33, level = 40 } } }, -- Ornate Mithril Shoulders
    { spell = 9954, skill = 200, creates = 7938, cost = 9000, source = { "trainer" } }, -- Truesilver Gauntlets
    { spell = 9997, skill = 225, creates = 7943, teach = 8029, source = { "drop" }, bound = true }, -- Wicked Mithril Blade
    { spell = 435906, skill = 225, teach = 215383, source = { "vendor" }, creates = 215167, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Reflective Truesilver Braincage
    { spell = 435908, skill = 225, teach = 215155, source = { "vendor" }, creates = 215161, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Tempered Interference-Negating Helmet
    { spell = 1252330, skill = 225, creates = 250581, teach = 251433, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Officer's Wristguards
    { spell = 1252331, skill = 225, creates = 250582, teach = 251434, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Sentinel's Wristguards
    { spell = 1252332, skill = 225, creates = 250583, teach = 251435, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Warder's Wristguards
    { spell = 1252333, skill = 225, creates = 250584, teach = 251436, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Prefect's Wristguards
    { spell = 1252334, skill = 225, creates = 250585, teach = 251437, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Justicar's Wristguards
    { spell = 9957, skill = 230, creates = 7929 }, -- Orcish War Leggings
    { spell = 9959, skill = 205, creates = 7930, source = { "trainer" }, cost = 15000 }, -- Heavy Mithril Breastplate
    { spell = 9961, skill = 205, creates = 7931, source = { "trainer" }, cost = 15000 }, -- Mithril Coif
    { spell = 10001, skill = 205, creates = 7945, source = { "trainer" }, cost = 15000 }, -- Big Black Mace
    { spell = 9964, skill = 235, creates = 7969, teach = 7989, source = { "drop" }, bound = false }, -- Mithril Spurs
    { spell = 9966, skill = 235, creates = 7932, teach = 7991, source = { "drop" }, bound = false }, -- Mithril Plate Shoulders
    { spell = 9968, skill = 210, creates = 7933, source = { "trainer" }, cost = 20000 }, -- Heavy Mithril Boots
    { spell = 10003, skill = 235, creates = 7954, cost = 13500 }, -- The Shatterer
    { spell = 1252292, skill = 235, creates = 250543 }, -- Shining Mithril Helm
    { spell = 9972, skill = 240, creates = 7935 }, -- Ornate Mithril Breastplate
    { spell = 10005, skill = 240, creates = 7944, teach = 7993, source = { "drop" }, bound = false }, -- Dazzling Mithril Rapier
    { spell = 1252310, skill = 240, creates = 250561, teach = 251413, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Officer's Sabatons
    { spell = 1252311, skill = 240, creates = 250562, teach = 251414, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Sentinel's Sabatons
    { spell = 1252312, skill = 240, creates = 250563, teach = 251415, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Warder's Sabatons
    { spell = 1252313, skill = 240, creates = 250564, teach = 251416, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Prefect's Sabatons
    { spell = 1252314, skill = 240, creates = 250565, teach = 251417, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Justicar's Sabatons
    { spell = 1252335, skill = 240, creates = 250586, teach = 251438, bound = true }, -- Blessed Plate Pauldrons
    { spell = 1252336, skill = 240, creates = 250587, teach = 251439, bound = true }, -- Blessed Plate Boots
    { spell = 9970, skill = 245, creates = 7934, teach = 7990, source = { "drop" }, bound = false }, -- Heavy Mithril Helm
    { spell = 9974, skill = 220, creates = 7939, cost = 9000, source = { "trainer" } }, -- Truesilver Breastplate
    { spell = 9979, skill = 245, creates = 7936 }, -- Ornate Mithril Boots
    { spell = 9980, skill = 245, creates = 7937 }, -- Ornate Mithril Helm
    { spell = 10007, skill = 245, creates = 7961, cost = 13500 }, -- Phantom Blade
    { spell = 10009, skill = 245, creates = 7946, teach = 8028, source = { "drop" }, bound = false }, -- Runed Mithril Hammer
    { spell = 1252337, skill = 245, creates = 250588, teach = 251440, bound = true }, -- Blessed Plate Gauntlet
    { spell = 10011, skill = 250, creates = 7959, cost = 13500 }, -- Blight
    { spell = 16639, skill = 225, creates = 12644, source = { "trainer" }, cost = 10000 }, -- Dense Grinding Stone
    { spell = 16640, skill = 225, creates = 12643, source = { "trainer" }, cost = 10000 }, -- Dense Weightstone
    { spell = 16641, skill = 225, creates = 12404, source = { "trainer" }, cost = 10000 }, -- Dense Sharpening Stone
    { spell = 16642, skill = 250, creates = 12405, teach = 12682, source = { "drop" }, bound = false }, -- Thorium Armor
    { spell = 16643, skill = 250, creates = 12406, teach = 12683, source = { "drop" }, bound = false }, -- Thorium Belt
    { spell = 446179, skill = 250, creates = 220738 }, -- Shoulderplates of Dread
    { spell = 446188, skill = 250, creates = 220740 }, -- Fearmonger's Shoulderguards
    { spell = 446191, skill = 250, creates = 220739 }, -- Baleful Pauldrons
    { spell = 1224635, skill = 250, teach = 238325, source = { "drop" }, creates = 238291, bound = false }, -- Scarlet Soldier's Protectors
    { spell = 1224637, skill = 250, teach = 238327, source = { "drop" }, creates = 238293, bound = false }, -- Scarlet Soldier's Waistguard
    { spell = 1252300, skill = 250, creates = 250551, teach = 251403, bound = true }, -- Officer's Gloves
    { spell = 1252301, skill = 250, creates = 250552, teach = 251404, bound = true }, -- Sentinel's Gloves
    { spell = 1252302, skill = 250, creates = 250553, teach = 251405, bound = true }, -- Warder's Gloves
    { spell = 1252303, skill = 250, creates = 250554, teach = 251406, bound = true }, -- Prefect's Gloves
    { spell = 1252304, skill = 250, creates = 250555, teach = 251407, bound = true }, -- Justicar's Gloves
    { spell = 1252320, skill = 250, creates = 250571, teach = 251423, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Officer's Waistguard
    { spell = 1252321, skill = 250, creates = 250572, teach = 251424, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Sentinel's Waistguard
    { spell = 1252322, skill = 250, creates = 250573, teach = 251425, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Warder's Waistguard
    { spell = 1252324, skill = 250, creates = 250575, teach = 251427, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Justicar's Waistguard
    { spell = 1252362, skill = 250, creates = 250613, teach = 251465, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Thorium Greatmace
    { spell = 1252363, skill = 250, creates = 250614, teach = 251466, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Thorium Cestus
    { spell = 10013, skill = 255, creates = 7947, teach = 8030, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Ebon Shiv
    { spell = 16644, skill = 255, creates = 12408, teach = 12684, source = { "drop" }, bound = false }, -- Thorium Bracers
    { spell = 1252338, skill = 255, creates = 250589, teach = 251441, bound = true }, -- Imperial Plate Gauntlets
    { spell = 1252339, skill = 255, creates = 250590, teach = 251442, bound = true }, -- Blessed Plate Bracers
    { spell = 10015, skill = 260, creates = 7960, cost = 13500 }, -- Truesilver Champion
    { spell = 16645, skill = 260, creates = 12416, teach = 12685, source = { "drop" }, bound = false }, -- Radiant Belt
    { spell = 1224636, skill = 260, teach = 238326, source = { "drop" }, creates = 238292, bound = false }, -- Scarlet Soldier's Grips
    { spell = 1224639, skill = 260, teach = 238329, source = { "drop" }, creates = 238295, bound = false }, -- Scarlet Soldier's Stompers
    { spell = 1252364, skill = 260, creates = 250615, teach = 251467, bound = true }, -- Thorium Poleaxe
    { spell = 15292, skill = 265, creates = 11608, teach = 11610, source = { "drop" }, bound = false }, -- Dark Iron Pulverizer
    { spell = 16646, skill = 265, creates = 12428, teach = 12687, source = { "quest" }, bound = true, quests = { { id = 7659, area = 440, level = 50 } } }, -- Imperial Plate Shoulders
    { spell = 16647, skill = 265, creates = 12424, teach = 12688, source = { "quest" }, bound = true, quests = { { id = 7653, area = 440, level = 50 } } }, -- Imperial Plate Belt
    { spell = 15293, skill = 270, creates = 11606, teach = 11614, source = { "drop" }, bound = true }, -- Dark Iron Mail
    { spell = 16648, skill = 270, creates = 12415, teach = 12689, source = { "drop" }, bound = false }, -- Radiant Breastplate
    { spell = 16649, skill = 270, creates = 12425, teach = 12690, source = { "quest" }, bound = true, quests = { { id = 7655, area = 440, level = 50 } } }, -- Imperial Plate Bracers
    { spell = 1224638, skill = 270, teach = 238328, source = { "drop" }, creates = 238294, bound = false }, -- Scarlet Soldier's Legplates
    { spell = 1252323, skill = 270, creates = 250574, teach = 251426, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Prefect's Waistguard
    { spell = 1252340, skill = 270, creates = 250591, teach = 251443, bound = true }, -- Blessed Plate Leggings
    { spell = 1252341, skill = 270, creates = 250592, teach = 251444, bound = true }, -- Blessed Plate Belt
    { spell = 1252365, skill = 270, creates = 250616, teach = 251468, source = { "vendor" }, bound = true, vendors = { { npc = 266901, area = 616 } } }, -- Bold Dirk
    { spell = 1317964, skill = 270, creates = 285281, teach = 285291, bound = true }, -- Arcanite Blacksmith Hammer
    { spell = 15294, skill = 275, creates = 11607, teach = 11611, source = { "drop" }, bound = false }, -- Dark Iron Sunderer
    { spell = 16651, skill = 275, creates = 12645, teach = 12692, source = { "drop" }, bound = false }, -- Thorium Shield Spike
    { spell = 16969, skill = 275, creates = 12773, teach = 12819, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Ornate Thorium Handaxe
    { spell = 16970, skill = 275, creates = 12774, teach = 12821, source = { "quest" }, bound = false, quests = { { id = 5306, area = 618, level = 50 } } }, -- Dawn's Edge
    { spell = 19669, skill = 250, creates = 15872, count = 2, source = { "trainer" }, cost = 10000 }, -- Arcanite Skeleton Key
    { spell = 20201, skill = 250, creates = 16206, source = { "trainer" }, cost = 10000 }, -- Arcanite Rod
    { spell = 1252342, skill = 275, creates = 250593, teach = 251445, bound = true }, -- Blessed Plate Helm
    { spell = 15295, skill = 280, creates = 11605, teach = 11615, source = { "drop" }, bound = true }, -- Dark Iron Shoulders
    { spell = 16652, skill = 280, creates = 12409, teach = 12693, source = { "drop" }, bound = false }, -- Thorium Boots
    { spell = 16653, skill = 280, creates = 12410, teach = 12694, source = { "drop" }, bound = false }, -- Thorium Helm
    { spell = 16971, skill = 280, creates = 12775, teach = 12823, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Huge Thorium Battleaxe
    { spell = 16973, skill = 280, creates = 12776, teach = 12824, source = { "quest" }, bound = false, quests = { { id = 5305, area = 618, level = 50 }, { id = 8869, area = 618, level = 50 } } }, -- Enchanted Battlehammer
    { spell = 16978, skill = 280, creates = 12777, teach = 12825, source = { "quest" }, bound = false, quests = { { id = 5307, area = 618, level = 50 } } }, -- Blazing Rapier
    { spell = 461733, skill = 280, teach = 228311, creates = 227880, bound = false }, -- Finely-Enchanted Battlehammer
    { spell = 1224631, skill = 280, teach = 238322, source = { "drop" }, creates = 238288, bound = false }, -- Scarlet Soldier's Helmet
    { spell = 1224632, skill = 280, teach = 238323, source = { "drop" }, creates = 238289, bound = false }, -- Scarlet Soldier's Spaulders
    { spell = 1224633, skill = 280, teach = 238324, source = { "drop" }, creates = 238290, bound = false }, -- Scarlet Soldier's Chestplate
    { spell = 1252343, skill = 280, creates = 250594, teach = 251446, bound = true }, -- Blessed Plate Chest
    { spell = 15296, skill = 285, creates = 11604, teach = 11612, source = { "drop" }, bound = false }, -- Dark Iron Plate
    { spell = 16654, skill = 285, creates = 12418, teach = 12695, source = { "drop" }, bound = false }, -- Radiant Gloves
    { spell = 16667, skill = 285, creates = 12628, teach = 12696, source = { "quest" }, bound = true, quests = { { id = 5127, area = 618, level = 55 } } }, -- Demon Forged Breastplate
    { spell = 16983, skill = 285, creates = 12781, teach = 12827, source = { "drop" }, bound = false }, -- Serenity
    { spell = 461667, skill = 285, teach = 227901, source = { "drop" }, creates = 227871, bound = false }, -- Tempered Dark Iron Plate
    { spell = 1297138, skill = 285, creates = 275622, teach = 275598, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Goregasher Grips
    { spell = 1297141, skill = 285, creates = 275625, teach = 275601, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Clutchlord's Grips
    { spell = 16655, skill = 290, creates = 12631, teach = 12699, source = { "quest" }, bound = true, quests = { { id = 5124, area = 618, level = 55 } } }, -- Fiery Plate Gauntlets
    { spell = 16656, skill = 290, creates = 12419, teach = 12697, source = { "drop" }, bound = false }, -- Radiant Boots
    { spell = 16660, skill = 290, creates = 12625, teach = 12698, source = { "vendor" }, reputation = { 529, 7, ns.L.FACTION_529 }, bound = false, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Dawnbringer Shoulders
    { spell = 16984, skill = 290, creates = 12792, teach = 12828, source = { "drop" }, bound = false }, -- Volcanic Hammer
    { spell = 16985, skill = 290, creates = 12782, teach = 12830, source = { "drop" }, bound = false }, -- Corruption
    { spell = 23632, skill = 290, creates = 19051, teach = 19203, source = { "vendor" }, reputation = { 529, 6, ns.L.FACTION_529 }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Girdle of the Dawn
    { spell = 461651, skill = 290, teach = 227909, creates = 227865, bound = true }, -- Fiery Plate Gauntlets of the Hidden Technique
    { spell = 1297139, skill = 290, creates = 275623, teach = 275599, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Goregasher Support
    { spell = 1297142, skill = 290, creates = 275626, teach = 275602, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Clutchlord's Support
    { spell = 16657, skill = 295, creates = 12426, teach = 12700, source = { "quest" }, bound = true, quests = { { id = 7654, area = 440, level = 50 } } }, -- Imperial Plate Boots
    { spell = 16658, skill = 295, creates = 12427, teach = 12701, source = { "quest" }, bound = true, quests = { { id = 7657, area = 440, level = 50 } } }, -- Imperial Plate Helm
    { spell = 16659, skill = 295, creates = 12417, teach = 12702, source = { "drop" }, bound = false }, -- Radiant Circlet
    { spell = 20872, skill = 295, creates = 16989, teach = 17049, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Fiery Chain Girdle
    { spell = 20874, skill = 295, creates = 17014, teach = 17051, source = { "vendor" }, reputation = { 59, 5, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Bracers
    { spell = 461737, skill = 295, teach = 228313, source = { "drop", "vendor" }, creates = 227870, bound = false, vendors = { { npc = 11278, area = 28 } } }, -- Tempest Gauntlets
    { spell = 1297140, skill = 295, creates = 275624, teach = 275600, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Goregasher Stompers
    { spell = 1297143, skill = 295, creates = 275627, teach = 275603, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15176, area = 1377 } } }, -- Clutchlord's Stompers
    { spell = 16662, skill = 300, creates = 12414, teach = 12704, source = { "drop" }, bound = false }, -- Thorium Leggings
    { spell = 16663, skill = 300, creates = 12422, teach = 12705, source = { "quest" }, bound = true, quests = { { id = 7656, area = 440, level = 50 } } }, -- Imperial Plate Chest
    { spell = 16664, skill = 300, creates = 12610, teach = 12706, source = { "drop" }, bound = true }, -- Runic Plate Shoulders
    { spell = 16665, skill = 300, creates = 12611, teach = 12707, source = { "drop" }, bound = true }, -- Runic Plate Boots
    { spell = 16724, skill = 300, creates = 12633, teach = 12711, source = { "drop" }, bound = false }, -- Whitesoul Helm
    { spell = 16725, skill = 300, creates = 12420, teach = 12713, source = { "drop" }, bound = false }, -- Radiant Leggings
    { spell = 16726, skill = 300, creates = 12612, teach = 12714, source = { "drop" }, bound = true }, -- Runic Plate Helm
    { spell = 16729, skill = 300, creates = 12640, teach = 12717, source = { "drop" }, bound = false }, -- Lionheart Helm
    { spell = 16730, skill = 300, creates = 12429, teach = 12715, source = { "quest" }, bound = true, quests = { { id = 7658, area = 440, level = 50 } } }, -- Imperial Plate Leggings
    { spell = 16731, skill = 300, creates = 12613, teach = 12718, source = { "drop" }, bound = true }, -- Runic Breastplate
    { spell = 16732, skill = 300, creates = 12614, teach = 12719, source = { "drop" }, bound = true }, -- Runic Plate Leggings
    { spell = 16741, skill = 300, creates = 12639, teach = 228118, source = { "drop" }, bound = false }, -- Stronghold Gauntlets
    { spell = 16742, skill = 300, creates = 12620, teach = 12725, source = { "quest" }, bound = true, quests = { { id = 7651, area = 2557, level = 50 } } }, -- Enchanted Thorium Helm
    { spell = 16744, skill = 300, creates = 12619, teach = 12726, source = { "quest" }, bound = true, quests = { { id = 7650, area = 2557, level = 50 } } }, -- Enchanted Thorium Leggings
    { spell = 16745, skill = 300, creates = 12618, teach = 12727, source = { "quest" }, bound = true, quests = { { id = 7649, area = 2557, level = 50 } } }, -- Enchanted Thorium Breastplate
    { spell = 16988, skill = 300, creates = 12796, teach = 12833, source = { "drop" }, bound = false }, -- Hammer of the Titans
    { spell = 16990, skill = 300, creates = 12790, teach = 12834, source = { "drop" }, bound = false }, -- Arcanite Champion
    { spell = 16991, skill = 300, creates = 12798, teach = 12835, source = { "drop" }, bound = false }, -- Annihilator
    { spell = 16992, skill = 300, creates = 12797, teach = 12836, source = { "drop" }, bound = false }, -- Frostguard
    { spell = 16993, skill = 300, creates = 12794, teach = 12837, source = { "drop" }, bound = false }, -- Masterwork Stormhammer
    { spell = 16994, skill = 300, creates = 12784, teach = 12838, source = { "drop" }, bound = false }, -- Arcanite Reaper
    { spell = 16995, skill = 300, creates = 12783, teach = 12839, source = { "drop" }, bound = false }, -- Heartseeker
    { spell = 20873, skill = 300, creates = 16988, teach = 17053, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Fiery Chain Shoulders
    { spell = 20876, skill = 300, creates = 17013, teach = 17052, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Leggings
    { spell = 20890, skill = 300, creates = 17015, teach = 17059, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Reaver
    { spell = 20897, skill = 300, creates = 17016, teach = 17060, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Destroyer
    { spell = 21161, skill = 300, creates = 17193, teach = 18592, source = { "quest" }, bound = false, quests = { { id = 7604, area = 1584, level = 60 } } }, -- Sulfuron Hammer
    { spell = 22757, skill = 300, creates = 18262, teach = 18264, source = { "drop" }, bound = true }, -- Elemental Sharpening Stone
    { spell = 23633, skill = 300, creates = 19057, teach = 19205, source = { "vendor" }, reputation = { 529, 7, ns.L.FACTION_529 }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Gloves of the Dawn
    { spell = 23636, skill = 300, creates = 19148, teach = 19206, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Helm
    { spell = 23637, skill = 300, creates = 19164, teach = 19207, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Gauntlets
    { spell = 23638, skill = 300, creates = 19166, teach = 19208, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Black Amnesty
    { spell = 23639, skill = 300, creates = 19167, teach = 19209, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Blackfury
    { spell = 23650, skill = 300, creates = 19170, teach = 19210, source = { "vendor" }, reputation = { 59, 8, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Ebon Hand
    { spell = 23652, skill = 300, creates = 19168, teach = 19211, source = { "vendor" }, reputation = { 59, 8, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Blackguard
    { spell = 23653, skill = 300, creates = 19169, teach = 19212, source = { "vendor" }, reputation = { 59, 8, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Nightfall
    { spell = 24136, skill = 300, creates = 19690, teach = 19776, source = { "vendor" }, reputation = { 270, 7, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodsoul Breastplate
    { spell = 24137, skill = 300, creates = 19691, teach = 19777, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodsoul Shoulders
    { spell = 24138, skill = 300, creates = 19692, teach = 19778, source = { "vendor" }, reputation = { 270, 5, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodsoul Gauntlets
    { spell = 24139, skill = 300, creates = 19693, teach = 19779, source = { "vendor" }, reputation = { 270, 7, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Darksoul Breastplate
    { spell = 24140, skill = 300, creates = 19694, teach = 19780, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Darksoul Leggings
    { spell = 24141, skill = 300, creates = 19695, teach = 19781, source = { "vendor" }, reputation = { 270, 5, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Darksoul Shoulders
    { spell = 24399, skill = 300, creates = 20039, teach = 20040, source = { "vendor" }, reputation = { 59, 8, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Dark Iron Boots
    { spell = 24912, skill = 300, creates = 20549, teach = 20553, source = { "drop" }, bound = false }, -- Darkrune Gauntlets
    { spell = 24913, skill = 300, creates = 20551, teach = 20555, source = { "drop" }, bound = false }, -- Darkrune Helm
    { spell = 24914, skill = 300, creates = 20550, teach = 20554, source = { "drop" }, bound = false }, -- Darkrune Breastplate
    { spell = 27585, skill = 300, creates = 22197 }, -- Heavy Obsidian Belt
    { spell = 27586, skill = 300, creates = 22198, teach = 22219, source = { "vendor" }, reputation = { 609, 7, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15471, area = 3429 } } }, -- Jagged Obsidian Shield
    { spell = 27587, skill = 300, creates = 22196, teach = 22222, source = { "drop" }, bound = false }, -- Thick Obsidian Breastplate
    { spell = 27588, skill = 300, creates = 22195 }, -- Light Obsidian Belt
    { spell = 27589, skill = 300, creates = 22194, teach = 22220, source = { "drop" }, bound = false }, -- Black Grasp of the Destroyer
    { spell = 27590, skill = 300, creates = 22191, teach = 22221, source = { "vendor" }, reputation = { 609, 8, ns.L.FACTION_609 }, bound = true, vendors = { { npc = 15471, area = 3429 } } }, -- Obsidian Mail Tunic
    { spell = 27829, skill = 300, creates = 22385, teach = 22388, source = { "drop" }, bound = false }, -- Titanic Leggings
    { spell = 27830, skill = 300, creates = 22384, teach = 22390, source = { "drop" }, bound = false }, -- Persuader
    { spell = 27832, skill = 300, creates = 22383, teach = 22389, source = { "drop" }, bound = false }, -- Sageblade
    { spell = 28242, skill = 300, creates = 22669, teach = 22703, source = { "trainer" }, reputation = { 529, 8, ns.L.FACTION_529 }, bound = true }, -- Icebane Breastplate
    { spell = 28243, skill = 300, creates = 22670, teach = 22704, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 }, bound = true }, -- Icebane Gauntlets
    { spell = 28244, skill = 300, creates = 22671, teach = 22705, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 }, bound = true }, -- Icebane Bracers
    { spell = 28461, skill = 300, creates = 22762 }, -- Ironvine Breastplate
    { spell = 28462, skill = 300, creates = 22763 }, -- Ironvine Gloves
    { spell = 28463, skill = 300, creates = 22764 }, -- Ironvine Belt
    { spell = 460460, skill = 300, teach = 227727, creates = 227684, bound = false }, -- Sulfuron Hammer
    { spell = 461647, skill = 300, teach = 227905, source = { "drop" }, creates = 227886, bound = false }, -- Skyrider's Masterwork Stormhammer
    { spell = 461669, skill = 300, teach = 228117, source = { "drop" }, creates = 228125, bound = false }, -- Refined Arcanite Champion
    { spell = 461671, skill = 300, teach = 228250, source = { "drop" }, creates = 227885, bound = false }, -- Stronger-hold Gauntlets
    { spell = 461675, skill = 300, teach = 228114, source = { "drop" }, creates = 227845, bound = false }, -- Refined Arcanite Reaper
    { spell = 461730, skill = 300, teach = 228310, source = { "drop" }, creates = 227887, bound = false }, -- Hardened Frostguard
    { spell = 461735, skill = 300, teach = 228312, source = { "drop" }, creates = 227876, bound = false }, -- Invincible Mail
    { spell = 461739, skill = 300, teach = 228314, source = { "drop" }, creates = 227872, bound = false }, -- Warcrest of the Great Chief
    { spell = 461743, skill = 300, teach = 228315, source = { "drop" }, creates = 227850, bound = false }, -- Sageblade of the Archmagus
    { spell = 1252344, skill = 300, creates = 250595, teach = 251447, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Enriched Thorium Breastplate
    { spell = 1252345, skill = 300, creates = 250596, teach = 251448, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Enriched Thorium Leggings
    { spell = 1252346, skill = 300, creates = 250597, teach = 251449, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Enriched Thorium Helm
    { spell = 1252347, skill = 300, creates = 250598, teach = 251450, bound = true }, -- Champion's Legplates
    { spell = 1252348, skill = 300, creates = 250599, teach = 251451, bound = true }, -- Stalwart Helm
    { spell = 1252349, skill = 300, creates = 250600, teach = 251452, bound = true }, -- Martyr's Legplates
    { spell = 1252350, skill = 300, creates = 250601, teach = 251453, bound = true }, -- Breastplate of Salvation
    { spell = 1252366, skill = 300, creates = 250617, teach = 251469, reputation = { 576, 7, ns.L.FACTION_576 }, bound = true }, -- Stormcarver
    { spell = 1252367, skill = 300, creates = 250618, teach = 251470, reputation = { 576, 7, ns.L.FACTION_576 }, bound = true }, -- Bagh Nakh
    { spell = 1252368, skill = 300, creates = 250619, teach = 251471, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248197, area = 17, faction = "Horde" }, { npc = 256730, area = 44, faction = "Alliance" } } }, -- Legionite Glaive
    { spell = 1263073, skill = 300, creates = 279955, teach = 273113, bound = false }, -- Master Forge
    { spell = 1306533, skill = 300, creates = 279259, teach = 279308, bound = true }, -- Ironwood Blade
    { spell = 1306534, skill = 300, creates = 279260, teach = 279309, bound = true }, -- Forest Defender's Axe
    { spell = 1306535, skill = 300, creates = 279261, teach = 279310, bound = true }, -- Greenhammer
    { spell = 1306536, skill = 300, creates = 279262, teach = 279311, bound = true }, -- Evergreen Shield
    { spell = 1306537, skill = 300, creates = 279263, teach = 279312, bound = true }, -- Depleted Thorium Sabatons
    { spell = 1306538, skill = 300, creates = 279264, teach = 279313, bound = true }, -- Heavy Thorium Gauntlets
    { spell = 1306539, skill = 300, creates = 279265, teach = 279314, bound = true }, -- Azerothium Legplates
}
