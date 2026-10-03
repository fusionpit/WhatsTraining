local _, wt = ...

local compare = CreateFrame("GameTooltip", "WhatsTrainingCompareTooltip", UIParent, "GameTooltipTemplate")
compare:SetClampedToScreen(true)

local function rankNumber(info)
    return tonumber(string.match(info.subText or "", "%d+")) or info.level or 0
end

local function isKnown(info)
    if info.tooltipType == "item" then return wt:IsPetAbilityLearned(info.id) end
    return wt.isAbilityKnown(info.id)
end

function wt.knownRankFor(spellInfo)
    if spellInfo.isHeader or spellInfo.npc or spellInfo.altTooltipType == "weapon"
        or (spellInfo.tooltipType ~= "spell" and spellInfo.tooltipType ~= "item") then return end
    if isKnown(spellInfo) then return end

    local getInfo = spellInfo.tooltipType == "item" and wt.ItemInfo or wt.SpellInfo
    local knownId, highestRank = nil, -1
    for _, id in ipairs(wt:AllRanks(spellInfo.id) or {}) do
        local info = getInfo(wt, id)
        if id ~= spellInfo.id and info and isKnown(info) then
            local rank = rankNumber(info)
            if rank > highestRank then
                knownId, highestRank = info.tooltipId, rank
            end
        end
    end
    return knownId
end

function wt.wantsRankComparison()
    return IsModifiedClick("COMPAREITEMS")
end

local watcher = CreateFrame("Frame")
local owner, mainTooltip, shownState

function wt.HideRankComparison()
    compare:Hide()
    owner, mainTooltip, shownState = nil, nil, nil
    watcher:UnregisterEvent("MODIFIER_STATE_CHANGED")
end

watcher:SetScript("OnEvent", function()
    if not owner or not owner:IsVisible() or not mainTooltip:IsShown() or not mainTooltip:IsOwned(owner) then
        wt.HideRankComparison()
        return
    end
    if wt.wantsRankComparison() ~= shownState then
        local onEnter = owner:GetScript("OnEnter")
        if onEnter then onEnter(owner) end
    end
end)

function wt.ShowRankComparison(tooltip, rowOwner, knownId)
    if not knownId then
        wt.HideRankComparison()
        return
    end
    owner, mainTooltip, shownState = rowOwner, tooltip, wt.wantsRankComparison()
    watcher:RegisterEvent("MODIFIER_STATE_CHANGED")
    if not shownState then
        compare:Hide()
        return
    end

    compare:SetParent(tooltip)
    compare:SetOwner(tooltip, "ANCHOR_NONE")
    compare:SetSpellByID(knownId)
    compare:AddLine(wt.L.COMPARE_KNOWN_RANK, 0.5, 0.5, 0.5)
    compare:Show()
    compare:ClearAllPoints()
    local screenWidth = GetScreenWidth() * UIParent:GetEffectiveScale() / tooltip:GetEffectiveScale()
    if tooltip:GetRight() + compare:GetWidth() <= screenWidth then
        compare:SetPoint("TOPLEFT", tooltip, "TOPRIGHT", 0, 0)
    else
        compare:SetPoint("TOPRIGHT", tooltip, "TOPLEFT", 0, 0)
    end
end
