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
        PET_HEADER = "Pet Abilities",
        COST_FORMAT = "Cost: %s",
        TOTALCOST_FORMAT = "Total Cost: %s",
        TOTALSAVINGS_FORMAT = "Total Savings: %s",
        LEVEL_FORMAT = "Level %s",
        TAB_TEXT = "What can I train?"
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
}

wt.L = localeText["enUS"]
local locale = GetLocale()
if (locale == "enUS" or locale == "enGB" or localeText[locale] == nil) then
    return
end
for k, v in pairs(localeText[locale]) do
    wt.L[k] = v
end
