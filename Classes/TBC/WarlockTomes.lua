local _, wt = ...
if wt.currentClass ~= "WARLOCK" then return end

wt.WarlockAltIcons = {
    ["Succubus"] = 136220,
    ["Incubus"] = 4352492,
    ["Imp"] = 136218,
    ["Voidwalker"] = 136221,
    ["Felhunter"] = 136217,
    ["Felguard"] = 136216
}

wt.WarlockPetOrder = {'Imp', 'Voidwalker', 'Succubus', 'Incubus', 'Felhunter', 'Felguard'}

wt.WarlockPetSummonIds = {
    [688] = true,   -- Summon Imp
    [697] = true,   -- Summon Voidwalker
    [712] = true,   -- Summon Succubus
    [713] = true,   -- Summon Incubus
    [691] = true,   -- Summon Felhunter
    [30146] = true, -- Summon Felguard
}

wt.WarlockTomeMerchantIds = {
    [5520] = true,  -- Spackle Thornberry, Stormwind
    [5753] = true,  -- Martha Strain, Undercity
    [6027] = true,  -- Kitha, Durotar
    [6374] = true,  -- Cylina Darkheart, Elwynn Forest
    [6373] = true,  -- Dane Winslow, Elwynn Forest
    [6376] = true,  -- Wren Darkspring, Dun Morogh
    [5749] = true,  -- Kayla Smithe, Tirisfall Glades
    [5750] = true,  -- Gina Lang, Tirisfall Glades
    [5815] = true,  -- Kurgul, Orgrimmar
    [6328] = true,  -- Jubahl Corpseseeker, Ironforge

    [12807] = true, -- Greshka, Swamp of Sorrows,
    [12776] = true, -- Hraug, Durotar
    [16267] = true, -- Daestra, Eversong Woods
    [15494] = true, -- Yasmine Teli'Larien, Eversong Woods
    [23535] = true, -- Matero Zeshuwal, The Barrens
    [16649] = true, -- Torian, Silvermoon City
}

wt.IsAddOnLoaded = C_AddOns.IsAddOnLoaded

wt.TomesByLevel = {
    [4] = {{itemId = 16321, cost = 100, family = "Imp"}},
    [8] = {{itemId = 16302, cost = 100, family = "Imp"}},
    [12] = {{itemId = 16331, cost = 600, family = "Imp"}},
    [14] = {
        {itemId = 16322, cost = 900, family = "Imp"}, 
        {itemId = 16326, cost = 900, family = "Imp"}
    },
    [16] = {{itemId = 16351, cost = 1200, family = "Voidwalker"}},
    [18] = {
        {itemId = 16316, cost = 1500, family = "Imp"}, 
        {itemId = 16357, cost = 1500, family = "Voidwalker"}
    },
    [20] = {{itemId = 16346, cost = 2000, family = "Voidwalker"}},
    [22] = {
        {id = "SUC:16375", itemId = 16375, cost = 2500, family = "Succubus"}, 
        {id = "INC:16375", itemId = 16375, cost = 2500, family = "Incubus"}
    },
    [24] = {
        {itemId = 16327, cost = 3000, family = "Imp"}, 
        {itemId = 16352, cost = 3000, family = "Voidwalker"}, 
        {itemId = 16363, cost = 3000, family = "Voidwalker"}
    },
    [26] = {
        {itemId = 16323, cost = 4000, family = "Imp"}, 
        {itemId = 16358, cost = 4000, family = "Voidwalker"}, 
        {id = "SUC:16379", itemId = 16379, cost = 4000, family = "Succubus"},
        {id = "INC:16379", itemId = 16379, cost = 4000, family = "Incubus"}
    },
    [28] = {
        {itemId = 16317, cost = 5000, family = "Imp"}, 
        {id = "SUC:16368", itemId = 16368, cost = 5000, family = "Succubus"}, 
        {id = "INC:16368", itemId = 16368, cost = 5000, family = "Incubus"}
    },
    [30] = {{itemId = 16347, cost = 6000, family = "Voidwalker"}},
    [32] = {
        {itemId = 16353, cost = 7000, family = "Voidwalker"}, 
        {id = "SUC:16380", itemId = 16380, cost = 7000, family = "Succubus"}, 
        {id = "INC:16380", itemId = 16380, cost = 7000, family = "Incubus"}, 
        {itemId = 16384, cost = 7000, family = "Felhunter"}
    },
    [34] = {
        {itemId = 16328, cost = 8000, family = "Imp"}, 
        {itemId = 16359, cost = 8000, family = "Voidwalker"}, 
        {id = "SUC:16376", itemId = 16376, cost = 8000, family = "Succubus"}, 
        {id = "INC:16376", itemId = 16376, cost = 8000, family = "Incubus"}
    },
    [36] = {
        {itemId = 16364, cost = 9000, family = "Voidwalker"}, 
        {id = "SUC:16371", itemId = 16371, cost = 9000, family = "Succubus"}, 
        {id = "INC:16371", itemId = 16371, cost = 9000, family = "Incubus"}, 
        {itemId = 16388, cost = 9000, family = "Felhunter"}
    },
    [38] = {
        {itemId = 16318, cost = 10000, family = "Imp"}, 
        {itemId = 16324, cost = 10000, family = "Imp"}, 
        {itemId = 16381, cost = 10000, family = "Felhunter"}
    },
    [40] = {
        {itemId = 16348, cost = 11000, family = "Voidwalker"}, 
        {itemId = 16354, cost = 11000, family = "Voidwalker"}, 
        {itemId = 16385, cost = 11000, family = "Felhunter"}
    },
    [42] = {
        {itemId = 16360, cost = 11000, family = "Voidwalker"}, 
        {itemId = 16390, cost = 11000, family = "Felhunter"}
    },
    [44] = {
        {itemId = 16329, cost = 12000, family = "Imp"}, 
        {id = "SUC:16372", itemId = 16372, cost = 12000, family = "Succubus"}, 
        {id = "INC:16372", itemId = 16372, cost = 12000, family = "Incubus"}
    },
    [46] = {
        {id = "SUC:16377", itemId = 16377, cost = 13000, family = "Succubus"}, 
        {id = "INC:16377", itemId = 16377, cost = 13000, family = "Incubus"}, 
        {itemId = 16382, cost = 13000, family = "Felhunter"}
    },
    [48] = {
        {itemId = 16319, cost = 14000, family = "Imp"}, 
        {itemId = 16355, cost = 14000, family = "Voidwalker"}, 
        {itemId = 16365, cost = 14000, family = "Voidwalker"}, 
        {itemId = 16386, cost = 14000, family = "Felhunter"}
    },
    [50] = {
        {itemId = 16325, cost = 15000, family = "Imp"}, 
        {itemId = 16349, cost = 15000, family = "Voidwalker"}, 
        {itemId = 16361, cost = 15000, family = "Voidwalker"},
        {itemId = 28071, cost = 15000, family = "Felguard"},
        {itemId = 23734, cost = 15000, family = "Felguard"},
    },
    [52] = {
        {id = "SUC:16373", itemId = 16373, cost = 18000, family = "Succubus"}, 
        {id = "INC:16373", itemId = 16373, cost = 18000, family = "Incubus"}, 
        {itemId = 16389, cost = 18000, family = "Felhunter"},
        {itemId = 23711, cost = 18000, family = "Felguard"}
    },
    [54] = {
        {itemId = 16330, cost = 20000, family = "Imp"}, 
        {itemId = 16383, cost = 20000, family = "Felhunter"}
    },
    [56] = {
        {itemId = 16356, cost = 22000, family = "Voidwalker"}, 
        {itemId = 16387, cost = 22000, family = "Felhunter"},
        {itemId = 25900, cost = 22000, family = "Felguard"}
    },
    [58] = {
        {itemId = 16320, cost = 24000, family = "Imp"}, 
        {itemId = 16362, cost = 24000, family = "Voidwalker"}, 
        {id = "SUC:16378", itemId = 16378, cost = 24000, family = "Succubus"},
        {id = "INC:16378", itemId = 16378, cost = 24000, family = "Incubus"}
    },
    [60] = {
        {itemId = 16350, cost = 26000, family = "Voidwalker"}, 
        {itemId = 16366, cost = 26000, family = "Voidwalker"}, 
        {itemId = 28072, cost = 26000, family = "Felguard"}, 
        {itemId = 25469, cost = 26000, family = "Felguard"}, 
        {itemId = 23745, cost = 26000, family = "Felguard"}, 
        {id = "SUC:16374", itemId = 16374, cost = 26000, family = "Succubus"}, 
        {id = "INC:16374", itemId = 16374, cost = 26000, family = "Incubus"}
    },    

    [61] = {{itemId = 23730, cost = 26000, family = "Felguard"}},
    [62] = {
        {itemId = 22180, cost = 26000, family = "Imp"}, 
        {itemId = 22188, cost = 29000, family = "Felhunter"}
    },
    [63] = {{itemId = 22183, cost = 32000, family = "Voidwalker"}},
    [64] = {
        {itemId = 22181, cost = 36000, family = "Imp"}, 
        {itemId = 22185, cost = 36000, family = "Voidwalker"}, 
        {itemId = 22190, cost = 36000, family = "Felhunter"}
    },
    [66] = {{itemId = 22184, cost = 44000, family = "Voidwalker"}},
    [68] = {
        {itemId = 22179, cost = 54000, family = "Imp"}, 
        {id = "SUC:22186", itemId = 22186, cost = 54000, family = "Succubus"}, 
        {id = "INC:22186", itemId = 22186, cost = 54000, family = "Incubus"}, 
        {itemId = 23755, cost = 60000, family = "Felguard"}
    },
    [69] = {
        {itemId = 28068, cost = 60000, family = "Voidwalker"}, 
        {itemId = 23731, cost = 60000, family = "Felguard"}
    },
    [70] = {
        {itemId = 22182, cost = 67000, family = "Voidwalker"}, 
        {id = "SUC:22187", itemId = 22187, cost = 67000, family = "Succubus"}, 
        {id = "INC:22187", itemId = 22187, cost = 67000, family = "Incubus"}, 
        {itemId = 22189, cost = 67000, family = "Felhunter"}, 
        {itemId = 28073, cost = 67000, family = "Felguard"}
    },
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

    [23711] = 30151,
    [25900] = 32850,
    [23745] = 30219,
    [23734] = 30213,
    [25469] = 32233,
    [28071] = 33698,
    [28072] = 33699,
    [23730] = 30194,
    [22180] = 27268,
    [22188] = 27276,
    [22183] = 27271,
    [22181] = 27269,
    [22185] = 27273,
    [22190] = 27280,
    [22184] = 27272,
    [22179] = 27267,
    [22186] = 27274,
    [23755] = 30223,
    [28068] = 33701,
    [23731] = 30198,
    [22182] = 27270,
    [22187] = 27275,
    [22189] = 27277,
    [28073] = 33700,
}
