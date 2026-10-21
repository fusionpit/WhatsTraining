local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[165] = {
    { spell = 2149, skill = 1, creates = 2302 }, -- Handstitched Leather Boots
    { spell = 2152, skill = 1, creates = 2304 }, -- Light Armor Kit
    { spell = 2881, skill = 1, creates = 2318 }, -- Light Leather
    { spell = 7126, skill = 1, creates = 5957 }, -- Handstitched Leather Vest
    { spell = 9058, skill = 1, creates = 7276 }, -- Handstitched Leather Cloak
    { spell = 9059, skill = 1, creates = 7277 }, -- Handstitched Leather Bracers
    { spell = 2153, skill = 15, creates = 2303, source = { "trainer" }, cost = 50 }, -- Handstitched Leather Pants
    { spell = 1229432, skill = 20, creates = 279978, source = { "quest", "trainer" }, cost = 100, quests = { { id = 96031, area = 1, faction = "Alliance", level = 4 }, { id = 97906, area = 14, faction = "Horde", level = 4 }, { id = 97922, area = 12, faction = "Alliance", level = 4 }, { id = 97934, area = 215, faction = "Horde", level = 4 }, { id = 97946, area = 141, faction = "Alliance", level = 4 }, { id = 97958, area = 85, faction = "Horde", level = 4 }, { id = 97969, area = 16593, level = 4 } } }, -- Camp Tent
    { spell = 3753, skill = 25, creates = 4237, source = { "trainer" }, cost = 75 }, -- Handstitched Leather Belt
    { spell = 9060, skill = 25, creates = 7278, source = { "trainer" }, cost = 100 }, -- Light Leather Quiver
    { spell = 9062, skill = 25, creates = 7279, source = { "trainer" }, cost = 100 }, -- Small Leather Ammo Pouch
    { spell = 1302604, skill = 30, creates = 277715, teach = 277716, source = { "quest", "vendor" }, bound = true, quests = { { id = 96875, area = 1637, faction = "Horde", level = 6 } }, vendors = { { npc = 4225, area = 1657, faction = "Alliance" } } }, -- Light Leather Reagent Bag
    { spell = 3816, skill = 30, creates = 4231, source = { "trainer" }, cost = 50 }, -- Cured Light Hide
    { spell = 9064, skill = 30, creates = 7280, teach = 7288, source = { "drop" }, bound = false }, -- Rugged Leather Pants
    { spell = 1255143, skill = 35, creates = 252427, teach = 252764, source = { "vendor", "trainer" }, cost = 500, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Moonglow Boots
    { spell = 1255144, skill = 35, creates = 252426, teach = 252763, source = { "vendor", "trainer" }, cost = 500, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Murloc Scale Shoes
    { spell = 1255145, skill = 35, creates = 252425, teach = 252762, source = { "vendor", "trainer" }, cost = 500, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Dark Leather Boots
    { spell = 1255146, skill = 35, creates = 252424, teach = 252761, source = { "vendor", "trainer" }, cost = 500, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Black Whelp Slippers
    { spell = 2160, skill = 35, creates = 2300, source = { "trainer" }, cost = 100 }, -- Embossed Leather Vest
    { spell = 5244, skill = 35, creates = 5081, teach = 5083, source = { "quest" }, bound = false, quests = { { id = 769, area = 1638, faction = "Horde", level = 4 } } }, -- Kodo Hide Bag
    { spell = 3104, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 10 }, -- Leatherworking (Journeyman)
    { spell = 1301428, skill = 50, creates = 276999, teach = 276935, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Gustwoven Bracers
    { spell = 1301430, skill = 50, creates = 277001, teach = 276937, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Gustwoven Belt
    { spell = 1301434, skill = 50, creates = 277005, teach = 276941, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Windraveled Armguards
    { spell = 1301436, skill = 50, creates = 277007, teach = 276943, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Windraveled Strap
    { spell = 1301452, skill = 50, creates = 277023, teach = 276959, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Gustwoven Bracers
    { spell = 1301454, skill = 50, creates = 277025, teach = 276961, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Gustwoven Belt
    { spell = 1301458, skill = 50, creates = 277029, teach = 276965, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Windraveled Armguards
    { spell = 1301460, skill = 50, creates = 277031, teach = 276967, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Windraveled Strap
    { spell = 2161, skill = 50, creates = 2309, source = { "trainer" }, cost = 100 }, -- Embossed Leather Boots
    { spell = 3756, skill = 40, creates = 4239, source = { "trainer" }, cost = 150 }, -- Embossed Leather Gloves
    { spell = 1301429, skill = 55, creates = 277000, teach = 276936, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Gustwoven Gloves
    { spell = 1301432, skill = 55, creates = 277003, teach = 276939, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Gustwoven Boots
    { spell = 1301435, skill = 55, creates = 277006, teach = 276942, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Windraveled Mitts
    { spell = 1301438, skill = 55, creates = 277009, teach = 276945, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Windraveled Footwraps
    { spell = 1301453, skill = 55, creates = 277024, teach = 276960, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Gustwoven Gloves
    { spell = 1301456, skill = 55, creates = 277027, teach = 276963, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Gustwoven Boots
    { spell = 1301459, skill = 55, creates = 277030, teach = 276966, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Windraveled Mitts
    { spell = 1301462, skill = 55, creates = 277033, teach = 276969, source = { "vendor" }, reputation = { 2758, 5, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Windraveled Footwraps
    { spell = 2162, skill = 40, creates = 2310, source = { "trainer" }, cost = 100 }, -- Embossed Leather Cloak
    { spell = 2163, skill = 40, creates = 2311, teach = 2407, source = { "drop" }, bound = false }, -- White Leather Jerkin
    { spell = 1255137, skill = 60, creates = 252433, teach = 252770, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Wisdom's Leather Belt
    { spell = 1255138, skill = 60, creates = 252432, teach = 252769, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stormrider's Leather Belt
    { spell = 1255139, skill = 60, creates = 252431, teach = 252768, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Totemic Leather Belt
    { spell = 1255140, skill = 60, creates = 252430, teach = 252767, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Defender's Leather Belt
    { spell = 1255141, skill = 60, creates = 252429, teach = 252766, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Trapper's Leather Belt
    { spell = 1255142, skill = 60, creates = 252428, teach = 252765, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Brawler's Leather Belt
    { spell = 1301427, skill = 60, creates = 276998, teach = 276934, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Gustwoven Harness
    { spell = 1301431, skill = 60, creates = 277002, teach = 276938, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Gustwoven Trousers
    { spell = 1301433, skill = 60, creates = 277004, teach = 276940, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Windraveled Jerkin
    { spell = 1301437, skill = 60, creates = 277008, teach = 276944, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Cloudy Windraveled Pants
    { spell = 1301451, skill = 60, creates = 277022, teach = 276958, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Gustwoven Harness
    { spell = 1301455, skill = 60, creates = 277026, teach = 276962, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Gustwoven Trousers
    { spell = 1301457, skill = 60, creates = 277028, teach = 276964, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Windraveled Jerkin
    { spell = 1301461, skill = 60, creates = 277032, teach = 276968, source = { "vendor" }, reputation = { 2758, 6, ns.L.FACTION_2758 }, bound = true, vendors = { { npc = 254151, area = 16593 } } }, -- Azure Windraveled Pants
    { spell = 9065, skill = 45, creates = 7281, source = { "trainer" }, cost = 150 }, -- Light Leather Bracers
    { spell = 2164, skill = 50, creates = 2312, teach = 2408, source = { "drop" }, bound = false }, -- Fine Leather Gloves
    { spell = 3759, skill = 50, creates = 4242, source = { "trainer" }, cost = 200 }, -- Embossed Leather Pants
    { spell = 1255125, skill = 75, creates = 252499, teach = 252782, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Wisdom's Leather Gloves
    { spell = 1255126, skill = 75, creates = 252498, teach = 252781, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stormrider's Leather Gloves
    { spell = 1255127, skill = 75, creates = 252497, teach = 252780, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Totemic Leather Gloves
    { spell = 1255128, skill = 75, creates = 252496, teach = 252779, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Defender's Leather Gloves
    { spell = 1255129, skill = 75, creates = 252495, teach = 252778, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Trapper's Leather Gloves
    { spell = 1255130, skill = 75, creates = 252494, teach = 252777, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Brawler's Leather Gloves
    { spell = 3763, skill = 55, creates = 4246, source = { "trainer" }, cost = 300 }, -- Fine Leather Belt
    { spell = 1255123, skill = 80, creates = 252437, teach = 252784, source = { "vendor" }, bound = false, vendors = { { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3366, area = 1637, faction = "Horde" }, { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 4589, area = 1497, faction = "Horde" }, { npc = 5128, area = 1537, faction = "Alliance" }, { npc = 5565, area = 1519, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Forceful Medium Armor Kit
    { spell = 1255124, skill = 80, creates = 252436, teach = 252783, source = { "vendor" }, bound = false, vendors = { { npc = 3005, area = 1638, faction = "Horde" }, { npc = 3366, area = 1637, faction = "Horde" }, { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 4589, area = 1497, faction = "Horde" }, { npc = 5128, area = 1537, faction = "Alliance" }, { npc = 5565, area = 1519, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Mystic Medium Armor Kit
    { spell = 1255131, skill = 80, creates = 252493 }, -- Wisdom's Leather Armor
    { spell = 1255132, skill = 80, creates = 252492 }, -- Stormrider's Leather Armor
    { spell = 1255133, skill = 80, creates = 252435 }, -- Totemic Leather Armor
    { spell = 1255134, skill = 80, creates = 252434 }, -- Defender's Leather Armor
    { spell = 1255135, skill = 80, creates = 252491 }, -- Trapper's Leather Armor
    { spell = 1255136, skill = 80, creates = 252490 }, -- Brawler's Leather Armor
    { spell = 2159, skill = 50, creates = 2308, source = { "trainer" }, cost = 250 }, -- Fine Leather Cloak
    { spell = 3761, skill = 60, creates = 4243, source = { "trainer" }, cost = 350 }, -- Fine Leather Tunic
    { spell = 1255116, skill = 85, creates = 252444, teach = 252791, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Wisdom's Leather Boots
    { spell = 1255117, skill = 85, creates = 252443, teach = 252790, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stormrider's Leather Boots
    { spell = 1255118, skill = 85, creates = 252442, teach = 252789, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Totemic Leather Boots
    { spell = 1255119, skill = 85, creates = 252441, teach = 252788, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Defender's Leather Boots
    { spell = 1255120, skill = 85, creates = 252440, teach = 252787, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Trapper's Leather Boots
    { spell = 1255121, skill = 85, creates = 252439, teach = 252786, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Brawler's Leather Boots
    { spell = 2158, skill = 65, creates = 2307, teach = 2406, source = { "drop" }, bound = false }, -- Fine Leather Boots
    { spell = 6702, skill = 65, creates = 5780, teach = 5786, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4186, area = 148, faction = "Alliance" } } }, -- Murloc Scale Belt
    { spell = 7953, skill = 65, creates = 6466, teach = 6474, source = { "vendor" }, bound = false, vendors = { { npc = 5783, area = -6 } } }, -- Deviate Scale Cloak
    { spell = 8322, skill = 65, creates = 6709, teach = 6710, source = { "quest" }, bound = false, quests = { { id = 1582, area = 1657, faction = "Alliance", level = 8 } } }, -- Moonglow Vest
    { spell = 6703, skill = 70, creates = 5781, teach = 5787, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 843, area = 40, faction = "Alliance" }, { npc = 3556, area = 130, faction = "Horde" }, { npc = 4186, area = 148, faction = "Alliance" } } }, -- Murloc Scale Breastplate
    { spell = 9068, skill = 70, creates = 7282, source = { "trainer" }, cost = 400 }, -- Light Leather Pants
    { spell = 2165, skill = 75, creates = 2313, source = { "trainer" }, cost = 250 }, -- Medium Armor Kit
    { spell = 2167, skill = 75, creates = 2315, source = { "trainer" }, cost = 350 }, -- Dark Leather Boots
    { spell = 2169, skill = 75, creates = 2317, teach = 2409, source = { "drop" }, bound = false }, -- Dark Leather Tunic
    { spell = 3762, skill = 75, creates = 4244, teach = 4293, source = { "drop" }, bound = false }, -- Hillman's Leather Vest
    { spell = 3817, skill = 75, creates = 4233, source = { "trainer" }, cost = 200 }, -- Cured Medium Hide
    { spell = 9070, skill = 75, creates = 7283, teach = 7289, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2697, area = 44, faction = "Alliance" } } }, -- Black Whelp Cloak
    { spell = 20648, skill = 75, creates = 2319, source = { "trainer" }, cost = 500 }, -- Medium Leather
    { spell = 24940, skill = 75, creates = 20575, teach = 20576, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 777, area = 44, faction = "Alliance" } } }, -- Black Whelp Tunic
    { spell = 1255104, skill = 100, creates = 252507, teach = 252803, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Wisdom's Leather Hood
    { spell = 1255105, skill = 100, creates = 252506, teach = 252802, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stormrider's Leather Hood
    { spell = 1255106, skill = 100, creates = 252448, teach = 252801, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Totemic Leather Hood
    { spell = 1255107, skill = 100, creates = 252447, teach = 252800, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Defender's Leather Hood
    { spell = 1255108, skill = 100, creates = 252505, teach = 252799, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Trapper's Leather Hood
    { spell = 1255109, skill = 100, creates = 252504, teach = 252798, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Brawler's Leather Hood
    { spell = 7133, skill = 80, creates = 5958, teach = 5972, source = { "drop" }, bound = false }, -- Fine Leather Pants
    { spell = 7954, skill = 80, creates = 6467, teach = 6475, source = { "vendor" }, bound = false, vendors = { { npc = 5783, area = -6 } } }, -- Deviate Scale Gloves
    { spell = 1255110, skill = 105, creates = 252503 }, -- Wisdom's Leather Pants
    { spell = 1255111, skill = 105, creates = 252502 }, -- Stormrider's Leather Pants
    { spell = 1255112, skill = 105, creates = 252446 }, -- Totemic Leather Pants
    { spell = 1255113, skill = 105, creates = 252445 }, -- Defender's Leather Pants
    { spell = 1255114, skill = 105, creates = 252501 }, -- Trapper's Leather Pants
    { spell = 1255115, skill = 105, creates = 252500 }, -- Brawler's Leather Pants
    { spell = 2168, skill = 85, creates = 2316, source = { "trainer" }, cost = 350 }, -- Dark Leather Cloak
    { spell = 1255097, skill = 110, creates = 252511, teach = 252810, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Wisdom's Leather Tunic
    { spell = 1255098, skill = 110, creates = 252510, teach = 252809, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stormrider's Leather Tunic
    { spell = 1255099, skill = 110, creates = 252451, teach = 252808, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Totemic Leather Tunic
    { spell = 1255100, skill = 110, creates = 252450, teach = 252807, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Defender's Leather Tunic
    { spell = 1255101, skill = 110, creates = 252509, teach = 252806, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Trapper's Leather Tunic
    { spell = 1255102, skill = 110, creates = 252508, teach = 252805, source = { "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Brawler's Leather Tunic
    { spell = 1255103, skill = 110, creates = 252449, teach = 252804, source = { "drop" }, bound = false }, -- Hillman's Leather Boots
    { spell = 7135, skill = 90, creates = 5961, source = { "trainer" }, cost = 400 }, -- Dark Leather Pants
    { spell = 7955, skill = 90, creates = 6468, teach = 6476, source = { "quest" }, bound = false, quests = { { id = 1487, area = 718, level = 15 } } }, -- Deviate Scale Belt
    { spell = 2166, skill = 95, creates = 2314, source = { "trainer" }, cost = 450 }, -- Toughened Leather Armor
    { spell = 3765, skill = 95, creates = 4248, teach = 7360, source = { "drop" }, bound = false }, -- Dark Leather Gloves
    { spell = 3767, skill = 95, creates = 4250, teach = 4294, source = { "drop" }, bound = false }, -- Hillman's Belt
    { spell = 9072, skill = 95, creates = 7284, teach = 7290, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2679, area = 11, faction = "Alliance" } } }, -- Red Whelp Gloves
    { spell = 9074, skill = 95, creates = 7285, source = { "trainer" }, cost = 500 }, -- Nimble Leather Gloves
    { spell = 3766, skill = 100, creates = 4249, source = { "trainer" }, cost = 400 }, -- Dark Leather Belt
    { spell = 3811, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 20 }, -- Leatherworking (Expert)
    { spell = 9145, skill = 100, creates = 7348, source = { "trainer" }, cost = 500 }, -- Fletcher's Gloves
    { spell = 1255082, skill = 125, creates = 252519, teach = 252825, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Wisdom's Leather Leggings
    { spell = 1255083, skill = 125, creates = 252518, teach = 252824, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stormrider's Leather Kilt
    { spell = 1255084, skill = 125, creates = 252458, teach = 252823, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Totemic Leather Leggings
    { spell = 1255085, skill = 125, creates = 252457, teach = 252822, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Defender's Leather Kilt
    { spell = 1255086, skill = 125, creates = 252517, teach = 252821, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Trapper's Leather Legguards
    { spell = 1255087, skill = 125, creates = 252516, teach = 252820, source = { "drop", "vendor" }, merchantFavor = 30, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Brawler's Leather Legguards
    { spell = 3768, skill = 105, creates = 4251, source = { "trainer" }, cost = 500 }, -- Hillman's Shoulders
    { spell = 1255088, skill = 130, creates = 252515 }, -- Wisdom's Leather Helm
    { spell = 1255089, skill = 130, creates = 252514 }, -- Stormrider's Leather Helm
    { spell = 1255090, skill = 130, creates = 252456 }, -- Totemic Leather Helm
    { spell = 1255091, skill = 130, creates = 252455 }, -- Defender's Leather Helm
    { spell = 1255092, skill = 130, creates = 252513 }, -- Trapper's Leather Helm
    { spell = 1255093, skill = 130, creates = 252512 }, -- Brawler's Leather Helm
    { spell = 3770, skill = 110, creates = 4253, source = { "trainer" }, cost = 500 }, -- Toughened Leather Gloves
    { spell = 9146, skill = 110, creates = 7349, teach = 7361, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 6731, area = 331, faction = "Alliance" } } }, -- Herbalist's Gloves
    { spell = 9147, skill = 110, creates = 7352, teach = 7362, source = { "vendor" }, bound = true, vendors = { { npc = 3537, area = 267 } } }, -- Earthen Leather Shoulders
    { spell = 1255095, skill = 135, creates = 252453, teach = 252812, source = { "vendor" }, bound = false, vendors = { { npc = 3005, area = 1638, faction = "Horde" }, { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Forceful Heavy Armor Kit
    { spell = 1255096, skill = 135, creates = 252452, teach = 252811, source = { "vendor" }, bound = false, vendors = { { npc = 3005, area = 1638, faction = "Horde" }, { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Mystic Heavy Armor Kit
    { spell = 3769, skill = 115, creates = 4252, teach = 4296, source = { "drop" }, bound = false }, -- Dark Leather Shoulders
    { spell = 9148, skill = 115, creates = 7358, teach = 7363, source = { "drop" }, bound = false }, -- Pilferer's Gloves
    { spell = 1263031, skill = 140, creates = 279941, teach = 273096, source = { "drop" }, bound = false }, -- Tanning Rack
    { spell = 3764, skill = 120, creates = 4247, source = { "trainer" }, cost = 500 }, -- Hillman's Leather Gloves
    { spell = 9149, skill = 120, creates = 7359, teach = 7364, source = { "drop" }, bound = false }, -- Heavy Earthen Gloves
    { spell = 3760, skill = 125, creates = 3719, source = { "trainer" }, cost = 600 }, -- Hillman's Cloak
    { spell = 3771, skill = 125, creates = 4254, teach = 4297, source = { "drop" }, bound = false }, -- Barbaric Gloves
    { spell = 3780, skill = 125, creates = 4265, source = { "trainer" }, cost = 750 }, -- Heavy Armor Kit
    { spell = 3818, skill = 125, creates = 4236, source = { "trainer" }, cost = 500 }, -- Cured Heavy Hide
    { spell = 9193, skill = 125, creates = 7371, source = { "trainer" }, cost = 500 }, -- Heavy Quiver
    { spell = 9194, skill = 125, creates = 7372, source = { "trainer" }, cost = 500 }, -- Heavy Leather Ammo Pouch
    { spell = 20649, skill = 125, creates = 4234, source = { "trainer" }, cost = 1000 }, -- Heavy Leather
    { spell = 23190, skill = 150, creates = 18662, teach = 18731, source = { "vendor" }, bound = false, vendors = { { npc = 3366, area = 1637, faction = "Horde" }, { npc = 5128, area = 1537, faction = "Alliance" } } }, -- Heavy Leather Ball
    { spell = 1255075, skill = 150, creates = 252523, teach = 252832, source = { "vendor", "trainer" }, cost = 2000, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Mender's Leather Belt
    { spell = 1255076, skill = 150, creates = 252522, teach = 252831, source = { "vendor", "trainer" }, cost = 2000, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Skycaller's Leather Belt
    { spell = 1255077, skill = 150, creates = 252461, teach = 252830, source = { "vendor", "trainer" }, cost = 2000, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Skirmisher's Leather Belt
    { spell = 1255078, skill = 150, creates = 252460, teach = 252829, source = { "vendor", "trainer" }, cost = 2000, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Warden's Leather Belt
    { spell = 1255079, skill = 150, creates = 252521, teach = 252828, source = { "vendor", "trainer" }, cost = 2000, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Stalker's Leather Belt
    { spell = 1255080, skill = 150, creates = 252520, teach = 252827, source = { "vendor", "trainer" }, cost = 2000, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Skulker's Leather Belt
    { spell = 1255081, skill = 150, creates = 252459, teach = 252826, source = { "vendor", "trainer" }, cost = 2000, bound = false, vendors = { { npc = 258306, area = 1537, faction = "Alliance" } } }, -- Prowler's Leather Belt
    { spell = 3772, skill = 130, creates = 4255, teach = 7613, source = { "vendor" }, bound = true, vendors = { { npc = 2679, area = 11, faction = "Alliance" }, { npc = 2698, area = 267, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Green Leather Armor
    { spell = 23399, skill = 130, creates = 18948, teach = 18949, source = { "vendor" }, bound = false, vendors = { { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 4589, area = 1497, faction = "Horde" } } }, -- Barbaric Bracers
    { spell = 3774, skill = 135, creates = 4257, source = { "trainer" }, cost = 900 }, -- Green Leather Belt
    { spell = 7147, skill = 135, creates = 5962, source = { "trainer" }, cost = 1000 }, -- Guardian Pants
    { spell = 429354, skill = 160, creates = 211423 }, -- Void-Touched Leather Gloves
    { spell = 429869, skill = 160, creates = 211502 }, -- Void-Touched Leather Gauntlets
    { spell = 439114, skill = 160, source = { "trainer" }, cost = 1000, creates = 217267 }, -- Guardian Pants
    { spell = 4096, skill = 140, creates = 4455, teach = 13287, source = { "drop", "vendor" }, bound = false, side = "Horde", vendors = { { npc = 2819, area = 45, faction = "Horde" } } }, -- Raptor Hide Harness
    { spell = 4097, skill = 140, creates = 4456, teach = 13288, source = { "drop", "vendor" }, bound = false, side = "Alliance", vendors = { { npc = 2816, area = 45, faction = "Alliance" } } }, -- Raptor Hide Belt
    { spell = 9195, skill = 140, creates = 7373, teach = 7449, source = { "drop" }, bound = false }, -- Dusky Leather Leggings
    { spell = 3775, skill = 145, creates = 4258, teach = 4298, source = { "drop" }, bound = false }, -- Guardian Belt
    { spell = 6704, skill = 145, creates = 5782, teach = 5788, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 2381, area = 267, faction = "Alliance" }, { npc = 2393, area = 267, faction = "Horde" }, { npc = 2846, area = 33 } } }, -- Thick Murloc Armor
    { spell = 7149, skill = 145, creates = 5963, teach = 5973, source = { "vendor" }, bound = true, vendors = { { npc = 2810, area = 45, faction = "Alliance" }, { npc = 2821, area = 45, faction = "Horde" }, { npc = 3958, area = 331, faction = "Alliance" }, { npc = 4877, area = 400, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Barbaric Leggings
    { spell = 439112, skill = 170, teach = 217266, source = { "drop" }, creates = 217265, bound = false }, -- Guardian Belt
    { spell = 3773, skill = 150, creates = 4256, teach = 4299, source = { "drop" }, bound = false }, -- Guardian Armor
    { spell = 7151, skill = 150, creates = 5964, source = { "trainer" }, cost = 1200 }, -- Barbaric Shoulders
    { spell = 9196, skill = 150, creates = 7374, source = { "trainer" }, cost = 1500 }, -- Dusky Leather Armor
    { spell = 9197, skill = 150, creates = 7375, teach = 7450, source = { "drop" }, bound = false }, -- Green Whelp Armor
    { spell = 1255065, skill = 175, creates = 252530, teach = 252842, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Leather Gloves
    { spell = 1255066, skill = 175, creates = 252529, teach = 252841, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Leather Gloves
    { spell = 1255067, skill = 175, creates = 252528, teach = 252840, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skirmisher's Leather Gloves
    { spell = 1255068, skill = 175, creates = 252527, teach = 252839, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Warden's Leather Gloves
    { spell = 1255069, skill = 175, creates = 252526, teach = 252838, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stalker's Leather Gloves
    { spell = 1255070, skill = 175, creates = 252525, teach = 252837, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skulker's Leather Gloves
    { spell = 1255071, skill = 175, creates = 252524, teach = 252836, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Prowler's Leather Gloves
    { spell = 1301528, skill = 175, creates = 277042, teach = 276978, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", bound = true, vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Gustwoven Hood
    { spell = 1301529, skill = 175, creates = 277043, teach = 276979, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", bound = true, vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Gustwoven Spaulders
    { spell = 1301530, skill = 175, creates = 277044, teach = 276980, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", bound = true, vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Windraveled Cover
    { spell = 1301531, skill = 175, creates = 277045, teach = 276981, source = { "vendor" }, reputation = { 2787, 5, ns.L.FACTION_2787 }, faction = "Horde", bound = true, vendors = { { npc = 264078, area = 215, faction = "Horde" } } }, -- Cloudy Windraveled Drapes
    { spell = 1301536, skill = 175, creates = 277050, teach = 276986, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", bound = true, vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Gustwoven Hood
    { spell = 1301537, skill = 175, creates = 277051, teach = 276987, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", bound = true, vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Gustwoven Spaulders
    { spell = 1301538, skill = 175, creates = 277052, teach = 276988, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", bound = true, vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Windraveled Cover
    { spell = 1301539, skill = 175, creates = 277053, teach = 276989, source = { "vendor" }, reputation = { 2740, 5, ns.L.FACTION_2740 }, faction = "Alliance", bound = true, vendors = { { npc = 32287, area = 36, faction = "Alliance" } } }, -- Azure Windraveled Drapes
    { spell = 3776, skill = 155, creates = 4259, source = { "trainer" }, cost = 1080 }, -- Green Leather Bracers
    { spell = 9198, skill = 155, creates = 7377, source = { "trainer" }, cost = 1800 }, -- Frost Leather Cloak
    { spell = 3778, skill = 160, creates = 4262, teach = 14635, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2699, area = 33 }, { npc = 12245, area = 405 } } }, -- Gem-studded Leather Belt
    { spell = 7153, skill = 160, creates = 5965, teach = 5974, source = { "drop" }, bound = false }, -- Guardian Cloak
    { spell = 9201, skill = 160, creates = 7378, source = { "trainer" }, cost = 1800 }, -- Dusky Bracers
    { spell = 1255073, skill = 185, creates = 252463, teach = 252834, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Forceful Thick Armor Kit
    { spell = 1255074, skill = 185, creates = 252462, teach = 252833, source = { "quest", "vendor" }, reputation = { 93, 8, ns.L.FACTION_93, 92, 6, ns.L.FACTION_92 }, bound = true, quests = { { id = 92817, area = 405, level = 30 } }, vendors = { { npc = 253140, area = 405 }, { npc = 253139, area = 405 } } }, -- Mystic Thick Armor Kit
    { spell = 6661, skill = 165, creates = 5739, source = { "trainer" }, cost = 1800 }, -- Barbaric Harness
    { spell = 6705, skill = 165, creates = 5783, teach = 5789, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 2846, area = 33 }, { npc = 4897, area = 15, faction = "Alliance" } } }, -- Murloc Scale Bracers
    { spell = 7156, skill = 165, creates = 5966, source = { "trainer" }, cost = 2400 }, -- Guardian Gloves
    { spell = 9202, skill = 165, creates = 7386, teach = 7451, source = { "vendor" }, bound = true, vendors = { { npc = 4225, area = 1657, faction = "Alliance" }, { npc = 4589, area = 1497, faction = "Horde" }, { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Green Whelp Bracers
    { spell = 21943, skill = 165, creates = 17721, teach = 17722, source = { "drop" }, bound = false }, -- Gloves of the Greatfather
    { spell = 3777, skill = 170, creates = 4260, teach = 4300, source = { "drop" }, bound = false }, -- Guardian Leather Bracers
    { spell = 9206, skill = 170, creates = 7387, source = { "trainer" }, cost = 2250 }, -- Dusky Belt
    { spell = 439110, skill = 195, teach = 217264, source = { "drop" }, creates = 217263, bound = false }, -- Guardian Leather Bracers
    { spell = 3779, skill = 175, creates = 4264, teach = 4301, source = { "drop" }, bound = false }, -- Barbaric Belt
    { spell = 9207, skill = 175, creates = 7390, teach = 7452, source = { "drop" }, bound = false }, -- Dusky Boots
    { spell = 9208, skill = 175, creates = 7391, teach = 7453, source = { "drop" }, bound = false }, -- Swift Boots
    { spell = 10482, skill = 175, creates = 8172, source = { "trainer" }, cost = 2000 }, -- Cured Thick Hide
    { spell = 10487, skill = 175, creates = 8173, source = { "trainer" }, cost = 2000 }, -- Thick Armor Kit
    { spell = 10490, skill = 175, creates = 8174, teach = 8384, source = { "drop" }, bound = false }, -- Comfortable Leather Hat
    { spell = 10662, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 35 }, -- Leatherworking (Artisan)
    { spell = 20650, skill = 175, creates = 4304, source = { "trainer" }, cost = 4000 }, -- Thick Leather
    { spell = 22711, skill = 175, creates = 18238, teach = 18239, source = { "vendor" }, bound = false, vendors = { { npc = 2699, area = 33 } } }, -- Shadowskin Gloves
    { spell = 435819, skill = 200, creates = 213369, teach = 215367, source = { "vendor" }, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Faintly Glowing Leather
    { spell = 1255008, skill = 200, creates = 252565, teach = 252899, source = { "drop" }, bound = false }, -- Mender's Mail Boots
    { spell = 1255009, skill = 200, creates = 252564, teach = 252898, bound = false }, -- Skirmisher's Mail Boots
    { spell = 1255010, skill = 200, creates = 252563, teach = 252897, bound = false }, -- Skycaller's Mail Boots
    { spell = 1255011, skill = 200, creates = 252562, teach = 252896, bound = false }, -- Stalker's Mail Boots
    { spell = 1255060, skill = 200, creates = 252533, teach = 252847, source = { "drop" }, bound = false }, -- Mender's Leather Shoes
    { spell = 1255061, skill = 200, creates = 252532, teach = 252846, source = { "drop" }, bound = false }, -- Skycaller's Leather Shoes
    { spell = 1255062, skill = 200, creates = 252466, teach = 252845, source = { "drop" }, bound = false }, -- Warden's Leather Shoes
    { spell = 1255063, skill = 200, creates = 252531, teach = 252844, bound = false }, -- Skulker's Leather Shoes
    { spell = 1255064, skill = 200, creates = 252465, teach = 252843, bound = false }, -- Prowler's Leather Shoes
    { spell = 10499, skill = 180, creates = 8175, source = { "trainer" }, cost = 3000 }, -- Nightscape Tunic
    { spell = 10507, skill = 180, creates = 8176, source = { "trainer" }, cost = 3000 }, -- Nightscape Headband
    { spell = 10509, skill = 180, creates = 8187, teach = 8385, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Turtle Scale Gloves
    { spell = 439118, skill = 205, creates = 217270, teach = 217271, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Turtle Scale Gloves
    { spell = 10511, skill = 185, creates = 8189, source = { "trainer" }, cost = 3000 }, -- Turtle Scale Breastplate
    { spell = 10516, skill = 185, creates = 8192, teach = 8409, source = { "vendor" }, bound = true, vendors = { { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Nightscape Shoulders
    { spell = 10518, skill = 185, creates = 8198, source = { "trainer" }, cost = 3150 }, -- Turtle Scale Bracers
    { spell = 439116, skill = 210, source = { "trainer" }, cost = 3000, creates = 217268 }, -- Turtle Scale Breastplate
    { spell = 1255004, skill = 210, creates = 252569, teach = 252903, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Mail Shoulder
    { spell = 1255005, skill = 210, creates = 252568, teach = 252902, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skirmisher's Mail Shoulder
    { spell = 1255006, skill = 210, creates = 252567, teach = 252901, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Mail Shoulder
    { spell = 1255007, skill = 210, creates = 252566, teach = 252900, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stalker's Mail Shoulder
    { spell = 1255055, skill = 210, creates = 252538, teach = 252852, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Leather Shoulder
    { spell = 1255056, skill = 210, creates = 252537, teach = 252851, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Leather Shoulder
    { spell = 1255057, skill = 210, creates = 252536, teach = 252850, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Warden's Leather Shoulder
    { spell = 1255058, skill = 210, creates = 252535, teach = 252849, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skulker's Leather Shoulder
    { spell = 1255059, skill = 210, creates = 252534, teach = 252848, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 60, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Prowler's Leather Shoulder
    { spell = 10520, skill = 190, creates = 8200, teach = 8386, source = { "drop" }, bound = false }, -- Big Voodoo Robe
    { spell = 439108, skill = 215, teach = 217262, source = { "drop" }, creates = 217261, bound = false }, -- Big Voodoo Robe
    { spell = 10525, skill = 195, creates = 8203, teach = 8395, source = { "drop" }, bound = false }, -- Tough Scorpid Breastplate
    { spell = 10529, skill = 195, creates = 8210, teach = 8403, source = { "quest" }, bound = true, quests = { { id = 2848, area = 357, faction = "Alliance", level = 30 }, { id = 2855, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Shoulders
    { spell = 10531, skill = 195, creates = 8201, teach = 8387, source = { "drop" }, bound = false }, -- Big Voodoo Mask
    { spell = 10533, skill = 195, creates = 8205, teach = 8397, source = { "drop" }, bound = false }, -- Tough Scorpid Bracers
    { spell = 439105, skill = 220, teach = 217260, source = { "drop" }, creates = 217259, bound = false }, -- Big Voodoo Mask
    { spell = 10542, skill = 200, creates = 8204, teach = 8398, source = { "drop" }, bound = false }, -- Tough Scorpid Gloves
    { spell = 10544, skill = 200, creates = 8211, teach = 8404, source = { "quest" }, bound = true, quests = { { id = 2849, area = 357, faction = "Alliance", level = 30 }, { id = 2856, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Vest
    { spell = 10546, skill = 200, creates = 8214, teach = 8405, source = { "quest" }, bound = true, quests = { { id = 2850, area = 357, faction = "Alliance", level = 30 }, { id = 2857, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Helmet
    { spell = 10619, skill = 225, creates = 8347, source = { "trainer" }, cost = 9000 }, -- Dragonscale Gauntlets
    { spell = 10621, skill = 225, creates = 8345, cost = 9000 }, -- Wolfshead Helm
    { spell = 14930, skill = 200, creates = 8217, source = { "trainer" }, cost = 3240 }, -- Quickdraw Quiver
    { spell = 14932, skill = 200, creates = 8218, source = { "trainer" }, cost = 3240 }, -- Thick Leather Ammo Pouch
    { spell = 435904, skill = 225, teach = 215152, source = { "vendor" }, creates = 215166, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Glowing Gneuro-Linked Cowl
    { spell = 435949, skill = 225, teach = 215422, source = { "vendor" }, creates = 215114, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Glowing Hyperconductive Scale Coif
    { spell = 435951, skill = 225, teach = 215423, source = { "vendor" }, creates = 215381, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Gneuro-Conductive Channeler's Hood
    { spell = 435953, skill = 225, teach = 215424, source = { "vendor" }, creates = 215382, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Rad-Resistant Scale Hood
    { spell = 1255000, skill = 225, creates = 252573, teach = 252907, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Mail Bracers
    { spell = 1255001, skill = 225, creates = 252572, teach = 252906, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skirmisher's Mail Bracers
    { spell = 1255002, skill = 225, creates = 252571, teach = 252905, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Mail Bracers
    { spell = 1255003, skill = 225, creates = 252570, teach = 252904, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stalker's Mail Bracers
    { spell = 1255050, skill = 225, creates = 252543, teach = 252857, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Leather Bracers
    { spell = 1255051, skill = 225, creates = 252542, teach = 252856, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Leather Bracers
    { spell = 1255052, skill = 225, creates = 252541, teach = 252855, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Warden's Leather Bracers
    { spell = 1255053, skill = 225, creates = 252540, teach = 252854, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skulker's Leather Bracers
    { spell = 1255054, skill = 225, creates = 252539, teach = 252853, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Prowler's Leather Bracers
    { spell = 10548, skill = 205, creates = 8193, source = { "trainer" }, cost = 4000 }, -- Nightscape Pants
    { spell = 10552, skill = 205, creates = 8191, source = { "trainer" }, cost = 4000 }, -- Turtle Scale Helm
    { spell = 10630, skill = 230, creates = 8346, cost = 9000 }, -- Gauntlets of the Sea
    { spell = 1254998, skill = 230, creates = 252575, teach = 252909, bound = false }, -- Charged Scorpid Belt
    { spell = 1254999, skill = 230, creates = 252574, teach = 252908, bound = false }, -- Supple Scorpid Boots
    { spell = 10554, skill = 210, creates = 8209, teach = 8399, source = { "drop" }, bound = false }, -- Tough Scorpid Boots
    { spell = 10556, skill = 210, creates = 8185, source = { "trainer" }, cost = 4500 }, -- Turtle Scale Leggings
    { spell = 10558, skill = 210, creates = 8197, source = { "trainer" }, cost = 4500 }, -- Nightscape Boots
    { spell = 1254965, skill = 235, creates = 252488, teach = 252942, source = { "vendor" }, bound = false, vendors = { { npc = 7854, area = 357, faction = "Horde" }, { npc = 8160, area = 47, faction = "Alliance" } } }, -- Forceful Rugged Armor Kit
    { spell = 1254966, skill = 235, creates = 252487, teach = 252941, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mystic Rugged Armor Kit
    { spell = 1254994, skill = 235, creates = 252579, teach = 252913, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Mail Sabatons
    { spell = 1254995, skill = 235, creates = 252578, teach = 252912, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skirmisher's Mail Sabatons
    { spell = 1254996, skill = 235, creates = 252577, teach = 252911, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Mail Sabatons
    { spell = 1254997, skill = 235, creates = 252576, teach = 252910, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stalker's Mail Sabatons
    { spell = 1255043, skill = 235, creates = 252472, teach = 252864, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Leather Boots
    { spell = 1255044, skill = 235, creates = 252471, teach = 252863, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Leather Boots
    { spell = 1255045, skill = 235, creates = 252470, teach = 252862, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Warden's Leather Boots
    { spell = 1255046, skill = 235, creates = 252469, teach = 252861, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skulker's Leather Boots
    { spell = 1255047, skill = 235, creates = 252468, teach = 252860, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Prowler's Leather Boots
    { spell = 1255048, skill = 235, creates = 252467, teach = 252859, bound = false }, -- Blue Suede Shoes
    { spell = 1255049, skill = 235, creates = 252544, teach = 252858, bound = false }, -- Tooled Leather Belt
    { spell = 10560, skill = 215, creates = 8202, teach = 8389, source = { "drop" }, bound = false }, -- Big Voodoo Pants
    { spell = 10562, skill = 215, creates = 8216, teach = 8390, source = { "drop" }, bound = false }, -- Big Voodoo Cloak
    { spell = 10564, skill = 215, creates = 8207, teach = 8400, source = { "drop" }, bound = false }, -- Tough Scorpid Shoulders
    { spell = 1254992, skill = 240, creates = 252581, teach = 252915, bound = false }, -- Charged Scorpid Helm
    { spell = 1254993, skill = 240, creates = 252580, teach = 252914, bound = false }, -- Supple Scorpid Leggings
    { spell = 1255041, skill = 240, creates = 252546, teach = 252866, bound = false }, -- Blue Suede Gloves
    { spell = 1255042, skill = 240, creates = 252545, teach = 252865, bound = false }, -- Tooled Leather Boots
    { spell = 10566, skill = 220, creates = 8213, teach = 8406, source = { "quest" }, bound = true, quests = { { id = 2851, area = 357, faction = "Alliance", level = 30 }, { id = 2858, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Boots
    { spell = 10568, skill = 220, creates = 8206, teach = 8401, source = { "drop" }, bound = false }, -- Tough Scorpid Leggings
    { spell = 10570, skill = 225, creates = 8208, teach = 8402, source = { "drop" }, bound = false }, -- Tough Scorpid Helm
    { spell = 10572, skill = 225, creates = 8212, teach = 8407, source = { "quest" }, bound = true, quests = { { id = 2852, area = 357, faction = "Alliance", level = 30 }, { id = 2859, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Leggings
    { spell = 10574, skill = 225, creates = 8215, teach = 8408, source = { "quest" }, bound = true, quests = { { id = 2853, area = 357, faction = "Alliance", level = 30 }, { id = 2860, area = 357, faction = "Horde", level = 30 } } }, -- Wild Leather Cloak
    { spell = 10632, skill = 250, creates = 8348, cost = 9000 }, -- Helm of Fire
    { spell = 10647, skill = 250, creates = 8349, cost = 9000 }, -- Feathered Breastplate
    { spell = 19047, skill = 225, creates = 15407, count = 2, source = { "trainer" }, cost = 5000 }, -- Cured Rugged Hide
    { spell = 19058, skill = 225, creates = 15564, source = { "trainer" }, cost = 5000 }, -- Rugged Armor Kit
    { spell = 22331, skill = 225, creates = 8170, source = { "trainer" }, cost = 5000 }, -- Rugged Leather
    { spell = 446183, skill = 250, creates = 220747 }, -- Paranoia Mantle
    { spell = 446185, skill = 250, creates = 220742 }, -- Shrieking Spaulders
    { spell = 446186, skill = 250, creates = 220743 }, -- Cacophonous Chain Shoulderguards
    { spell = 446189, skill = 250, creates = 220748 }, -- Shoulderpads of Obsession
    { spell = 446190, skill = 250, creates = 220744 }, -- Wailing Chain Mantle
    { spell = 446192, skill = 250, creates = 220745 }, -- Membrane of Dark Neurosis
    { spell = 451706, skill = 250, creates = 220741 }, -- Screaming Chain Pauldrons
    { spell = 1224618, skill = 250, teach = 238309, source = { "drop" }, creates = 238275, bound = false }, -- Scarlet Infiltrator's Bracers
    { spell = 1224620, skill = 250, teach = 238311, source = { "drop" }, creates = 238277, bound = false }, -- Scarlet Infiltrator's Belt
    { spell = 1224626, skill = 250, teach = 238317, source = { "drop" }, creates = 238283, bound = false }, -- Scarlet Huntsman's Wristguards
    { spell = 1224628, skill = 250, teach = 238319, source = { "drop" }, creates = 238285, bound = false }, -- Scarlet Huntsman's Clasp
    { spell = 1254982, skill = 250, creates = 252591, teach = 252925, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Mail Belt
    { spell = 1254983, skill = 250, creates = 252590, teach = 252924, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skirmisher's Mail Belt
    { spell = 1254984, skill = 250, creates = 252589, teach = 252923, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Mail Belt
    { spell = 1254985, skill = 250, creates = 252588, teach = 252922, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Stalker's Mail Belt
    { spell = 1254986, skill = 250, creates = 252587, teach = 252921, bound = false }, -- Mender's Mail Gauntlets
    { spell = 1254987, skill = 250, creates = 252586, teach = 252920, bound = false }, -- Skirmisher's Mail Gauntlets
    { spell = 1254988, skill = 250, creates = 252585, teach = 252919, bound = false }, -- Skycaller's Mail Gauntlets
    { spell = 1254989, skill = 250, creates = 252584, teach = 252918, bound = false }, -- Stalker's Mail Gauntlets
    { spell = 1254990, skill = 250, creates = 252583, teach = 252917, bound = false }, -- Charged Scorpid Shoulder
    { spell = 1254991, skill = 250, creates = 252582, teach = 252916, bound = false }, -- Supple Scorpid Bracers
    { spell = 1255031, skill = 250, creates = 252477, teach = 252876, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Mender's Leather Waistguard
    { spell = 1255032, skill = 250, creates = 252476, teach = 252875, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skycaller's Leather Waistguard
    { spell = 1255033, skill = 250, creates = 252475, teach = 252874, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Warden's Leather Waistguard
    { spell = 1255034, skill = 250, creates = 252474, teach = 252873, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Skulker's Leather Waistguard
    { spell = 1255035, skill = 250, creates = 252473, teach = 252872, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 90, bound = true, vendors = { { npc = 248201, area = 17, faction = "Horde" }, { npc = 256734, area = 44, faction = "Alliance" } } }, -- Prowler's Leather Waistguard
    { spell = 1255036, skill = 250, creates = 252551, teach = 252871, bound = false }, -- Mender's Leather Gauntlets
    { spell = 1255037, skill = 250, creates = 252550, teach = 252870, bound = false }, -- Skycaller's Leather Gauntlets
    { spell = 1255038, skill = 250, creates = 252549, teach = 252869, bound = false }, -- Warden's Leather Gauntlets
    { spell = 1255039, skill = 250, creates = 252548, teach = 252868, bound = false }, -- Skulker's Leather Gauntlets
    { spell = 1255040, skill = 250, creates = 252547, teach = 252867, bound = false }, -- Prowler's Leather Gauntlets
    { spell = 10650, skill = 255, creates = 8367, source = { "trainer" }, cost = 9000 }, -- Dragonscale Breastplate
    { spell = 19048, skill = 255, creates = 15077, teach = 15724, source = { "vendor" }, bound = true, vendors = { { npc = 12956, area = 1377 } } }, -- Heavy Scorpid Bracers
    { spell = 1254977, skill = 255, creates = 252596, teach = 252930, bound = false }, -- Charged Scorpid Gauntlets
    { spell = 1254978, skill = 255, creates = 252595, teach = 252929, bound = false }, -- Supple Scorpid Belt
    { spell = 1254979, skill = 255, creates = 252594, teach = 252928, bound = false }, -- Heavy Scorpid Boots
    { spell = 1254980, skill = 255, creates = 252593, teach = 252927, bound = false }, -- Charged Scorpid Bracers
    { spell = 1254981, skill = 255, creates = 252592, teach = 252926, bound = false }, -- Supple Scorpid Shoulder
    { spell = 1255029, skill = 255, creates = 252478, teach = 252878, bound = false }, -- Blue Suede Pants
    { spell = 1255030, skill = 255, creates = 252552, teach = 252877, source = { "vendor" }, bound = true, vendors = { { npc = 266901, area = 616 } } }, -- Tooled Leather Armor
    { spell = 19049, skill = 235, creates = 15083, teach = 15725, source = { "vendor" }, bound = true, vendors = { { npc = 12942, area = 28, faction = "Alliance" }, { npc = 12943, area = 85, faction = "Horde" } } }, -- Wicked Leather Gauntlets
    { spell = 19050, skill = 235, creates = 15045, teach = 15726, source = { "vendor" }, bound = false, vendors = { { npc = 11874, area = 8 } } }, -- Green Dragonscale Breastplate
    { spell = 461720, skill = 260, teach = 228309, source = { "vendor" }, creates = 227879, bound = false, vendors = { { npc = 11874, area = 8 } } }, -- Living Green Dragonscale Breastplate
    { spell = 1224619, skill = 260, teach = 238310, source = { "drop" }, creates = 238276, bound = false }, -- Scarlet Infiltrator's Gloves
    { spell = 1224622, skill = 260, teach = 238313, source = { "drop" }, creates = 238279, bound = false }, -- Scarlet Infiltrator's Shoes
    { spell = 1224627, skill = 260, teach = 238318, source = { "drop" }, creates = 238284, bound = false }, -- Scarlet Huntsman's Handguards
    { spell = 1224630, skill = 260, teach = 238321, source = { "drop" }, creates = 238287, bound = false }, -- Scarlet Huntsman's Boots
    { spell = 1254975, skill = 260, creates = 252598, teach = 252932, bound = false }, -- Charged Scorpid Vest
    { spell = 1254976, skill = 260, creates = 252597, teach = 252931, bound = false }, -- Supple Scorpid Helm
    { spell = 1255026, skill = 260, creates = 252554, teach = 252881, bound = false }, -- Blue Suede Shoulder
    { spell = 1255027, skill = 260, creates = 252553, teach = 252880, bound = false }, -- Tooled Leather Gauntlets
    { spell = 1255028, skill = 260, creates = 252479, teach = 252879, bound = false }, -- Wicked Leather Boots
    { spell = 19051, skill = 240, creates = 15076, teach = 15727, source = { "drop" }, bound = false }, -- Heavy Scorpid Vest
    { spell = 19052, skill = 240, creates = 15084, teach = 15728, source = { "drop" }, bound = false }, -- Wicked Leather Bracers
    { spell = 19053, skill = 240, creates = 15074, teach = 15729, source = { "vendor" }, bound = true, vendors = { { npc = 12957, area = 16 } } }, -- Chimeric Gloves
    { spell = 1255024, skill = 265, creates = 252480, teach = 252883, source = { "quest" }, bound = true, quests = { { id = 92817, area = 405, level = 30 } } }, -- Blue Suede Armor
    { spell = 1255025, skill = 265, creates = 252555, teach = 252882, bound = false }, -- Tooled Leather Crown
    { spell = 16650, skill = 270, creates = 12624, teach = 12691, source = { "drop" }, bound = false }, -- Wildthorn Mail
    { spell = 19055, skill = 245, creates = 15091, teach = 15731, source = { "drop" }, bound = false }, -- Runic Leather Gauntlets
    { spell = 19059, skill = 245, creates = 15054, teach = 15732, source = { "drop" }, bound = false }, -- Volcanic Leggings
    { spell = 19060, skill = 245, creates = 15046, teach = 15733, source = { "drop" }, bound = false }, -- Green Dragonscale Leggings
    { spell = 19061, skill = 245, creates = 15061, teach = 15734, source = { "vendor" }, bound = false, vendors = { { npc = 7852, area = 357, faction = "Alliance" }, { npc = 7854, area = 357, faction = "Horde" } } }, -- Living Shoulders
    { spell = 19062, skill = 245, creates = 15067, teach = 15735, source = { "vendor" }, bound = false, vendors = { { npc = 12958, area = 47 } } }, -- Ironfeather Shoulders
    { spell = 461649, skill = 270, teach = 227900, creates = 227877, bound = false }, -- Living Green Dragonscale Leggings
    { spell = 461665, skill = 270, teach = 227908, source = { "drop" }, creates = 227867, bound = false }, -- Masterwork Volcanic Leggings
    { spell = 461677, skill = 270, teach = 228251, creates = 227878, bound = false }, -- Living Green Dragonscale Gauntlets
    { spell = 1224621, skill = 270, teach = 238312, source = { "drop" }, creates = 238278, bound = false }, -- Scarlet Infiltrator's Trousers
    { spell = 1224629, skill = 270, teach = 238320, source = { "drop" }, creates = 238286, bound = false }, -- Scarlet Huntsman's Legguards
    { spell = 1254973, skill = 270, creates = 252600, teach = 252934, bound = false }, -- Charged Scorpid Leggings
    { spell = 1254974, skill = 270, creates = 252599, teach = 252933, source = { "vendor" }, bound = true, vendors = { { npc = 266901, area = 616 } } }, -- Supple Scorpid Vest
    { spell = 1255021, skill = 270, creates = 252481, teach = 252886, bound = false }, -- Blue Suede Belt
    { spell = 1255022, skill = 270, creates = 252557, teach = 252885, bound = false }, -- Tooled Leather Bracers
    { spell = 1255023, skill = 270, creates = 252556, teach = 252884, bound = false }, -- Wicked Leather Shoulder
    { spell = 19063, skill = 250, creates = 15073, teach = 15737, source = { "drop" }, bound = false }, -- Chimeric Boots
    { spell = 19064, skill = 250, creates = 15078, teach = 15738, source = { "drop" }, bound = false }, -- Heavy Scorpid Gauntlets
    { spell = 19065, skill = 250, creates = 15092, teach = 15739, source = { "drop" }, bound = false }, -- Runic Leather Bracers
    { spell = 19066, skill = 250, creates = 15071, teach = 15740, source = { "vendor" }, bound = true, vendors = { { npc = 11189, area = 618 } } }, -- Frostsaber Boots
    { spell = 19067, skill = 250, creates = 15057, teach = 15741, source = { "vendor" }, bound = false, vendors = { { npc = 12942, area = 28, faction = "Alliance" }, { npc = 12943, area = 85, faction = "Horde" } } }, -- Stormshroud Pants
    { spell = 19068, skill = 250, creates = 15064, teach = 15742, source = { "drop", "vendor" }, bound = false }, -- Warbear Harness
    { spell = 1226689, skill = 275, teach = 238927, creates = 238925, bound = true }, -- Scarlet Quiver
    { spell = 1226690, skill = 275, teach = 238928, creates = 238926, bound = true }, -- Scarlet Ammo Pouch
    { spell = 1255019, skill = 275, creates = 252559, teach = 252888, bound = false }, -- Blue Suede Bracers
    { spell = 1255020, skill = 275, creates = 252558, teach = 252887, bound = false }, -- Tooled Leather Epaulets
    { spell = 19070, skill = 255, creates = 15082, teach = 15743, source = { "drop" }, bound = false }, -- Heavy Scorpid Belt
    { spell = 19071, skill = 255, creates = 15086, teach = 15744, source = { "drop" }, bound = false }, -- Wicked Leather Headband
    { spell = 19072, skill = 255, creates = 15093, teach = 15745, source = { "drop" }, bound = false }, -- Runic Leather Belt
    { spell = 19073, skill = 255, creates = 15072, teach = 15746, source = { "drop" }, bound = false }, -- Chimeric Leggings
    { spell = 24655, skill = 280, creates = 20296, source = { "trainer" }, cost = 27000 }, -- Green Dragonscale Gauntlets
    { spell = 1224615, skill = 280, teach = 238306, source = { "drop" }, creates = 238272, bound = false }, -- Scarlet Infiltrator's Bandana
    { spell = 1224616, skill = 280, teach = 238307, source = { "drop" }, creates = 238273, bound = false }, -- Scarlet Infiltrator's Shoulderpads
    { spell = 1224617, skill = 280, teach = 238308, source = { "drop" }, creates = 238274, bound = false }, -- Scarlet Infiltrator's Vest
    { spell = 1224623, skill = 280, teach = 238314, source = { "drop" }, creates = 238280, bound = false }, -- Scarlet Huntsman's Coif
    { spell = 1224624, skill = 280, teach = 238315, source = { "drop" }, creates = 238281, bound = false }, -- Scarlet Huntsman's Pauldrons
    { spell = 1224625, skill = 280, teach = 238316, source = { "drop" }, creates = 238282, bound = false }, -- Scarlet Huntsman's Chain
    { spell = 1254971, skill = 280, creates = 252602, teach = 252936, bound = false }, -- Charged Scorpid Boots
    { spell = 1254972, skill = 280, creates = 252601, teach = 252935, bound = false }, -- Supple Scorpid Sabatons
    { spell = 1255017, skill = 280, creates = 252482, teach = 252890, bound = false }, -- Blue Suede Hat
    { spell = 1255018, skill = 280, creates = 252560, teach = 252889, bound = false }, -- Tooled Leather Pants
    { spell = 19074, skill = 260, creates = 15069, teach = 15747, source = { "drop" }, bound = false }, -- Frostsaber Leggings
    { spell = 19075, skill = 260, creates = 15079, teach = 15748, source = { "drop" }, bound = false }, -- Heavy Scorpid Leggings
    { spell = 19076, skill = 260, creates = 15053, teach = 15749, source = { "drop" }, bound = false }, -- Volcanic Breastplate
    { spell = 19077, skill = 260, creates = 15048, teach = 15751, source = { "vendor" }, bound = false, vendors = { { npc = 12957, area = 16 } } }, -- Blue Dragonscale Breastplate
    { spell = 19078, skill = 260, creates = 15060, teach = 15752, source = { "drop" }, bound = false }, -- Living Leggings
    { spell = 19079, skill = 260, creates = 15056, teach = 15753, source = { "drop" }, bound = false }, -- Stormshroud Armor
    { spell = 19080, skill = 260, creates = 15065, teach = 20254, source = { "vendor" }, reputation = { 576, 5, ns.L.FACTION_576 }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Warbear Woolies
    { spell = 22815, skill = 285, creates = 18258 }, -- Gordok Ogre Suit
    { spell = 44953, skill = 285, creates = 34086, teach = 34262, source = { "vendor" }, bound = true }, -- Winter Boots
    { spell = 461661, skill = 285, teach = 227906, source = { "drop" }, creates = 227868, bound = false }, -- Masterwork Volcanic Breastplate
    { spell = 461673, skill = 285, teach = 227898, source = { "vendor" }, creates = 227875, bound = false, vendors = { { npc = 12957, area = 16 } } }, -- Honed Blue Dragonscale Breastplate
    { spell = 461692, skill = 285, creates = 227855 }, -- Synthetic Gordok Ogre Suit
    { spell = 1297126, skill = 285, creates = 275610, teach = 275586, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true }, -- Bileblister Claws
    { spell = 1297129, skill = 285, creates = 275613, teach = 275589, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true }, -- Hivethrasher's Claws
    { spell = 1297132, skill = 285, creates = 275616, teach = 275592, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true }, -- Scalegut Clenchers
    { spell = 1297135, skill = 285, creates = 275619, teach = 275595, reputation = { 609, 5, ns.L.FACTION_609 }, bound = true }, -- Broodwatcher's Clenchers
    { spell = 19081, skill = 265, creates = 15075, teach = 15755, source = { "drop" }, bound = false }, -- Chimeric Vest
    { spell = 19082, skill = 265, creates = 15094, teach = 15756, source = { "vendor" }, bound = true, vendors = { { npc = 12941, area = 139 } } }, -- Runic Leather Headband
    { spell = 19083, skill = 265, creates = 15087, teach = 15757, source = { "drop" }, bound = false }, -- Wicked Leather Pants
    { spell = 19084, skill = 265, creates = 15063, teach = 15758, source = { "vendor" }, bound = false, vendors = { { npc = 12959, area = 490 } } }, -- Devilsaur Gauntlets
    { spell = 19085, skill = 265, creates = 15050, teach = 15759, source = { "vendor" }, bound = false, vendors = { { npc = 9499, area = 1584 } } }, -- Black Dragonscale Breastplate
    { spell = 19086, skill = 265, creates = 15066, teach = 15760, source = { "drop" }, bound = false }, -- Ironfeather Breastplate
    { spell = 23628, skill = 290, creates = 19043, teach = 19202, source = { "vendor" }, reputation = { 576, 6, ns.L.FACTION_576 }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Heavy Timbermaw Belt
    { spell = 23703, skill = 265, creates = 19044, teach = 19326, source = { "vendor" }, reputation = { 576, 6, ns.L.FACTION_576 }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Might of the Timbermaw
    { spell = 23705, skill = 265, creates = 19052, teach = 19328, source = { "vendor" }, reputation = { 529, 6, ns.L.FACTION_529 }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Dawn Treaders
    { spell = 461655, skill = 290, teach = 227902, source = { "vendor" }, creates = 227851, bound = false, vendors = { { npc = 9499, area = 1584 } } }, -- Hardened Black Dragonscale Breastplate
    { spell = 461722, skill = 290, teach = 228119, source = { "drop" }, creates = 227848, bound = false }, -- Devilcore Gauntlets
    { spell = 1297127, skill = 290, creates = 275611, teach = 275587, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Bileblister Girdle
    { spell = 1297130, skill = 290, creates = 275614, teach = 275590, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Hivethrasher's Girdle
    { spell = 1297133, skill = 290, creates = 275617, teach = 275593, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Scalegut Belt
    { spell = 1297136, skill = 290, creates = 275620, teach = 275596, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Broodwatcher's Belt
    { spell = 16661, skill = 295, creates = 12632, teach = 12703, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 11278, area = 28 } } }, -- Storm Gauntlets
    { spell = 19087, skill = 270, creates = 15070, teach = 15761, source = { "drop" }, bound = false }, -- Frostsaber Gloves
    { spell = 19088, skill = 270, creates = 15080, teach = 15762, source = { "vendor" }, bound = true, vendors = { { npc = 12956, area = 1377 } } }, -- Heavy Scorpid Helm
    { spell = 19089, skill = 270, creates = 15049, teach = 15763, source = { "drop" }, bound = false }, -- Blue Dragonscale Shoulders
    { spell = 19090, skill = 270, creates = 15058, teach = 15764, source = { "drop" }, bound = false }, -- Stormshroud Shoulders
    { spell = 20853, skill = 295, creates = 16982, teach = 17022, source = { "vendor" }, reputation = { 59, 5, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Corehound Boots
    { spell = 461645, skill = 295, teach = 227899, source = { "drop" }, creates = 227873, bound = false }, -- Honed Blue Dragonscale Shoulders
    { spell = 1297128, skill = 295, creates = 275612, teach = 275588, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Bileblister Boots
    { spell = 1297131, skill = 295, creates = 275615, teach = 275591, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Hivethrasher's Boots
    { spell = 1297134, skill = 295, creates = 275618, teach = 275594, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Scalegut Treaders
    { spell = 1297137, skill = 295, creates = 275621, teach = 275597, reputation = { 609, 6, ns.L.FACTION_609 }, bound = true }, -- Broodwatcher's Treaders
    { spell = 16728, skill = 300, creates = 12636, teach = 12716, source = { "drop" }, bound = false }, -- Helm of the Great Chief
    { spell = 16746, skill = 300, creates = 12641, teach = 12728, source = { "drop" }, bound = false }, -- Invulnerable Mail
    { spell = 19054, skill = 290, creates = 15047, teach = 15730, source = { "drop" }, bound = true }, -- Red Dragonscale Breastplate
    { spell = 19091, skill = 275, creates = 15095, teach = 15765, source = { "drop" }, bound = false }, -- Runic Leather Pants
    { spell = 19092, skill = 275, creates = 15088, teach = 15768, source = { "drop" }, bound = false }, -- Wicked Leather Belt
    { spell = 19093, skill = 300, creates = 15138 }, -- Onyxia Scale Cloak
    { spell = 19094, skill = 270, creates = 15051, teach = 15770, source = { "drop" }, bound = false }, -- Black Dragonscale Shoulders
    { spell = 19095, skill = 290, creates = 15059, teach = 15771, source = { "drop" }, bound = false }, -- Living Breastplate
    { spell = 19097, skill = 290, creates = 15062, teach = 15772, source = { "drop" }, bound = false }, -- Devilsaur Leggings
    { spell = 19098, skill = 280, creates = 15085, teach = 15773, source = { "drop" }, bound = false }, -- Wicked Leather Armor
    { spell = 19100, skill = 280, creates = 15081, teach = 15774, source = { "drop" }, bound = false }, -- Heavy Scorpid Shoulders
    { spell = 19101, skill = 280, creates = 15055, teach = 15775, source = { "drop" }, bound = false }, -- Volcanic Shoulders
    { spell = 19102, skill = 285, creates = 15090, teach = 15776, source = { "drop" }, bound = false }, -- Runic Leather Armor
    { spell = 19103, skill = 285, creates = 15096, teach = 15777, source = { "drop" }, bound = false }, -- Runic Leather Shoulders
    { spell = 19104, skill = 290, creates = 15068, teach = 15779, source = { "drop" }, bound = false }, -- Frostsaber Tunic
    { spell = 19107, skill = 290, creates = 15052, teach = 15781, source = { "drop" }, bound = false }, -- Black Dragonscale Leggings
    { spell = 20854, skill = 300, creates = 16983, teach = 17023, source = { "vendor" }, reputation = { 59, 5, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Molten Helm
    { spell = 20855, skill = 300, creates = 16984, teach = 17025, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Black Dragonscale Boots
    { spell = 22727, skill = 300, creates = 18251, teach = 18252, source = { "drop" }, bound = true }, -- Core Armor Kit
    { spell = 22921, skill = 290, creates = 18504, teach = 18514, source = { "drop" }, bound = true }, -- Girdle of Insight
    { spell = 22922, skill = 290, creates = 18506, teach = 18515, source = { "drop" }, bound = true }, -- Mongoose Boots
    { spell = 22923, skill = 290, creates = 18508, teach = 18516, source = { "drop" }, bound = true }, -- Swift Flight Bracers
    { spell = 22926, skill = 300, creates = 18509, teach = 18517, source = { "drop" }, bound = false }, -- Chromatic Cloak
    { spell = 22927, skill = 300, creates = 18510, teach = 18518, source = { "drop" }, bound = false }, -- Hide of the Wild
    { spell = 22928, skill = 300, creates = 18511, teach = 18519, source = { "drop" }, bound = false }, -- Shifting Cloak
    { spell = 23629, skill = 300, creates = 19048, teach = 19204, source = { "vendor" }, reputation = { 576, 7, ns.L.FACTION_576 }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Heavy Timbermaw Boots
    { spell = 23704, skill = 295, creates = 19049, teach = 19327, source = { "vendor" }, reputation = { 576, 7, ns.L.FACTION_576 }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Timbermaw Brawlers
    { spell = 23706, skill = 300, creates = 19058, teach = 19329, source = { "vendor" }, reputation = { 529, 7, ns.L.FACTION_529 }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Golden Mantle of the Dawn
    { spell = 23707, skill = 300, creates = 19149, teach = 19330, source = { "vendor" }, reputation = { 59, 6, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Lava Belt
    { spell = 23708, skill = 300, creates = 19157, teach = 19331, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Chromatic Gauntlets
    { spell = 23709, skill = 300, creates = 19162, teach = 19332, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Corehound Belt
    { spell = 23710, skill = 300, creates = 19163, teach = 19333, source = { "vendor" }, reputation = { 59, 7, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Molten Belt
    { spell = 24121, skill = 300, creates = 19685, teach = 19769, source = { "vendor" }, reputation = { 270, 7, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Primal Batskin Jerkin
    { spell = 24122, skill = 300, creates = 19686, teach = 19770, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Primal Batskin Gloves
    { spell = 24123, skill = 300, creates = 19687, teach = 19771, source = { "vendor" }, reputation = { 270, 5, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Primal Batskin Bracers
    { spell = 24124, skill = 300, creates = 19688, teach = 19772, source = { "vendor" }, reputation = { 270, 7, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Blood Tiger Breastplate
    { spell = 24125, skill = 300, creates = 19689, teach = 19773, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Blood Tiger Shoulders
    { spell = 24654, skill = 300, creates = 20295, source = { "trainer" }, cost = 45000 }, -- Blue Dragonscale Leggings
    { spell = 24703, skill = 300, creates = 20380, source = { "trainer" }, reputation = { 609, 8, ns.L.FACTION_609 } }, -- Dreamscale Breastplate
    { spell = 24846, skill = 300, creates = 20481, source = { "trainer" }, reputation = { 609, 5, ns.L.FACTION_609 } }, -- Spitfire Bracers
    { spell = 24847, skill = 300, creates = 20480, source = { "trainer" }, reputation = { 609, 6, ns.L.FACTION_609 } }, -- Spitfire Gauntlets
    { spell = 24848, skill = 300, creates = 20479, source = { "trainer" }, reputation = { 609, 7, ns.L.FACTION_609 } }, -- Spitfire Breastplate
    { spell = 24849, skill = 300, creates = 20476, source = { "trainer" }, reputation = { 609, 5, ns.L.FACTION_609 } }, -- Sandstalker Bracers
    { spell = 24850, skill = 300, creates = 20477, source = { "trainer" }, reputation = { 609, 6, ns.L.FACTION_609 } }, -- Sandstalker Gauntlets
    { spell = 24851, skill = 300, creates = 20478, source = { "trainer" }, reputation = { 609, 7, ns.L.FACTION_609 } }, -- Sandstalker Breastplate
    { spell = 26279, skill = 290, creates = 21278, teach = 21548, source = { "drop" }, bound = false }, -- Stormshroud Gloves
    { spell = 28219, skill = 300, creates = 22661, source = { "trainer" }, reputation = { 529, 8, ns.L.FACTION_529 } }, -- Polar Tunic
    { spell = 28220, skill = 300, creates = 22662, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 } }, -- Polar Gloves
    { spell = 28221, skill = 300, creates = 22663, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 } }, -- Polar Bracers
    { spell = 28222, skill = 300, creates = 22664, source = { "trainer" }, reputation = { 529, 8, ns.L.FACTION_529 } }, -- Icy Scale Breastplate
    { spell = 28223, skill = 300, creates = 22666, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 } }, -- Icy Scale Gauntlets
    { spell = 28224, skill = 300, creates = 22665, source = { "trainer" }, reputation = { 529, 7, ns.L.FACTION_529 } }, -- Icy Scale Bracers
    { spell = 28472, skill = 300, creates = 22759, source = { "vendor" }, reputation = { 609, 7, ns.L.FACTION_609 } }, -- Bramblewood Helm
    { spell = 28473, skill = 300, creates = 22760, source = { "vendor" }, reputation = { 609, 6, ns.L.FACTION_609 } }, -- Bramblewood Boots
    { spell = 28474, skill = 300, creates = 22761, source = { "vendor" }, reputation = { 609, 5, ns.L.FACTION_609 } }, -- Bramblewood Belt
    { spell = 461653, skill = 300, teach = 227910, source = { "drop" }, creates = 227869, bound = false }, -- Brilliant Chromatic Cloak
    { spell = 461657, skill = 300, teach = 227903, source = { "drop" }, creates = 227852, bound = false }, -- Hardened Black Dragonscale Leggings
    { spell = 461659, skill = 300, teach = 227904, source = { "drop" }, creates = 227853, bound = false }, -- Hardened Black Dragonscale Shoulders
    { spell = 461663, skill = 300, teach = 227907, source = { "drop" }, creates = 227866, bound = false }, -- Masterwork Volcanic Shoulders
    { spell = 461690, skill = 300, teach = 228276, source = { "drop" }, creates = 227854, bound = false }, -- Mastercrafted Shifting Cloak
    { spell = 461706, skill = 300, teach = 228301, source = { "drop" }, creates = 227883, bound = true }, -- Swift Flight Vambraces
    { spell = 461724, skill = 300, teach = 228120, source = { "drop" }, creates = 227847, bound = false }, -- Devilcore Leggings
    { spell = 461754, skill = 300, teach = 228319, source = { "drop" }, creates = 227882, bound = true }, -- Girdle of Arcane Insight
    { spell = 1254967, skill = 300, creates = 252606, teach = 252940, bound = false }, -- Pristine Scorpid Leggings
    { spell = 1254968, skill = 300, creates = 252605, teach = 252939, bound = false }, -- Black Dragonscale Helm
    { spell = 1254969, skill = 300, creates = 252604, teach = 252938, bound = false }, -- Blue Dragonscale Helm
    { spell = 1254970, skill = 300, creates = 252603, teach = 252937, bound = false }, -- Red Dragonscale Leggings
    { spell = 1255012, skill = 300, creates = 252486, teach = 252895, bound = false }, -- Ironfeather Leggings
    { spell = 1255013, skill = 300, creates = 252485, teach = 252894, bound = false }, -- Warbear Helm
    { spell = 1255014, skill = 300, creates = 252484, teach = 252893, bound = false }, -- Timbermaw Tunic
    { spell = 1255015, skill = 300, creates = 252483, teach = 252892, bound = false }, -- Dawn Armor
    { spell = 1255016, skill = 300, creates = 252561, teach = 252891, bound = false }, -- Living Crown
    { spell = 1263079, skill = 300, creates = 279945, teach = 273121, bound = false }, -- Sewing Machine
    { spell = 1306526, skill = 300, creates = 279252, teach = 279301, bound = true }, -- Elderwild Waistcord
    { spell = 1306527, skill = 300, creates = 279253, teach = 279302, bound = true }, -- Outlaw's Collar
    { spell = 1306528, skill = 300, creates = 279254, teach = 279303, bound = true }, -- Elderwild Pants
    { spell = 1306529, skill = 300, creates = 279255, teach = 279304, bound = true }, -- Eternity Pauldrons
    { spell = 1306530, skill = 300, creates = 279256, teach = 279305, bound = true }, -- Tranquil Wristguards
    { spell = 1306531, skill = 300, creates = 279257, teach = 279306, bound = true }, -- Mourning Handguards
    { spell = 1306532, skill = 300, creates = 279258, teach = 279307, bound = true }, -- Wild Leather Armor Kit
}
