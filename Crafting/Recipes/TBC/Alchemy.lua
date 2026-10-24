local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[171] = {
    { spell = 2329, skill = 1, autoLearned = true, creates = 2454 }, -- Elixir of Lion's Strength
    { spell = 2330, skill = 1, autoLearned = true, creates = 118 }, -- Minor Healing Potion
    { spell = 7183, skill = 1, autoLearned = true, creates = 5997 }, -- Elixir of Minor Defense
    { spell = 3170, skill = 15, creates = 3382, source = { "trainer" }, cost = 50 }, -- Weak Troll's Blood Potion
    { spell = 2331, skill = 25, creates = 2455, source = { "trainer" }, cost = 100 }, -- Minor Mana Potion
    { spell = 2332, skill = 40, creates = 2456, source = { "trainer" }, cost = 150 }, -- Minor Rejuvenation Potion
    { spell = 2334, skill = 50, creates = 2458, source = { "trainer" }, cost = 250 }, -- Elixir of Minor Fortitude
    { spell = 3101, skill = 50, rank = "Journeyman", level = 10, source = { "trainer" }, cost = 500 }, -- Alchemy (Journeyman)
    { spell = 3230, skill = 50, creates = 2457, teach = 2553, source = { "drop" }, bound = false }, -- Elixir of Minor Agility
    { spell = 4508, skill = 50, creates = 4596, teach = 4597, source = { "quest" }, bound = false, quests = { { id = 429, area = 130, faction = "Horde", level = 10 } } }, -- Discolored Healing Potion
    { spell = 2337, skill = 55, creates = 858, source = { "trainer" }, cost = 1000 }, -- Lesser Healing Potion
    { spell = 2335, skill = 60, creates = 2459, teach = 2555, source = { "drop" }, bound = false }, -- Swiftness Potion
    { spell = 6617, skill = 60, creates = 5631, teach = 5640, source = { "vendor" }, bound = false, vendors = { { npc = 1669, area = 40 }, { npc = 1685, area = 38, faction = "Alliance" }, { npc = 3335, area = 1637, faction = "Horde" }, { npc = 3499, area = 17 } } }, -- Rage Potion
    { spell = 7836, skill = 80, creates = 6370, source = { "trainer" }, cost = 250 }, -- Blackmouth Oil
    { spell = 3171, skill = 90, creates = 3383, source = { "trainer" }, cost = 500 }, -- Elixir of Wisdom
    { spell = 7179, skill = 90, creates = 5996, source = { "trainer" }, cost = 450 }, -- Elixir of Water Breathing
    { spell = 8240, skill = 90, creates = 6662, teach = 6663, source = { "drop" }, bound = false }, -- Elixir of Giant Growth
    { spell = 7255, skill = 100, creates = 6051, teach = 6053, source = { "vendor" }, bound = false, vendors = { { npc = 1685, area = 38, faction = "Alliance" }, { npc = 3134, area = 10 }, { npc = 3490, area = 17, faction = "Horde" } } }, -- Holy Protection Potion
    { spell = 7841, skill = 100, creates = 6372, source = { "trainer" }, cost = 1000 }, -- Swim Speed Potion
    { spell = 3172, skill = 110, creates = 3384, teach = 3393, source = { "drop" }, bound = false }, -- Minor Magic Resistance Potion
    { spell = 3447, skill = 110, creates = 929, source = { "trainer" }, cost = 4000 }, -- Healing Potion
    { spell = 3173, skill = 120, creates = 3385, source = { "trainer" }, cost = 1500 }, -- Lesser Mana Potion
    { spell = 3174, skill = 120, creates = 3386, teach = 3394, source = { "drop" }, bound = false }, -- Potion of Curing
    { spell = 3176, skill = 125, creates = 3388, source = { "trainer" }, cost = 1500 }, -- Strong Troll's Blood Potion
    { spell = 3464, skill = 125, rank = "Expert", level = 20, source = { "trainer" }, cost = 5000 }, -- Alchemy (Expert)
    { spell = 3177, skill = 130, creates = 3389, source = { "trainer" }, cost = 2000 }, -- Elixir of Defense
    { spell = 7837, skill = 130, creates = 6371, source = { "trainer" }, cost = 1000 }, -- Fire Oil
    { spell = 7256, skill = 135, creates = 6048, teach = 6054, source = { "vendor" }, bound = false, vendors = { { npc = 2393, area = 267, faction = "Horde" }, { npc = 3956, area = 331, faction = "Alliance" } } }, -- Shadow Protection Potion
    { spell = 2333, skill = 140, creates = 3390, teach = 3396, source = { "drop" }, bound = false }, -- Elixir of Lesser Agility
    { spell = 7845, skill = 140, creates = 6373, source = { "trainer" }, cost = 3000 }, -- Elixir of Firepower
    { spell = 3188, skill = 150, creates = 3391, teach = 6211, source = { "drop" }, bound = false }, -- Elixir of Ogre's Strength
    { spell = 6624, skill = 150, creates = 5634, teach = 5642, source = { "vendor" }, bound = false, vendors = { { npc = 3348, area = 1637, faction = "Horde" }, { npc = 4226, area = 1657, faction = "Alliance" }, { npc = 5178, area = 1537, faction = "Alliance" }, { npc = 12245, area = 405 } } }, -- Free Action Potion
    { spell = 7181, skill = 155, creates = 1710, source = { "trainer" }, cost = 5000 }, -- Greater Healing Potion
    { spell = 3452, skill = 160, creates = 3827, source = { "trainer" }, cost = 5000 }, -- Mana Potion
    { spell = 3448, skill = 165, creates = 3823, source = { "trainer" }, cost = 5000 }, -- Lesser Invisibility Potion
    { spell = 3449, skill = 165, creates = 3824, teach = 6068, source = { "vendor" }, bound = false, vendors = { { npc = 2481, area = 10 }, { npc = 4878, area = 400, faction = "Horde" }, { npc = 12245, area = 405 } } }, -- Shadow Oil
    { spell = 7257, skill = 165, creates = 6049, teach = 6055, source = { "vendor" }, bound = false, vendors = { { npc = 2380, area = 267, faction = "Alliance" }, { npc = 4083, area = 406, faction = "Horde" } } }, -- Fire Protection Potion
    { spell = 3450, skill = 175, creates = 3825, teach = 3830, source = { "drop" }, cost = 6000, bound = false }, -- Elixir of Fortitude
    { spell = 6618, skill = 175, creates = 5633, teach = 5643, source = { "vendor" }, bound = false, vendors = { { npc = 3335, area = 1637, faction = "Horde" }, { npc = 4226, area = 1657, faction = "Alliance" }, { npc = 12245, area = 405 } } }, -- Great Rage Potion
    { spell = 3451, skill = 180, creates = 3826, teach = 3831, source = { "drop" }, bound = false }, -- Mighty Troll's Blood Potion
    { spell = 11449, skill = 185, creates = 8949, source = { "trainer" }, cost = 6500 }, -- Elixir of Agility
    { spell = 7258, skill = 190, creates = 6050, teach = 6056, source = { "vendor" }, bound = false, vendors = { { npc = 2812, area = 45, faction = "Alliance" }, { npc = 2848, area = 33 } } }, -- Frost Protection Potion
    { spell = 7259, skill = 190, creates = 6052, teach = 6057, source = { "vendor" }, bound = false, vendors = { { npc = 2848, area = 33 }, { npc = 5594, area = 440 }, { npc = 8157, area = 357, faction = "Alliance" }, { npc = 8158, area = 357, faction = "Horde" } } }, -- Nature Protection Potion
    { spell = 21923, skill = 190, creates = 17708, teach = 17709, source = { "drop" }, bound = false }, -- Elixir of Frost Power
    { spell = 3453, skill = 195, creates = 3828, teach = 3832, source = { "drop" }, bound = false }, -- Elixir of Detect Lesser Invisibility
    { spell = 11450, skill = 195, creates = 8951, source = { "trainer" }, cost = 7500 }, -- Elixir of Greater Defense
    { spell = 3454, skill = 200, creates = 3829, teach = 14634, source = { "vendor" }, bound = false, vendors = { { npc = 2480, area = 36 } } }, -- Frost Oil
    { spell = 11611, skill = 200, rank = "Artisan", level = 35, source = { "trainer" }, cost = 50000 }, -- Alchemy (Artisan)
    { spell = 12609, skill = 200, creates = 10592, source = { "trainer" }, cost = 8000 }, -- Catseye Elixir
    { spell = 11448, skill = 205, creates = 6149, source = { "trainer" }, cost = 9000 }, -- Greater Mana Potion
    { spell = 11451, skill = 205, creates = 8956, source = { "trainer" }, cost = 8000 }, -- Oil of Immolation
    { spell = 11453, skill = 210, creates = 9036, teach = 9293, source = { "drop" }, bound = false }, -- Magic Resistance Potion
    { spell = 11456, skill = 210, creates = 9061, teach = 10644, source = { "crafted" }, bound = false }, -- Goblin Rocket Fuel
    { spell = 4942, skill = 215, creates = 4623, teach = 4624, source = { "quest" }, bound = false, quests = { { id = 715, area = 3, level = 35 } } }, -- Lesser Stoneshield Potion
    { spell = 11452, skill = 215, creates = 9030, source = { "quest" }, quests = { { id = 2203, area = 3, faction = "Horde", level = 40 }, { id = 2501, area = 38, level = 40 } } }, -- Restorative Potion
    { spell = 11457, skill = 215, creates = 3928, source = { "trainer" }, cost = 10000 }, -- Superior Healing Potion
    { spell = 22808, skill = 215, creates = 18294, source = { "trainer" }, cost = 10000 }, -- Elixir of Greater Water Breathing
    { spell = 11458, skill = 225, creates = 9144, teach = 9294, source = { "drop" }, bound = false }, -- Wildvine Potion
    { spell = 11459, skill = 225, creates = 9149, teach = 9303, source = { "vendor" }, bound = false, vendors = { { npc = 5594, area = 440 } } }, -- Philosopher's Stone
    { spell = 11479, skill = 225, creates = 3577, count = 0, teach = 9304, source = { "vendor" }, bound = false, vendors = { { npc = 5594, area = 440 } } }, -- Transmute: Iron to Gold
    { spell = 11480, skill = 225, creates = 6037, count = 0, teach = 9305, source = { "vendor" }, cost = 10000, bound = false, vendors = { { npc = 5594, area = 440 } } }, -- Transmute: Mithril to Truesilver
    { spell = 11460, skill = 230, creates = 9154, source = { "trainer" }, cost = 5000 }, -- Elixir of Detect Undead
    { spell = 15833, skill = 230, creates = 12190, source = { "trainer" }, cost = 10000 }, -- Dreamless Sleep Potion
    { spell = 11461, skill = 235, creates = 9155, source = { "trainer" }, cost = 10000 }, -- Arcane Elixir
    { spell = 11464, skill = 235, creates = 9172, teach = 9295, source = { "drop" }, bound = false }, -- Invisibility Potion
    { spell = 11465, skill = 235, creates = 9179, source = { "trainer" }, cost = 12000 }, -- Elixir of Greater Intellect
    { spell = 11466, skill = 240, creates = 9088, teach = 9296, source = { "drop" }, bound = false }, -- Gift of Arthas
    { spell = 11467, skill = 240, creates = 9187, source = { "trainer" }, cost = 12000 }, -- Elixir of Greater Agility
    { spell = 11468, skill = 240, creates = 9197, teach = 9297, source = { "drop" }, bound = false }, -- Elixir of Dream Vision
    { spell = 11472, skill = 245, creates = 9206, teach = 9298, source = { "drop" }, bound = false }, -- Elixir of Giants
    { spell = 11473, skill = 245, creates = 9210, teach = 9302, source = { "vendor" }, bound = false, vendors = { { npc = 8157, area = 357, faction = "Alliance" }, { npc = 8158, area = 357, faction = "Horde" } } }, -- Ghost Dye
    { spell = 3175, skill = 250, creates = 3387, teach = 3395, source = { "drop" }, bound = false }, -- Limited Invulnerability Potion
    { spell = 11476, skill = 250, creates = 9264, teach = 9301, source = { "vendor" }, bound = false, vendors = { { npc = 1313, area = 1519, faction = "Alliance" }, { npc = 4610, area = 1497, faction = "Horde" } } }, -- Elixir of Shadow Power
    { spell = 11477, skill = 250, creates = 9224, teach = 9300, source = { "vendor" }, bound = false, vendors = { { npc = 8177, area = 8, faction = "Horde" }, { npc = 8178, area = 4, faction = "Alliance" } } }, -- Elixir of Demonslaying
    { spell = 11478, skill = 250, creates = 9233, source = { "trainer" }, cost = 14000 }, -- Elixir of Detect Demon
    { spell = 17551, skill = 250, creates = 13423, source = { "trainer" }, cost = 15000 }, -- Stonescale Oil
    { spell = 26277, skill = 250, creates = 21546, teach = 21547, source = { "drop" }, bound = false }, -- Elixir of Greater Firepower
    { spell = 17552, skill = 255, creates = 13442, teach = 13476, source = { "drop" }, cost = 15000, bound = false }, -- Mighty Rage Potion
    { spell = 17553, skill = 260, creates = 13443, teach = 13477, source = { "vendor" }, cost = 15000, bound = false, vendors = { { npc = 4226, area = 1657, faction = "Alliance" }, { npc = 4610, area = 1497, faction = "Horde" } } }, -- Superior Mana Potion
    { spell = 17554, skill = 265, creates = 13445, teach = 13478, source = { "vendor" }, bound = false, vendors = { { npc = 3348, area = 1637, faction = "Horde" }, { npc = 5178, area = 1537, faction = "Alliance" } } }, -- Elixir of Superior Defense
    { spell = 17555, skill = 270, creates = 13447, teach = 13479, source = { "drop" }, cost = 15000, bound = false }, -- Elixir of the Sages
    { spell = 17187, skill = 275, creates = 12360, count = 0, teach = 12958, source = { "vendor" }, bound = false, vendors = { { npc = 5594, area = 440 } } }, -- Transmute: Arcanite
    { spell = 17556, skill = 275, creates = 13446, teach = 13480, source = { "vendor" }, cost = 20000, bound = false, vendors = { { npc = 11188, area = 618 } } }, -- Major Healing Potion
    { spell = 17557, skill = 275, creates = 13453, teach = 13481, source = { "drop" }, cost = 20000, bound = false }, -- Elixir of Brute Force
    { spell = 17559, skill = 275, creates = 7078, count = 0, teach = 13482, reputation = { 529, 6, ns.L.FACTION_529 }, source = { "vendor" }, bound = true, vendors = { { npc = 10856, area = 85 }, { npc = 10857, area = 28 }, { npc = 11536, area = 139 } } }, -- Transmute: Air to Fire
    { spell = 17560, skill = 275, creates = 7076, count = 0, teach = 13483, source = { "vendor" }, bound = true, vendors = { { npc = 9499, area = 1584 } } }, -- Transmute: Fire to Earth
    { spell = 17561, skill = 275, creates = 7080, count = 0, teach = 13484, reputation = { 576, 5, ns.L.FACTION_576 }, source = { "vendor" }, bound = true, vendors = { { npc = 11557, area = 361 } } }, -- Transmute: Earth to Water
    { spell = 17562, skill = 275, creates = 7082, count = 0, teach = 13485, source = { "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Transmute: Water to Air
    { spell = 17563, skill = 275, creates = 7080, count = 0, teach = 13486, source = { "drop" }, bound = false }, -- Transmute: Undeath to Water
    { spell = 17564, skill = 275, creates = 12808, count = 0, teach = 13487, source = { "drop" }, bound = false }, -- Transmute: Water to Undeath
    { spell = 17565, skill = 275, creates = 7076, count = 0, teach = 13488, source = { "drop" }, bound = false }, -- Transmute: Life to Earth
    { spell = 17566, skill = 275, creates = 12803, count = 0, teach = 13489, source = { "drop" }, bound = false }, -- Transmute: Earth to Life
    { spell = 24365, skill = 275, creates = 20007, teach = 20011, reputation = { 270, 7, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Mageblood Potion
    { spell = 24366, skill = 275, creates = 20002, teach = 20012, reputation = { 270, 5, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Greater Dreamless Sleep Potion
    { spell = 28596, skill = 275, rank = "Master", level = 50, source = { "trainer" }, cost = 100000 }, -- Alchemy (Master)
    { spell = 17570, skill = 280, creates = 13455, teach = 13490, source = { "drop" }, bound = false }, -- Greater Stoneshield Potion
    { spell = 17571, skill = 280, creates = 13452, teach = 13491, source = { "drop" }, bound = false }, -- Elixir of the Mongoose
    { spell = 17572, skill = 285, creates = 13462, teach = 13492, source = { "drop" }, cost = 20000, bound = false }, -- Purification Potion
    { spell = 17573, skill = 285, creates = 13454, teach = 13493, source = { "drop" }, cost = 20000, bound = false }, -- Greater Arcane Elixir
    { spell = 24367, skill = 285, creates = 20008, teach = 20013, reputation = { 270, 8, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Living Action Potion
    { spell = 17574, skill = 290, creates = 13457, teach = 13494, source = { "drop" }, bound = false }, -- Greater Fire Protection Potion
    { spell = 17575, skill = 290, creates = 13456, teach = 13495, source = { "drop" }, bound = false }, -- Greater Frost Protection Potion
    { spell = 17576, skill = 290, creates = 13458, teach = 13496, source = { "drop" }, bound = false }, -- Greater Nature Protection Potion
    { spell = 17577, skill = 290, creates = 13461, teach = 13497, source = { "drop" }, bound = false }, -- Greater Arcane Protection Potion
    { spell = 17578, skill = 290, creates = 13459, teach = 13499, source = { "drop" }, bound = false }, -- Greater Shadow Protection Potion
    { spell = 24368, skill = 290, creates = 20004, teach = 20014, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Major Troll's Blood Potion
    { spell = 17580, skill = 295, creates = 13444, teach = 13501, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 11278, area = 28 } } }, -- Major Mana Potion
    { spell = 17632, skill = 300, creates = 13503, teach = 13517, reputation = { 935, 7, ns.L.FACTION_935 }, source = { "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Alchemist's Stone
    { spell = 17634, skill = 300, creates = 13506, teach = 13518, source = { "drop" }, bound = false }, -- Flask of Petrification
    { spell = 17635, skill = 300, creates = 13510, teach = 13519, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 21432, area = 3703 } } }, -- Flask of the Titans
    { spell = 17636, skill = 300, creates = 13511, teach = 13520, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 17904, area = 3521 } } }, -- Flask of Distilled Wisdom
    { spell = 17637, skill = 300, creates = 13512, teach = 13521, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 21643, area = 440 } } }, -- Flask of Supreme Power
    { spell = 17638, skill = 300, creates = 13513, teach = 13522, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 21655, area = 3703 } } }, -- Flask of Chromatic Resistance
    { spell = 22732, skill = 300, creates = 18253, teach = 18257, source = { "drop" }, bound = false }, -- Major Rejuvenation Potion
    { spell = 24266, skill = 300, creates = 19931, count = 3, source = { "trainer" } }, -- Gurubashi Mojo Madness
    { spell = 25146, skill = 300, creates = 7068, count = 3, teach = 20761, reputation = { 59, 5, ns.L.FACTION_59 }, source = { "vendor" }, bound = true, vendors = { { npc = 12944, area = 1584 } } }, -- Transmute: Elemental Fire
    { spell = 28580, skill = 300, creates = 21885, source = { "discovery" } }, -- Transmute: Primal Shadow to Water
    { spell = 28581, skill = 300, creates = 22456, source = { "discovery" } }, -- Transmute: Primal Water to Shadow
    { spell = 28582, skill = 300, creates = 21884, source = { "discovery" } }, -- Transmute: Primal Mana to Fire
    { spell = 28583, skill = 300, creates = 22457, source = { "discovery" } }, -- Transmute: Primal Fire to Mana
    { spell = 28584, skill = 300, creates = 22452, source = { "discovery" } }, -- Transmute: Primal Life to Earth
    { spell = 28585, skill = 300, creates = 21886, source = { "discovery" } }, -- Transmute: Primal Earth to Life
    { spell = 28586, skill = 300, creates = 22850, source = { "discovery" } }, -- Super Rejuvenation Potion
    { spell = 28587, skill = 300, creates = 22851, source = { "discovery" } }, -- Flask of Fortification
    { spell = 28588, skill = 300, creates = 22853, source = { "discovery" } }, -- Flask of Mighty Restoration
    { spell = 28589, skill = 300, creates = 22854, source = { "discovery" } }, -- Flask of Relentless Assault
    { spell = 28590, skill = 300, creates = 22861, source = { "discovery" } }, -- Flask of Blinding Light
    { spell = 28591, skill = 300, creates = 22866, source = { "discovery" } }, -- Flask of Pure Death
    { spell = 33732, skill = 300, creates = 28100, source = { "trainer" }, cost = 20000 }, -- Volatile Healing Potion
    { spell = 33738, skill = 300, creates = 28102, source = { "trainer" }, cost = 20000 }, -- Onslaught Elixir
    { spell = 33740, skill = 300, creates = 28103, source = { "trainer" }, cost = 20000 }, -- Adept's Elixir
    { spell = 28543, skill = 305, creates = 22823, teach = 22900, source = { "vendor" }, bound = true, vendors = { { npc = 16588, area = 3483, faction = "Horde" }, { npc = 16641, area = 3487, faction = "Horde" }, { npc = 16705, area = 3557, faction = "Alliance" }, { npc = 18802, area = 3483, faction = "Alliance" }, { npc = 19837, area = 3522 } } }, -- Elixir of Camouflage
    { spell = 28544, skill = 305, creates = 22824, source = { "trainer" }, cost = 25000 }, -- Elixir of Major Strength
    { spell = 28545, skill = 310, creates = 22825, source = { "trainer" }, cost = 25000 }, -- Elixir of Healing Power
    { spell = 33733, skill = 310, creates = 28101, source = { "trainer" }, cost = 25000 }, -- Unstable Mana Potion
    { spell = 39636, skill = 310, creates = 32062, source = { "trainer" }, cost = 25000 }, -- Elixir of Major Fortitude
    { spell = 28546, skill = 315, creates = 22826, teach = 22901, source = { "vendor" }, bound = false, vendors = { { npc = 18017, area = 3521, faction = "Horde" }, { npc = 19042, area = 3519, faction = "Alliance" } } }, -- Sneaking Potion
    { spell = 33741, skill = 315, creates = 28104, source = { "trainer" }, cost = 30000 }, -- Elixir of Mastery
    { spell = 28549, skill = 320, creates = 22827, teach = 22902, source = { "vendor" }, bound = false, vendors = { { npc = 18005, area = 3521, faction = "Alliance" }, { npc = 18017, area = 3521, faction = "Horde" } } }, -- Elixir of Major Frost Power
    { spell = 28550, skill = 320, creates = 22828, teach = 22903, source = { "drop" }, bound = false }, -- Insane Strength Potion
    { spell = 39637, skill = 320, creates = 32063, teach = 32070, reputation = { 942, 6, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Earthen Elixir
    { spell = 39638, skill = 320, creates = 32067, source = { "trainer" }, cost = 30000 }, -- Elixir of Draenic Wisdom
    { spell = 28551, skill = 325, creates = 22829, source = { "trainer" }, cost = 50000 }, -- Super Healing Potion
    { spell = 28552, skill = 325, creates = 22830, teach = 22904, source = { "drop" }, bound = false }, -- Elixir of the Searching Eye
    { spell = 38070, skill = 325, creates = 31080, source = { "trainer" }, cost = 20000 }, -- Mercurial Stone
    { spell = 45061, skill = 325, creates = 34440, teach = 34481, source = { "trainer" }, cost = 35000, bound = true }, -- Mad Alchemist's Potion
    { spell = 28553, skill = 330, creates = 22831, teach = 22905, reputation = { 946, 6, ns.L.FACTION_946, 947, 6, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17657, area = 3483, faction = "Alliance" }, { npc = 17585, area = 3483 } } }, -- Elixir of Major Agility
    { spell = 39639, skill = 330, creates = 32068, teach = 32071, source = { "vendor" }, bound = true, vendors = { { npc = 18821, area = 3518, faction = "Horde" }, { npc = 18822, area = 3518, faction = "Alliance" } } }, -- Elixir of Ironskin
    { spell = 28554, skill = 335, creates = 22871, teach = 22906, reputation = { 970, 8, ns.L.FACTION_970 }, source = { "vendor" }, bound = true, vendors = { { npc = 18382, area = 3521 } } }, -- Shrouding Potion
    { spell = 38960, skill = 335, creates = 31679, teach = 31680, source = { "drop" }, bound = true }, -- Fel Strength Elixir
    { spell = 28555, skill = 340, creates = 22832, teach = 22907, source = { "vendor" }, bound = true, vendors = { { npc = 18005, area = 3521, faction = "Alliance" }, { npc = 19837, area = 3522, faction = "Horde" } } }, -- Super Mana Potion
    { spell = 28556, skill = 345, creates = 22833, teach = 22908, reputation = { 934, 7, ns.L.FACTION_934 }, source = { "vendor" }, bound = true, vendors = { { npc = 19331, area = 3703 } } }, -- Elixir of Major Firepower
    { spell = 28557, skill = 345, creates = 22834, teach = 22909, source = { "vendor" }, bound = true, vendors = { { npc = 18005, area = 3521, faction = "Alliance" }, { npc = 19837, area = 3522, faction = "Horde" } } }, -- Elixir of Major Defense
    { spell = 38962, skill = 345, creates = 31676, teach = 31681, source = { "drop" }, bound = true }, -- Fel Regeneration Potion
    { spell = 28558, skill = 350, creates = 22835, teach = 22910, reputation = { 1011, 7, ns.L.FACTION_1011 }, source = { "vendor" }, bound = true, vendors = { { npc = 21655, area = 3703 } } }, -- Elixir of Major Shadow Power
    { spell = 28562, skill = 350, creates = 22836, teach = 22911, source = { "vendor" }, bound = true, vendors = { { npc = 19042, area = 3519, faction = "Alliance" }, { npc = 19837, area = 3522, faction = "Horde" } } }, -- Major Dreamless Sleep Potion
    { spell = 28563, skill = 350, creates = 22837, teach = 22912, source = { "drop" }, bound = false }, -- Heroic Potion
    { spell = 28564, skill = 350, creates = 22838, teach = 22913, source = { "drop" }, bound = false }, -- Haste Potion
    { spell = 28565, skill = 350, creates = 22839, teach = 22914, source = { "drop" }, bound = false }, -- Destruction Potion
    { spell = 28566, skill = 350, creates = 21884, teach = 22915, reputation = { 935, 7, ns.L.FACTION_935 }, source = { "vendor" }, bound = true, vendors = { { npc = 21432, area = 3703 } } }, -- Transmute: Primal Air to Fire
    { spell = 28567, skill = 350, creates = 21885, teach = 22916, reputation = { 970, 7, ns.L.FACTION_970 }, source = { "vendor" }, bound = true, vendors = { { npc = 18382, area = 3521 } } }, -- Transmute: Primal Earth to Water
    { spell = 28568, skill = 350, creates = 22452, teach = 22917, reputation = { 941, 7, ns.L.FACTION_941, 978, 7, ns.L.FACTION_978 }, source = { "vendor" }, bound = true, vendors = { { npc = 20241, area = 3518, faction = "Horde" }, { npc = 20240, area = 3518 } } }, -- Transmute: Primal Fire to Earth
    { spell = 28569, skill = 350, creates = 22451, teach = 22918, reputation = { 942, 7, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Transmute: Primal Water to Air
    { spell = 29688, skill = 350, creates = 23571, teach = 23574, source = { "vendor" }, bound = true, vendors = { { npc = 16641, area = 3487, faction = "Horde" }, { npc = 16705, area = 3557, faction = "Alliance" }, { npc = 19074, area = 3703 } } }, -- Transmute: Primal Might
    { spell = 32765, skill = 350, creates = 25867, teach = 25869, reputation = { 942, 6, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Transmute: Earthstorm Diamond
    { spell = 32766, skill = 350, creates = 25868, teach = 25870, reputation = { 946, 6, ns.L.FACTION_946, 947, 6, ns.L.FACTION_947 }, source = { "vendor" }, bound = true, vendors = { { npc = 17657, area = 3483, faction = "Alliance" }, { npc = 17585, area = 3483 } } }, -- Transmute: Skyfire Diamond
    { spell = 28570, skill = 355, creates = 22840, teach = 22919, source = { "drop" }, bound = false }, -- Elixir of Major Mageblood
    { spell = 28571, skill = 360, creates = 22841, count = 5, teach = 22920, source = { "drop" }, bound = true }, -- Major Fire Protection Potion
    { spell = 28572, skill = 360, creates = 22842, count = 5, teach = 22921, source = { "drop" }, bound = true }, -- Major Frost Protection Potion
    { spell = 28573, skill = 360, creates = 22844, count = 5, teach = 22922, reputation = { 942, 8, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Major Nature Protection Potion
    { spell = 28575, skill = 360, creates = 22845, count = 5, teach = 22923, source = { "drop" }, bound = true }, -- Major Arcane Protection Potion
    { spell = 28576, skill = 360, creates = 22846, count = 5, teach = 22924, source = { "drop" }, bound = true }, -- Major Shadow Protection Potion
    { spell = 28577, skill = 360, creates = 22847, count = 5, teach = 22925, source = { "drop" }, bound = true }, -- Major Holy Protection Potion
    { spell = 38961, skill = 360, creates = 31677, teach = 31682, source = { "drop" }, bound = true }, -- Fel Mana Potion
    { spell = 41458, skill = 360, creates = 32839, source = { "discovery" } }, -- Cauldron of Major Arcane Protection
    { spell = 41500, skill = 360, creates = 32849, source = { "discovery" } }, -- Cauldron of Major Fire Protection
    { spell = 41501, skill = 360, creates = 32850, source = { "discovery" } }, -- Cauldron of Major Frost Protection
    { spell = 41502, skill = 360, creates = 32851, source = { "discovery" } }, -- Cauldron of Major Nature Protection
    { spell = 41503, skill = 360, creates = 32852, source = { "discovery" } }, -- Cauldron of Major Shadow Protection
    { spell = 28578, skill = 365, creates = 22848, teach = 22926, source = { "drop" }, bound = false }, -- Elixir of Empowerment
    { spell = 28579, skill = 365, creates = 22849, teach = 22927, source = { "drop" }, bound = true }, -- Ironshield Potion
    { spell = 42736, skill = 375, creates = 33208, teach = 33209, reputation = { 967, 6, ns.L.FACTION_967 }, source = { "vendor" }, bound = false, vendors = { { npc = 18255, area = 41 } } }, -- Flask of Chromatic Wonder
    { spell = 47046, skill = 375, creates = 35748, teach = 35752, reputation = { 1077, 8, ns.L.FACTION_1077 }, source = { "vendor" }, bound = true, vendors = { { npc = 25032, area = 4080 } } }, -- Guardian's Alchemist Stone
    { spell = 47048, skill = 375, creates = 35749, teach = 35753, reputation = { 1077, 8, ns.L.FACTION_1077 }, source = { "vendor" }, bound = true, vendors = { { npc = 25032, area = 4080 } } }, -- Sorcerer's Alchemist Stone
    { spell = 47049, skill = 375, creates = 35750, teach = 35754, reputation = { 1077, 8, ns.L.FACTION_1077 }, source = { "vendor" }, bound = true, vendors = { { npc = 25032, area = 4080 } } }, -- Redeemer's Alchemist Stone
    { spell = 47050, skill = 375, creates = 35751, teach = 35755, reputation = { 1077, 8, ns.L.FACTION_1077 }, source = { "vendor" }, bound = true, vendors = { { npc = 25032, area = 4080 } } }, -- Assassin's Alchemist Stone
}
