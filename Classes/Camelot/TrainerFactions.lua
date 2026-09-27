local _, wt = ...

wt.TrainerFactions = {
	factions = {
		[21] = { side = 0 },
		[47] = { side = 1, city = true },
		[54] = { side = 1, city = true },
		[68] = { side = 2, city = true },
		[69] = { side = 1, city = true },
		[72] = { side = 1, city = true },
		[76] = { side = 2, city = true },
		[81] = { side = 2, city = true },
		[349] = { side = 0 },
		[530] = { side = 2, city = true },
		[609] = { side = 0 },
		[2740] = { side = 1 },
		[2787] = { side = 2 },
	},
	roles = {
		DRUID = {
			Alliance = { 69, 72, 609, 2740 },
			Horde = { 81, 609, 2787 },
		},
		-- Forever's tome vendors charge full price at every standing (Era discounts them, so this is
		-- probably a Forever bug). No GRIMOIRE role means Pricing shows only the base cost for tomes.
		-- GRIMOIRE = {
		-- 	Alliance = { 54, 72 },
		-- 	Horde = { 68, 76 },
		-- },
		HUNTER = {
			Alliance = { 47, 69, 72 },
			Horde = { 76, 81, 530 },
		},
		MAGE = {
			Alliance = { 47, 54, 69, 72, 2740 },
			Horde = { 68, 76, 530 },
		},
		PALADIN = {
			Alliance = { 47, 72 },
			Horde = { 68 },
		},
		PET = {
			Alliance = { 47, 69, 72 },
			Horde = { 76, 81 },
		},
		PRIEST = {
			Alliance = { 47, 54, 69, 72 },
			Horde = { 68, 76, 530 },
		},
		ROGUE = {
			Alliance = { 21, 47, 54, 69, 72, 349 },
			Horde = { 21, 68, 76, 81, 349, 530 },
		},
		SHAMAN = {
			Alliance = { 47 },
			Horde = { 76, 81, 2787 },
		},
		WARLOCK = {
			Alliance = { 47, 54, 72 },
			Horde = { 68, 76 },
		},
		WARRIOR = {
			Alliance = { 47, 54, 69, 72 },
			Horde = { 68, 76, 81 },
		},
	},
	npcs = {
		[2704] = 530,
		[11865] = 47,
		[11866] = 69,
		[11867] = 72,
		[11868] = 76,
		[11869] = 81,
		[11870] = 68,
		[13084] = 47,
	},
}
