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
		["area:15"] = { area = 15, side = 0, noRep = true },
	},
	roles = {
		DRUID = {
			Alliance = { 69, 72, 609 },
			Horde = { 81, 609 },
		},
		GRIMOIRE = {
			Alliance = { 54, 72 },
			Horde = { 68, 76 },
		},
		HUNTER = {
			Alliance = { 47, 69, 72 },
			Horde = { 76, 81, 530 },
		},
		MAGE = {
			Alliance = { 47, 54, 69, 72 },
			Horde = { 68, 76, 530 },
		},
		PALADIN = {
			Alliance = { 47, 72, "area:15" },
		},
		PET = {
			Alliance = { 47, 69 },
			Horde = { 76, 81 },
		},
		PRIEST = {
			Alliance = { 47, 69, 72 },
			Horde = { 68, 76, 530 },
		},
		ROGUE = {
			Alliance = { 21, 47, 54, 69, 72, 349 },
			Horde = { 21, 68, 76, 349, 530 },
		},
		SHAMAN = {
			Horde = { 76, 81 },
		},
		WARLOCK = {
			Alliance = { 47, 54, 72 },
			Horde = { 68, 76 },
		},
		WARRIOR = {
			Alliance = { 47, 54, 69, 72, "area:15" },
			Horde = { 68, 76, 81 },
		},
		WEAPON = {
			Alliance = { 47, 69, 72 },
			Horde = { 68, 76, 81, 530 },
		},
	},
}
