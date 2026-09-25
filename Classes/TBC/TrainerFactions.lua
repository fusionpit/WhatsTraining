local _, wt = ...

wt.TrainerFactions = {
	factions = {
		[21] = { side = 0 },
		[47] = { side = 1 },
		[54] = { side = 1 },
		[68] = { side = 2 },
		[69] = { side = 1 },
		[72] = { side = 1 },
		[76] = { side = 2 },
		[81] = { side = 2 },
		[349] = { side = 0 },
		[530] = { side = 2 },
		[609] = { side = 0 },
		[911] = { side = 2 },
		[930] = { side = 1 },
		[934] = { side = 0 },
		[935] = { side = 0 },
	},
	roles = {
		DRUID = {
			Alliance = { 69, 72, 609, 930 },
			Horde = { 81, 609, 911 },
		},
		GRIMOIRE = {
			Alliance = { 54, 72 },
			Horde = { 68, 76, 911 },
		},
		HUNTER = {
			Alliance = { 47, 69, 72, 930 },
			Horde = { 76, 81, 530, 911 },
		},
		MAGE = {
			Alliance = { 47, 54, 69, 72, 930, 934, 935 },
			Horde = { 68, 76, 530, 911, 934, 935 },
		},
		PALADIN = {
			Alliance = { 47, 72, 930 },
			Horde = { 911 },
		},
		PET = {
			Alliance = { 47, 69, 930 },
			Horde = { 76, 81, 911 },
		},
		PRIEST = {
			Alliance = { 47, 69, 72, 930 },
			Horde = { 68, 76, 530, 911 },
		},
		ROGUE = {
			Alliance = { 21, 47, 54, 69, 72, 349 },
			Horde = { 21, 68, 76, 349, 530, 911 },
		},
		SHAMAN = {
			Alliance = { 930 },
			Horde = { 76, 81 },
		},
		WARLOCK = {
			Alliance = { 47, 54, 72 },
			Horde = { 68, 76, 911 },
		},
		WARRIOR = {
			Alliance = { 47, 54, 69, 72, 930 },
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
		[16621] = 911,
		[16773] = 930,
		[17005] = 911,
	},
}
