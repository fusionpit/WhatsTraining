local _, wt = ...

local IRONFORGE = 1537
local STORMWIND = 1519
local DARNASSUS = 1657
local ORGRIMMAR = 1637
local THUNDER_BLUFF = 1638
local UNDERCITY = 1497

wt.cityIconIds = {
    [IRONFORGE] = 135757,
    [STORMWIND] = 135763,
    [DARNASSUS] = 135755,
    [ORGRIMMAR] = 135759,
    [THUNDER_BLUFF] = 135765,
    [UNDERCITY] = 135766,
}
local function npcLocation(id, zone, x, y) 
    return { npc = id, zone = zone, zoneIcon = wt.cityIconIds[zone], x = x, y = y }
end

local BULIWYF_STONEHAND = npcLocation(11865, IRONFORGE, 61.2, 89.5)
local BIXI_WOBBLEBONK = npcLocation(11866, IRONFORGE, 62.2, 89.6)
local WOO_PING = npcLocation(11869, STORMWIND, 57.1, 57.7)
local ILYENIA_MOONFIRE = npcLocation(11867, DARNASSUS, 57.7, 46.0)
local HANASHI = npcLocation(2704, ORGRIMMAR, 81.5, 19.6)
local SAYOC = npcLocation(11868, ORGRIMMAR, 81.7, 19.6)
local ANSEKHWA = npcLocation(11870, THUNDER_BLUFF, 40.0, 63.1)
local ARCHIBALD = npcLocation(11871, UNDERCITY, 57.3, 32.8)

local ONE_HANDED_AXES = 196
local TWO_HANDED_AXES = 197
local ONE_HANDED_MACES = 198
local TWO_HANDED_MACES = 199
local POLEARMS = 200
local ONE_HANDED_SWORDS = 201
local TWO_HANDED_SWORDS = 202
local STAVES = 227
local BOWS = 264
local GUNS = 266
local DAGGERS = 1180
local THROWN = 2567
local CROSSBOWS = 5011
local FIST_WEAPONS = 15590

wt.WeaponSkills = {
    [ONE_HANDED_AXES] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "SHAMAN"},
        trainers = {
            Alliance = {
                BULIWYF_STONEHAND
            },
            Horde = {
                HANASHI,
                SAYOC
            }
        }
    },
    [TWO_HANDED_AXES] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "SHAMAN"},
        trainers = {
            Alliance = {
                BULIWYF_STONEHAND
            },
            Horde = {
                HANASHI,
                SAYOC
            }
        }
    },
    [ONE_HANDED_MACES] = {
        classes = {"WARRIOR", "PALADIN", "ROGUE", "PRIEST", "SHAMAN", "DRUID"},
        trainers = {
            Alliance = {
                BULIWYF_STONEHAND
            },
            Horde = {
                ANSEKHWA
            }
        }
    },
    [TWO_HANDED_MACES] = {
        classes = {"WARRIOR", "PALADIN", "SHAMAN", "DRUID"},
        trainers = {
            Alliance = {
                BULIWYF_STONEHAND
            },
            Horde = {
                ANSEKHWA
            }
        }
    },
    [POLEARMS] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "DRUID"},
        level = 20,
        cost = 10000,
        trainers = {
            Alliance = {
                WOO_PING
            },
            Horde = {
                ARCHIBALD
            }
        }
    },
    [ONE_HANDED_SWORDS] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK"},
        trainers = {
            Alliance = {
                WOO_PING
            },
            Horde = {
                ARCHIBALD
            }
        }
    },
    [TWO_HANDED_SWORDS] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER"},
        trainers = {
            Alliance = {
                WOO_PING
            },
            Horde = {
                ARCHIBALD
            }
        }
    },
    [STAVES] = {
        classes = {"WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "DRUID", "WARLOCK", "MAGE"},
        trainers = {
            Alliance = {
                ILYENIA_MOONFIRE,
                WOO_PING
            },
            Horde = {
                HANASHI,
                SAYOC,
                ANSEKHWA
            }
        }
    },
    [BOWS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                ILYENIA_MOONFIRE
            },
            Horde = {
                HANASHI,
                SAYOC
            }
        }
    },
    [GUNS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                BULIWYF_STONEHAND
            },
            Horde = {
                ANSEKHWA
            }
        }
    },
    [DAGGERS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "DRUID", "WARLOCK", "MAGE"},
        trainers = {
            Alliance = {
                ILYENIA_MOONFIRE,
                BIXI_WOBBLEBONK,
                WOO_PING
            },
            Horde = {
                SAYOC,
                ARCHIBALD
            }
        }
    },
    [THROWN] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                ILYENIA_MOONFIRE,
                BIXI_WOBBLEBONK
            },
            Horde = {
                HANASHI,
                SAYOC
            }
        }
    },
    [CROSSBOWS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
        trainers = {
            Alliance = {
                BIXI_WOBBLEBONK,
                WOO_PING
            },
            Horde = {
                ARCHIBALD
            }
        }
    },
    [FIST_WEAPONS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE", "SHAMAN", "DRUID"},
        trainers = {
            Alliance = {
                ILYENIA_MOONFIRE,
                BULIWYF_STONEHAND
            },
            Horde = {
                SAYOC
            }
        }
    },
}
wt.WeaponSkillDisplayOrder = {
    ONE_HANDED_AXES,
    TWO_HANDED_AXES,
    ONE_HANDED_MACES,
    TWO_HANDED_MACES,
    ONE_HANDED_SWORDS,
    TWO_HANDED_SWORDS,
    DAGGERS,
    FIST_WEAPONS,
    STAVES,
    POLEARMS,
    BOWS,
    GUNS,
    CROSSBOWS,
    THROWN
}

for index, id in ipairs(wt.WeaponSkillDisplayOrder) do
    if wt.WeaponSkills[id] then
        wt.WeaponSkills[id].orderIndex = index
    end
end

for id, weaponData in pairs(wt.WeaponSkills) do
    if weaponData.trainers then
        for faction, trainers in pairs(weaponData.trainers) do
            local trainerZones = {}
            local seenZones = {}
            for _, trainer in ipairs(trainers) do
                if not seenZones[trainer.zone] then
                    tinsert(trainerZones, {
                        id = trainer.zone,
                        icon = wt.cityIconIds[trainer.zone] or trainer.zoneIcon,
                        name = C_Map.GetAreaInfo(trainer.zone)
                    })
                    seenZones[trainer.zone] = true
                end
            end
            table.sort(trainerZones, function(a, b)
                return (a.name or "") < (b.name or "")
            end)
            
            local zoneNames = {}
            for _, zoneData in ipairs(trainerZones) do
                if zoneData.name then tinsert(zoneNames, zoneData.name) end
            end
            
            weaponData[faction .. "TrainerZones"] = trainerZones
            if #zoneNames > 0 then
                weaponData[faction .. "FormattedTrainerZones"] = table.concat(zoneNames, wt.L.OR)
            end
        end
    end
end
