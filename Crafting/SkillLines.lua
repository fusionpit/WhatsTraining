-- polyfill C_SkillInfo.GetSkillLineInfoByID in Era/TBC
-- skills can be named differently in different places: e.g., Herbalism/Herb Gathering
local nameSpells = {
    [129] = 3273, -- First Aid
    [186] = 2575, -- Mining
    [185] = 2550, -- Cooking
    [393] = 8613, -- Skinning
    [182] = 9134, -- Herbalism
    [164] = 2018, -- Blacksmithing
    [356] = 7620, -- Fishing
    [171] = 2259, -- Alchemy
    [165] = 2108, -- Leatherworking
    [197] = 3908, -- Tailoring
    [333] = 7411, -- Enchanting
    [202] = 4036, -- Engineering
    [755] = 25229, -- Jewelcrafting
    [40] = 2842, -- Poisons
}

local skills, scanned, muted = {}, false, false

-- record what headers are collapsed, open everything, scan, then re-collapse bottom-to-top
local function scan()
    scanned = true
    local idByName = {}
    for id, spell in pairs(nameSpells) do
        local info = C_Spell.GetSpellInfo(spell)
        if info then idByName[info.name] = id end
    end
    local collapsed = {}
    for i = 1, GetNumSkillLines() do
        local name, isHeader, isExpanded = GetSkillLineInfo(i)
        if isHeader and not isExpanded then collapsed[name] = true end
    end
    muted = true
    if next(collapsed) then ExpandSkillHeader(0) end
    local found, toCollapse = {}, {}
    for i = 1, GetNumSkillLines() do
        local name, isHeader, _, rank, tempPoints, modifier, maxRank = GetSkillLineInfo(i)
        if isHeader then
            if collapsed[name] then tinsert(toCollapse, i) end
        elseif idByName[name] then
            local id = idByName[name]
            found[id] = {skillID = id, name = name, isHeader = false, isCollapsed = false, rank = rank,
                tempPoints = tempPoints, modifier = modifier, maxRank = maxRank}
        end
    end
    for j = #toCollapse, 1, -1 do CollapseSkillHeader(toCollapse[j]) end
    skills = found
    if #toCollapse > 0 then
        C_Timer.After(0, function() muted = false end)
    else
        muted = false
    end
end

C_SkillInfo = C_SkillInfo or {}
function C_SkillInfo.GetSkillLineInfoByID(id)
    if not scanned then scan() end
    return skills[id]
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("SKILL_LINES_CHANGED")
frame:SetScript("OnEvent", function()
    if not muted then scan() end
end)
