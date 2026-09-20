local _, wt = ...
if wt.currentClass ~= "HUNTER" then return end

-- Forever no longer provides the legacy beast training craft API.
if not C_EventUtils or C_EventUtils.IsEventValid("CRAFT_UPDATE") then
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
else
    -- Beast training opens the trainer frame, listing the abilities the hunter knows.
    -- The service status seems unreliable right after learning, so only presence is used
    local petAbilityUpdateFrame = CreateFrame("Frame")
    petAbilityUpdateFrame:SetScript("OnEvent", function()
        if C_Trainer.GetTrainerType() ~= Enum.TrainerType.Pet then return end
        for i = 1, GetNumTrainerServices() do
            local tooltipData = C_TooltipInfo.GetTrainerService(i)
            if tooltipData and tooltipData.id then
                wt:SetPetAbilityStatus(tooltipData.id, true)
            end
        end
        wt.afterPetUpdate()
    end)
    petAbilityUpdateFrame:RegisterEvent("TRAINER_SHOW")
    petAbilityUpdateFrame:RegisterEvent("TRAINER_UPDATE")
end

local learnedSpellMatchPattern = string.gsub(ERR_LEARN_SPELL_S, "%%s",
                                             "(.+)")
local petChatParserFrame = CreateFrame("Frame")
petChatParserFrame:SetScript("OnEvent", function(_, _, ...)
    local matchedSpellName = string.match(select(1, ...),
                                          learnedSpellMatchPattern)
    if matchedSpellName == nil then return end
    -- Forever sends a spell link instead of a plain name
    local spellId = tonumber(string.match(matchedSpellName, "|Hspell:(%d+)"))
    if spellId == nil then
        wt.onSpellLearned(matchedSpellName)
    elseif wt:IsPetAbility(spellId) and wt:SetPetAbilityStatus(spellId, true) then
        wt:RebuildData()
    end
end)
petChatParserFrame:RegisterEvent("CHAT_MSG_SYSTEM")
