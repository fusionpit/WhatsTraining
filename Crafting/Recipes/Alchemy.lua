local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[171] = {
    { spell = 2329, skill = 15, creates = 2454, source = { "trainer" }, cost = 50 }, -- Elixir of Minor Strength
    { spell = 7183, skill = 1, creates = 5997 }, -- Elixir of Minor Defense
    { spell = 1245246, skill = 10, creates = 247754 }, -- Minor Arcane Elixir
    { spell = 1245250, skill = 10, creates = 247755 }, -- Elixir of Minor Force
    { spell = 3170, skill = 15, creates = 3382, source = { "trainer" }, cost = 50 }, -- Minor Troll's Blood Elixir
    { spell = 1250793, skill = 15, creates = 250344, teach = 250380, source = { "drop" }, bound = false }, -- Elixir of Minor Spirit
    { spell = 1230564, skill = 20, creates = 279956, source = { "quest", "trainer" }, cost = 100, quests = { { id = 96045, area = 1537, faction = "Alliance", level = 4 }, { id = 97899, area = 14, faction = "Horde", level = 4 }, { id = 97915, area = 12, faction = "Alliance", level = 4 }, { id = 97927, area = 215, faction = "Horde", level = 4 }, { id = 97938, area = 141, faction = "Alliance", level = 4 }, { id = 97951, area = 85, faction = "Horde", level = 4 }, { id = 97963, area = 16593, level = 4 } } }, -- Mana Well
    { spell = 2331, skill = 25, creates = 2455, source = { "trainer" }, cost = 100 }, -- Minor Mana Potion
    { spell = 1250788, skill = 25, creates = 250339, teach = 250375, source = { "drop" }, bound = false }, -- Minor Mageblood Elixir
    { spell = 1251741, skill = 30, creates = 250944, teach = 250988, source = { "drop" }, bound = false }, -- Minor Mender's Potion
    { spell = 1251729, skill = 35, creates = 250932, teach = 250976, source = { "drop" }, bound = false }, -- Minor Spellblasting Potion
    { spell = 2332, skill = 40, creates = 2456, source = { "trainer" }, cost = 150 }, -- Minor Rejuvenation Potion
    { spell = 1251735, skill = 40, creates = 250938, teach = 250982, source = { "drop" }, bound = false }, -- Minor Frenzy Potion
    { spell = 1250779, skill = 45, creates = 250330, teach = 250366, source = { "drop" }, bound = false }, -- Minor Cleric's Elixir
    { spell = 2334, skill = 50, creates = 2458, source = { "trainer" }, cost = 250 }, -- Elixir of Minor Fortitude
    { spell = 3101, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 10 }, -- Alchemy (Journeyman)
    { spell = 3230, skill = 50, creates = 2457, teach = 2553, source = { "drop" }, bound = false }, -- Elixir of Minor Agility
    { spell = 4508, skill = 50, creates = 4596, teach = 4597, source = { "quest", "trainer" }, cost = 10, bound = true, quests = { { id = 91920, area = 130, faction = "Horde", level = 10 }, { id = 92110, area = 40, faction = "Alliance", level = 10 } } }, -- Minor Discolored Healing Potion
    { spell = 1249630, skill = 40, creates = 249409, source = { "trainer" }, cost = 150 }, -- Cerulean Dye
    { spell = 1249633, skill = 40, creates = 249410, source = { "trainer" }, cost = 150 }, -- Sulfuric Acid
    { spell = 2335, skill = 60, creates = 2459, teach = 2555, source = { "drop" }, bound = false }, -- Swiftness Potion
    { spell = 6617, skill = 60, creates = 5631, teach = 5640, source = { "vendor" }, bound = false, vendors = { { npc = 1669, area = 40 }, { npc = 1685, area = 38, faction = "Alliance" }, { npc = 3335, area = 1637, faction = "Horde" }, { npc = 3499, area = 17 } } }, -- Rage Potion
    { spell = 1250794, skill = 65, creates = 250345, teach = 250381, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Lesser Spirit
    { spell = 1250789, skill = 75, creates = 250340, teach = 250376, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Lesser Mageblood Elixir
    { spell = 7836, skill = 80, creates = 6370, source = { "trainer" }, cost = 250 }, -- Blackmouth Oil
    { spell = 1251742, skill = 80, creates = 250945, teach = 250989, source = { "drop" }, bound = false }, -- Lesser Mender's Potion
    { spell = 1244645, skill = 85, creates = 247239, source = { "trainer" }, cost = 100 }, -- Lesser Discolored Healing Potion
    { spell = 1251730, skill = 85, creates = 250933, teach = 250977, source = { "drop" }, bound = false }, -- Lesser Spellblasting Potion
    { spell = 3171, skill = 90, creates = 3383, source = { "trainer" }, cost = 500 }, -- Elixir of Wisdom
    { spell = 7179, skill = 90, creates = 5996, source = { "trainer" }, cost = 450 }, -- Draught of Water Breathing
    { spell = 8240, skill = 90, creates = 6662, teach = 6663, source = { "drop" }, bound = false }, -- Elixir of Giant Growth
    { spell = 426607, skill = 90, creates = 210708, teach = 210709, source = { "vendor" }, bound = false, vendors = { { npc = 3134, area = 10 }, { npc = 3537, area = 267 } } }, -- Elixir of Coalesced Regret
    { spell = 1251736, skill = 90, creates = 250939, teach = 250983, source = { "drop" }, bound = false }, -- Lesser Frenzy Potion
    { spell = 1250780, skill = 95, creates = 250331, teach = 250367, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Lesser Cleric's Elixir
    { spell = 1250801, skill = 95, creates = 250353, teach = 250388, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Lesser Intellect
    { spell = 2365, skill = 100, creates = 2460 }, -- Draught of Tongues
    { spell = 7255, skill = 100, creates = 6051, teach = 6053, source = { "vendor" }, bound = true, vendors = { { npc = 1685, area = 38, faction = "Alliance" }, { npc = 3134, area = 10 }, { npc = 3490, area = 17, faction = "Horde" } } }, -- Holy Protection Potion
    { spell = 7841, skill = 100, creates = 6372, source = { "trainer" }, cost = 1000 }, -- Swim Speed Potion
    { spell = 3172, skill = 110, creates = 3384, teach = 3393, source = { "drop" }, bound = false }, -- Minor Magic Resistance Potion
    { spell = 1250795, skill = 115, creates = 250346, teach = 250382, source = { "drop" }, bound = false }, -- Elixir of Spirit
    { spell = 3173, skill = 120, creates = 3385, source = { "trainer" }, cost = 1500 }, -- Lesser Mana Potion
    { spell = 3174, skill = 120, creates = 3386, teach = 3394, source = { "drop" }, bound = false }, -- Potion of Poison Cleansing
    { spell = 1250791, skill = 120, creates = 250342, teach = 250378, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Lesser Arcane Elixir
    { spell = 3176, skill = 125, creates = 3388, source = { "trainer" }, cost = 1500 }, -- Lesser Troll's Blood Elixir
    { spell = 3464, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 20 }, -- Alchemy (Expert)
    { spell = 3177, skill = 130, creates = 3389, source = { "trainer" }, cost = 2000 }, -- Elixir of Lesser Defense
    { spell = 7837, skill = 130, creates = 6371, count = 2, source = { "trainer" }, cost = 1000 }, -- Fire Oil
    { spell = 1249631, skill = 120, creates = 249430, source = { "trainer" }, cost = 1500 }, -- Magenta Dye
    { spell = 1251743, skill = 130, creates = 250946, teach = 250990, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Mender's Potion
    { spell = 7256, skill = 135, creates = 6048, teach = 6054, source = { "vendor" }, bound = true, vendors = { { npc = 2393, area = 267, faction = "Horde" }, { npc = 3956, area = 331, faction = "Alliance" } } }, -- Shadow Protection Potion
    { spell = 1244646, skill = 135, creates = 247240, source = { "trainer" }, cost = 500 }, -- Discolored Healing Potion
    { spell = 1250802, skill = 135, creates = 250354, teach = 250389, source = { "drop" }, bound = false }, -- Elixir of Intellect
    { spell = 1251731, skill = 135, creates = 250934, teach = 250978, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Spellblasting Potion
    { spell = 2333, skill = 140, creates = 3390, teach = 3396, source = { "drop" }, bound = false }, -- Elixir of Lesser Agility
    { spell = 7845, skill = 140, creates = 6373, source = { "trainer" }, cost = 3000 }, -- Elixir of Fire Power
    { spell = 1251737, skill = 140, creates = 250940, teach = 250984, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Frenzy Potion
    { spell = 1263005, skill = 140, creates = 279970, teach = 273085, source = { "drop" }, bound = false }, -- Fermenter
    { spell = 1250781, skill = 145, creates = 250332, teach = 250368, source = { "drop" }, bound = false }, -- Cleric's Elixir
    { spell = 3188, skill = 150, creates = 3391, teach = 6211, source = { "drop" }, bound = false }, -- Elixir of Ogre Strength
    { spell = 6624, skill = 150, creates = 5634, teach = 5642, source = { "vendor" }, bound = false, vendors = { { npc = 3348, area = 1637, faction = "Horde" }, { npc = 4226, area = 1657, faction = "Alliance" }, { npc = 5178, area = 1537, faction = "Alliance" }, { npc = 12245, area = 405 } } }, -- Free Action Potion
    { spell = 1250783, skill = 150, creates = 250334, teach = 250370, bound = false }, -- Elixir of Fortitude
    { spell = 1250798, skill = 150, creates = 250349, teach = 250385, bound = false }, -- Elixir of Strength
    { spell = 3452, skill = 160, creates = 3827, source = { "trainer" }, cost = 5000 }, -- Mana Potion
    { spell = 3448, skill = 165, creates = 3823, source = { "trainer" }, cost = 5000 }, -- Lesser Invisibility Potion
    { spell = 3449, skill = 165, creates = 3824, count = 2, teach = 6068, source = { "vendor" }, bound = true, vendors = { { npc = 2481, area = 10 }, { npc = 4878, area = 400, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Shadow Oil
    { spell = 7257, skill = 165, creates = 6049, teach = 6055, source = { "vendor" }, bound = true, vendors = { { npc = 2380, area = 267, faction = "Alliance" }, { npc = 4083, area = 406, faction = "Horde" } } }, -- Fire Protection Potion
    { spell = 1250796, skill = 165, creates = 250347, teach = 250383, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Greater Spirit
    { spell = 3450, skill = 175, creates = 3825, teach = 3830, source = { "drop", "trainer" }, cost = 6000, bound = false }, -- Elixir of Lesser Fortitude
    { spell = 6618, skill = 175, creates = 5633, teach = 5643, source = { "vendor" }, bound = false, vendors = { { npc = 3335, area = 1637, faction = "Horde" }, { npc = 4226, area = 1657, faction = "Alliance" }, { npc = 12245, area = 405 } } }, -- Great Rage Potion
    { spell = 1244647, skill = 175, creates = 247241, source = { "trainer" }, cost = 1500 }, -- Greater Discolored Healing Potion
    { spell = 1250790, skill = 175, creates = 250341, teach = 250377, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Greater Mageblood Elixir
    { spell = 3451, skill = 180, creates = 3826, teach = 3831, source = { "drop" }, bound = false }, -- Troll's Blood Elixir
    { spell = 1251750, skill = 180, creates = 250952, teach = 250996, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Disorienting Smog Potion
    { spell = 11449, skill = 185, creates = 8949, source = { "trainer" }, cost = 6500 }, -- Elixir of Agility
    { spell = 1251732, skill = 185, creates = 250935, teach = 250979, source = { "quest", "vendor" }, reputation = { 93, 6, ns.L.FACTION_93, 92, 8, ns.L.FACTION_92 }, bound = true, quests = { { id = 92754, area = 405, level = 30 } }, vendors = { { npc = 253139, area = 405 }, { npc = 253140, area = 405 } } }, -- Greater Spellblasting Potion
    { spell = 1251744, skill = 180, creates = 250947 }, -- Greater Mender's Potion
    { spell = 7258, skill = 190, creates = 6050, teach = 6056, source = { "vendor" }, bound = true, vendors = { { npc = 2812, area = 45, faction = "Alliance" }, { npc = 2848, area = 33 } } }, -- Frost Protection Potion
    { spell = 7259, skill = 190, creates = 6052, teach = 6057, source = { "vendor" }, bound = true, vendors = { { npc = 2848, area = 33 }, { npc = 5594, area = 440 }, { npc = 8157, area = 357, faction = "Alliance" }, { npc = 8158, area = 357, faction = "Horde" } } }, -- Nature Protection Potion
    { spell = 21923, skill = 190, creates = 17708, teach = 17709, source = { "drop" }, bound = false }, -- Elixir of Frost Power
    { spell = 439960, skill = 190, creates = 217398, teach = 217399, source = { "vendor" }, bound = true, vendors = { { npc = 213077, area = 1519, faction = "Alliance" }, { npc = 214070, area = 1637, faction = "Horde" }, { npc = 214096, area = 1638, faction = "Horde" }, { npc = 214098, area = 1497, faction = "Horde" }, { npc = 214099, area = 1537, faction = "Alliance" }, { npc = 214101, area = 1657, faction = "Alliance" } } }, -- Lesser Arcane Elixir
    { spell = 1251738, skill = 190, creates = 250941, teach = 250985, source = { "quest", "vendor" }, reputation = { 93, 6, ns.L.FACTION_93, 92, 8, ns.L.FACTION_92 }, bound = true, quests = { { id = 92754, area = 405, level = 30 } }, vendors = { { npc = 253139, area = 405 }, { npc = 253140, area = 405 } } }, -- Greater Frenzy Potion
    { spell = 3453, skill = 195, creates = 3828, teach = 3832, source = { "drop" }, bound = false }, -- Draught of Detect Lesser Invisibility
    { spell = 11450, skill = 195, creates = 8951, source = { "trainer" }, cost = 7500 }, -- Elixir of Defense
    { spell = 1250776, skill = 195, creates = 250327, teach = 250363, bound = false }, -- Draught of Predatory Senses
    { spell = 1250782, skill = 195, creates = 250333, teach = 250369, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Greater Cleric's Elixir
    { spell = 3454, skill = 200, creates = 3829, count = 2, teach = 14634, source = { "vendor" }, bound = true, vendors = { { npc = 2480, area = 36 } } }, -- Frost Oil
    { spell = 11611, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 35 }, -- Alchemy (Artisan)
    { spell = 12609, skill = 200, creates = 10592, source = { "trainer" }, cost = 8000 }, -- Catseye Draught
    { spell = 435969, skill = 200, teach = 215434, source = { "vendor" }, creates = 213372, bound = true }, -- Insulating Gniodine
    { spell = 1250784, skill = 200, creates = 250335, teach = 250371, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Greater Fortitude
    { spell = 11448, skill = 205, creates = 6149, source = { "trainer" }, cost = 9000 }, -- Greater Mana Potion
    { spell = 11451, skill = 205, creates = 8956, source = { "trainer" }, cost = 8000 }, -- Oil of Immolation
    { spell = 1250775, skill = 205, creates = 250326 }, -- Revealing Draught
    { spell = 11453, skill = 210, creates = 9036, teach = 9293, source = { "drop" }, bound = false }, -- Magic Resistance Potion
    { spell = 11456, skill = 210, creates = 9061, count = 2, teach = 10644, source = { "crafted" }, bound = false }, -- Goblin Rocket Fuel
    { spell = 4942, skill = 215, creates = 4623, teach = 4624, source = { "quest" }, bound = false, quests = { { id = 715, area = 3, level = 35 } } }, -- Lesser Stoneshield Potion
    { spell = 11452, skill = 215, creates = 9030 }, -- Restorative Potion
    { spell = 22808, skill = 215, creates = 18294, source = { "trainer" }, cost = 10000 }, -- Draught of Greater Water Breathing
    { spell = 11458, skill = 225, creates = 9144, teach = 9294, source = { "drop" }, bound = false }, -- Wildvine Potion
    { spell = 11459, skill = 225, creates = 9149, teach = 9303, source = { "vendor" }, bound = false, vendors = { { npc = 5594, area = 440 } } }, -- Philosopher's Stone
    { spell = 11479, skill = 225, creates = 3577, teach = 9304, source = { "vendor", "trainer" }, cost = 2500, bound = false, vendors = { { npc = 5594, area = 440 } } }, -- Transmute: Iron to Gold
    { spell = 11480, skill = 225, creates = 6037, teach = 9305, source = { "vendor", "trainer" }, cost = 10000, bound = true, vendors = { { npc = 5594, area = 440 } } }, -- Transmute: Mithril to Truesilver
    { spell = 435971, skill = 225, teach = 215163, source = { "vendor" }, creates = 215162, count = 5, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Mildly Irradiated Rejuvenation Potion
    { spell = 11460, skill = 230, creates = 9154, source = { "trainer" }, cost = 5000 }, -- Draught of Detect Undead
    { spell = 15833, skill = 230, creates = 12190, source = { "trainer" }, cost = 10000 }, -- Dreamless Sleep Potion
    { spell = 1244648, skill = 230, creates = 247242, source = { "trainer" }, cost = 5000 }, -- Superior Discolored Healing Potion
    { spell = 1249632, skill = 215, creates = 249431, source = { "trainer" }, cost = 10000 }, -- Viridian Dye
    { spell = 1251745, skill = 230, creates = 250948, teach = 250992, bound = false }, -- Superior Mender's Potion
    { spell = 11461, skill = 235, creates = 9155, source = { "trainer" }, cost = 10000 }, -- Arcane Elixir
    { spell = 11464, skill = 235, creates = 9172, teach = 9295, source = { "drop" }, bound = false }, -- Invisibility Potion
    { spell = 11465, skill = 235, creates = 9179, source = { "trainer" }, cost = 12000 }, -- Elixir of Greater Intellect
    { spell = 1251733, skill = 235, creates = 250936, teach = 250980, bound = false }, -- Superior Spellblasting Potion
    { spell = 11466, skill = 240, creates = 9088, teach = 9296, source = { "drop" }, bound = false }, -- Gift of Arthas
    { spell = 11467, skill = 240, creates = 9187, source = { "trainer" }, cost = 12000 }, -- Elixir of Greater Agility
    { spell = 11468, skill = 240, creates = 9197, teach = 9297, source = { "drop" }, bound = false }, -- Draught of Dream Vision
    { spell = 1251739, skill = 240, creates = 250942, teach = 250986, bound = false }, -- Superior Frenzy Potion
    { spell = 11472, skill = 245, creates = 9206, teach = 9298, source = { "drop" }, bound = false }, -- Elixir of Greater Strength
    { spell = 11473, skill = 245, creates = 9210, count = 2, teach = 9302, source = { "vendor" }, bound = true, vendors = { { npc = 8157, area = 357, faction = "Alliance" }, { npc = 8158, area = 357, faction = "Horde" } } }, -- Ghost Dye
    { spell = 1251751, skill = 245, creates = 250953, teach = 250997, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 120, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Dragonfire Potion
    { spell = 3175, skill = 250, creates = 3387, teach = 3395, source = { "drop" }, bound = false }, -- Limited Invulnerability Potion
    { spell = 11476, skill = 250, creates = 9264, teach = 9301, source = { "vendor" }, bound = false, vendors = { { npc = 1313, area = 1519, faction = "Alliance" }, { npc = 4610, area = 1497, faction = "Horde" } } }, -- Elixir of Shadow Power
    { spell = 11477, skill = 250, creates = 9224, teach = 9300, source = { "vendor" }, bound = true, vendors = { { npc = 8177, area = 8, faction = "Horde" }, { npc = 8178, area = 4, faction = "Alliance" } } }, -- Potion of Demon Slaying
    { spell = 11478, skill = 250, creates = 9233, source = { "trainer" }, cost = 14000 }, -- Draught of Detect Demon
    { spell = 17551, skill = 250, creates = 13423, count = 2, source = { "trainer" }, cost = 15000 }, -- Stonescale Oil
    { spell = 26277, skill = 250, creates = 21546, teach = 21547, source = { "drop" }, bound = false }, -- Elixir of Holy Power
    { spell = 446226, skill = 250, creates = 221024 }, -- Flask of Everlasting Nightmares
    { spell = 446851, skill = 250, creates = 221313 }, -- Jar of Nightmarish Mojo
    { spell = 448085, skill = 250, creates = 222952 }, -- Flask of Restless Dreams
    { spell = 1231583, skill = 250, creates = 241650, teach = 241651, source = { "trainer" }, cost = 10000, bound = true }, -- Major Discolored Healing Potion
    { spell = 1244421, skill = 250, creates = 246948, teach = 236754, bound = true }, -- Distilled Firewater
    { spell = 1250778, skill = 250, creates = 250329, teach = 250365, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of the Phalanx
    { spell = 17552, skill = 255, creates = 13442, teach = 13476, source = { "drop" }, bound = false }, -- Mighty Rage Potion
    { spell = 17553, skill = 260, creates = 13443, teach = 13477, source = { "vendor" }, bound = false, vendors = { { npc = 4226, area = 1657, faction = "Alliance" }, { npc = 4610, area = 1497, faction = "Horde" } } }, -- Superior Mana Potion
    { spell = 17554, skill = 265, creates = 13445, teach = 13478, source = { "vendor" }, bound = false, vendors = { { npc = 3348, area = 1637, faction = "Horde" }, { npc = 5178, area = 1537, faction = "Alliance" } } }, -- Elixir of Greater Defense
    { spell = 1251749, skill = 265, creates = 250951, teach = 250995, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Caustic Smog Potion
    { spell = 17555, skill = 270, creates = 13447, teach = 13479, source = { "drop" }, bound = false }, -- Elixir of the Sages
    { spell = 17187, skill = 275, creates = 12360, teach = 12958, source = { "vendor" }, bound = false, vendors = { { npc = 5594, area = 440 } } }, -- Transmute: Arcanite
    { spell = 17557, skill = 275, creates = 13453, teach = 13481, source = { "drop" }, bound = false }, -- Elixir of Brute Force
    { spell = 17559, skill = 275, creates = 7078, teach = 13482, source = { "vendor" }, reputation = { 529, 6, ns.L.FACTION_529 }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Transmute: Air to Fire
    { spell = 17560, skill = 275, creates = 7076, teach = 13483, source = { "vendor" }, bound = true, vendors = { { npc = 9499, area = 1584 } } }, -- Transmute: Fire to Earth
    { spell = 17561, skill = 275, creates = 7080, teach = 13484, source = { "vendor" }, reputation = { 576, 5, ns.L.FACTION_576 }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Transmute: Earth to Water
    { spell = 17562, skill = 275, creates = 7082, teach = 13485, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Transmute: Water to Air
    { spell = 17563, skill = 275, creates = 7080, teach = 13486, source = { "drop" }, bound = false }, -- Transmute: Undeath to Water
    { spell = 17564, skill = 275, creates = 12808, teach = 13487, source = { "drop" }, bound = false }, -- Transmute: Water to Undeath
    { spell = 17565, skill = 275, creates = 7076, teach = 13488, source = { "drop" }, bound = false }, -- Transmute: Life to Earth
    { spell = 17566, skill = 275, creates = 12803, teach = 13489, source = { "drop" }, bound = false }, -- Transmute: Earth to Life
    { spell = 24365, skill = 275, creates = 20007, teach = 20011, source = { "vendor" }, reputation = { 270, 7, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Mageblood Elixir
    { spell = 24366, skill = 275, creates = 20002, teach = 20012, source = { "vendor" }, reputation = { 270, 5, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Greater Dreamless Sleep Potion
    { spell = 1250777, skill = 275, creates = 250328, teach = 250364, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Cunning
    { spell = 1250787, skill = 275, creates = 250338, teach = 250374, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Sages
    { spell = 1250797, skill = 275, creates = 250348, teach = 250384, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of the Whale
    { spell = 1250799, skill = 275, creates = 250350, teach = 250386, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Ferocity
    { spell = 1251748, skill = 275, creates = 250950, teach = 250994, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Potion of Venomous Blood
    { spell = 1317279, skill = 275, creates = 251290, teach = 284871, bound = false }, -- Transmute: Legionite
    { spell = 17570, skill = 280, creates = 13455, teach = 13490, source = { "drop" }, bound = false }, -- Greater Stoneshield Potion
    { spell = 17571, skill = 280, creates = 13452, teach = 13491, source = { "drop" }, bound = false }, -- Elixir of the Mongoose
    { spell = 1250786, skill = 280, creates = 250337, teach = 250373, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of the Owl
    { spell = 1251747, skill = 280, creates = 250949, teach = 250993, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Major Mender's Potion
    { spell = 1251752, skill = 280, creates = 250954, teach = 250998, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Potion of Elemental Purging
    { spell = 1251753, skill = 280, creates = 250955, teach = 250999, bound = true }, -- Potion of Beast Slaying
    { spell = 17572, skill = 285, creates = 13462, teach = 13492, source = { "drop" }, bound = false }, -- Purification Potion
    { spell = 17573, skill = 285, creates = 13454, teach = 13493, source = { "drop" }, bound = false }, -- Greater Arcane Elixir
    { spell = 24367, skill = 285, creates = 20008, teach = 20013, source = { "vendor" }, reputation = { 270, 8, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Living Action Potion
    { spell = 1250785, skill = 285, creates = 250336, teach = 250372, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Wicked Regeneration
    { spell = 1250792, skill = 285, creates = 250343, teach = 250379, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of Nature Power
    { spell = 1251734, skill = 285, creates = 250937, teach = 250981, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Major Spellblasting Potion
    { spell = 17574, skill = 290, creates = 13457, teach = 13494, source = { "drop" }, bound = false }, -- Greater Fire Protection Potion
    { spell = 17575, skill = 290, creates = 13456, teach = 13495, source = { "drop" }, bound = false }, -- Greater Frost Protection Potion
    { spell = 17576, skill = 290, creates = 13458, teach = 13496, source = { "drop" }, bound = false }, -- Greater Nature Protection Potion
    { spell = 17577, skill = 290, creates = 13461, teach = 13497, source = { "drop" }, bound = false }, -- Greater Arcane Protection Potion
    { spell = 17578, skill = 290, creates = 13459, teach = 13499, source = { "drop" }, bound = false }, -- Greater Shadow Protection Potion
    { spell = 24368, skill = 290, creates = 20004, teach = 20014, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Major Troll's Blood Elixir
    { spell = 1251740, skill = 290, creates = 250943, teach = 250987, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Major Frenzy Potion
    { spell = 17580, skill = 295, creates = 13444, teach = 13501, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Major Mana Potion
    { spell = 17632, skill = 300, creates = 13503, teach = 13517, source = { "vendor" }, reputation = { 2747, 8, ns.L.FACTION_2747 }, bound = true, vendors = { { npc = 256629, area = 616 } } }, -- Alchemist's Stone
    { spell = 17634, skill = 300, creates = 13506, teach = 13518, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 227853, area = 33 } } }, -- Flask of Petrification
    { spell = 17635, skill = 300, creates = 13510, teach = 13519, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 227853, area = 33 } } }, -- Flask of the Titans
    { spell = 17636, skill = 300, creates = 13511, teach = 13520, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 227853, area = 33 } } }, -- Flask of Distilled Wisdom
    { spell = 17637, skill = 300, creates = 13512, teach = 13521, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 227853, area = 33 } } }, -- Flask of Supreme Power
    { spell = 17638, skill = 300, creates = 13513, teach = 13522, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 227853, area = 33 } } }, -- Flask of Chromatic Resistance
    { spell = 22732, skill = 300, creates = 18253, teach = 18257, source = { "drop" }, bound = false }, -- Major Rejuvenation Potion
    { spell = 25146, skill = 300, creates = 7068, count = 3, teach = 20761, source = { "vendor" }, reputation = { 59, 5, ns.L.FACTION_59 }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Transmute: Elemental Fire
    { spell = 1250800, skill = 300, creates = 250351, teach = 250387, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 240, bound = true, vendors = { { npc = 248196, area = 17, faction = "Horde" }, { npc = 256729, area = 44, faction = "Alliance" } } }, -- Elixir of the Grizzly
    { spell = 1263078, skill = 300, creates = 279990, teach = 273112, bound = false }, -- Alchemy Laboratory
    { spell = 1293559, skill = 300, creates = 274273, teach = 274277, bound = true }, -- Flask of Natural Accuracy
    { spell = 1293560, skill = 300, creates = 274274, teach = 274278, bound = true }, -- Flask of Natural Aggression
    { spell = 1293561, skill = 300, creates = 274275, teach = 274279, bound = true }, -- Flask of Natural Precision
    { spell = 1293562, skill = 300, creates = 274276, teach = 274280, bound = true }, -- Flask of Natural Swiftness
    { spell = 24266, skill = 315, creates = 19931, count = 3 }, -- Gurubashi Mojo Madness
}
