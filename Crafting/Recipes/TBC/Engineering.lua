local _, ns = ...
ns.Recipes = ns.Recipes or {}
ns.Recipes[202] = {
    { spell = 3918, skill = 1, autoLearned = true, creates = 4357 }, -- Rough Blasting Powder
    { spell = 3919, skill = 1, autoLearned = true, creates = 4358, count = 2 }, -- Rough Dynamite
    { spell = 3920, skill = 1, autoLearned = true, creates = 8067, count = 200 }, -- Crafted Light Shot
    { spell = 3922, skill = 30, creates = 4359, source = { "trainer" }, cost = 115 }, -- Handful of Copper Bolts
    { spell = 3923, skill = 30, creates = 4360, count = 2, source = { "trainer" }, cost = 130 }, -- Rough Copper Bomb
    { spell = 3924, skill = 50, creates = 4361, source = { "trainer" }, cost = 150 }, -- Copper Tube
    { spell = 3925, skill = 50, creates = 4362, source = { "trainer" }, cost = 150 }, -- Rough Boomstick
    { spell = 4037, skill = 50, rank = "Journeyman", level = 10, source = { "trainer" }, cost = 500 }, -- Engineering (Journeyman)
    { spell = 7430, skill = 50, creates = 6219, source = { "trainer" }, cost = 150 }, -- Arclight Spanner
    { spell = 3977, skill = 60, creates = 4405, source = { "trainer" }, cost = 200 }, -- Crude Scope
    { spell = 3926, skill = 65, creates = 4363, source = { "trainer" }, cost = 225 }, -- Copper Modulator
    { spell = 3928, skill = 75, creates = 4401, teach = 4408, source = { "drop" }, bound = false }, -- Mechanical Squirrel
    { spell = 3929, skill = 75, creates = 4364, source = { "trainer" }, cost = 250 }, -- Coarse Blasting Powder
    { spell = 3930, skill = 75, creates = 8068, count = 200, source = { "trainer" }, cost = 250 }, -- Crafted Heavy Shot
    { spell = 3931, skill = 75, creates = 4365, count = { 1, 3 }, source = { "trainer" }, cost = 250 }, -- Coarse Dynamite
    { spell = 3932, skill = 85, creates = 4366, source = { "trainer" }, cost = 300 }, -- Target Dummy
    { spell = 3973, skill = 90, creates = 4404, count = 5, source = { "trainer" }, cost = 300 }, -- Silver Contact
    { spell = 3933, skill = 100, creates = 4367, teach = 4409, source = { "drop" }, bound = false }, -- Small Seaforium Charge
    { spell = 3934, skill = 100, creates = 4368, source = { "trainer" }, cost = 400 }, -- Flying Tiger Goggles
    { spell = 8334, skill = 100, creates = 6712, source = { "trainer" }, cost = 300 }, -- Practice Lock
    { spell = 8339, skill = 100, creates = 6714, count = { 1, 3 }, teach = 6716, source = { "drop" }, bound = false }, -- EZ-Thro Dynamite
    { spell = 3936, skill = 105, creates = 4369, source = { "trainer" }, cost = 420 }, -- Deadly Blunderbuss
    { spell = 3937, skill = 105, creates = 4370, count = { 2, 4 }, source = { "trainer" }, cost = 450 }, -- Large Copper Bomb
    { spell = 3938, skill = 105, creates = 4371, source = { "trainer" }, cost = 450 }, -- Bronze Tube
    { spell = 3978, skill = 110, creates = 4406, source = { "trainer" }, cost = 475 }, -- Standard Scope
    { spell = 3939, skill = 120, creates = 4372, teach = 13309, source = { "vendor" }, bound = false, vendors = { { npc = 2682, area = 11, faction = "Alliance" }, { npc = 6730, area = 400 } } }, -- Lovingly Crafted Boomstick
    { spell = 3940, skill = 120, creates = 4373, teach = 4410, source = { "drop" }, bound = false }, -- Shadow Goggles
    { spell = 3941, skill = 120, creates = 4374, count = { 1, 3 }, source = { "trainer" }, cost = 500 }, -- Small Bronze Bomb
    { spell = 3942, skill = 125, creates = 4375, source = { "trainer" }, cost = 500 }, -- Whirring Bronze Gizmo
    { spell = 3944, skill = 125, creates = 4376, teach = 4411, source = { "drop" }, bound = false }, -- Flame Deflector
    { spell = 3945, skill = 125, creates = 4377, source = { "trainer" }, cost = 500 }, -- Heavy Blasting Powder
    { spell = 3946, skill = 125, creates = 4378, count = { 1, 5 }, source = { "trainer" }, cost = 500 }, -- Heavy Dynamite
    { spell = 3947, skill = 125, creates = 8069, count = 200, source = { "trainer" }, cost = 300 }, -- Crafted Solid Shot
    { spell = 4038, skill = 125, rank = "Expert", level = 20, source = { "trainer" }, cost = 5000 }, -- Engineering (Expert)
    { spell = 9269, skill = 125, creates = 7506, teach = 7560, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 5175, area = 1537, faction = "Alliance" }, { npc = 6730, area = 400 } } }, -- Gnomish Universal Remote
    { spell = 26416, skill = 125, creates = 21558, count = 3, teach = 21724, source = { "drop" }, bound = true }, -- Small Blue Rocket
    { spell = 26417, skill = 125, creates = 21559, count = 3, teach = 21725, source = { "drop" }, bound = true }, -- Small Green Rocket
    { spell = 26418, skill = 125, creates = 21557, count = 3, teach = 21726, source = { "drop" }, bound = true }, -- Small Red Rocket
    { spell = 3949, skill = 130, creates = 4379, source = { "trainer" }, cost = 550 }, -- Silver-plated Shotgun
    { spell = 6458, skill = 135, creates = 5507, source = { "trainer" }, cost = 400 }, -- Ornate Spyglass
    { spell = 3950, skill = 140, creates = 4380, count = { 2, 4 }, source = { "trainer" }, cost = 600 }, -- Big Bronze Bomb
    { spell = 3952, skill = 140, creates = 4381, teach = 14639, source = { "vendor" }, bound = false, vendors = { { npc = 2682, area = 11, faction = "Alliance" }, { npc = 2683, area = -3, faction = "Alliance" }, { npc = 3495, area = 17 } } }, -- Minor Recombobulator
    { spell = 3953, skill = 145, creates = 4382, source = { "trainer" }, cost = 600 }, -- Bronze Framework
    { spell = 3954, skill = 145, creates = 4383, teach = 4412, source = { "drop" }, bound = false }, -- Moonsight Rifle
    { spell = 3955, skill = 150, creates = 4384, source = { "trainer" }, cost = 750 }, -- Explosive Sheep
    { spell = 3956, skill = 150, creates = 4385, source = { "trainer" }, cost = 750 }, -- Green Tinted Goggles
    { spell = 9271, skill = 150, creates = 6533, count = 3, source = { "trainer" }, cost = 500 }, -- Aquadynamic Fish Attractor
    { spell = 12584, skill = 150, creates = 10558, count = 3, source = { "trainer" }, cost = 1000 }, -- Gold Power Core
    { spell = 23066, skill = 150, creates = 9318, count = 3, teach = 18647, source = { "vendor" }, bound = false, vendors = { { npc = 3413, area = 1637, faction = "Horde" } } }, -- Red Firework
    { spell = 23067, skill = 150, creates = 9312, count = 3, teach = 18649, source = { "vendor" }, bound = false, vendors = { { npc = 1304, area = 1519, faction = "Alliance" }, { npc = 5175, area = 1537, faction = "Alliance" } } }, -- Blue Firework
    { spell = 23068, skill = 150, creates = 9313, count = 3, teach = 18648, source = { "vendor" }, bound = false, vendors = { { npc = 2838, area = 33 }, { npc = 3495, area = 17 } } }, -- Green Firework
    { spell = 3957, skill = 155, creates = 4386, teach = 13308, source = { "vendor" }, bound = false, vendors = { { npc = 2684, area = 36 } } }, -- Ice Deflector
    { spell = 3958, skill = 160, creates = 4387, source = { "trainer" }, cost = 800 }, -- Iron Strut
    { spell = 3959, skill = 160, creates = 4388, teach = 4413, source = { "drop" }, bound = false }, -- Discombobulator Ray
    { spell = 3960, skill = 165, creates = 4403, teach = 4414, source = { "drop" }, bound = false }, -- Portable Bronze Mortar
    { spell = 9273, skill = 165, creates = 7148, teach = 7561, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 3134, area = 10 }, { npc = 3537, area = 267 }, { npc = 4086, area = 406 }, { npc = 12246, area = 405 } } }, -- Goblin Jumper Cables
    { spell = 3961, skill = 170, creates = 4389, source = { "trainer" }, cost = 900 }, -- Gyrochronatom
    { spell = 3962, skill = 175, creates = 4390, count = { 2, 4 }, source = { "trainer" }, cost = 1000 }, -- Iron Grenade
    { spell = 3963, skill = 175, creates = 4391, source = { "trainer" }, cost = 1000 }, -- Compact Harvest Reaper Kit
    { spell = 12585, skill = 175, creates = 10505, source = { "trainer" }, cost = 1000 }, -- Solid Blasting Powder
    { spell = 12586, skill = 175, creates = 10507, count = 2, source = { "trainer" }, cost = 1000 }, -- Solid Dynamite
    { spell = 12587, skill = 175, creates = 10499, teach = 10601, source = { "drop" }, bound = false }, -- Bright-Eye Goggles
    { spell = 12590, skill = 175, creates = 10498, source = { "trainer" }, cost = 1000 }, -- Gyromatic Micro-Adjustor
    { spell = 26420, skill = 175, creates = 21589, count = 3, teach = 21727, source = { "drop" }, bound = true }, -- Large Blue Rocket
    { spell = 26421, skill = 175, creates = 21590, count = 3, teach = 21728, source = { "drop" }, bound = true }, -- Large Green Rocket
    { spell = 26422, skill = 175, creates = 21592, count = 3, teach = 21729, source = { "drop" }, bound = true }, -- Large Red Rocket
    { spell = 3979, skill = 180, creates = 4407, teach = 13310, source = { "vendor" }, bound = false, vendors = { { npc = 2685, area = 33 }, { npc = 12246, area = 405 } } }, -- Accurate Scope
    { spell = 3965, skill = 185, creates = 4392, source = { "trainer" }, cost = 1200 }, -- Advanced Target Dummy
    { spell = 3966, skill = 185, creates = 4393, teach = 4415, source = { "drop" }, bound = false }, -- Craftsman's Monocle
    { spell = 8243, skill = 185, creates = 4852, teach = 6672, source = { "drop", "quest" }, bound = false, quests = { { id = 1559, area = 3, level = 30 } } }, -- Flash Bomb
    { spell = 3967, skill = 190, creates = 4394, count = 2, source = { "trainer" }, cost = 1400 }, -- Big Iron Bomb
    { spell = 21940, skill = 190, creates = 17716, teach = 17720, source = { "drop" }, bound = false }, -- Snowmaster 9000
    { spell = 3968, skill = 195, creates = 4395, teach = 4416, source = { "drop" }, bound = false }, -- Goblin Land Mine
    { spell = 12589, skill = 195, creates = 10559, source = { "trainer" }, cost = 1300 }, -- Mithril Tube
    { spell = 3969, skill = 200, creates = 4396, teach = 13311, source = { "vendor" }, bound = false, vendors = { { npc = 2687, area = 33 } } }, -- Mechanical Dragonling
    { spell = 3971, skill = 200, creates = 4397, teach = 7742, source = { "drop", "vendor" }, bound = false, vendors = { { npc = 6777, area = 36 } } }, -- Gnomish Cloaking Device
    { spell = 3972, skill = 200, creates = 4398, teach = 4417, source = { "drop" }, bound = false }, -- Large Seaforium Charge
    { spell = 12591, skill = 200, creates = 10560, source = { "trainer" }, cost = 1500 }, -- Unstable Trigger
    { spell = 12656, skill = 200, rank = "Artisan", level = 35, source = { "trainer" }, cost = 50000 }, -- Engineering (Artisan)
    { spell = 15255, skill = 200, creates = 11590, source = { "trainer" }, cost = 1500 }, -- Mechanical Repair Kit
    { spell = 23069, skill = 200, creates = 18588, teach = 18650, source = { "vendor" }, bound = false, vendors = { { npc = 8131, area = 440 } } }, -- EZ-Thro Dynamite II
    { spell = 12594, skill = 205, creates = 10500, source = { "trainer" }, cost = 1600 }, -- Fire Goggles
    { spell = 12595, skill = 205, creates = 10508, source = { "trainer" }, cost = 1600 }, -- Mithril Blunderbuss
    { spell = 12715, skill = 205, creates = 10644, source = { "trainer" }, cost = 1000 }, -- Goblin Rocket Fuel Recipe
    { spell = 12716, skill = 205, creates = 10577, source = { "trainer" } }, -- Goblin Mortar
    { spell = 12717, skill = 205, creates = 10542, source = { "trainer" }, cost = 1500 }, -- Goblin Mining Helmet
    { spell = 12718, skill = 205, creates = 10543, source = { "trainer" }, cost = 1500 }, -- Goblin Construction Helmet
    { spell = 12760, skill = 205, creates = 10646, source = { "trainer" }, cost = 1500 }, -- Goblin Sapper Charge
    { spell = 12895, skill = 205, creates = 10713, source = { "trainer" }, cost = 1500 }, -- Inlaid Mithril Cylinder Plans
    { spell = 12899, skill = 205, creates = 10716, source = { "trainer" }, cost = 1500 }, -- Gnomish Shrink Ray
    { spell = 13240, skill = 205, creates = 10577, source = { "trainer" }, cost = 1500 }, -- The Mortar: Reloaded
    { spell = 15628, skill = 205, creates = 11825, teach = 11828, source = { "drop" }, bound = true }, -- Pet Bombling
    { spell = 15633, skill = 205, creates = 11826, teach = 11827, source = { "drop" }, bound = true }, -- Lil' Smoky
    { spell = 12596, skill = 210, creates = 10512, count = 200, source = { "trainer" }, cost = 1700 }, -- Hi-Impact Mithril Slugs
    { spell = 12597, skill = 210, creates = 10546, teach = 10602, source = { "vendor" }, bound = false, vendors = { { npc = 8679, area = 33 }, { npc = 9544, area = 46 } } }, -- Deadly Scope
    { spell = 12897, skill = 210, creates = 10545, source = { "trainer" }, cost = 1500 }, -- Gnomish Goggles
    { spell = 12902, skill = 210, creates = 10720, source = { "trainer" }, cost = 1800 }, -- Gnomish Net-o-Matic Projector
    { spell = 12599, skill = 215, creates = 10561, source = { "trainer" }, cost = 1800 }, -- Mithril Casing
    { spell = 12603, skill = 215, creates = 10514, count = 3, source = { "trainer" }, cost = 1800 }, -- Mithril Frag Bomb
    { spell = 12903, skill = 215, creates = 10721, source = { "trainer" }, cost = 2000 }, -- Gnomish Harm Prevention Belt
    { spell = 12607, skill = 220, creates = 10501, teach = 10603, source = { "drop" }, bound = false }, -- Catseye Ultra Goggles
    { spell = 12614, skill = 220, creates = 10510, teach = 10604, source = { "drop" }, bound = false }, -- Mithril Heavy-bore Rifle
    { spell = 8895, skill = 225, creates = 7189, teach = 7192, source = { "drop" }, cost = 2200, bound = false }, -- Goblin Rocket Boots
    { spell = 12615, skill = 225, creates = 10502, teach = 10605, source = { "drop" }, cost = 2500, bound = false }, -- Spellpower Goggles Xtreme
    { spell = 12616, skill = 225, creates = 10518, teach = 10606, source = { "drop" }, bound = false }, -- Parachute Cloak
    { spell = 12905, skill = 225, creates = 10724, source = { "trainer" }, cost = 2200 }, -- Gnomish Rocket Boots
    { spell = 26423, skill = 225, creates = 21571, count = 3, teach = 21730, source = { "drop" }, bound = true }, -- Blue Rocket Cluster
    { spell = 26424, skill = 225, creates = 21574, count = 3, teach = 21731, source = { "drop" }, bound = true }, -- Green Rocket Cluster
    { spell = 26425, skill = 225, creates = 21576, count = 3, teach = 21732, source = { "drop" }, bound = true }, -- Red Rocket Cluster
    { spell = 26442, skill = 225, creates = 21569, teach = 21738, source = { "quest" }, bound = false, quests = { { id = 8877, area = 493, level = 45 } } }, -- Firework Launcher
    { spell = 12617, skill = 230, creates = 10506, teach = 10607, source = { "vendor" }, bound = false, vendors = { { npc = 8678, area = 16 } } }, -- Deepdive Helmet
    { spell = 12618, skill = 230, creates = 10503, source = { "trainer" }, cost = 2200 }, -- Rose Colored Goggles
    { spell = 12755, skill = 230, creates = 10587, source = { "trainer" }, cost = 2400 }, -- Goblin Bomb Dispenser
    { spell = 12906, skill = 230, creates = 10725, source = { "trainer" }, cost = 2400 }, -- Gnomish Battle Chicken
    { spell = 12619, skill = 235, creates = 10562, count = 4, source = { "trainer" }, cost = 2400 }, -- Hi-Explosive Bomb
    { spell = 12754, skill = 235, creates = 10586, count = 2, source = { "trainer" }, cost = 2600 }, -- The Big One
    { spell = 12907, skill = 235, creates = 10726, source = { "trainer" }, cost = 2600 }, -- Gnomish Mind Control Cap
    { spell = 12620, skill = 240, creates = 10548, teach = 10608, source = { "drop" }, bound = false }, -- Sniper Scope
    { spell = 12759, skill = 240, creates = 10645, source = { "trainer" }, cost = 2800 }, -- Gnomish Death Ray
    { spell = 12908, skill = 240, creates = 10727, source = { "trainer" }, cost = 2800 }, -- Goblin Dragon Gun
    { spell = 12621, skill = 245, creates = 10513, count = 200, source = { "trainer" }, cost = 2800 }, -- Mithril Gyro-Shot
    { spell = 12622, skill = 245, creates = 10504, source = { "trainer" }, cost = 2800 }, -- Green Lens
    { spell = 12758, skill = 245, creates = 10588, source = { "trainer" }, cost = 3000 }, -- Goblin Rocket Helmet
    { spell = 12624, skill = 250, creates = 10576, teach = 10609, source = { "vendor" }, bound = false, vendors = { { npc = 2688, area = 47 } } }, -- Mithril Mechanical Dragonling
    { spell = 19567, skill = 250, creates = 15846, source = { "trainer" }, cost = 4000 }, -- Salt Shaker
    { spell = 19788, skill = 250, creates = 15992, source = { "trainer" }, cost = 4000 }, -- Dense Blasting Powder
    { spell = 23070, skill = 250, creates = 18641, count = 2, source = { "trainer" }, cost = 5000 }, -- Dense Dynamite
    { spell = 23507, skill = 250, creates = 19026, count = 4, teach = 19027, source = { "vendor" }, bound = true, vendors = { { npc = 14637, area = 357 } } }, -- Snake Burst Firework
    { spell = 26011, skill = 250, creates = 21277, source = { "quest" }, quests = { { id = 8798, area = 618, level = 55 } } }, -- Tranquil Mechanical Yeti
    { spell = 19790, skill = 260, creates = 15993, count = 3, teach = 16041, source = { "vendor" }, cost = 10000, bound = false, vendors = { { npc = 3413, area = 1637, faction = "Horde" }, { npc = 5175, area = 1537, faction = "Alliance" } } }, -- Thorium Grenade
    { spell = 19791, skill = 260, creates = 15994, teach = 16042, source = { "vendor" }, cost = 5000, bound = false, vendors = { { npc = 3413, area = 1637, faction = "Horde" }, { npc = 5175, area = 1537, faction = "Alliance" } } }, -- Thorium Widget
    { spell = 19792, skill = 260, creates = 15995, teach = 16043, source = { "drop" }, cost = 10000, bound = false }, -- Thorium Rifle
    { spell = 23071, skill = 260, creates = 18631, teach = 18651, source = { "vendor" }, cost = 5000, bound = false, vendors = { { npc = 2685, area = 33 } } }, -- Truesilver Transformer
    { spell = 23077, skill = 260, creates = 18634, teach = 18652, source = { "vendor" }, bound = false, vendors = { { npc = 11185, area = 618 } } }, -- Gyrofreeze Ice Reflector
    { spell = 23129, skill = 260, creates = 18660, teach = 18661, source = { "drop" }, bound = false }, -- World Enlarger
    { spell = 23486, skill = 260, creates = 18984, source = { "trainer" } }, -- Dimensional Ripper - Everlook
    { spell = 23489, skill = 260, creates = 18986, source = { "trainer" } }, -- Ultrasafe Transporter - Gadgetzan
    { spell = 19793, skill = 265, creates = 15996, teach = 16044, source = { "drop" }, bound = false }, -- Lifelike Mechanical Toad
    { spell = 23078, skill = 265, creates = 18587, teach = 18653, source = { "drop" }, bound = false }, -- Goblin Jumper Cables XL
    { spell = 23096, skill = 265, creates = 18645, teach = 18654, source = { "drop" }, bound = false }, -- Alarm-O-Bot
    { spell = 19794, skill = 270, creates = 15999, teach = 16045, source = { "drop" }, cost = 20000, bound = false }, -- Spellpower Goggles Xtreme Plus
    { spell = 19795, skill = 275, creates = 16000, teach = 16047, source = { "vendor" }, cost = 10000, bound = false, vendors = { { npc = 11185, area = 618 } } }, -- Thorium Tube
    { spell = 19796, skill = 275, creates = 16004, teach = 16048, source = { "drop" }, bound = false }, -- Dark Iron Rifle
    { spell = 19814, skill = 275, creates = 16023, teach = 16046, source = { "vendor" }, bound = false, vendors = { { npc = 11185, area = 618 } } }, -- Masterwork Target Dummy
    { spell = 23079, skill = 275, creates = 18637, teach = 18655, source = { "drop" }, bound = false }, -- Major Recombobulator
    { spell = 23080, skill = 275, creates = 18594, teach = 18656, source = { "vendor" }, bound = false, vendors = { { npc = 11185, area = 618 } } }, -- Powerful Seaforium Charge
    { spell = 26426, skill = 275, creates = 21714, count = 3, teach = 21733, source = { "drop" }, bound = true }, -- Large Blue Rocket Cluster
    { spell = 26427, skill = 275, creates = 21716, count = 3, teach = 21734, source = { "drop" }, bound = true }, -- Large Green Rocket Cluster
    { spell = 26428, skill = 275, creates = 21718, count = 3, teach = 21735, source = { "drop" }, bound = true }, -- Large Red Rocket Cluster
    { spell = 26443, skill = 275, creates = 21570, teach = 21737, source = { "quest" }, bound = false, quests = { { id = 8882, area = 493, level = 55 } } }, -- Firework Cluster Launcher
    { spell = 28327, skill = 275, creates = 22728, teach = 22729, source = { "quest", "vendor" }, bound = true, quests = { { id = 9249, areas = { 12, 215, 3519 }, level = 45 } }, vendors = { { npc = 3413, area = 1637, faction = "Horde" }, { npc = 5175, area = 1537, faction = "Alliance" } } }, -- Steam Tonk Controller
    { spell = 30350, skill = 275, rank = "Master", level = 50, source = { "trainer" }, cost = 100000 }, -- Engineering (Master)
    { spell = 39895, skill = 275, creates = 7191, teach = 32381, source = { "vendor" }, bound = false, vendors = { { npc = 11185, area = 618 }, { npc = 19661, area = 3703 } } }, -- Fused Wiring
    { spell = 19799, skill = 285, creates = 16005, count = 3, teach = 16049, source = { "drop" }, bound = false }, -- Dark Iron Bomb
    { spell = 19800, skill = 285, creates = 15997, count = 200, teach = 16051, source = { "drop" }, cost = 10000, bound = false }, -- Thorium Shells
    { spell = 19815, skill = 285, creates = 16006, teach = 16050, source = { "vendor" }, bound = false, vendors = { { npc = 11185, area = 618 } } }, -- Delicate Arcanite Converter
    { spell = 19819, skill = 290, creates = 16009, teach = 16052, source = { "drop" }, bound = false }, -- Voice Amplification Modulator
    { spell = 19825, skill = 290, creates = 16008, teach = 16053, source = { "drop" }, cost = 20000, bound = false }, -- Master Engineer's Goggles
    { spell = 23081, skill = 290, creates = 18638, teach = 18657, source = { "drop" }, bound = false }, -- Hyper-Radiant Flame Reflector
    { spell = 19830, skill = 300, creates = 16022, teach = 16054, source = { "drop" }, bound = false }, -- Arcanite Dragonling
    { spell = 19831, skill = 300, creates = 16040, count = 3, teach = 16055, source = { "drop" }, bound = false }, -- Arcane Bomb
    { spell = 19833, skill = 300, creates = 16007, teach = 16056, source = { "drop" }, bound = false }, -- Flawless Arcanite Rifle
    { spell = 22704, skill = 300, creates = 18232, teach = 18235, source = { "trainer" }, bound = false }, -- Field Repair Bot 74A
    { spell = 22793, skill = 300, creates = 18283, teach = 18290, source = { "drop" }, bound = true }, -- Biznicks 247x128 Accurascope
    { spell = 22795, skill = 300, creates = 18282, teach = 18292, source = { "drop" }, bound = true }, -- Core Marksman Rifle
    { spell = 22797, skill = 300, creates = 18168, teach = 18291, source = { "drop" }, bound = true }, -- Force Reactive Disk
    { spell = 23082, skill = 300, creates = 18639, teach = 18658, source = { "drop" }, bound = false }, -- Ultra-Flash Shadow Reflector
    { spell = 24356, skill = 300, creates = 19999, teach = 20000, reputation = { 270, 6, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Goggles
    { spell = 24357, skill = 300, creates = 19998, teach = 20001, reputation = { 270, 5, ns.L.FACTION_270 }, source = { "vendor" }, bound = true, vendors = { { npc = 14921, area = 33 } } }, -- Bloodvine Lens
    { spell = 30303, skill = 300, creates = 23781, count = 4, source = { "trainer" }, cost = 10000 }, -- Elemental Blasting Powder
    { spell = 30304, skill = 300, creates = 23782, source = { "trainer" }, cost = 10000 }, -- Fel Iron Casing
    { spell = 30305, skill = 300, creates = 23783, source = { "trainer" }, cost = 10000 }, -- Handful of Fel Iron Bolts
    { spell = 30310, skill = 300, creates = 23736, count = 4, source = { "trainer" }, cost = 15000 }, -- Fel Iron Bomb
    { spell = 30548, skill = 305, creates = 23821, teach = 23888, source = { "quest" }, bound = true, quests = { { id = 9635, area = 3521, faction = "Horde", level = 58 }, { id = 9636, area = 3521, faction = "Alliance", level = 58 } } }, -- Zapthrottle Mote Extractor
    { spell = 30346, skill = 310, creates = 23772, count = 200, source = { "trainer" }, cost = 15000 }, -- Fel Iron Shells
    { spell = 30312, skill = 320, creates = 23742, source = { "trainer" }, cost = 20000 }, -- Fel Iron Musket
    { spell = 30306, skill = 325, creates = 23784, source = { "trainer" }, cost = 20000 }, -- Adamantite Frame
    { spell = 30311, skill = 325, creates = 23737, count = 3, source = { "trainer" }, cost = 25000 }, -- Adamantite Grenade
    { spell = 30337, skill = 325, creates = 23767, teach = 23810, source = { "drop" }, bound = false }, -- Crashin' Thrashin' Robot
    { spell = 30348, skill = 325, creates = 23774, teach = 23816, source = { "vendor" }, bound = false, vendors = { { npc = 16657, area = 3557, faction = "Alliance" }, { npc = 16782, area = 3487, faction = "Horde" }, { npc = 18484, area = 3703 } } }, -- Fel Iron Toolbox
    { spell = 30558, skill = 325, level = 65, creates = 23826, count = 3, source = { "trainer" }, cost = 25000 }, -- The Bigger One
    { spell = 30568, skill = 325, creates = 23841, count = 3, source = { "trainer" }, cost = 22500 }, -- Gnomish Flame Turret
    { spell = 30551, skill = 330, creates = 33092, count = 20, teach = 23883, source = { "drop" }, bound = false }, -- Healing Potion Injector
    { spell = 30329, skill = 335, creates = 23764, teach = 23807, source = { "vendor" }, bound = false, vendors = { { npc = 19351, area = 3520, faction = "Alliance" }, { npc = 19836, area = 3483, faction = "Horde" } } }, -- Adamantite Scope
    { spell = 30341, skill = 335, creates = 23768, count = 3, teach = 23811, source = { "vendor" }, bound = false, vendors = { { npc = 16657, area = 3557, faction = "Alliance" }, { npc = 16782, area = 3487, faction = "Horde" }, { npc = 18484, area = 3703 }, { npc = 19383, area = 3521, faction = "Horde" } } }, -- White Smoke Flare
    { spell = 30344, skill = 335, creates = 23771, count = 3, teach = 23814, reputation = { 942, 5, ns.L.FACTION_942 }, source = { "vendor" }, bound = true, vendors = { { npc = 17904, area = 3521 } } }, -- Green Smoke Flare
    { spell = 30347, skill = 335, creates = 34504, teach = 23815, source = { "vendor" }, bound = false, vendors = { { npc = 16657, area = 3557, faction = "Alliance" }, { npc = 16782, area = 3487, faction = "Horde" }, { npc = 18484, area = 3703 } } }, -- Adamantite Shell Machine
    { spell = 32814, skill = 335, creates = 25886, count = 3, teach = 25887, source = { "drop" }, bound = false }, -- Purple Smoke Flare
    { spell = 39971, skill = 335, creates = 32423, count = 10, source = { "trainer" }, cost = 20000 }, -- Icy Blasting Primers
    { spell = 39973, skill = 335, creates = 32413, count = 5, source = { "trainer" }, cost = 50000 }, -- Frost Grenades
    { spell = 43676, skill = 335, creates = 20475, teach = 33804, source = { "drop" }, bound = true }, -- Adamantite Arrow Maker
    { spell = 30307, skill = 340, creates = 23785, source = { "trainer" }, cost = 50000 }, -- Hardened Adamantite Tube
    { spell = 30308, skill = 340, creates = 23786, source = { "trainer" }, cost = 50000 }, -- Khorium Power Core
    { spell = 30309, skill = 340, creates = 23787, source = { "trainer" }, cost = 50000 }, -- Felsteel Stabilizer
    { spell = 30316, skill = 340, creates = 23758, teach = 23803, source = { "vendor" }, bound = false, vendors = { { npc = 18775, area = 3483, faction = "Alliance" }, { npc = 19836, area = 3483, faction = "Horde" } } }, -- Cogspinner Goggles
    { spell = 30317, skill = 340, creates = 23761, teach = 23804, source = { "drop" }, bound = false }, -- Power Amplification Goggles
    { spell = 30560, skill = 340, creates = 23827, count = 2, source = { "trainer" }, cost = 35000 }, -- Super Sapper Charge
    { spell = 30569, skill = 340, creates = 23835, source = { "trainer" }, cost = 31500 }, -- Gnomish Poultryizer
    { spell = 30552, skill = 345, creates = 33093, count = 20, teach = 23884, source = { "drop" }, bound = false }, -- Mana Potion Injector
    { spell = 30313, skill = 350, creates = 23746, teach = 23799, source = { "vendor" }, bound = false, vendors = { { npc = 16657, area = 3557, faction = "Alliance" }, { npc = 16782, area = 3487, faction = "Horde" }, { npc = 19661, area = 3703 } } }, -- Adamantite Rifle
    { spell = 30318, skill = 350, creates = 23762, teach = 23805, source = { "vendor" }, bound = false, vendors = { { npc = 18775, area = 3483, faction = "Alliance" }, { npc = 19383, area = 3521, faction = "Horde" } } }, -- Ultra-Spectropic Detection Goggles
    { spell = 30349, skill = 350, creates = 23775, teach = 23817, bound = true }, -- Khorium Toolbox
    { spell = 30547, skill = 350, creates = 23819, count = 2, teach = 23874, reputation = { 933, 7, ns.L.FACTION_933 }, source = { "vendor" }, bound = true, vendors = { { npc = 20242, area = 3523 }, { npc = 23007, area = 3518 } } }, -- Elemental Seaforium Charge
    { spell = 30563, skill = 350, level = 70, creates = 23836, source = { "trainer" }, cost = 50000 }, -- Goblin Rocket Launcher
    { spell = 30570, skill = 350, creates = 23825, source = { "trainer" }, cost = 45000 }, -- Nigh-Invulnerability Belt
    { spell = 36954, skill = 350, creates = 30542, source = { "trainer" } }, -- Dimensional Ripper - Area 52
    { spell = 36955, skill = 350, creates = 30544, source = { "trainer" } }, -- Ultrasafe Transporter - Toshley's Station
    { spell = 40274, skill = 350, creates = 32461, source = { "trainer" }, cost = 50000 }, -- Furious Gizmatic Goggles
    { spell = 41311, skill = 350, creates = 32472, source = { "trainer" }, cost = 50000 }, -- Justicebringer 2000 Specs
    { spell = 41312, skill = 350, creates = 32473, source = { "trainer" }, cost = 50000 }, -- Tankatronic Goggles
    { spell = 41314, skill = 350, creates = 32474, source = { "trainer" }, cost = 50000 }, -- Surestrike Goggles v2.0
    { spell = 41315, skill = 350, creates = 32476, source = { "trainer" }, cost = 50000 }, -- Gadgetstorm Goggles
    { spell = 41316, skill = 350, creates = 32475, source = { "trainer" }, cost = 50000 }, -- Living Replicator Specs
    { spell = 41317, skill = 350, creates = 32478, source = { "trainer" }, cost = 50000 }, -- Deathblow X11 Goggles
    { spell = 41318, skill = 350, creates = 32479, source = { "trainer" }, cost = 50000 }, -- Wonderheal XT40 Shades
    { spell = 41319, skill = 350, creates = 32480, source = { "trainer" }, cost = 50000 }, -- Magnified Moon Specs
    { spell = 41320, skill = 350, creates = 32494, source = { "trainer" }, cost = 50000 }, -- Destruction Holo-gogs
    { spell = 41321, skill = 350, creates = 32495, source = { "trainer" }, cost = 50000 }, -- Powerheal 4000 Lens
    { spell = 44155, skill = 350, level = 70, creates = 34060, source = { "trainer" }, cost = 120000 }, -- Flying Machine
    { spell = 30556, skill = 355, creates = 23824, teach = 23887, source = { "drop" }, bound = true }, -- Rocket Boots Xtreme
    { spell = 46697, skill = 355, creates = 35581, teach = 35582, source = { "drop" }, bound = true }, -- Rocket Boots Xtreme Lite
    { spell = 30314, skill = 360, creates = 23747, teach = 23800, source = { "drop" }, bound = true }, -- Felsteel Boomstick
    { spell = 30325, skill = 360, creates = 23763, teach = 23806, source = { "drop" }, bound = true }, -- Hyper-Vision Goggles
    { spell = 30332, skill = 360, creates = 23765, teach = 23808, source = { "drop" }, bound = true }, -- Khorium Scope
    { spell = 44391, skill = 360, creates = 34113, count = 5, teach = 34114, source = { "drop" }, bound = true }, -- Field Repair Bot 110G
    { spell = 30315, skill = 375, creates = 23748, teach = 23802, source = { "drop" }, bound = false }, -- Ornate Khorium Rifle
    { spell = 30334, skill = 375, creates = 23766, teach = 23809, source = { "drop" }, bound = true }, -- Stabilized Eternium Scope
    { spell = 30565, skill = 375, level = 70, creates = 23838, source = { "trainer" }, cost = 100000 }, -- Foreman's Enchanted Helmet
    { spell = 30566, skill = 375, level = 70, creates = 23839, source = { "trainer" }, cost = 100000 }, -- Foreman's Reinforced Helmet
    { spell = 30574, skill = 375, creates = 23828, source = { "trainer" }, cost = 90000 }, -- Gnomish Power Goggles
    { spell = 30575, skill = 375, creates = 23829, source = { "trainer" }, cost = 90000 }, -- Gnomish Battle Goggles
    { spell = 41307, skill = 375, creates = 32756, source = { "trainer" }, cost = 50000 }, -- Gyro-balanced Khorium Destroyer
    { spell = 44157, skill = 375, level = 70, creates = 34061, source = { "trainer" }, cost = 180000 }, -- Turbo-Charged Flying Machine
    { spell = 46106, skill = 375, creates = 35183, teach = 35191, source = { "drop" }, bound = false }, -- Wonderheal XT68 Shades
    { spell = 46107, skill = 375, creates = 35185, teach = 35187, source = { "drop" }, bound = false }, -- Justicebringer 3000 Specs
    { spell = 46108, skill = 375, creates = 35181, teach = 35189, source = { "drop" }, bound = false }, -- Powerheal 9000 Lens
    { spell = 46109, skill = 375, creates = 35182, teach = 35190, source = { "drop" }, bound = false }, -- Hyper-Magnified Moon Specs
    { spell = 46110, skill = 375, creates = 35184, teach = 35192, source = { "drop" }, bound = false }, -- Primal-Attuned Goggles
    { spell = 46111, skill = 375, creates = 34847, teach = 35186, source = { "drop" }, bound = false }, -- Annihilator Holo-Gogs
    { spell = 46112, skill = 375, creates = 34355, teach = 35193, source = { "drop" }, bound = false }, -- Lightning Etched Specs
    { spell = 46113, skill = 375, creates = 34356, teach = 35194, source = { "drop" }, bound = false }, -- Surestrike Goggles v3.0
    { spell = 46114, skill = 375, creates = 34354, teach = 35195, source = { "drop" }, bound = false }, -- Mayhem Projection Goggles
    { spell = 46115, skill = 375, creates = 34357, teach = 35196, source = { "drop" }, bound = false }, -- Hard Khorium Goggles
    { spell = 46116, skill = 375, creates = 34353, teach = 35197, source = { "drop" }, bound = false }, -- Quad Deathblow X44 Goggles
}
