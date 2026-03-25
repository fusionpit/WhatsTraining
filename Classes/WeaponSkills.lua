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
local function npcLocation(id, faction, zone, x, y) 
    return { npc = id, faction = faction, zone = zone, zoneIcon = wt.cityIconIds[zone], x = x, y = y }
end

local BULIWYF_STONEHAND = npcLocation(11865, "Alliance", IRONFORGE, 61.2, 89.5)
local BIXI_WOBBLEBONK = npcLocation(11866, "Alliance", IRONFORGE, 62.2, 89.6)
local WOO_PING = npcLocation(11869, "Alliance", STORMWIND, 57.1, 57.7)
local ILYENIA_MOONFIRE = npcLocation(11867, "Alliance", DARNASSUS, 57.7, 46.0)
local HANASHI = npcLocation(2704, "Horde", ORGRIMMAR, 81.5, 19.6)
local SAYOC = npcLocation(11868, "Horde", ORGRIMMAR, 81.7, 19.6)
local ANSEKHWA = npcLocation(11870, "Horde", THUNDER_BLUFF, 40.0, 63.1)
local ARCHIBALD = npcLocation(11871, "Horde", UNDERCITY, 57.3, 32.8)

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
    },
    [TWO_HANDED_AXES] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "SHAMAN"},
    },
    [ONE_HANDED_MACES] = {
        classes = {"WARRIOR", "PALADIN", "ROGUE", "PRIEST", "SHAMAN", "DRUID"},
    },
    [TWO_HANDED_MACES] = {
        classes = {"WARRIOR", "PALADIN", "SHAMAN", "DRUID"},
    },
    [POLEARMS] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "DRUID"},
        level = 20,
        cost = 10000,
    },
    [ONE_HANDED_SWORDS] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER", "ROGUE", "MAGE", "WARLOCK"},
    },
    [TWO_HANDED_SWORDS] = {
        classes = {"WARRIOR", "PALADIN", "HUNTER"},
    },
    [STAVES] = {
        classes = {"WARRIOR", "HUNTER", "PRIEST", "SHAMAN", "DRUID", "WARLOCK", "MAGE"},
    },
    [BOWS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
    },
    [GUNS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
    },
    [DAGGERS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "DRUID", "WARLOCK", "MAGE"},
    },
    [THROWN] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
    },
    [CROSSBOWS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE"},
    },
    [FIST_WEAPONS] = {
        classes = {"WARRIOR", "HUNTER", "ROGUE", "SHAMAN", "DRUID"},
    },
}

local function AddTrainer(trainer, ...)
    for _, weaponId in ipairs({...}) do
        local weaponData = wt.WeaponSkills[weaponId]
        if weaponData then
            if not weaponData.trainers then
                weaponData.trainers = { Alliance = {}, Horde = {} }
            end
            tinsert(weaponData.trainers[trainer.faction], trainer)
        end
    end
end

AddTrainer(BULIWYF_STONEHAND, ONE_HANDED_AXES, TWO_HANDED_AXES, ONE_HANDED_MACES, TWO_HANDED_MACES, GUNS, FIST_WEAPONS)
AddTrainer(BIXI_WOBBLEBONK, DAGGERS, THROWN, CROSSBOWS)
AddTrainer(WOO_PING, POLEARMS, ONE_HANDED_SWORDS, TWO_HANDED_SWORDS, STAVES, DAGGERS, CROSSBOWS)
AddTrainer(ILYENIA_MOONFIRE, STAVES, BOWS, DAGGERS, THROWN, FIST_WEAPONS)

AddTrainer(HANASHI, ONE_HANDED_AXES, TWO_HANDED_AXES, STAVES, BOWS, THROWN)
AddTrainer(SAYOC, ONE_HANDED_AXES, TWO_HANDED_AXES, STAVES, BOWS, DAGGERS, THROWN, FIST_WEAPONS)
AddTrainer(ANSEKHWA, ONE_HANDED_MACES, TWO_HANDED_MACES, STAVES, GUNS)
AddTrainer(ARCHIBALD, POLEARMS, ONE_HANDED_SWORDS, TWO_HANDED_SWORDS, DAGGERS, CROSSBOWS)

wt.NumCityIcons = 3

if WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
    wt.NumCityIcons = 4
    local EXODAR = 3557
    local SILVERMOON = 3487

    wt.cityIconIds[EXODAR] = 135756
    wt.cityIconIds[SILVERMOON] = 135761
    
    local HANDIIR = npcLocation(16773, "Alliance", EXODAR, 54.6, 85.9)
    local ILEDA = npcLocation(16621, "Horde", SILVERMOON, 91.0, 38.6)

    AddTrainer(HANDIIR, CROSSBOWS, DAGGERS, ONE_HANDED_MACES, TWO_HANDED_MACES, ONE_HANDED_SWORDS, TWO_HANDED_SWORDS)
    AddTrainer(ILEDA, BOWS, DAGGERS, ONE_HANDED_SWORDS, TWO_HANDED_SWORDS, POLEARMS, THROWN)
    -- There is also a trainer in Eversong Woods, but there's no icon for the zone
end

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

function wt.buildWeaponTrainerZones()
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
end
