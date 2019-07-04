local _, wt = ...

local localeText = {
    enUS = {
        AVAILABLE_HEADER = "Available Now",
        MISSINGREQS_HEADER = "Available but Missing Requirements",
        NEXTLEVEL_HEADER = "Coming Soon",
        NOTLEVEL_HEADER = "Not Yet Available",
        IGNORED_HEADER = "Ignored",
        KNOWN_HEADER = "Already Known",
        COST_FORMAT = "Cost: %s",
        TOTALCOST_FORMAT = "Total Cost: %s",
        TOTALSAVINGS_FORMAT = "Total Savings: %s",
        LEVEL_FORMAT = "Level %s",
        TAB_TEXT = "What can I train?"
    }
}

wt.L = localeText["enUS"]
local locale = GetLocale()
if (locale == "enUS" or locale == "enGB" or localeText[locale] == nil) then
    return
end
for k, v in pairs(localeText[locale]) do
    wt.L[k] = v
end
