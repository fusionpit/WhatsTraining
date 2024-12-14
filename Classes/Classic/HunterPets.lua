local _, wt = ...
if wt.currentClass ~= "HUNTER" then return end

wt.PetAbilityIds = {
    [24493] = true,
    [24497] = true,
    [24500] = true,
    [24501] = true,
    [23992] = true,
    [24439] = true,
    [24444] = true,
    [24445] = true,
    [24446] = true,
    [24447] = true,
    [24448] = true,
    [24449] = true,
    [4187] = true,
    [5042] = true,
    [4188] = true,
    [4189] = true,
    [4190] = true,
    [4191] = true,
    [4192] = true,
    [4193] = true,
    [4194] = true,
    [5041] = true,
    [2649] = true,
    [14916] = true,
    [14917] = true,
    [14918] = true,
    [14919] = true,
    [14920] = true,
    [14921] = true,
    [24545] = true,
    [24630] = true,
    [24549] = true,
    [24550] = true,
    [24551] = true,
    [24552] = true,
    [24553] = true,
    [24554] = true,
    [24555] = true,
    [24629] = true,
    [24492] = true,
    [24502] = true,
    [24503] = true,
    [24504] = true,
    [24488] = true,
    [24505] = true,
    [24506] = true,
    [24507] = true
}

local petAbilityUpdateFrame = CreateFrame("Frame")
petAbilityUpdateFrame:SetScript("OnEvent", function()
    -- Beast training should always have at least one craft, and
    -- display skill line should always return nil for beast training
    local numCrafts = GetNumCrafts()
    if (numCrafts == 0 or GetCraftDisplaySkillLine()) then return end
    for i = 1, numCrafts do
        local name, rank = GetCraftInfo(i)
        if wt.learnedPetAbilityMap[name] == nil then
            wt.learnedPetAbilityMap[name] = {}
        end
        -- some locales may not provide a rank, need more investigation
        if rank ~= nil then
            wt.learnedPetAbilityMap[name][rank] = true
        end
    end
    wt.afterPetUpdate()
end)
petAbilityUpdateFrame:RegisterEvent("CRAFT_UPDATE")
petAbilityUpdateFrame:RegisterEvent("SPELLS_CHANGED")

local learnedSpellMatchPattern = string.gsub(ERR_LEARN_SPELL_S, "%%s",
                                             "(.+)")
local petChatParserFrame = CreateFrame("Frame")
petChatParserFrame:SetScript("OnEvent", function(_, _, ...)
    local matchedSpellName = string.match(select(1, ...),
                                          learnedSpellMatchPattern)
    if matchedSpellName ~= nil then
        wt.onSpellLearned(matchedSpellName)
    end
end)
petChatParserFrame:RegisterEvent("CHAT_MSG_SYSTEM")
