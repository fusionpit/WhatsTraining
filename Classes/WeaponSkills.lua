local _, wt = ...

local IRONFORGE = 1537
local STORMWIND = 1519
local DARNASSUS = 1657
local ORGRIMMAR = 1637
local THUNDER_BLUFF = 1638
local UNDERCITY = 1497

wt.cityIconIds = {
    [IRONFORGE] = 135757, -- Ironforge
    [STORMWIND] = 135763, -- Stormwind
    [DARNASSUS] = 135755, -- Darnassus
    [ORGRIMMAR] = 135759, -- Orgrimmar
    [THUNDER_BLUFF] = 135765, -- Thunder Bluff
    [UNDERCITY] = 135766, -- Undercity
}
local function npcLocation(id, zone, x, y) 
    return { npc = id, zone = zone, zoneIcon = wt.cityIconIds[zone], x = x, y = y }
end

wt.WeaponSkills = {
    [196] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "SHAMAN"},
        trainers = {
            Alliance = {
                npcLocation(11865, IRONFORGE, 61.2, 89.5) -- Buliwyf Stonehand
            },
            Horde = {
                npcLocation(2704, ORGRIMMAR, 81.5, 19.6), -- Hanashi
                npcLocation(11868, ORGRIMMAR, 81.7, 19.6) -- Sayoc
            }
        }
    }, -- One-Handed Axes
    [197] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "SHAMAN"},
        trainers = {
            Alliance = {
                npcLocation(11865, IRONFORGE, 61.2, 89.5) -- Buliwyf Stonehand
            },
            Horde = {
                npcLocation(2704, ORGRIMMAR, 81.5, 19.6), -- Hanashi
                npcLocation(11868, ORGRIMMAR, 81.7, 19.6) -- Sayoc
            }
        }
    }, -- Two-Handed Axes
    [198] = {
        classes = {"WARRIOR", "PALADIN", "ROGUE", "PRIEST", "SHAMAN", "DRUID"},
        trainers = {
            Alliance = {
                npcLocation(11865, IRONFORGE, 61.2, 89.5) -- Buliwyf Stonehand
            },
            Horde = {
                npcLocation(11870, THUNDER_BLUFF, 40.0, 63.1) -- Ansekhwa
            }
        }
    }, -- One-Handed Maces
    [199] = {
        classes = {"WARRIOR", "PALADIN", "SHAMAN", "DRUID"},
        trainers = {
            Alliance = {
                npcLocation(11865, IRONFORGE, 61.2, 89.5) -- Buliwyf Stonehand
            },
            Horde = {
                npcLocation(11870, THUNDER_BLUFF, 40.0, 63.1) -- Ansekhwa
            }
        }
    }, -- Two-Handed Maces
    [200] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "DRUID"},
        level = 20,
        cost = 10000,
        trainers = {
            Alliance = {
                npcLocation(11869, STORMWIND, 57.1, 57.7) -- Woo Ping
            },
            Horde = {
                npcLocation(11871, UNDERCITY, 57.3, 32.8) -- Archibald
            }
        }
    }, -- Polearms
    [201] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK"},
        trainers = {
            Alliance = {
                npcLocation(11869, STORMWIND, 57.1, 57.7) -- Woo Ping
            },
            Horde = {
                npcLocation(11871, UNDERCITY, 57.3, 32.8) -- Archibald
            }
        }
    }, -- One-Handed Swords
    [202] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER"},
        trainers = {
            Alliance = {
                npcLocation(11869, STORMWIND, 57.1, 57.7) -- Woo Ping
            },
            Horde = {
                npcLocation(11871, UNDERCITY, 57.3, 32.8) -- Archibald
            }
        }
    }, -- Two-Handed Swords
    [227] = {
        classes = {"WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "DRUID", "WARLOCK", "MAGE"},
        trainers = {
            Alliance = {
                npcLocation(11867, DARNASSUS, 57.7, 46.0), -- Ilyenia Moonfire
                npcLocation(11869, STORMWIND, 57.1, 57.7) -- Woo Ping
            },
            Horde = {
                npcLocation(2704, ORGRIMMAR, 81.5, 19.6), -- Hanashi
                npcLocation(11868, ORGRIMMAR, 81.7, 19.6), -- Sayoc
                npcLocation(11870, THUNDER_BLUFF, 40.0, 63.1) -- Ansekhwa
            }
        }
    }, -- Staves
    [264] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                npcLocation(11867, DARNASSUS, 57.7, 46.0) -- Ilyenia Moonfire
            },
            Horde = {
                npcLocation(2704, ORGRIMMAR, 81.5, 19.6), -- Hanashi
                npcLocation(11868, ORGRIMMAR, 81.7, 19.6) -- Sayoc
            }
        }
    }, -- Bows
    [266] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                npcLocation(11865, IRONFORGE, 61.2, 89.5) -- Buliwyf Stonehand
            },
            Horde = {
                npcLocation(11870, THUNDER_BLUFF, 40.0, 63.1) -- Ansekhwa
            }
        }
    }, -- Guns
    [1180] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "DRUID", "WARLOCK", "MAGE"},
        trainers = {
            Alliance = {
                npcLocation(11867, DARNASSUS, 57.7, 46.0), -- Ilyenia Moonfire
                npcLocation(11866, IRONFORGE, 62.2, 89.6), -- Bixi Wobblebonk
                npcLocation(11869, STORMWIND, 57.1, 57.7) -- Woo Ping
            },
            Horde = {
                npcLocation(11868, ORGRIMMAR, 81.7, 19.6), -- Sayoc
                npcLocation(11871, UNDERCITY, 57.3, 32.8) -- Archibald
            }
        }
    }, -- Daggers
    [2567] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                npcLocation(11867, DARNASSUS, 57.7, 46.0), -- Ilyenia Moonfire
                npcLocation(11866, IRONFORGE, 62.2, 89.6) -- Bixi Wobblebonk
            },
            Horde = {
                npcLocation(2704, ORGRIMMAR, 81.5, 19.6), -- Hanashi
                npcLocation(11868, ORGRIMMAR, 81.7, 19.6) -- Sayoc
            }
        }
    }, -- Thrown
    [5011] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                npcLocation(11866, IRONFORGE, 62.2, 89.6), -- Bixi Wobblebonk
                npcLocation(11869, STORMWIND, 57.1, 57.7) -- Woo Ping
            },
            Horde = {
                npcLocation(11871, UNDERCITY, 57.3, 32.8) -- Archibald
            }
        }
    }, -- Crossbows
    [15590] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE", "SHAMAN", "DRUID"},
        trainers = {
            Alliance = {
                npcLocation(11867, DARNASSUS, 57.7, 46.0), -- Ilyenia Moonfire
                npcLocation(11865, IRONFORGE, 61.2, 89.5) -- Buliwyf Stonehand
            },
            Horde = {
                npcLocation(11868, ORGRIMMAR, 81.7, 19.6) -- Sayoc
            }
        }
    }, -- Fist Weapons
}
wt.WeaponSkillDisplayOrder = {
    196, -- One-Handed Axes
    197, -- Two-Handed Axes
    198, -- One-Handed Maces
    199, -- Two-Handed Maces
    201, -- One-Handed Swords
    202, -- Two-Handed Swords
    1180, -- Daggers
    15590, -- Fist Weapons
    227, -- Staves
    200, -- Polearms
    264, -- Bows
    266, -- Guns
    5011, -- Crossbows
    2567 -- Thrown
}

for index, id in ipairs(wt.WeaponSkillDisplayOrder) do
    if wt.WeaponSkills[id] then
        wt.WeaponSkills[id].orderIndex = index
    end
end
