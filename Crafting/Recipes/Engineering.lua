local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[202] = {
    { spell = 3918, skill = 1, creates = 4357 }, -- Rough Blasting Powder
    { spell = 3919, skill = 1, creates = 4358, count = 2 }, -- Rough Dynamite
    { spell = 1230656, skill = 20, creates = 279950, source = { "quest", "trainer" }, cost = 100, quests = { { id = 96058, area = 1, faction = "Alliance", level = 4 }, { id = 97902, area = 14, faction = "Horde", level = 4 }, { id = 97918, area = 12, faction = "Alliance", level = 4 }, { id = 97930, area = 215, faction = "Horde", level = 4 }, { id = 97941, area = 141, faction = "Alliance", level = 4 }, { id = 97954, area = 85, faction = "Horde", level = 4 }, { id = 98285, area = 16593, level = 4 } } }, -- Reagent Bot
    { spell = 1266893, skill = 25, creates = 260784, teach = 264201, source = { "vendor" }, merchantFavor = 45, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- SAF-T Tabs
    { spell = 1266905, skill = 25, creates = 260792, teach = 264202, source = { "vendor" }, merchantFavor = 45, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- SAF-T Dynamite
    { spell = 3920, skill = 30, creates = 8067, count = 200 }, -- Crafted Light Shot
    { spell = 3922, skill = 30, creates = 4359, source = { "trainer" }, cost = 115 }, -- Handful of Copper Bolts
    { spell = 3923, skill = 30, creates = 4360, count = 2, source = { "trainer" }, cost = 130 }, -- Rough Copper Bomb
    { spell = 3924, skill = 50, creates = 4361, source = { "trainer" }, cost = 150 }, -- Copper Tube
    { spell = 3925, skill = 50, creates = 4362, source = { "trainer" }, cost = 150 }, -- Rough Boomstick
    { spell = 4037, skill = 50, rank = "Journeyman", source = { "trainer" }, cost = 500, level = 10 }, -- Engineering (Journeyman)
    { spell = 7430, skill = 50, creates = 6219, source = { "trainer" }, cost = 150 }, -- Arclight Spanner
    { spell = 1266906, skill = 55, creates = 260793, teach = 264203, source = { "vendor" }, merchantFavor = 45, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- SAF-T Copper Bomb
    { spell = 3977, skill = 60, creates = 4405, source = { "trainer" }, cost = 200 }, -- Crude Scope
    { spell = 3926, skill = 65, creates = 4363, source = { "trainer" }, cost = 225 }, -- Copper Modulator
    { spell = 1302161, skill = 65, creates = 277132, teach = 277470, source = { "drop", "quest" }, bound = true, quests = { { id = 92911, area = 40, faction = "Alliance", level = 8 } } }, -- Harvester Override Signalcaster
    { spell = 3928, skill = 75, creates = 4401, teach = 4408, source = { "drop" }, bound = false }, -- Mechanical Squirrel
    { spell = 3929, skill = 75, creates = 4364, source = { "trainer" }, cost = 250 }, -- Coarse Blasting Powder
    { spell = 3930, skill = 75, creates = 8068, count = 200, source = { "trainer" }, cost = 250 }, -- Crafted Heavy Shot
    { spell = 3931, skill = 75, creates = 4365, count = { 1, 3 }, source = { "trainer" }, cost = 250 }, -- Coarse Dynamite
    { spell = 3932, skill = 85, creates = 4366, source = { "trainer" }, cost = 300 }, -- Target Dummy
    { spell = 1317958, skill = 85, creates = 285275, teach = 285285, source = { "vendor" }, merchantFavor = 45, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Satchel of Copper Bombs
    { spell = 3973, skill = 90, creates = 4404, count = 5, source = { "trainer" }, cost = 300 }, -- Silver Contact
    { spell = 3933, skill = 100, creates = 4367, teach = 4409, source = { "drop" }, bound = false }, -- Small Seaforium Charge
    { spell = 3934, skill = 100, creates = 4368, source = { "trainer" }, cost = 400 }, -- Flying Tiger Goggles
    { spell = 8334, skill = 100, creates = 6712, source = { "trainer" }, cost = 300 }, -- Practice Lock
    { spell = 8339, skill = 100, creates = 6714, count = { 1, 3 }, teach = 6716, source = { "drop" }, bound = false }, -- EZ-Thro Dynamite
    { spell = 1266907, skill = 100, creates = 260794, teach = 264204, source = { "vendor" }, merchantFavor = 45, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- EZ-Thro Wrap
    { spell = 3936, skill = 105, creates = 4369, source = { "trainer" }, cost = 420 }, -- Deadly Blunderbuss
    { spell = 3937, skill = 105, creates = 4370, count = { 2, 4 }, source = { "trainer" }, cost = 450 }, -- Large Copper Bomb
    { spell = 3938, skill = 105, creates = 4371, source = { "trainer" }, cost = 450 }, -- Bronze Tube
    { spell = 3978, skill = 110, creates = 4406, source = { "trainer" }, cost = 475 }, -- Standard Scope
    { spell = 3939, skill = 120, creates = 4372, teach = 13309, source = { "vendor" }, bound = true, vendors = { { npc = 2682, area = 11, faction = "Alliance" }, { npc = 6730, area = 400 } } }, -- Lovingly Crafted Boomstick
    { spell = 3940, skill = 120, creates = 4373, teach = 4410, source = { "drop" }, bound = false }, -- Shadow Goggles
    { spell = 3941, skill = 120, creates = 4374, count = { 1, 3 }, source = { "trainer" }, cost = 500 }, -- Small Bronze Bomb
    { spell = 3942, skill = 125, creates = 4375, source = { "trainer" }, cost = 500 }, -- Whirring Bronze Gizmo
    { spell = 3944, skill = 125, creates = 4376, teach = 4411, source = { "drop" }, bound = false }, -- Flame Deflector
    { spell = 3945, skill = 125, creates = 4377, source = { "trainer" }, cost = 500 }, -- Heavy Blasting Powder
    { spell = 3946, skill = 125, creates = 4378, count = { 1, 5 }, source = { "trainer" }, cost = 500 }, -- Heavy Dynamite
    { spell = 3947, skill = 125, creates = 8069, count = 200, source = { "trainer" }, cost = 300 }, -- Crafted Solid Shot
    { spell = 4038, skill = 125, rank = "Expert", source = { "trainer" }, cost = 5000, level = 20 }, -- Engineering (Expert)
    { spell = 9269, skill = 125, creates = 7506, teach = 7560, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 5175, area = 1537, faction = "Alliance" }, { npc = 6730, area = 400 } } }, -- Gnomish Universal Remote
    { spell = 26416, skill = 125, creates = 21558, count = 5, teach = 21724, bound = true }, -- Small Blue Rocket
    { spell = 26417, skill = 125, creates = 21559, count = 5, teach = 21725, bound = true }, -- Small Green Rocket
    { spell = 26418, skill = 125, creates = 21557, count = 5, teach = 21726, bound = true }, -- Small Red Rocket
    { spell = 1293088, skill = 125, creates = 274048, teach = 274049, source = { "drop" }, bound = true }, -- 9-60 Battery Pack
    { spell = 1319154, skill = 125, creates = 21560, count = 5, teach = 286076, bound = true }, -- Small Purple Rocket
    { spell = 1319155, skill = 125, creates = 21561, count = 5, teach = 286077, bound = true }, -- Small White Rocket
    { spell = 1319156, skill = 125, creates = 21562, count = 5, teach = 286078, bound = true }, -- Small Yellow Rocket
    { spell = 3949, skill = 130, creates = 4379, source = { "trainer" }, cost = 550 }, -- Silver-plated Shotgun
    { spell = 8895, skill = 225, creates = 7189, teach = 7192, source = { "drop", "trainer" }, cost = 2200, bound = false }, -- Goblin Rocket Boots
    { spell = 1249634, skill = 120, creates = 249432, source = { "trainer" }, cost = 500 }, -- Sandpaper
    { spell = 1266908, skill = 130, creates = 260795, teach = 264205, source = { "vendor" }, merchantFavor = 45, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- EZ-Thro Copper Bomb XL
    { spell = 6458, skill = 135, creates = 5507, source = { "trainer" }, cost = 400 }, -- Ornate Spyglass
    { spell = 424641, skill = 135, creates = 210147, teach = 210178, source = { "drop" }, bound = false }, -- Shredder Autosalvage Unit
    { spell = 3950, skill = 140, creates = 4380, count = { 2, 4 }, source = { "trainer" }, cost = 600 }, -- Big Bronze Bomb
    { spell = 3952, skill = 140, creates = 4381, teach = 14639, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 2682, area = 11, faction = "Alliance" }, { npc = 2683, area = -3, faction = "Alliance" }, { npc = 216672, faction = "Alliance" } } }, -- Minor Recombobulator
    { spell = 1263034, skill = 140, creates = 279949, teach = 273092, source = { "drop" }, bound = false }, -- Repair Bot
    { spell = 1286796, skill = 140, creates = 269902, teach = 269903, source = { "quest", "vendor" }, reputation = { 93, 5, ns.L.FACTION_93, 92, 8, ns.L.FACTION_92 }, bound = true, quests = { { id = 1371, area = 405, level = 30 } }, vendors = { { npc = 253139, area = 405 }, { npc = 253140, area = 405 } } }, -- Hoof-Shaped Foot Pedal
    { spell = 3953, skill = 145, creates = 4382, source = { "trainer" }, cost = 600 }, -- Bronze Framework
    { spell = 3954, skill = 145, creates = 4383, teach = 4412, source = { "drop" }, bound = false }, -- Moonsight Rifle
    { spell = 1266909, skill = 145, creates = 260796, teach = 264206, source = { "vendor" }, merchantFavor = 45, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- No Slip SAF-T Padding
    { spell = 1266910, skill = 145, creates = 260797, teach = 264207, source = { "drop" }, bound = false }, -- SAF-T Bronze Bomb
    { spell = 3955, skill = 150, creates = 4384, source = { "trainer" }, cost = 750 }, -- Explosive Sheep
    { spell = 3956, skill = 150, creates = 4385, source = { "trainer" }, cost = 750 }, -- Green Tinted Goggles
    { spell = 9271, skill = 150, creates = 6533, count = 3, source = { "trainer" }, cost = 500 }, -- Aquadynamic Fish Attractor
    { spell = 12584, skill = 150, creates = 10558, count = 3, source = { "trainer" }, cost = 1000 }, -- Gold Power Core
    { spell = 23066, skill = 150, creates = 9318, count = 3, teach = 18647, source = { "vendor" }, bound = false, side = "Horde", vendors = { { npc = 3413, area = 1637, faction = "Horde" } } }, -- Red Firework
    { spell = 23067, skill = 150, creates = 9312, count = 3, teach = 18649, source = { "vendor" }, bound = false, side = "Alliance", vendors = { { npc = 1304, area = 1519, faction = "Alliance" }, { npc = 5175, area = 1537, faction = "Alliance" } } }, -- Blue Firework
    { spell = 23068, skill = 150, creates = 9313, count = 3, teach = 18648, source = { "vendor" }, bound = true, vendors = { { npc = 2838, area = 33 }, { npc = 3495, area = 17 } } }, -- Green Firework
    { spell = 1266911, skill = 150, creates = 260798, teach = 264208, bound = false }, -- SAF-T Jumbo Dynamite
    { spell = 3957, skill = 155, creates = 4386, teach = 13308, source = { "vendor" }, bound = true, vendors = { { npc = 2684, area = 36 }, { npc = 12246, area = 405 } } }, -- Ice Deflector
    { spell = 3958, skill = 160, creates = 4387, source = { "trainer" }, cost = 800 }, -- Iron Strut
    { spell = 3959, skill = 160, creates = 4388, teach = 4413, source = { "drop" }, bound = false }, -- Discombobulator Ray
    { spell = 3960, skill = 165, creates = 4403, teach = 4414, source = { "drop" }, bound = false }, -- Portable Bronze Mortar
    { spell = 9273, skill = 165, creates = 7148, teach = 7561, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 3134, area = 10 }, { npc = 3537, area = 267 }, { npc = 4086, area = 406 }, { npc = 12246, area = 405 } } }, -- Goblin Jumper Cables
    { spell = 1317959, skill = 165, creates = 285276, teach = 285286, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Satchel of Bronze Bombs
    { spell = 3961, skill = 170, creates = 4389, source = { "trainer" }, cost = 900 }, -- Gyrochronatom
    { spell = 3962, skill = 175, creates = 4390, count = { 2, 4 }, source = { "trainer" }, cost = 1000 }, -- Iron Grenade
    { spell = 3963, skill = 175, creates = 4391, source = { "trainer" }, cost = 1000 }, -- Compact Harvest Reaper Kit
    { spell = 12585, skill = 175, creates = 10505, source = { "trainer" }, cost = 1000 }, -- Solid Blasting Powder
    { spell = 12586, skill = 175, creates = 10507, count = 2, source = { "trainer" }, cost = 1000 }, -- Solid Dynamite
    { spell = 12587, skill = 175, creates = 10499, teach = 10601, source = { "drop" }, bound = false }, -- Bright-Eye Goggles
    { spell = 12590, skill = 175, creates = 10498, source = { "trainer" }, cost = 1000 }, -- Gyromatic Micro-Adjustor
    { spell = 26420, skill = 175, creates = 21589, count = 5, teach = 21727, bound = true }, -- Large Blue Rocket
    { spell = 26421, skill = 175, creates = 21590, count = 5, teach = 21728, bound = true }, -- Large Green Rocket
    { spell = 26422, skill = 175, creates = 21592, count = 5, teach = 21729, bound = true }, -- Large Red Rocket
    { spell = 1266912, skill = 175, creates = 260799, teach = 264209, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- SAF-T Bell
    { spell = 1266913, skill = 175, creates = 260800, teach = 264210, bound = false }, -- Shafety Sheep
    { spell = 1308178, skill = 175, creates = 280306, teach = 280321, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Whimsical Waistwrap
    { spell = 1308179, skill = 175, creates = 280307, teach = 280322, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Gizmo Girdle
    { spell = 1308180, skill = 175, creates = 280308, teach = 280323, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Clanking Cord
    { spell = 1308182, skill = 175, teach = 280324, creates = 280309, bound = true }, -- Serrated Strap
    { spell = 1319157, skill = 175, creates = 21591, count = 5, teach = 286079, bound = true }, -- Large Purple Rocket
    { spell = 1319158, skill = 175, creates = 21593, count = 5, teach = 286080, bound = true }, -- Large White Rocket
    { spell = 1319159, skill = 175, creates = 21595, count = 5, teach = 286081, bound = true }, -- Large Yellow Rocket
    { spell = 3979, skill = 180, creates = 4407, teach = 13310, source = { "vendor" }, bound = true, vendors = { { npc = 2685, area = 33 }, { npc = 12246, area = 405 } } }, -- Accurate Scope
    { spell = 3965, skill = 185, creates = 4392, source = { "trainer" }, cost = 1200 }, -- Advanced Target Dummy
    { spell = 3966, skill = 185, creates = 4393, teach = 4415, source = { "drop" }, bound = false }, -- Craftsman's Monocle
    { spell = 8243, skill = 185, creates = 4852, teach = 6672, source = { "drop", "quest" }, bound = false, quests = { { id = 1559, area = 3, level = 30 } } }, -- Flash Bomb
    { spell = 3967, skill = 190, creates = 4394, count = 2, source = { "trainer" }, cost = 1400 }, -- Big Iron Bomb
    { spell = 21940, skill = 190, creates = 17716, teach = 17720, source = { "drop" }, bound = false }, -- Snowmaster 9000
    { spell = 1266914, skill = 190, creates = 260801, teach = 264211, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = false, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- EZ-Thro Fireproof Fuse
    { spell = 1266915, skill = 190, creates = 260802, teach = 264212, bound = false }, -- EZ-Thro Bronze Mortar
    { spell = 1286792, skill = 190, creates = 269900, teach = 269901, source = { "quest", "vendor" }, reputation = { 93, 5, ns.L.FACTION_93, 92, 8, ns.L.FACTION_92 }, bound = true, quests = { { id = 1371, area = 405, level = 30 } }, vendors = { { npc = 253139, area = 405 }, { npc = 253140, area = 405 } } }, -- Centaur Banner Deployment Device
    { spell = 3968, skill = 195, creates = 4395, teach = 4416, source = { "drop" }, bound = false }, -- Goblin Land Mine
    { spell = 12589, skill = 195, creates = 10559, source = { "trainer" }, cost = 1300 }, -- Mithril Tube
    { spell = 3969, skill = 200, creates = 4396, teach = 13311, source = { "vendor" }, bound = false, vendors = { { npc = 2687, area = 33 } } }, -- Mechanical Dragonling
    { spell = 3971, skill = 200, creates = 4397, teach = 7742, source = { "drop", "vendor" }, bound = true, vendors = { { npc = 6777, area = 36 } } }, -- Gnomish Cloaking Device
    { spell = 3972, skill = 200, creates = 4398, teach = 4417, source = { "drop" }, bound = false }, -- Large Seaforium Charge
    { spell = 12591, skill = 200, creates = 10560, source = { "trainer" }, cost = 1500 }, -- Unstable Trigger
    { spell = 12656, skill = 200, rank = "Artisan", source = { "trainer" }, cost = 50000, level = 35 }, -- Engineering (Artisan)
    { spell = 15255, skill = 200, creates = 11590, source = { "trainer" }, cost = 1500 }, -- Mechanical Repair Kit
    { spell = 23069, skill = 200, creates = 18588, teach = 18650, source = { "vendor" }, bound = true, vendors = { { npc = 8131, area = 440 }, { npc = 260566, area = 16591 } } }, -- EZ-Thro Dynamite II
    { spell = 435956, skill = 200, creates = 213383, teach = 215429, source = { "vendor" }, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Polished Truesilver Gears
    { spell = 1266916, skill = 200, creates = 260803, teach = 264213, bound = false }, -- EZ-Thro Grenade
    { spell = 1308183, skill = 200, creates = 280310, teach = 280325, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Floppy Goggles
    { spell = 1308184, skill = 200, creates = 280311, teach = 280326, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Bent Goggles
    { spell = 1308185, skill = 200, creates = 280312, teach = 280327, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Stuckbutton Goggles
    { spell = 1308186, skill = 200, creates = 280313, teach = 280328, source = { "vendor" }, reputation = { 2586, 5, ns.L.FACTION_2586, 2587, 5, ns.L.FACTION_2587 }, merchantFavor = 180, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Dented Goggles
    { spell = 12594, skill = 205, creates = 10500, source = { "trainer" }, cost = 1600 }, -- Fire Goggles
    { spell = 12595, skill = 205, creates = 10508, source = { "trainer" }, cost = 1600 }, -- Mithril Blunderbuss
    { spell = 12715, skill = 205, creates = 10644, source = { "trainer" }, cost = 1000 }, -- Goblin Rocket Fuel Recipe
    { spell = 12717, skill = 205, creates = 10542, teach = 221336, source = { "vendor", "trainer" }, cost = 1500, bound = true, vendors = { { npc = 222261, area = 400 } } }, -- Goblin Mining Helmet
    { spell = 12760, skill = 205, creates = 10646, source = { "trainer" }, cost = 1500 }, -- Goblin Sapper Charge
    { spell = 12895, skill = 205, creates = 10713, cost = 1500, source = { "trainer" } }, -- Inlaid Mithril Cylinder Plans
    { spell = 12899, skill = 205, creates = 10716, cost = 1500, source = { "trainer" } }, -- Gnomish Shrink Ray
    { spell = 13240, skill = 205, creates = 10577, cost = 1500 }, -- The Mortar: Reloaded
    { spell = 15628, skill = 205, creates = 11825, teach = 11828, bound = true }, -- Pet Bombling
    { spell = 15633, skill = 205, creates = 11826, teach = 11827, bound = true }, -- Lil' Smoky
    { spell = 431362, skill = 205, creates = 211427, teach = 212230, source = { "vendor" }, bound = true, vendors = { { npc = 213077, area = 1519, faction = "Alliance" }, { npc = 214070, area = 1637, faction = "Horde" }, { npc = 214096, area = 1638, faction = "Horde" }, { npc = 214098, area = 1497, faction = "Horde" }, { npc = 214099, area = 1537, faction = "Alliance" }, { npc = 214101, area = 1657, faction = "Alliance" } } }, -- Soul Vessel
    { spell = 12596, skill = 210, creates = 10512, count = 200, source = { "trainer" }, cost = 1700 }, -- Hi-Impact Mithril Slugs
    { spell = 12597, skill = 210, creates = 10546, teach = 10602, source = { "vendor" }, bound = true, vendors = { { npc = 8679, area = 33 }, { npc = 9544, area = 46 } } }, -- Deadly Scope
    { spell = 12897, skill = 210, creates = 10545, cost = 1500, source = { "trainer" } }, -- Gnomish Goggles
    { spell = 12902, skill = 210, creates = 10720, cost = 1800, source = { "trainer" } }, -- Gnomish Net-o-Matic Projector
    { spell = 12599, skill = 215, creates = 10561, source = { "trainer" }, cost = 1800 }, -- Mithril Casing
    { spell = 12603, skill = 215, creates = 10514, count = 3, source = { "trainer" }, cost = 1800 }, -- Mithril Frag Bomb
    { spell = 12903, skill = 215, creates = 10721, cost = 2000, source = { "trainer" } }, -- Gnomish Harm Prevention Belt
    { spell = 1266917, skill = 215, creates = 260804, teach = 264214, bound = false }, -- SAF-T Casing
    { spell = 1266918, skill = 215, creates = 260805, teach = 264215, bound = false }, -- SAF-T Bomb
    { spell = 12607, skill = 220, creates = 10501, teach = 10603, source = { "drop" }, bound = false }, -- Catseye Ultra Goggles
    { spell = 12614, skill = 220, creates = 10510, teach = 10604, source = { "drop" }, bound = false }, -- Mithril Heavy-bore Rifle
    { spell = 12615, skill = 225, creates = 10502, teach = 10605, source = { "drop" }, bound = false }, -- Spellpower Goggles Xtreme
    { spell = 12616, skill = 225, creates = 10518, teach = 10606, source = { "drop" }, bound = false }, -- Parachute Cloak
    { spell = 12716, skill = 225, creates = 10577 }, -- Goblin Mortar
    { spell = 12718, skill = 205, creates = 10543, source = { "trainer" }, cost = 1500 }, -- Goblin Construction Helmet
    { spell = 12905, skill = 225, creates = 10724, cost = 2200, source = { "trainer" } }, -- Gnomish Rocket Boots
    { spell = 26423, skill = 225, creates = 21571, count = 5, teach = 21730, bound = true }, -- Blue Rocket Cluster
    { spell = 26424, skill = 225, creates = 21574, count = 5, teach = 21731, bound = true }, -- Green Rocket Cluster
    { spell = 26425, skill = 225, creates = 21576, count = 5, teach = 21732, bound = true }, -- Red Rocket Cluster
    { spell = 26442, skill = 225, creates = 21569, teach = 21738, source = { "quest" }, bound = true, quests = { { id = 8877, area = 493, level = 45 } } }, -- Firework Launcher
    { spell = 435958, skill = 225, teach = 215153, source = { "vendor" }, creates = 213390, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Whirling Truesilver Gearwall
    { spell = 435960, skill = 225, teach = 215156, source = { "vendor" }, creates = 215115, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Hyperconductive Goldwap
    { spell = 435964, skill = 225, creates = 215127, count = { 2, 4 }, teach = 215431, source = { "vendor" }, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- High-Yield Radiation Bomb
    { spell = 435966, skill = 225, creates = 215168, count = { 2, 4 }, teach = 215432, source = { "vendor" }, bound = true, vendors = { { npc = 217689, area = 721 } } }, -- Ez-Thro Radiation Bomb
    { spell = 1266919, skill = 225, creates = 260806, teach = 264216, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 270, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Emergency Field Cloak
    { spell = 1266920, skill = 225, creates = 260807, teach = 264217, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 270, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Compact Critter Carrier
    { spell = 1319160, skill = 225, creates = 21575, count = 5, teach = 286082, bound = true }, -- Purple Rocket Cluster
    { spell = 1319161, skill = 225, creates = 21577, count = 5, teach = 286083, bound = true }, -- White Rocket Cluster
    { spell = 1319162, skill = 225, creates = 21578, count = 5, teach = 286084, bound = true }, -- Yellow Rocket Cluster
    { spell = 12617, skill = 230, creates = 10506, teach = 10607, source = { "vendor" }, bound = true, vendors = { { npc = 8678, area = 16 } } }, -- Deepdive Helmet
    { spell = 12618, skill = 230, creates = 10503, source = { "trainer" }, cost = 2200 }, -- Rose Colored Goggles
    { spell = 12755, skill = 230, creates = 10587, source = { "trainer" }, cost = 2400 }, -- Goblin Bomb Dispenser
    { spell = 12906, skill = 230, creates = 10725, cost = 2400, source = { "trainer" } }, -- Gnomish Battle Chicken
    { spell = 1317960, skill = 230, creates = 285277, teach = 285287, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 270, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Satchel of Iron Bombs
    { spell = 12619, skill = 235, creates = 10562, count = 4, source = { "trainer" }, cost = 2400 }, -- Hi-Explosive Bomb
    { spell = 12754, skill = 235, creates = 10586, count = 2, source = { "trainer" }, cost = 2600 }, -- The Big One
    { spell = 12907, skill = 235, creates = 10726, cost = 2600, source = { "trainer" } }, -- Gnomish Mind Control Cap
    { spell = 12620, skill = 240, creates = 10548, teach = 10608, source = { "drop" }, bound = false }, -- Sniper Scope
    { spell = 12759, skill = 240, creates = 10645, cost = 2800, source = { "trainer" } }, -- Gnomish Death Ray
    { spell = 1266921, skill = 240, creates = 260808, teach = 264218, bound = false }, -- EZ-Thro Tru-Trigger
    { spell = 1266922, skill = 240, creates = 260809, teach = 264219, bound = false }, -- Tru-Trigger Frag Bomb
    { spell = 12621, skill = 245, creates = 10513, count = 200, source = { "trainer" }, cost = 2800 }, -- Mithril Gyro-Shot
    { spell = 12622, skill = 245, creates = 10504, source = { "trainer" }, cost = 2800 }, -- Green Lens
    { spell = 12624, skill = 250, creates = 10576, teach = 10609, source = { "vendor" }, bound = false, vendors = { { npc = 2688, area = 47 } } }, -- Mithril Mechanical Dragonling
    { spell = 19567, skill = 250, creates = 15846, source = { "trainer" }, cost = 4000 }, -- Salt Shaker
    { spell = 19788, skill = 250, creates = 15992, source = { "trainer" }, cost = 4000 }, -- Dense Blasting Powder
    { spell = 23070, skill = 250, creates = 18641, count = 2, source = { "trainer" }, cost = 5000 }, -- Dense Dynamite
    { spell = 23507, skill = 250, creates = 19026, count = 4, teach = 19027, source = { "vendor" }, bound = true, vendors = { { npc = 14637, area = 357 } } }, -- Snake Burst Firework
    { spell = 26011, skill = 250, creates = 21277 }, -- Tranquil Mechanical Yeti
    { spell = 446236, skill = 250, creates = 221025 }, -- Void-Powered Invoker's Vambraces
    { spell = 446237, skill = 250, creates = 221026 }, -- Void-Powered Slayer's Vambraces
    { spell = 446238, skill = 250, creates = 221027 }, -- Void-Powered Protector's Vambraces
    { spell = 1221012, skill = 250, teach = 236872, creates = 236871, bound = true }, -- Creepy Censor Sensors
    { spell = 1226206, skill = 250, creates = 238737, teach = 238782, bound = true }, -- Tinkerbox
    { spell = 1228088, skill = 250, creates = 237023, teach = 239222, bound = true }, -- Pop-Up Shrub
    { spell = 1266923, skill = 250, creates = 260810, teach = 264220, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 270, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- SAF-T Disposable Parachute
    { spell = 1266924, skill = 250, creates = 260811, teach = 264221, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 270, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Gnomish Army Knife
    { spell = 12908, skill = 240, creates = 10727, source = { "trainer" }, cost = 2800 }, -- Goblin Dragon Gun
    { spell = 19790, skill = 260, creates = 15993, count = 3, teach = 16041, source = { "vendor" }, bound = false, vendors = { { npc = 3413, area = 1637, faction = "Horde" }, { npc = 5175, area = 1537, faction = "Alliance" } } }, -- Thorium Grenade
    { spell = 19791, skill = 260, creates = 15994, teach = 16042, source = { "vendor" }, bound = false, vendors = { { npc = 3413, area = 1637, faction = "Horde" }, { npc = 5175, area = 1537, faction = "Alliance" } } }, -- Thorium Widget
    { spell = 19792, skill = 260, creates = 15995, teach = 16043, source = { "drop" }, bound = false }, -- Thorium Rifle
    { spell = 23071, skill = 260, creates = 18631, teach = 18651, source = { "vendor" }, bound = true, vendors = { { npc = 2685, area = 33 } } }, -- Truesilver Transformer
    { spell = 23077, skill = 260, creates = 18634, teach = 18652, source = { "vendor" }, bound = false, vendors = { { npc = 11185, area = 618 } } }, -- Gyrofreeze Ice Reflector
    { spell = 23129, skill = 260, creates = 18660, teach = 18661, source = { "drop" }, bound = false }, -- World Enlarger
    { spell = 1226207, skill = 260, creates = 238734, teach = 238783, bound = true }, -- Tinkerbox: Teleport
    { spell = 1226208, skill = 260, creates = 238735, teach = 238784, bound = true }, -- Tinkerbox: Nitro Boosts
    { spell = 1226209, skill = 260, creates = 238736, teach = 238785, bound = true }, -- Tinkerbox: Magnetic Displacement
    { spell = 1317270, skill = 260, creates = 284869, count = 3, teach = 284870, source = { "drop" }, bound = false }, -- Unsanctified Grenade
    { spell = 12758, skill = 245, creates = 10588, source = { "trainer" }, cost = 3000 }, -- Goblin Rocket Helmet
    { spell = 19793, skill = 265, creates = 15996, teach = 16044, source = { "drop" }, bound = false }, -- Lifelike Mechanical Toad
    { spell = 23078, skill = 265, creates = 18587, teach = 18653, source = { "drop" }, bound = false }, -- Goblin Jumper Cables XL
    { spell = 23096, skill = 265, creates = 18645, teach = 18654, source = { "drop" }, bound = false }, -- Alarm-O-Bot
    { spell = 19794, skill = 270, creates = 15999, teach = 16045, source = { "drop" }, bound = false }, -- Spellpower Goggles Xtreme Plus
    { spell = 19795, skill = 275, creates = 16000, teach = 16047, source = { "vendor" }, bound = true, vendors = { { npc = 11185, area = 618 }, { npc = 260565, area = 16591 } } }, -- Thorium Tube
    { spell = 19796, skill = 275, creates = 16004, teach = 16048, source = { "drop" }, bound = false }, -- Dark Iron Rifle
    { spell = 19814, skill = 275, creates = 16023, teach = 16046, source = { "vendor" }, bound = true, vendors = { { npc = 11185, area = 618 }, { npc = 260565, area = 16591 } } }, -- Masterwork Target Dummy
    { spell = 23079, skill = 275, creates = 18637, teach = 18655, source = { "drop" }, bound = false }, -- Major Recombobulator
    { spell = 23080, skill = 275, creates = 18594, teach = 18656, source = { "vendor" }, bound = false, vendors = { { npc = 11185, area = 618 } } }, -- Powerful Seaforium Charge
    { spell = 26426, skill = 275, creates = 21714, count = 5, teach = 21733, bound = true }, -- Large Blue Rocket Cluster
    { spell = 26427, skill = 275, creates = 21716, count = 5, teach = 21734, bound = true }, -- Large Green Rocket Cluster
    { spell = 26428, skill = 275, creates = 21718, count = 5, teach = 21735, bound = true }, -- Large Red Rocket Cluster
    { spell = 26443, skill = 275, creates = 21570, teach = 21737, source = { "quest" }, bound = true, quests = { { id = 8882, area = 493, level = 55 } } }, -- Firework Cluster Launcher
    { spell = 28327, skill = 275, creates = 22728, teach = 22729, source = { "quest" }, bound = true, quests = { { id = 9249, level = 45 } } }, -- Steam Tonk Controller
    { spell = 1266925, skill = 275, creates = 260812, teach = 264222, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 270, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Loot-A-Rang
    { spell = 1266926, skill = 275, creates = 260813, teach = 264223, bound = false }, -- SAF-T Tube
    { spell = 1266927, skill = 275, creates = 260814, teach = 264224, bound = false }, -- SAF-T Clever Dynamite
    { spell = 1319163, skill = 275, creates = 21717, count = 5, teach = 286085, bound = true }, -- Large Purple Rocket Cluster
    { spell = 1319164, skill = 275, creates = 21719, count = 5, teach = 286086, bound = true }, -- Large White Rocket Cluster
    { spell = 1319165, skill = 275, creates = 21720, count = 5, teach = 286087, bound = true }, -- Large Yellow Rocket Cluster
    { spell = 1226210, skill = 280 }, -- Tinker: Teleport
    { spell = 1226211, skill = 280 }, -- Tinker: Nitro Boosts
    { spell = 1226212, skill = 280 }, -- Tinker: Magnetic Displacement
    { spell = 19799, skill = 285, creates = 16005, count = 3, teach = 16049, source = { "drop" }, bound = false }, -- Dark Iron Bomb
    { spell = 19800, skill = 285, creates = 15997, count = 200, teach = 16051, source = { "drop" }, bound = false }, -- Thorium Shells
    { spell = 19815, skill = 285, creates = 16006, teach = 16050, source = { "vendor" }, bound = true, vendors = { { npc = 11185, area = 618 } } }, -- Delicate Arcanite Converter
    { spell = 23486, skill = 285, creates = 18984 }, -- Dimensional Ripper - Everlook
    { spell = 23489, skill = 285, creates = 18986 }, -- Ultrasafe Transporter - Gadgetzan
    { spell = 1266928, skill = 285, creates = 260815, teach = 264225, bound = false }, -- EZ-Thro Shell
    { spell = 1266929, skill = 285, creates = 260816, teach = 264226, bound = false }, -- EZ-Thro Thorium Grenade
    { spell = 1317961, skill = 285, creates = 285278, teach = 285288, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 270, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Satchel of Dark Iron Bombs
    { spell = 19819, skill = 290, creates = 16009, teach = 16052, source = { "drop" }, bound = false }, -- Voice Amplification Modulator
    { spell = 19825, skill = 290, creates = 16008, teach = 16053, source = { "drop" }, bound = false }, -- Master Engineer's Goggles
    { spell = 23081, skill = 290, creates = 18638, teach = 18657, source = { "drop" }, bound = false }, -- Hyper-Radiant Flame Reflector
    { spell = 19830, skill = 300, creates = 16022, teach = 16054, source = { "drop" }, bound = false }, -- Arcanite Dragonling
    { spell = 19831, skill = 300, creates = 16040, count = 3, teach = 16055, source = { "drop" }, bound = false }, -- Arcane Bomb
    { spell = 19833, skill = 300, creates = 16007, teach = 16056, source = { "drop" }, bound = false }, -- Flawless Arcanite Rifle
    { spell = 22704, skill = 300, creates = 18232, teach = 18235, source = { "world_object" }, bound = false }, -- Field Repair Bot 74A
    { spell = 22793, skill = 300, creates = 18283, teach = 18290, source = { "drop" }, bound = true }, -- Biznicks 247x128 Accurascope
    { spell = 22795, skill = 300, creates = 18282, teach = 18292, source = { "drop" }, bound = true }, -- Core Marksman Rifle
    { spell = 22797, skill = 300, creates = 18168, teach = 18291, source = { "drop" }, bound = true }, -- Force Reactive Disk
    { spell = 23082, skill = 300, creates = 18639, teach = 18658, source = { "drop" }, bound = false }, -- Ultra-Flash Shadow Reflector
    { spell = 24356, skill = 300, creates = 19999, teach = 20000, source = { "vendor" }, reputation = { 270, 6, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Goggles
    { spell = 24357, skill = 300, creates = 19998, teach = 20001, source = { "vendor" }, reputation = { 270, 5, ns.L.FACTION_270 }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Lens
    { spell = 1226213, skill = 300, teach = 238789, creates = 238781, bound = true }, -- Semisafe Transporter: New Avalon
    { spell = 1263083, skill = 300, creates = 279989, teach = 273117, bound = false }, -- Anarchist's Workbench
    { spell = 1266930, skill = 300, creates = 260817, teach = 264227, bound = false }, -- EZ-Thro Dark Bomb
    { spell = 1266931, skill = 300, creates = 260818, teach = 264228, bound = false }, -- EZ-Thro Mana Bomb
    { spell = 1266932, skill = 300, creates = 260819, teach = 264229, bound = false }, -- EZ-Thro Field Transporter: Gadgetzan
    { spell = 1266933, skill = 300, creates = 260820, teach = 264230, bound = false }, -- SAF-T Emergency Ripper: Everlook
    { spell = 1266934, skill = 300, creates = 260821, teach = 264231, bound = false }, -- EZ and SAF Field Transporter: Mt. Hyjal
    { spell = 1266935, skill = 300, creates = 260822, teach = 264232, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 360, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Ultrasafe Rechargeable Battery
    { spell = 1266936, skill = 300, creates = 260823, teach = 264233, source = { "vendor" }, bound = true, vendors = { { npc = 266901, area = 616 } } }, -- Dimensional Transporter - Mt. Hyjal
    { spell = 1266937, skill = 300, creates = 260824, teach = 264234, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 360, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Gnomish Poultryizer
    { spell = 1266938, skill = 300, creates = 260825, teach = 264235, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 360, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Ultralight Goblin Glider
    { spell = 1266939, skill = 300, creates = 260826, teach = 264236, bound = true }, -- Gnomish Weather Machine
    { spell = 1266940, skill = 300, creates = 260827, teach = 264237, source = { "vendor" }, reputation = { 2586, 6, ns.L.FACTION_2586, 2587, 6, ns.L.FACTION_2587 }, merchantFavor = 360, bound = true, vendors = { { npc = 248200, area = 17, faction = "Horde" }, { npc = 256733, area = 44, faction = "Alliance" } } }, -- Stealthman 52
    { spell = 1266941, skill = 300, creates = 260828, teach = 264238, bound = false }, -- SAF-T Nitro Boosts
    { spell = 1266942, skill = 300, creates = 260829, teach = 264239, bound = false }, -- EZ-Thro Magnetic Displacer
    { spell = 1266943, skill = 300, creates = 260830, teach = 264240, bound = false }, -- SAF-T Teleport
    { spell = 1293849, skill = 300, creates = 274387, count = 200, teach = 274389, bound = true }, -- Swiftfeather Arrow
    { spell = 1293850, skill = 300, creates = 274388, count = 200, teach = 274390, bound = true }, -- Swiftstrike Shot
    { spell = 1306546, skill = 300, creates = 279272, teach = 279321, bound = true }, -- SAF-T Ultra Precision Scope
    { spell = 1306547, skill = 300, creates = 279273, teach = 279322, bound = true }, -- Hyper Deluxe Sniper Rifle Mk XVII
}
