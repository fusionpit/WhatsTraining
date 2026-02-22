local _, wt = ...
if wt.currentClass ~= "WARLOCK" then return end

wt.WarlockAltIcons = {
    ["Succubus"] = 136220,
    ["Incubus"] = 4352492,
    ["Imp"] = 136218,
    ["Voidwalker"] = 136221,
    ["Felhunter"] = 136217
}

wt.WarlockPetOrder = {'Imp', 'Voidwalker', 'Succubus', 'Incubus', 'Felhunter'}

wt.WarlockPetSummonIds = {
    [688] = true, -- Summon Imp
    [697] = true, -- Summon Voidwalker
    [712] = true, -- Summon Succubus
    [713] = true, -- Summon Incubus
    [691] = true, -- Summon Felhunter
}

wt.WarlockTomeMerchantIds = {
    [5520] = true,
    [5753] = true,
    [1277] = true,
    [6027] = true,
    [6374] = true,
    [6373] = true,
    [6376] = true,
    [1280] = true,
    [5749] = true,
    [5750] = true,
    [6382] = true,
    [5815] = true,
    [6328] = true
}

wt.IsAddOnLoaded = IsAddOnLoaded

wt.TomesByLevel = {
    [4] = {{itemId = 16321, cost = 100, family = "Imp"}},
    [8] = {{itemId = 16302, cost = 100, family = "Imp"}},
    [12] = {{itemId = 16331, cost = 600, family = "Imp"}},
    [14] = {{itemId = 16322, cost = 900, family = "Imp"}, {itemId = 16326, cost = 900, family = "Imp"}},
    [16] = {{itemId = 16351, cost = 1200, family = "Voidwalker"}},
    [18] = {{itemId = 16316, cost = 1500, family = "Imp"}, {itemId = 16357, cost = 1500, family = "Voidwalker"}},
    [20] = {{itemId = 16346, cost = 2000, family = "Voidwalker"}},
    [22] = {{id = "SUC:16375", itemId = 16375, cost = 2500, family = "Succubus"}, {id = "INC:16375", itemId = 16375, cost = 2500, family = "Incubus"}},
    [24] = {{itemId = 16327, cost = 3000, family = "Imp"}, {itemId = 16352, cost = 3000, family = "Voidwalker"}, {itemId = 16363, cost = 3000, family = "Voidwalker"}},
    [26] = {{itemId = 16323, cost = 4000, family = "Imp"}, {itemId = 16358, cost = 4000, family = "Voidwalker"}, {id = "SUC:16379", itemId = 16379, cost = 4000, family = "Succubus"}, {id = "INC:16379", itemId = 16379, cost = 4000, family = "Incubus"}},
    [28] = {{itemId = 16317, cost = 5000, family = "Imp"}, {id = "SUC:16368", itemId = 16368, cost = 5000, family = "Succubus"}, {id = "INC:16368", itemId = 16368, cost = 5000, family = "Incubus"}},
    [30] = {{itemId = 16347, cost = 6000, family = "Voidwalker"}},
    [32] = {{itemId = 16353, cost = 7000, family = "Voidwalker"}, {id = "SUC:16380", itemId = 16380, cost = 7000, family = "Succubus"}, {id = "INC:16380", itemId = 16380, cost = 7000, family = "Incubus"}, {itemId = 16384, cost = 7000, family = "Felhunter"}},
    [34] = {{itemId = 16328, cost = 8000, family = "Imp"}, {itemId = 16359, cost = 8000, family = "Voidwalker"}, {id = "SUC:16376", itemId = 16376, cost = 8000, family = "Succubus"}, {id = "INC:16376", itemId = 16376, cost = 8000, family = "Incubus"}},
    [36] = {{itemId = 16364, cost = 9000, family = "Voidwalker"}, {id = "SUC:16371", itemId = 16371, cost = 9000, family = "Succubus"}, {id = "INC:16371", itemId = 16371, cost = 9000, family = "Incubus"}, {itemId = 16388, cost = 9000, family = "Felhunter"}},
    [38] = {{itemId = 16318, cost = 10000, family = "Imp"}, {itemId = 16324, cost = 10000, family = "Imp"}, {itemId = 16381, cost = 10000, family = "Felhunter"}},
    [40] = {{itemId = 16348, cost = 11000, family = "Voidwalker"}, {itemId = 16354, cost = 11000, family = "Voidwalker"}, {itemId = 16385, cost = 11000, family = "Felhunter"}},
    [42] = {{itemId = 16360, cost = 11000, family = "Voidwalker"}, {itemId = 16390, cost = 11000, family = "Felhunter"}},
    [44] = {{itemId = 16329, cost = 12000, family = "Imp"}, {id = "SUC:16372", itemId = 16372, cost = 12000, family = "Succubus"}, {id = "INC:16372", itemId = 16372, cost = 12000, family = "Incubus"}},
    [46] = {{id = "SUC:16377", itemId = 16377, cost = 13000, family = "Succubus"}, {id = "INC:16377", itemId = 16377, cost = 13000, family = "Incubus"}, {itemId = 16382, cost = 13000, family = "Felhunter"}},
    [48] = {{itemId = 16319, cost = 14000, family = "Imp"}, {itemId = 16355, cost = 14000, family = "Voidwalker"}, {itemId = 16365, cost = 14000, family = "Voidwalker"}, {itemId = 16386, cost = 14000, family = "Felhunter"}},
    [50] = {{itemId = 16325, cost = 15000, family = "Imp"}, {itemId = 16349, cost = 15000, family = "Voidwalker"}, {itemId = 16361, cost = 15000, family = "Voidwalker"}},
    [52] = {{id = "SUC:16373", itemId = 16373, cost = 18000, family = "Succubus"}, {id = "INC:16373", itemId = 16373, cost = 18000, family = "Incubus"}, {itemId = 16389, cost = 18000, family = "Felhunter"}},
    [54] = {{itemId = 16330, cost = 20000, family = "Imp"}, {itemId = 16383, cost = 20000, family = "Felhunter"}},
    [56] = {{itemId = 16356, cost = 22000, family = "Voidwalker"}, {itemId = 16387, cost = 22000, family = "Felhunter"}},
    [58] = {{itemId = 16320, cost = 24000, family = "Imp"}, {itemId = 16362, cost = 24000, family = "Voidwalker"}, {id = "SUC:16378", itemId = 16378, cost = 24000, family = "Succubus"}, {id = "INC:16378", itemId = 16378, cost = 24000, family = "Incubus"}},
    [60] = {{itemId = 16350, cost = 26000, family = "Voidwalker"}, {itemId = 16366, cost = 26000, family = "Voidwalker"}, {id = "SUC:16374", itemId = 16374, cost = 26000, family = "Succubus"}, {id = "INC:16374", itemId = 16374, cost = 26000, family = "Incubus"}},    
}
wt.TomeTaughtSpells = {
    [16321] = 6307,
    [16302] = 7799,
    [16331] = 4511,
    [16322] = 7804,
    [16326] = 2947,
    [16351] = 7812,
    [16316] = 7800,
    [16357] = 17767,
    [16346] = 7809,
    [16375] = 6360,
    [16327] = 8316,
    [16352] = 19438,
    [16363] = 17735,
    [16323] = 7805,
    [16358] = 17850,
    [16379] = 6358,
    [16317] = 7801,
    [16368] = 7815,
    [16347] = 7810,
    [16353] = 19440,
    [16380] = 7870,
    [16384] = 19478,
    [16328] = 8317,
    [16359] = 17851,
    [16376] = 7813,
    [16364] = 17750,
    [16371] = 7816,
    [16388] = 19244,
    [16318] = 7802,
    [16324] = 11766,
    [16381] = 19731,
    [16348] = 7811,
    [16354] = 19441,
    [16385] = 19655,
    [16360] = 17852,
    [16390] = 19480,
    [16329] = 11770,
    [16372] = 11778,
    [16377] = 11784,
    [16382] = 19734,
    [16319] = 11762,
    [16355] = 19442,
    [16365] = 17751,
    [16386] = 19656,
    [16325] = 11767,
    [16349] = 11774,
    [16361] = 17853,
    [16373] = 11779,
    [16389] = 19647,
    [16330] = 11771,
    [16383] = 19736,
    [16356] = 19443,
    [16387] = 19660,
    [16320] = 11763,
    [16362] = 17854,
    [16378] = 11785,
    [16350] = 11775,
    [16374] = 11780,
    [16366] = 17752,
}
