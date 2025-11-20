local _, wt = ...
if wt.currentClass ~= "HUNTER" then return end

wt.PetAbilityIds = {
    [4195] = true,
    [24547] = true,
    [4196] = true,
    [24556] = true,
    [4197] = true,
    [24557] = true,
    [24495] = true,
    [24440] = true,
    [24475] = true,
    [14923] = true,
    [24494] = true,
    [24490] = true,
    [4198] = true,
    [24558] = true,
    [24508] = true,
    [35694] = true,
    [25076] = true,
    [24441] = true,
    [24476] = true,
    [4199] = true,
    [14924] = true,
    [24559] = true,
    [24511] = true,
    [24514] = true,
    [4200] = true,
    [24560] = true,
    [24509] = true,
    [24463] = true,
    [24477] = true,
    [14925] = true,
    [24512] = true,
    [24515] = true,
    [4201] = true,
    [24561] = true,
    [4202] = true,
    [24562] = true,
    [24510] = true,
    [24464] = true,
    [24478] = true,
    [14926] = true,
    [24513] = true,
    [24516] = true,
    [5048] = true,
    [24631] = true,
    [27052] = true,
    [35698] = true,
    [27053] = true,
    [27054] = true,
    [5049] = true,
    [14927] = true,
    [24632] = true,
    [27055] = true,
    [27056] = true,
    [27062] = true,
    [27047] = true,
    [27061] = true,
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
