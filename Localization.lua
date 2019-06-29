WhatsTrainingTextLocales = {
    enUS = {
        AVAILABLE_HEADER = "Available Now",
        MISSINGREQS_HEADER = "Available but Missing Requirements",
        NEXTLEVEL_HEADER = "Coming Soon",
        NOTLEVEL_HEADER = "Not Yet Available",
        IGNORED_HEADER = "Ignored",
        KNOWN_HEADER = "Already Known",
        COST_FORMAT = "Cost: %s",
        TOTALCOST_FORMAT = "Total Cost: %s",
        LEVEL_FORMAT = "Level %s",
        TAB_TEXT = "What can I train?",
    },
}
WhatsTrainingText = WhatsTrainingTextLocales[GetLocale()] or WhatsTrainingTextLocales["enUS"];
