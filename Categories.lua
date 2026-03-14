local _, wt = ...

wt.AVAILABLE_KEY = "available"
wt.MISSINGREQS_KEY = "missingReqs"
wt.NEXTLEVEL_KEY = "nextLevel"
wt.NOTLEVEL_KEY = "notLevel"
wt.MISSINGTALENT_KEY = "missingTalent"
wt.IGNORED_KEY = "ignored"
wt.IGNORED_PET_KEY = "ignoredPet"
wt.KNOWN_KEY = "known"
wt.KNOWN_PET_KEY = "knownPet"
wt.PET_KEY = "pet"
wt.WEAPON_AVAILABLE_KEY = "weaponAvailable"
wt.WEAPON_NEXTLEVEL_KEY = "weaponNextLevel"
wt.WEAPON_NOTLEVEL_KEY = "weaponNotLevel"
wt.WEAPON_KNOWN_KEY = "weaponKnown"
wt.WEAPON_IGNORED_KEY = "weaponIgnored"

local COMINGSOON_FONT_COLOR_CODE = "|cff82c5ff"
local MISSINGTALENT_FONT_COLOR_CODE = "|cffffffff"
local PET_FONT_COLOR_CODE = "|cffffffff"

wt.headers = {
    {
        name = wt.L.AVAILABLE_HEADER,
        color = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = wt.AVAILABLE_KEY,
        brokerMaxDisplayEntries = 10
    }, {
        name = wt.L.MISSINGREQS_HEADER,
        color = ORANGE_FONT_COLOR_CODE,
        hideLevel = true,
        key = wt.MISSINGREQS_KEY,
        brokerMaxDisplayEntries = 5
    }, {
        name = wt.L.WEAPON_AVAILABLE_HEADER,
        color = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = wt.WEAPON_AVAILABLE_KEY,
        brokerMaxDisplayEntries = 10,
        weaponSort = true
    }, {
        name = wt.L.NEXTLEVEL_HEADER,
        color = COMINGSOON_FONT_COLOR_CODE,
        key = wt.NEXTLEVEL_KEY,
        brokerMaxDisplayEntries = 10
    }, {
        name = wt.L.WEAPON_NEXTLEVEL_HEADER,
        color = COMINGSOON_FONT_COLOR_CODE,
        key = wt.WEAPON_NEXTLEVEL_KEY,
        brokerMaxDisplayEntries = 10,
        weaponSort = true
    }, {
        name = wt.L.NOTLEVEL_HEADER,
        color = RED_FONT_COLOR_CODE,
        key = wt.NOTLEVEL_KEY,
        brokerMaxDisplayEntries = 5
    }, {
        name = wt.L.WEAPON_NOTLEVEL_HEADER,
        color = RED_FONT_COLOR_CODE,
        key = wt.WEAPON_NOTLEVEL_KEY,
        brokerMaxDisplayEntries = 5,
        weaponSort = true
    }, {
        name = wt.L.PET_HEADER,
        color = PET_FONT_COLOR_CODE,
        key = wt.PET_KEY,
        brokerMaxDisplayEntries = 5
        -- nameSort = true
    }, {
        name = wt.L.MISSINGTALENT_HEADER,
        color = MISSINGTALENT_FONT_COLOR_CODE,
        key = wt.MISSINGTALENT_KEY,
        nameSort = true
    }, {
        name = wt.L.IGNORED_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        costColor = GREEN_FONT_COLOR_CODE,
        key = wt.IGNORED_KEY,
        nameSort = true
    }, {
        name = wt.L.WEAPON_IGNORED_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        costColor = GREEN_FONT_COLOR_CODE,
        hideLevel = true,
        key = wt.WEAPON_IGNORED_KEY,
        weaponSort = true
    }, {
        name = wt.L.IGNORED_PET_HEADER,
        color = LIGHTYELLOW_FONT_COLOR_CODE,
        costFormat = wt.L.TOTALSAVINGS_FORMAT,
        costColor = GREEN_FONT_COLOR_CODE,
        key = wt.IGNORED_PET_KEY,
        nameSort = true
    }, {
        name = wt.L.KNOWN_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = wt.KNOWN_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        nameSort = true
    }, {
        name = wt.L.WEAPON_KNOWN_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = wt.WEAPON_KNOWN_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        weaponSort = true
    },{
        name = wt.L.KNOWN_PET_HEADER,
        color = GRAY_FONT_COLOR_CODE,
        hideLevel = true,
        key = wt.KNOWN_PET_KEY,
        costFormat = wt.L.TOTALSPENT_FORMAT,
        costColor = RED_FONT_COLOR_CODE,
        nameSort = true
    }, 
}

wt.weaponCategoryKeys = {
    [wt.WEAPON_AVAILABLE_KEY] = true,
    [wt.WEAPON_NEXTLEVEL_KEY] = true,
    [wt.WEAPON_NOTLEVEL_KEY] = true,
    [wt.WEAPON_KNOWN_KEY] = true,
    [wt.WEAPON_IGNORED_KEY] = true
}

function wt.makeCategories(headersDef, isBroker) 
    return {
        _spellsByCategoryKey = {},
        Insert = function(self, key, spellInfo)
            if self._spellsByCategoryKey[key] ~= nil then tinsert(self._spellsByCategoryKey[key], spellInfo) end
        end,
        Initialize = function(self)
            for _, def in ipairs(headersDef) do
                if not isBroker or def.brokerMaxDisplayEntries then
                    local cat = {}
                    for k, v in pairs(def) do cat[k] = v end
                    if isBroker then
                        cat.maxDisplayEntries = def.brokerMaxDisplayEntries
                    end
                    cat.spells = {}
                    self._spellsByCategoryKey[cat.key] = cat.spells
                    cat.formattedName = cat.color and cat.color .. cat.name .. FONT_COLOR_CODE_CLOSE or cat.name
                    cat.isHeader = true
                    tinsert(self, cat)
                end
            end
        end,
        ClearSpells = function(self)
            for _, cat in ipairs(self) do
                cat.cost = 0
                wipe(cat.spells)
            end
        end
    }
end

wt.categories = wt.makeCategories(wt.headers, false)
wt.categories:Initialize()

wt.brokerCategories = wt.makeCategories(wt.headers, true)
wt.brokerCategories:Initialize()
