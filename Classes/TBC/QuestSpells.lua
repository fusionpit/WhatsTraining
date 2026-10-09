local _, wt = ...

-- QuestSpells[<CLASS>][<spellId>] = list of { races = {<addon race ids>}, level = <first-quest min level>, area = <AreaTable id> or areas = {<AreaTable ids>}, quests = {<reward quest ids>} }
local QuestSpells = {
    WARRIOR = {
        [71] = { -- Defensive Stance
            { races = {2, 6, 8}, level = 10, area = 17, quests = {1498} },
            { races = {5}, level = 10, area = 85, quests = {1819} },
            { races = {1}, level = 10, area = 1519, quests = {1665} },
            { races = {3, 7}, level = 10, area = 1537, quests = {1678} },
            { races = {4}, level = 10, area = 1657, quests = {1683} },
            { races = {11}, level = 10, area = 3524, quests = {9582, 10350} },
        },
        [355] = { -- Taunt
            { races = {2, 6, 8}, level = 10, area = 17, quests = {1498} },
            { races = {5}, level = 10, area = 85, quests = {1819} },
            { races = {1}, level = 10, area = 1519, quests = {1665} },
            { races = {3, 7}, level = 10, area = 1537, quests = {1678} },
            { races = {4}, level = 10, area = 1657, quests = {1683} },
            { races = {11}, level = 10, area = 3524, quests = {9582, 10350} },
        },
        [7386] = { -- Sunder Armor 
            { races = {2, 6, 8}, level = 10, area = 17, quests = {1498} },
            { races = {5}, level = 10, area = 85, quests = {1819} },
            { races = {1}, level = 10, area = 1519, quests = {1665} },
            { races = {3, 7}, level = 10, area = 1537, quests = {1678} },
            { races = {4}, level = 10, area = 1657, quests = {1683} },
            { races = {11}, level = 10, area = 3524, quests = {9582, 10350} },
        },
        [2458] = { -- Berserker Stance
            { races = {1, 2, 3, 4, 5, 6, 7, 8, 11}, level = 30, area = 17, quests = {1719} },
        },
        [20252] = { -- Intercept 
            { races = {1, 2, 3, 4, 5, 6, 7, 8, 11}, level = 30, area = 17, quests = {1719} },
        },
    },
    PALADIN = {
        [7328] = { -- Redemption 
            { races = {3}, level = 12, area = 1537, quests = {1785} },
            { races = {1}, level = 12, area = 1519, quests = {1788} },
            { races = {11}, level = 12, area = 3557, quests = {9600} },
            { races = {10}, level = 12, area = 3487, quests = {9685} },
        },
        [5502] = { -- Sense Undead
            { races = {1, 3, 11}, level = 20, areas = {1519, 1537}, quests = {1652} },
            { races = {10}, level = 20, area = 3487, quests = {9691} },
        },
        [23214] = { -- Summon Charger (Alliance)
            { races = {1, 3, 11}, level = 60, area = 1519, quests = {7647} },
        },
        [34767] = { -- Summon Charger (Blood Elf)
            { races = {10}, level = 60, areas = {3487, 3703}, quests = {9737} },
        },
    },
    HUNTER = {
        [1515] = { -- Tame Beast
            { races = {2, 8}, level = 10, area = 14, quests = {6082} },
            { races = {6}, level = 10, area = 215, quests = {6088} },
            { races = {3}, level = 10, area = 1, quests = {6085} },
            { races = {4}, level = 10, area = 141, quests = {6102} },
            { races = {11}, level = 10, area = 3524, quests = {9593} },
            { races = {10}, level = 10, area = 3430, quests = {9485} },
        },
        [883] = { -- Call Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6082} },
            { races = {6}, level = 10, area = 215, quests = {6088} },
            { races = {3}, level = 10, area = 1, quests = {6085} },
            { races = {4}, level = 10, area = 141, quests = {6102} },
            { races = {11}, level = 10, area = 3524, quests = {9593} },
            { races = {10}, level = 10, area = 3430, quests = {9485} },
        },
        [2641] = { -- Dismiss Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6082} },
            { races = {6}, level = 10, area = 215, quests = {6088} },
            { races = {3}, level = 10, area = 1, quests = {6085} },
            { races = {4}, level = 10, area = 141, quests = {6102} },
            { races = {11}, level = 10, area = 3524, quests = {9593} },
            { races = {10}, level = 10, area = 3430, quests = {9485} },
        },
        [5149] = { -- Beast Training
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {11}, level = 10, area = 3524, quests = {9675} },
            { races = {10}, level = 10, area = 3430, quests = {9673} },
        },
        [6991] = { -- Feed Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {11}, level = 10, area = 3524, quests = {9675} },
            { races = {10}, level = 10, area = 3430, quests = {9673} },
        },
        [982] = { -- Revive Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {11}, level = 10, area = 3524, quests = {9675} },
            { races = {10}, level = 10, area = 3430, quests = {9673} },
        },
    },
    ROGUE = {
        [2842] = { -- Poisons
            { races = {1, 3, 4, 7}, level = 20, area = 1519, quests = {2359} },
            { races = {2, 5, 8, 10}, level = 20, area = 1637, quests = {2480} },
        },
    },
    PRIEST = {}, -- no quest spells: every racial is a trainer spell in TBC
    SHAMAN = {
        [8071] = { -- Stoneskin Totem 
            { races = {2, 8}, level = 4, area = 14, quests = {1518} },
            { races = {6}, level = 4, area = 215, quests = {1521} },
            { races = {11}, level = 4, area = 3524, quests = {9451} },
        },
        [3599] = { -- Searing Totem 
            { races = {2, 6, 8}, level = 10, area = 17, quests = {1527} },
            { races = {11}, level = 10, area = 3524, quests = {9555} },
        },
        [5394] = { -- Healing Stream Totem 
            { races = {2, 6, 8}, level = 20, area = 17, quests = {96} },
            { races = {11}, level = 20, area = 3557, quests = {9509} },
        },
    },
    MAGE = {
        [28272] = { -- Polymorph: Pig
            { races = {1, 5, 7, 8, 10, 11}, level = 60, area = 16, quests = {9364} },
        },
    },
    WARLOCK = {
        [688] = { -- Summon Imp
            { races = {5}, level = 1, area = 85, quests = {1470} },
            { races = {2}, level = 1, area = 14, quests = {1485} },
            { races = {1}, level = 1, area = 12, quests = {1598} },
            { races = {7}, level = 1, area = 1, quests = {1599} },
            { races = {10}, level = 1, area = 3430, quests = {8344} },
        },
        [697] = { -- Summon Voidwalker
            { races = {5}, level = 10, area = 1497, quests = {1471} },
            { races = {2}, level = 10, area = 1637, quests = {1504} },
            { races = {1, 7}, level = 10, area = 1519, quests = {1689} },
            { races = {10}, level = 10, area = 3487, quests = {9619} },
        },
        [712] = { -- Summon Succubus
            { races = {5}, level = 20, area = 1497, quests = {1474} },
            { races = {2}, level = 20, area = 1637, quests = {1513} },
            { races = {1, 7}, level = 20, area = 1519, quests = {1739} },
            { races = {10}, level = 20, area = 1497, quests = {1474} },
        },
        [713] = { -- Summon Incubus
            { races = {5}, level = 20, area = 1497, quests = {65597} },
            { races = {2}, level = 20, area = 1637, quests = {65604} },
            { races = {10}, level = 20, areas = {1497, 1637}, quests = {65597, 65604} },
            { races = {1, 7}, level = 20, area = 17, quests = {65603} },
        },
        [691] = { -- Summon Felhunter
            { races = {1, 2, 5, 7, 10}, level = 30, area = 17, quests = {1795} },
        },
        [1122] = { -- Inferno
            { races = {1, 2, 5, 7, 10}, level = 50, area = 361, quests = {7603} },
        },
        [18540] = { -- Ritual of Doom
            { races = {1, 2, 5, 7, 10}, level = 60, area = 4, quests = {7583} },
        },
        [23161] = { -- Summon Dreadsteed
            { races = {1, 2, 5, 7, 10}, level = 60, area = 46, quests = {7631} },
        },
    },
    DRUID = {
        [5487] = { -- Bear Form
            { races = {4}, level = 10, area = 1657, quests = {6001} },
            { races = {6}, level = 10, area = 1638, quests = {6002} },
        },
        [6795] = { -- Growl
            { races = {4}, level = 10, area = 1657, quests = {6001} },
            { races = {6}, level = 10, area = 1638, quests = {6002} },
        },
        [6807] = { -- Maul 
            { races = {4}, level = 10, area = 1657, quests = {6001} },
            { races = {6}, level = 10, area = 1638, quests = {6002} },
        },
        [8946] = { -- Cure Poison
            { races = {4}, level = 14, area = 1657, quests = {6125} },
            { races = {6}, level = 14, area = 1638, quests = {6130} },
        },
        [1066] = { -- Aquatic Form
            { races = {4}, level = 16, area = 1657, quests = {5061} },
            { races = {6}, level = 16, area = 1638, quests = {31} },
        },
        [40120] = { -- Swift Flight Form
            { races = {4, 6}, level = 70, area = 3521, quests = {11001} },
        },
        -- enable after an in-game check:
        -- [18960] = { -- Teleport: Moonglade
        --     { races = {4}, level = 10, area = 1657, quests = {5921} },
        --     { races = {6}, level = 10, area = 1638, quests = {5922} },
        -- },
    },
}

wt.AddQuestSpells(QuestSpells)
