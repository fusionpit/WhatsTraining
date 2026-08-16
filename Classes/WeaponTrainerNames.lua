local _, wt = ...

local locale = GetLocale()
if locale == "enGB" then locale = "enUS" end
if locale == "enUS" then return end

local HANASHI = 2704
local BULIWYF_STONEHAND = 11865
local ILYENIA_MOONFIRE = 11866
local WOO_PING = 11867
local SAYOC = 11868
local ANSEKHWA = 11869
local ARCHIBALD = 11870
local BIXI_WOBBLEBONK = 13084
local ILEDA = 16621
local HANDIIR = 16773
local DUELIST_LARENIS = 17005

-- Only names that differ from English are listed.
local names = {
    deDE = {
        [DUELIST_LARENIS] = "Duellant Larenis",
    },
    esES = {
        [BULIWYF_STONEHAND] = "Buliwyf Petramano",
        [ILYENIA_MOONFIRE] = "Ilyenia Fuegolunar",
        [BIXI_WOBBLEBONK] = "Bixi Tambaleapié",
        [DUELIST_LARENIS] = "Duelista Larenis",
    },
    frFR = {
        [DUELIST_LARENIS] = "Duelliste Larenis",
    },
    koKR = {
        [HANASHI] = "하나시",
        [BULIWYF_STONEHAND] = "불리위프 스톤헤드",
        [ILYENIA_MOONFIRE] = "일예니아 문파이어",
        [WOO_PING] = "우 핑",
        [SAYOC] = "사요크",
        [ANSEKHWA] = "안세크화",
        [ARCHIBALD] = "아키발드",
        [BIXI_WOBBLEBONK] = "빅시 와블봉크",
        [ILEDA] = "일레다",
        [HANDIIR] = "한디르",
        [DUELIST_LARENIS] = "결투사 라레니스",
    },
    ptBR = {
        [BULIWYF_STONEHAND] = "Bulif Manopedra",
        [ILYENIA_MOONFIRE] = "Ilyenia Flameluna",
        [ARCHIBALD] = "Arquibaldo",
        [BIXI_WOBBLEBONK] = "Bixi Bateagita",
        [DUELIST_LARENIS] = "Duelista Larenis",
    },
    ruRU = {
        [HANASHI] = "Ханаши",
        [BULIWYF_STONEHAND] = "Бульвайф Крепкорук",
        [ILYENIA_MOONFIRE] = "Илиения Лунное Пламя",
        [WOO_PING] = "Ву Пинг",
        [SAYOC] = "Сайок",
        [ANSEKHWA] = "Ансеква",
        [ARCHIBALD] = "Арчибальд",
        [BIXI_WOBBLEBONK] = "Бикси Пошатушка",
        [ILEDA] = "Иледа",
        [HANDIIR] = "Хандиир",
        [DUELIST_LARENIS] = "Дуэлянт Ларенис",
    },
    zhCN = {
        [HANASHI] = "哈纳什",
        [BULIWYF_STONEHAND] = "布里维夫·石手",
        [ILYENIA_MOONFIRE] = "伊琳尼雅·月火",
        [WOO_PING] = "吴平",
        [SAYOC] = "塞尤克",
        [ANSEKHWA] = "安塞瓦",
        [ARCHIBALD] = "阿基巴德",
        [BIXI_WOBBLEBONK] = "比克斯",
        [ILEDA] = "伊蕾达",
        [HANDIIR] = "韩迪尔",
        [DUELIST_LARENIS] = "斗技者拉雷尼斯",
    },
    zhTW = {
        [HANASHI] = "哈納什",
        [BULIWYF_STONEHAND] = "布里維夫·石拳",
        [ILYENIA_MOONFIRE] = "伊琳尼雅·月火",
        [WOO_PING] = "吳平",
        [SAYOC] = "塞尤克",
        [ANSEKHWA] = "安塞瓦",
        [ARCHIBALD] = "阿基巴德",
        [BIXI_WOBBLEBONK] = "比克斯",
        [ILEDA] = "伊利達",
        [HANDIIR] = "哈戴爾",
        [DUELIST_LARENIS] = "決鬥家·拉瑞尼斯",
    },
}

-- No esMX source data exists; Wowhead serves identical strings for /es/ and /mx/.
names.esMX = names.esES

-- Blizzard re-translated these three proper nouns starting with TBC.
local tbcNames = {
    deDE = {
        [BULIWYF_STONEHAND] = "Buliwyf Steinhand",
        [ILYENIA_MOONFIRE] = "Ilyenia Mondfeuer",
        [BIXI_WOBBLEBONK] = "Bixi Wobbelbonk",
    },
    frFR = {
        [BULIWYF_STONEHAND] = "Buliwyf Main-de-pierre",
        [ILYENIA_MOONFIRE] = "Ilyenia Lunéclat",
        [BIXI_WOBBLEBONK] = "Bixi Oscillognon",
    },
}

local localized = names[locale]
if localized == nil then return end

if WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and tbcNames[locale] then
    for id, name in pairs(tbcNames[locale]) do
        localized[id] = name
    end
end

wt.weaponTrainerNames = localized
