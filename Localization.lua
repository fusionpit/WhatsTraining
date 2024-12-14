local _, wt = ...

local localeText = {
    enUS = {
        AVAILABLE_HEADER = "Available Now",
        MISSINGREQS_HEADER = "Available but Missing Requirements",
        NEXTLEVEL_HEADER = "Coming Soon",
        NOTLEVEL_HEADER = "Not Yet Available",
        MISSINGTALENT_HEADER = "Missing Required Talents",
        IGNORED_HEADER = "Ignored",
        KNOWN_HEADER = "Already Known",
        KNOWN_PET_HEADER = "Already Known (Pet)",
        PET_HEADER = "Pet Abilities",
        COST_FORMAT = "Cost: %s",
        TOTALCOST_FORMAT = "Total Cost: %s",
        TOTALSAVINGS_FORMAT = "Total Savings: %s",
        BROKER_HEADER_HIDDEN_FORMAT = "%s shown (%s total)",
        BROKER_HIDDEN_FORMAT = "And another %d that cost %s",
        BROKER_NOTHING = "Nothing left to learn!",
        BROKER_CLICK_BEAST_TRAIN = "Hint: Shift-Click to open the Beast Training UI",
        BROKER_CLICK_OPEN = "Hint: Click to open spellbook.",
        BROKER_OPEN_IN_COMBAT = "Can't open spellbook while in combat",
        OPEN_BEAST_IN_COMBAT = "Can't open Beast Training while in combat",
        LEVEL_FORMAT = "Level %s",
        TAB_TEXT = "What can I train?",
        OPEN_BEAST_TRAINING = "Please open the Beast Training UI",
        CLICK_TO_OPEN = "Click to open Beast Training",
        TOME_HEADER = "Has this been learned?",
        TOME_LEARNED = "Grimoire learned",
        RIGHT_CLICK_LEARNED = "Right-click to mark abilities as learned",
        NEW_IGNORE_FEATURE = "Right-click to ignore abilities",
        CLICK_TO_DISMISS = "Click header to dismiss",
        IGNORED_TT = "Ignored",
        IGNORE_ALL_TT = "Ignore all ranks",
        SEARCH_NO_RESULTS = "No results found",
        INCUBUS = "Incubus",
        NOT_KNOWN = "Not known"
    },
    frFR = {
        AVAILABLE_HEADER = "Disponible",
        MISSINGREQS_HEADER = "Disponible mais pré-requis manquants",
        NEXTLEVEL_HEADER = "Bientôt disponible",
        NOTLEVEL_HEADER = "Pas encore disponible",
        MISSINGTALENT_HEADER = "Talents requis manquants",
        IGNORED_HEADER = "Ignoré",
        KNOWN_HEADER = "Déjà connu",
        PET_HEADER = "Techniques de familier",
        COST_FORMAT = "Coût : %s",
        TOTALCOST_FORMAT = "Coût total : %s",
        TOTALSAVINGS_FORMAT = "Coût économisé : %s",
        LEVEL_FORMAT = "Niveau %s",
        TAB_TEXT = "Que puis-je apprendre ?"
    },
    ruRU = {
        AVAILABLE_HEADER = "Доступен сейчас",
        MISSINGREQS_HEADER = "Доступно, но отсутствуют требования",
        NEXTLEVEL_HEADER = "Скоро будет",
        NOTLEVEL_HEADER = "Пока недоступно",
        MISSINGTALENT_HEADER = "Отсутствующие необходимые таланты",
        IGNORED_HEADER = "Игнорируется",
        KNOWN_HEADER = "Уже известно",
        PET_HEADER = "Способности питомца",
        COST_FORMAT = "Стоимость: %s",
        TOTALCOST_FORMAT = "Общая стоимость: %s",
        TOTALSAVINGS_FORMAT = "Все сбережения: %s",
        LEVEL_FORMAT = "Уровень %s",
        TAB_TEXT = "Что я могу изучить?"
    },
    zhCN = {
        AVAILABLE_HEADER = "可学",
        MISSINGREQS_HEADER = "满足条件方可学习",
        NEXTLEVEL_HEADER = "即将学习",
        NOTLEVEL_HEADER = "等级不够",
        MISSINGTALENT_HEADER = "缺少相关天赋",
        IGNORED_HEADER = "已忽略技能",
        KNOWN_HEADER = "已学技能",
        PET_HEADER = "宠物技能",
        COST_FORMAT = "花费: %s",
        TOTALCOST_FORMAT = "总花费: %s",
        TOTALSAVINGS_FORMAT = "总共节省: %s",
        LEVEL_FORMAT = "等级 %s",
        TAB_TEXT = "我能学什么技能?"
    },
    zhTW = {
        AVAILABLE_HEADER = "現在可以訓練",
        MISSINGREQS_HEADER = "可以訓練但是缺少需求條件",
        NEXTLEVEL_HEADER = "即將可以訓練",
        NOTLEVEL_HEADER = "還不可以訓練",
        MISSINGTALENT_HEADER = "缺少需要的天賦",
        IGNORED_HEADER = "已忽略",
        KNOWN_HEADER = "已學會",
        PET_HEADER = "寵物技能",
        COST_FORMAT = "花費: %s",
        TOTALCOST_FORMAT = "總需花費: %s",
        TOTALSAVINGS_FORMAT = "總共省下: %s",
        LEVEL_FORMAT = "等級 %s",
        TAB_TEXT = "我可以接受什麼訓練?"
    },
    deDE = {
        AVAILABLE_HEADER = "Jetzt verfügbar",
        MISSINGREQS_HEADER = "Verfügbar, aber fehlende Anforderungen",
        NEXTLEVEL_HEADER = "Demnächst",
        NOTLEVEL_HEADER = "Noch nicht verfügbar",
        MISSINGTALENT_HEADER = "Fehlende Talente",
        IGNORED_HEADER = "Ignoriert",
        KNOWN_HEADER = "Bereits bekannt",
        PET_HEADER = "Pet Fähigkeiten",
        COST_FORMAT = "Kosten: %s",
        TOTALCOST_FORMAT = "Gesamtkosten: %s",
        TOTALSAVINGS_FORMAT = "Gesamtersparnis: %s",
        LEVEL_FORMAT = "Level %s",
        TAB_TEXT = "Was kann ich Lernen?"
    },
    koKR = {
        AVAILABLE_HEADER = "지금 사용 가능",
        MISSINGREQS_HEADER = "사용 가능하지만 누락된 요구 사항",
        NEXTLEVEL_HEADER = "곧 사용 가능",
        NOTLEVEL_HEADER = "아직 사용 불가",
        MISSINGTALENT_HEADER = "필수 특성 누락",
        IGNORED_HEADER = "무시됨",
        KNOWN_HEADER = "이미 배움",
        PET_HEADER = "소환수 능력",
        COST_FORMAT = "비용: %s",
        TOTALCOST_FORMAT = "총 비용: %s",
        TOTALSAVINGS_FORMAT = "총 절감: %s",
        LEVEL_FORMAT = "레벨 %s",
        TAB_TEXT = "무엇을 훈련할 수 있나요?"
    }
}

wt.L = localeText["enUS"]
local locale = GetLocale()
if locale == "enUS" or locale == "enGB" or localeText[locale] == nil then
    return
end
for k, v in pairs(localeText[locale]) do
    wt.L[k] = v
end
