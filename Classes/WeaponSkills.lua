local _, wt = ...

local IRONFORGE = 1537
local STORMWIND = 1519
local DARNASSUS = 1657
local ORGRIMMAR = 1637
local THUNDER_BLUFF = 1638
local UNDERCITY = 1497
local EXODAR = 3557
local SILVERMOON = 3487
local EVERSONG_WOODS = 3430

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

local zones = {
    [IRONFORGE] = { uiMapId = 1455, iconId = 135757 },
    [STORMWIND] = { uiMapId = 1453, iconId = 135763 },
    [DARNASSUS] = { uiMapId = 1457, iconId = 135755 },
    [ORGRIMMAR] = { uiMapId = 1454, iconId = 135759 },
    [THUNDER_BLUFF] = { uiMapId = 1456, iconId = 135765 },
    [UNDERCITY] = { uiMapId = 1458, iconId = 135766 },
    [EXODAR] = { uiMapId = 1947, iconId = 135756 },
    [SILVERMOON] = { uiMapId = 1954, iconId = 135761 },
    [EVERSONG_WOODS] = { uiMapId = 1941 },
}

local weaponSkills = {
    [ONE_HANDED_AXES] = {
        classes = {
            WARRIOR = true, PALADIN = true, HUNTER = true, SHAMAN = true,
        },
    },
    [TWO_HANDED_AXES] = {
        classes = {
            WARRIOR = true, PALADIN = true, HUNTER = true, SHAMAN = true,
        },
    },
    [ONE_HANDED_MACES] = {
        classes = {
            WARRIOR = true, PALADIN = true, ROGUE = true, PRIEST = true,
            SHAMAN = true, DRUID = true,
        },
    },
    [TWO_HANDED_MACES] = {
        classes = {
            WARRIOR = true, PALADIN = true, SHAMAN = true, DRUID = true,
        },
    },
    [POLEARMS] = {
        classes = {
            WARRIOR = true, PALADIN = true, HUNTER = true, DRUID = true,
        },
        requiredLevel = 20,
        costCopper = 10000,
    },
    [ONE_HANDED_SWORDS] = {
        classes = {
            WARRIOR = true, PALADIN = true, HUNTER = true, ROGUE = true,
            MAGE = true, WARLOCK = true,
        },
    },
    [TWO_HANDED_SWORDS] = {
        classes = {
            WARRIOR = true, PALADIN = true, HUNTER = true,
        },
    },
    [STAVES] = {
        classes = {
            WARRIOR = true, HUNTER = true, PRIEST = true, SHAMAN = true,
            DRUID = true, WARLOCK = true, MAGE = true,
        },
    },
    [BOWS] = {
        classes = {
            WARRIOR = true, HUNTER = true, ROGUE = true,
        },
    },
    [GUNS] = {
        classes = {
            WARRIOR = true, HUNTER = true, ROGUE = true,
        },
    },
    [DAGGERS] = {
        classes = {
            WARRIOR = true, HUNTER = true, ROGUE = true, PRIEST = true,
            SHAMAN = true, DRUID = true, WARLOCK = true, MAGE = true,
        },
    },
    [THROWN] = {
        classes = {
            WARRIOR = true, HUNTER = true, ROGUE = true,
        },
    },
    [CROSSBOWS] = {
        classes = {
            WARRIOR = true, HUNTER = true, ROGUE = true,
        },
    },
    [FIST_WEAPONS] = {
        classes = {
            WARRIOR = true, HUNTER = true, ROGUE = true, SHAMAN = true,
            DRUID = true,
        },
    },
}

local weaponMasters = {
    [11865] = {
        versions = { era = true, tbc = true },
        faction = "Alliance",
        location = { zoneId = IRONFORGE, x = 61.2, y = 89.5 },
        teaches = {
            [ONE_HANDED_AXES] = true,
            [TWO_HANDED_AXES] = true,
            [ONE_HANDED_MACES] = true,
            [TWO_HANDED_MACES] = true,
            [GUNS] = true,
            [FIST_WEAPONS] = true,
        },
        names = {
            enUS = "Buliwyf Stonehand",
            esES = "Buliwyf Petramano",
            koKR = "불리위프 스톤헤드",
            ptBR = "Bulif Manopedra",
            ruRU = "Бульвайф Крепкорук",
            zhCN = "布里维夫·石手",
            zhTW = "布里維夫·石拳",
        },
        nameOverrides = {
            tbc = {
                deDE = "Buliwyf Steinhand",
                frFR = "Buliwyf Main-de-pierre",
            },
        },
    },
    [13084] = {
        versions = { era = true, tbc = true },
        faction = "Alliance",
        location = { zoneId = IRONFORGE, x = 62.2, y = 89.6 },
        teaches = {
            [DAGGERS] = true,
            [THROWN] = true,
            [CROSSBOWS] = true,
        },
        names = {
            enUS = "Bixi Wobblebonk",
            esES = "Bixi Tambaleapié",
            koKR = "빅시 와블봉크",
            ptBR = "Bixi Bateagita",
            ruRU = "Бикси Пошатушка",
            zhCN = "比克斯",
            zhTW = "比克斯",
        },
        nameOverrides = {
            tbc = {
                deDE = "Bixi Wobbelbonk",
                frFR = "Bixi Oscillognon",
            },
        },
    },
    [11867] = {
        versions = { era = true, tbc = true },
        faction = "Alliance",
        location = { zoneId = STORMWIND, x = 57.1, y = 57.7 },
        teaches = {
            [POLEARMS] = true,
            [ONE_HANDED_SWORDS] = true,
            [TWO_HANDED_SWORDS] = true,
            [STAVES] = true,
            [DAGGERS] = true,
            [CROSSBOWS] = true,
        },
        names = {
            enUS = "Woo Ping",
            koKR = "우 핑",
            ruRU = "Ву Пинг",
            zhCN = "吴平",
            zhTW = "吳平",
        },
    },
    [11866] = {
        versions = { era = true, tbc = true },
        faction = "Alliance",
        location = { zoneId = DARNASSUS, x = 57.7, y = 46.0 },
        teaches = {
            [STAVES] = true,
            [BOWS] = true,
            [DAGGERS] = true,
            [THROWN] = true,
            [FIST_WEAPONS] = true,
        },
        names = {
            enUS = "Ilyenia Moonfire",
            esES = "Ilyenia Fuegolunar",
            koKR = "일예니아 문파이어",
            ptBR = "Ilyenia Flameluna",
            ruRU = "Илиения Лунное Пламя",
            zhCN = "伊琳尼雅·月火",
            zhTW = "伊琳尼雅·月火",
        },
        nameOverrides = {
            tbc = {
                deDE = "Ilyenia Mondfeuer",
                frFR = "Ilyenia Lunéclat",
            },
        },
    },
    [2704] = {
        versions = { era = true, tbc = true },
        faction = "Horde",
        location = { zoneId = ORGRIMMAR, x = 81.5, y = 19.6 },
        teaches = {
            [ONE_HANDED_AXES] = true,
            [TWO_HANDED_AXES] = true,
            [STAVES] = true,
            [BOWS] = true,
            [THROWN] = true,
        },
        names = {
            enUS = "Hanashi",
            koKR = "하나시",
            ruRU = "Ханаши",
            zhCN = "哈纳什",
            zhTW = "哈納什",
        },
    },
    [11868] = {
        versions = { era = true, tbc = true },
        faction = "Horde",
        location = { zoneId = ORGRIMMAR, x = 81.7, y = 19.6 },
        teaches = {
            [ONE_HANDED_AXES] = true,
            [TWO_HANDED_AXES] = true,
            [STAVES] = true,
            [BOWS] = true,
            [DAGGERS] = true,
            [THROWN] = true,
            [FIST_WEAPONS] = true,
        },
        names = {
            enUS = "Sayoc",
            koKR = "사요크",
            ruRU = "Сайок",
            zhCN = "塞尤克",
            zhTW = "塞尤克",
        },
    },
    [11869] = {
        versions = { era = true, tbc = true },
        faction = "Horde",
        location = { zoneId = THUNDER_BLUFF, x = 40.0, y = 63.1 },
        teaches = {
            [ONE_HANDED_MACES] = true,
            [TWO_HANDED_MACES] = true,
            [STAVES] = true,
            [GUNS] = true,
        },
        names = {
            enUS = "Ansekhwa",
            koKR = "안세크화",
            ruRU = "Ансеква",
            zhCN = "安塞瓦",
            zhTW = "安塞瓦",
        },
    },
    [11870] = {
        versions = { era = true, tbc = true },
        faction = "Horde",
        location = { zoneId = UNDERCITY, x = 57.3, y = 32.8 },
        teaches = {
            [POLEARMS] = true,
            [ONE_HANDED_SWORDS] = true,
            [TWO_HANDED_SWORDS] = true,
            [DAGGERS] = true,
            [CROSSBOWS] = true,
        },
        names = {
            enUS = "Archibald",
            koKR = "아키발드",
            ptBR = "Arquibaldo",
            ruRU = "Арчибальд",
            zhCN = "阿基巴德",
            zhTW = "阿基巴德",
        },
    },
    [16773] = {
        versions = { tbc = true },
        faction = "Alliance",
        location = { zoneId = EXODAR, x = 54.6, y = 85.9 },
        teaches = {
            [CROSSBOWS] = true,
            [DAGGERS] = true,
            [ONE_HANDED_MACES] = true,
            [TWO_HANDED_MACES] = true,
            [ONE_HANDED_SWORDS] = true,
            [TWO_HANDED_SWORDS] = true,
        },
        names = {
            enUS = "Handiir",
            koKR = "한디르",
            ruRU = "Хандиир",
            zhCN = "韩迪尔",
            zhTW = "哈戴爾",
        },
    },
    [16621] = {
        versions = { tbc = true },
        faction = "Horde",
        location = { zoneId = SILVERMOON, x = 91.0, y = 38.6 },
        teaches = {
            [BOWS] = true,
            [DAGGERS] = true,
            [ONE_HANDED_SWORDS] = true,
            [TWO_HANDED_SWORDS] = true,
            [POLEARMS] = true,
            [THROWN] = true,
        },
        names = {
            enUS = "Ileda",
            koKR = "일레다",
            ruRU = "Иледа",
            zhCN = "伊蕾达",
            zhTW = "伊利達",
        },
    },
    [17005] = {
        versions = { tbc = true },
        faction = "Horde",
        location = { zoneId = EVERSONG_WOODS, x = 48.4, y = 46.0 },
        teaches = {
            [BOWS] = true,
            [ONE_HANDED_SWORDS] = true,
            [TWO_HANDED_SWORDS] = true,
            [POLEARMS] = true,
            [THROWN] = true,
        },
        names = {
            enUS = "Duelist Larenis",
            deDE = "Duellant Larenis",
            esES = "Duelista Larenis",
            frFR = "Duelliste Larenis",
            koKR = "결투사 라레니스",
            ptBR = "Duelista Larenis",
            ruRU = "Дуэлянт Ларенис",
            zhCN = "斗技者拉雷尼斯",
            zhTW = "決鬥家·拉瑞尼斯",
        },
    },
}

local localeAliases = {
    enGB = "enUS",
    esMX = "esES",
}

local presentation = {
    skillOrder = {
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
    },
    groupedOnlyMasters = {
        [17005] = true,
    },
    numCityIcons = { era = 3, tbc = 4 },
}

local version = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and "tbc" or "era"
local locale = GetLocale()
locale = localeAliases[locale] or locale

wt.WeaponSkills = {}
wt.WeaponSkillDisplayOrder = presentation.skillOrder
wt.NumCityIcons = presentation.numCityIcons[version]
wt.cityIconIds = {}
wt.zoneUiMapIds = {}

for index, id in ipairs(presentation.skillOrder) do
    local skill = weaponSkills[id]
    wt.WeaponSkills[id] = {
        classes = skill.classes,
        level = skill.requiredLevel,
        cost = skill.costCopper,
        orderIndex = index,
        trainers = { Alliance = {}, Horde = {} },
    }
end

for npcId, master in pairs(weaponMasters) do
    if master.versions[version] then
        local location = master.location
        local zone = zones[location.zoneId]
        wt.cityIconIds[location.zoneId] = zone.iconId
        wt.zoneUiMapIds[location.zoneId] = zone.uiMapId
        local nameOverrides = master.nameOverrides and master.nameOverrides[version]
        local trainer = {
            npc = npcId,
            name = nameOverrides and nameOverrides[locale] or master.names[locale] or master.names.enUS,
            faction = master.faction,
            zone = location.zoneId,
            zoneIcon = zone.iconId,
            x = location.x,
            y = location.y,
            groupedOnly = presentation.groupedOnlyMasters[npcId],
        }
        for skillId in pairs(master.teaches) do
            tinsert(wt.WeaponSkills[skillId].trainers[master.faction], trainer)
        end
    end
end

function wt.buildWeaponTrainerZones()
    for _, weaponData in pairs(wt.WeaponSkills) do
        if weaponData.trainers then
            for faction, trainers in pairs(weaponData.trainers) do
                local trainerZones = {}
                local seenZones = {}
                for _, trainer in ipairs(trainers) do
                    if not trainer.groupedOnly and not seenZones[trainer.zone] then
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

                -- Grouped tooltips also list trainers whose zones have no list-mode icon.
                for _, trainer in ipairs(trainers) do
                    if trainer.groupedOnly and not seenZones[trainer.zone] then
                        local name = C_Map.GetAreaInfo(trainer.zone)
                        if name then tinsert(zoneNames, name) end
                        seenZones[trainer.zone] = true
                    end
                end
                if #zoneNames > 0 then
                    weaponData[faction .. "GroupedFormattedTrainerZones"] = table.concat(zoneNames, wt.L.OR)
                end
            end
        end
    end
end
