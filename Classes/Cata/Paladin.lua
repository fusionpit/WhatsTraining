local _, wt = ...
if (wt.currentClass ~= "PALADIN") then
	return
end

--Mounts don't show up on the trainer so no need for faction flags there, not sure where they're trained.
--Probably need to find the mounts and add them.
--No need for faction check anymore in cata I think if we don't add the mounts, all spells are the same for both factions?
wt.SpellsByLevel = wt.FactionFilter({
		[3] = {
		{
			["id"] = 20154,
			["name"] = "Seal of Righteousness",
			["cost"] = 57,
		}, -- [1]
		{
			["id"] = 20271,
			["name"] = "Judgement",
			["cost"] = 57,
		}, -- [2]
	},
	[54] = {
		{
			["id"] = 96231,
			["name"] = "Rebuke",
			["cost"] = 22800,
		}, -- [1]
	},
	[62] = {
		{
			["id"] = 82326,
			["name"] = "Divine Light",
			["cost"] = 76950,
		}, -- [1]
		{
			["id"] = 32223,
			["name"] = "Crusader Aura",
			["cost"] = 76950,
		}, -- [2]
	},
	[76] = {
		{
			["id"] = 19891,
			["name"] = "Resistance Aura",
			["cost"] = 176700,
		}, -- [1]
	},
	[7] = {
		{
			["id"] = 635,
			["name"] = "Holy Light",
			["cost"] = 271,
		}, -- [1]
	},
	[10] = {
		{
			["id"] = 82242,
			["name"] = "Parry",
			["cost"] = 646,
		}, -- [1]
	},
	[12] = {
		{
			["id"] = 7328,
			["name"] = "Redemption",
			["cost"] = 1023,
		}, -- [1]
		{
			["id"] = 25780,
			["name"] = "Righteous Fury",
			["cost"] = 1023,
		}, -- [2]
	},
	[14] = {
		{
			["id"] = 853,
			["name"] = "Hammer of Justice",
			["cost"] = 1348,
		}, -- [1]
		{
			["id"] = 62124,
			["name"] = "Hand of Reckoning",
			["cost"] = 1348,
		}, -- [2]
	},
	[16] = {
		{
			["id"] = 19750,
			["name"] = "Flash of Light",
			["cost"] = 1957,
		}, -- [1]
		{
			["id"] = 633,
			["name"] = "Lay on Hands",
			["cost"] = 1957,
		}, -- [2]
	},
	[78] = {
		{
			["id"] = 10326,
			["name"] = "Turn Evil",
			["cost"] = 193800,
		}, -- [1]
	},
	[24] = {
		{
			["id"] = 26573,
			["name"] = "Consecration",
			["cost"] = 4845,
		}, -- [1]
	},
	[28] = {
		{
			["id"] = 2812,
			["name"] = "Holy Wrath",
			["cost"] = 7125,
		}, -- [1]
	},
	[32] = {
		{
			["id"] = 20165,
			["name"] = "Seal of Insight",
			["cost"] = 8550,
		}, -- [1]
	},
	[40] = {
		{
			["id"] = 750,
			["name"] = "Plate Mail",
			["cost"] = 14250,
		}, -- [1]
	},
	[48] = {
		{
			["id"] = 642,
			["name"] = "Divine Shield",
			["cost"] = 19950,
		}, -- [1]
	},
	[56] = {
		{
			["id"] = 19740,
			["name"] = "Blessing of Might",
			["cost"] = 24225,
		}, -- [1]
	},
	[64] = {
		{
			["id"] = 20164,
			["name"] = "Seal of Justice",
			["cost"] = 88350,
		}, -- [1]
	},
	[80] = {
		{
			["id"] = 87494,
			["name"] = "Mastery",
			["cost"] = 210900,
		}, -- [1]
		{
			["id"] = 6940,
			["name"] = "Hand of Sacrifice",
			["cost"] = 210900,
		}, -- [2]
	},
	[81] = {
		{
			["id"] = 84963,
			["name"] = "Inquisition",
			["cost"] = 222300,
		}, -- [1]
	},
	[66] = {
		{
			["id"] = 1038,
			["name"] = "Hand of Salvation",
			["cost"] = 99750,
		}, -- [1]
	},
	[34] = {
		{
			["id"] = 4987,
			["name"] = "Cleanse",
			["cost"] = 9975,
		}, -- [1]
	},
	[42] = {
		{
			["id"] = 19746,
			["name"] = "Concentration Aura",
			["cost"] = 15675,
		}, -- [1]
	},
	[50] = {
		{
			["id"] = 87511,
			["name"] = "Plate Specialization",
			["cost"] = 21375,
		}, -- [1]
	},
	[9] = {
		{
			["id"] = 85673,
			["name"] = "Word of Glory",
			["cost"] = 524,
		}, -- [1]
	},
	[85] = {
		{
			["id"] = 86150,
			["name"] = "Guardian of Ancient Kings",
			["cost"] = 267900,
		}, -- [1]
	},
	[18] = {
		{
			["id"] = 879,
			["name"] = "Exorcism",
			["cost"] = 2646,
		}, -- [1]
		{
			["id"] = 1022,
			["name"] = "Hand of Protection",
			["cost"] = 2646,
		}, -- [2]
	},
	[22] = {
		{
			["id"] = 20217,
			["name"] = "Blessing of Kings",
			["cost"] = 3990,
		}, -- [1]
	},
	[26] = {
		{
			["id"] = 7294,
			["name"] = "Retribution Aura",
			["cost"] = 5700,
		}, -- [1]
	},
	[30] = {
		{
			["id"] = 498,
			["name"] = "Divine Protection",
			["cost"] = 7125,
		}, -- [1]
	},
	[36] = {
		{
			["id"] = 31789,
			["name"] = "Righteous Defense",
			["cost"] = 11400,
		}, -- [1]
	},
	[44] = {
		{
			["id"] = 450761,
			["name"] = "Absolution",
			["cost"] = 18525,
		}, -- [1]
		{
			["id"] = 54428,
			["name"] = "Divine Plea",
			["cost"] = 18525,
		}, -- [2]
		{
			["id"] = 31801,
			["name"] = "Seal of Truth",
			["cost"] = 18525,
		}, -- [3]
	},
	[52] = {
		{
			["id"] = 1044,
			["name"] = "Hand of Freedom",
			["cost"] = 21375,
		}, -- [1]
	},
	[72] = {
		{
			["id"] = 31884,
			["name"] = "Avenging Wrath",
			["cost"] = 142500,
		}, -- [1]
	},
	[83] = {
		{
			["id"] = 82327,
			["name"] = "Holy Radiance",
			["cost"] = 245100,
		}, -- [1]
	},
	[46] = {
		{
			["id"] = 24275,
			["name"] = "Hammer of Wrath",
			["cost"] = 18525,
		}, -- [1]
	},
	[5] = {
		{
			["id"] = 465,
			["name"] = "Devotion Aura",
			["cost"] = 135,
		}, -- [1]
	},
})