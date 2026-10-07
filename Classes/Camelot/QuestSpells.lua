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
            { races = {95, 96}, level = 10, area = 16593, quests = {94003} },
        },
        [355] = { -- Taunt
            { races = {2, 6, 8}, level = 10, area = 17, quests = {1498} },
            { races = {5}, level = 10, area = 85, quests = {1819} },
            { races = {1}, level = 10, area = 1519, quests = {1665} },
            { races = {3, 7}, level = 10, area = 1537, quests = {1678} },
            { races = {4}, level = 10, area = 1657, quests = {1683} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94003} },
        },
        [7386] = { -- Sunder Armor
            { races = {2, 6, 8}, level = 10, area = 17, quests = {1498} },
            { races = {5}, level = 10, area = 85, quests = {1819} },
            { races = {1}, level = 10, area = 1519, quests = {1665} },
            { races = {3, 7}, level = 10, area = 1537, quests = {1678} },
            { races = {4}, level = 10, area = 1657, quests = {1683} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94003} },
        },
        [2458] = { -- Berserker Stance
            { races = {1, 2, 3, 4, 5, 6, 7, 8, 95, 96}, level = 30, area = 17, quests = {1719} },
        },
        [20252] = { -- Intercept
            { races = {1, 2, 3, 4, 5, 6, 7, 8, 95, 96}, level = 30, area = 17, quests = {1719} },
        },
    },
    PALADIN = {
        [635] = { -- Holy Light
            { races = {5}, level = 2, area = 85, quests = {90902} },
        },
        [7328] = { -- Redemption
            { races = {3}, level = 12, area = 1537, quests = {1785} },
            { races = {1}, level = 12, area = 1519, quests = {1788} },
            { races = {5}, level = 12, area = 85, quests = {94441} },
        },
        [5502] = { -- Sense Undead
            { races = {1, 3}, level = 20, areas = {1519, 1537}, quests = {1652} },
        },
        [13819] = { -- Summon Warhorse
            { races = {1, 3}, level = 40, area = 1519, quests = {1661} },
        },
        [23214] = { -- Summon Charger
            { races = {1, 3}, level = 60, area = 1519, quests = {7647} },
        },
    },
    HUNTER = {
        [1515] = { -- Tame Beast
            { races = {2, 8}, level = 10, area = 14, quests = {6082} },
            { races = {6}, level = 10, area = 215, quests = {6088} },
            { races = {3}, level = 10, area = 1, quests = {6085} },
            { races = {4}, level = 10, area = 141, quests = {6102} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94013} },
            { races = {1}, level = 10, area = 12, quests = {94864} },
        },
        [5149] = { -- Beast Training
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94050} },
            { races = {1}, level = 10, area = 12, quests = {94793} },
        },
        [883] = { -- Call Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94050} },
            { races = {1}, level = 10, area = 12, quests = {94793} },
        },
        [2641] = { -- Dismiss Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94050} },
            { races = {1}, level = 10, area = 12, quests = {94793} },
        },
        [6991] = { -- Feed Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94050} },
            { races = {1}, level = 10, area = 12, quests = {94793} },
        },
        [982] = { -- Revive Pet
            { races = {2, 8}, level = 10, area = 14, quests = {6081} },
            { races = {6}, level = 10, area = 215, quests = {6089} },
            { races = {3}, level = 10, area = 1, quests = {6086} },
            { races = {4}, level = 10, area = 141, quests = {6103} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94050} },
            { races = {1}, level = 10, area = 12, quests = {94793} },
        },
    },
    ROGUE = {
        [2842] = { -- Poisons
            { races = {1, 3, 4, 7, 95}, level = 20, area = 1519, quests = {2359} },
            { races = {2, 5, 8}, level = 20, area = 1637, quests = {2480} },
        },
    },
    PRIEST = {
        [13908] = { -- Desperate Prayer
            { races = {1}, level = 10, areas = {12, 1, 1519, 1537, 1657}, quests = {5635, 5637, 5638, 5639, 5640} },
            { races = {3}, level = 10, areas = {12, 1, 1519, 1537, 1657, 141}, quests = {5635, 5637, 5638, 5639, 5640, 5634, 5636} },
        },
        [13896] = { -- Feedback
            { races = {1}, level = 20, areas = {1519, 1537, 1657}, quests = {5676, 5677, 5678} },
        },
        [10797] = { -- Starshards
            { races = {4}, level = 10, areas = {1657, 12, 141, 1, 1519, 1537}, quests = {5627, 5628, 5629, 5630, 5631, 5632, 5633} },
        },
        [2651] = { -- Elune's Grace
            { races = {4}, level = 20, areas = {1657, 1519, 1537}, quests = {5672, 5673, 5674, 5675} },
        },
        [2652] = { -- Touch of Weakness
            { races = {5}, level = 10, areas = {1497, 14, 215, 1637, 1638}, quests = {5658, 5660, 5661, 5662, 5663} },
        },
        [9035] = { -- Hex of Weakness
            { races = {8}, level = 10, areas = {1637, 14, 215, 1497}, quests = {5652, 5654, 5655, 5656, 5657} },
        },
        [18137] = { -- Shadowguard
            { races = {8}, level = 20, areas = {1638, 1497, 1637}, quests = {5642, 5643, 5680} },
        },
        [1277370] = { -- Divine Grace
            { races = {1}, level = 10, areas = {1519, 12}, quests = {94773, 94774, 94775, 94776, 94777, 94778, 94779} },
        },
        [1277331] = { -- Chastise
            { races = {3}, level = 20, areas = {1537, 1519, 1657}, quests = {5641, 5645, 5647} },
        },
        [1277324] = { -- Dark Sacrifice
            { races = {5}, level = 20, areas = {1638, 1637, 1497}, quests = {5644, 5646, 5679} },
        },
        [1277455] = { -- Confounding Flash
            { races = {7}, level = 10, areas = {1537, 1}, quests = {94817, 94821, 94822, 94823, 94824, 94825, 94826} },
        },
        [1277462] = { -- Contingency Plan
            { races = {7}, level = 20, area = 1537, quests = {94818, 94819, 94820} },
        },
    },
    SHAMAN = {
        [8071] = { -- Stoneskin Totem
            { races = {2, 6}, level = 4, areas = {14, 215}, quests = {1518, 1521} },
            { races = {8}, level = 4, area = 14, quests = {1518} },
            { races = {3}, level = 4, area = 1, quests = {94375} },
            { races = {96}, level = 3, area = 16593, quests = {92468} },
        },
        [3599] = { -- Searing Totem
            { races = {2, 6, 8}, level = 10, area = 17, quests = {1527} },
            { races = {3}, level = 10, area = 1, quests = {94468} },
            { races = {96}, level = 10, area = 16593, quests = {97257} },
        },
        [5394] = { -- Healing Stream Totem
            { races = {2, 6, 8}, level = 20, area = 17, quests = {96} },
            { races = {3}, level = 20, area = 38, quests = {94505} },
        },
    },
    MAGE = {
        [28272] = { -- Polymorph: Pig
            { races = {1, 2, 3, 4, 5, 6, 7, 8, 95, 96}, level = 60, area = 16, quests = {9364} },
        },
        [10140] = { -- Conjure Water Rank 7
            { races = {1, 2, 3, 4, 5, 6, 7, 8, 95, 96}, level = 60, area = 2557, quests = {7463} },
        },
    },
    WARLOCK = {
        [688] = { -- Summon Imp
            { races = {5}, level = 1, area = 85, quests = {1470} },
            { races = {2, 8}, level = 1, area = 14, quests = {1485} },
            { races = {1}, level = 1, area = 12, quests = {1598} },
            { races = {7}, level = 1, area = 1, quests = {1599} },
        },
        [697] = { -- Summon Voidwalker
            { races = {5}, level = 10, area = 1497, quests = {1471} },
            { races = {2, 8}, level = 10, area = 1637, quests = {1504} },
            { races = {1, 7}, level = 10, area = 1519, quests = {1689} },
        },
        [712] = { -- Summon Succubus
            { races = {5}, level = 20, area = 1497, quests = {1474} },
            { races = {2, 8}, level = 20, area = 1637, quests = {1513} },
            { races = {1, 7}, level = 20, area = 1519, quests = {1739} },
        },
        [713] = { -- Summon Incubus
            { races = {5}, level = 20, area = 1497, quests = {65597} },
            { races = {2, 8}, level = 20, area = 1637, quests = {65604} },
            { races = {1, 7}, level = 20, area = 17, quests = {65603} },
        },
        [691] = { -- Summon Felhunter
            { races = {1, 2, 5, 7, 8}, level = 30, area = 17, quests = {1795} },
        },
        [5784] = { -- Summon Felsteed
            { races = {1, 2, 5, 7, 8}, level = 40, area = 17, quests = {4490} },
        },
        [1122] = { -- Inferno
            { races = {1, 2, 5, 7, 8}, level = 50, area = 361, quests = {7603} },
        },
        [18540] = { -- Ritual of Doom
            { races = {1, 2, 5, 7, 8}, level = 60, area = 4, quests = {7583} },
        },
        [23161] = { -- Summon Dreadsteed
            { races = {1, 2, 5, 7, 8}, level = 60, area = 46, quests = {7631} },
        },
    },
    DRUID = {
        [5487] = { -- Bear Form
            { races = {4}, level = 10, area = 1657, quests = {6001} },
            { races = {6}, level = 10, area = 1638, quests = {6002} },
            { races = {95, 96}, level = 10, area = 16593, quests = {94638} },
        },
        [18960] = { -- Teleport: Moonglade
            { races = {4}, level = 10, area = 1657, quests = {5921} },
            { races = {6}, level = 10, area = 1638, quests = {5922} },
            { races = {96}, level = 10, area = 1638, quests = {94913} },
            { races = {95}, level = 10, area = 1519, quests = {94914} },
        },
        [768] = { -- Cat Form
            { races = {4, 95}, level = 20, area = 1657, quests = {98397} },
            { races = {6, 96}, level = 20, area = 1638, quests = {98362} },
        },
        [8946] = { -- Cure Poison
            { races = {4}, level = 14, area = 1657, quests = {6125} },
            { races = {6}, level = 14, area = 1638, quests = {6130} },
        },
        [1066] = { -- Aquatic Form
            { races = {4}, level = 16, area = 1657, quests = {5061} },
            { races = {6}, level = 16, area = 1638, quests = {31} },
        },
    },
}

wt.AddQuestSpells(QuestSpells)
