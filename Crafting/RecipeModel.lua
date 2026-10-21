local _, wt = ...
local ignoreStore = LibStub:GetLibrary("FusionIgnoreStore-1.0")

local professions = {
    129, -- First Aid
    186, -- Mining
    185, -- Cooking
    393, -- Skinning
    182, -- Herbalism
    164, -- Blacksmithing
    356, -- Fishing
    171, -- Alchemy
    165, -- Leatherworking
    197, -- Tailoring
    333, -- Enchanting
    202, -- Engineering
}
wt.Professions = professions
local secondaryProfessions = {
    [129] = true, -- First Aid
    [185] = true, -- Cooking
    [356] = true, -- Fishing
}
local requested = {}
local sourceNames = {trainer = wt.L.TRAINER, vendor = wt.L.VENDOR, drop = wt.L.DROP, quest = wt.L.QUEST,
    crafted = wt.L.CRAFTED, world_object = wt.L.WORLD_OBJECT}
wt.RecipeSourceNames = sourceNames
local Category = {AVAILABLE = 1, MISSING = 2, SOON = 3, LATER = 4, IGNORED = 5}
wt.RecipeCategory = Category
local categories = {
    [Category.AVAILABLE] = {label = wt.L.AVAILABLE_HEADER, text = {0.65, 0.9, 0.5}, band = {0.24, 0.48, 0.16},
        heading = {0.65, 1, 0.40}},
    [Category.MISSING] = {label = wt.L.MISSINGREQS_HEADER, text = {1, 0.82, 0}, band = {0.64, 0.30, 0.06},
        heading = {1, 0.82, 0.30}},
    [Category.SOON] = {label = wt.L.NEXTLEVEL_HEADER, text = {0.3, 0.8, 1}, band = {0.16, 0.36, 0.58},
        heading = {0.55, 0.84, 1}},
    [Category.LATER] = {label = wt.L.NOTLEVEL_HEADER, text = {1, 0.45, 0.4}, band = {0.60, 0.14, 0.08},
        heading = {1, 0.55, 0.45}},
    [Category.IGNORED] = {label = wt.L.IGNORED_HEADER, text = {0.5, 0.5, 0.5}, band = {0.40, 0.34, 0.24},
        heading = {0.85, 0.80, 0.65}},
}
wt.RecipeCategories = categories

function wt.HasSelection(selection)
    for _, selected in pairs(selection) do
        if selected then return true end
    end
    return false
end

function wt.ProfessionLess(a, b)
    local aSecondary, bSecondary = secondaryProfessions[a.id], secondaryProfessions[b.id]
    if aSecondary ~= bSecondary then return not aSecondary end
    return a.profession < b.profession
end

function wt.GetRecipeSources(recipe)
    return recipe.source or {}
end

-- query must already be lower case
function wt.RowMatches(row, query, selectedSources)
    if query ~= "" and not row.searchName:find(query, 1, true)
        and not row.searchProfession:find(query, 1, true) then return false end
    if not selectedSources then return true end
    for _, source in ipairs(row.sources) do
        if selectedSources[source] then return true end
    end
    return false
end

local function reputationRequirement(recipe)
    local rep = recipe.reputation
    if not rep and recipe.reputationUnknown then
        return string.format(wt.L.REPUTATION_UNVERIFIED, recipe.reputationUnknown), false
    end
    if not rep then return nil, true end
    local alternatives, met = {}, false
    for i = 1, #rep, 3 do
        local faction = C_Reputation.GetFactionDataByID(rep[i])
        met = met or (faction and faction.reaction and faction.reaction >= rep[i + 1]) or false
        tinsert(alternatives, string.format(wt.L.REPUTATION_STANDING,
            faction and faction.name or rep[i + 2],
            _G["FACTION_STANDING_LABEL" .. rep[i + 1]]))
    end
    return string.format(wt.L.REQUIRES_REPUTATION, table.concat(alternatives, wt.L.REPUTATION_OR)), met
end

local function categoryFor(recipe, required, skill, level, reputationMet)
    if not required then return Category.MISSING end
    if required <= skill.rank then
        return (not reputationMet or level and level > UnitLevel("player")
            or (recipe.rank and not level)) and Category.MISSING or Category.AVAILABLE
    end
    if required <= skill.rank + 10 and required <= skill.maxRank then return Category.SOON end
    return Category.LATER
end

-- returns the row and its category, or nil when the recipe is hidden
local function rowFor(recipe, skill, id)
    local info = C_Spell.GetSpellInfo(recipe.spell)
    if not info and requested[recipe.spell] == nil then
        requested[recipe.spell] = true
        C_Spell.RequestLoadSpellData(recipe.spell)
    end
    local name = info and info.name or string.format(wt.L.SPELL, recipe.spell)
    local rank = recipe.rank and C_Spell.GetSpellSubtext(recipe.spell)
    if recipe.rank and (not rank or rank == "") then rank = wt.L[recipe.rank] or recipe.rank end
    if rank and rank ~= "" then name = string.format(wt.L.NAME_WITH_RANK, name, rank) end
    local sources, labels = wt.GetRecipeSources(recipe), {}
    for _, source in ipairs(sources) do
        tinsert(labels, sourceNames[source] or source)
    end
    if #labels == 0 then return nil end
    local row = {
        recipe = recipe, name = name, profession = skill.name, professionID = id, rankName = rank,
        searchName = strlower(name), searchProfession = strlower(skill.name), sources = sources,
    }

    local required = recipe.skill
    local level = recipe.level
    local repRequirement, reputationMet = reputationRequirement(recipe)
    local category = categoryFor(recipe, required, skill, level, reputationMet)
    local skillLabel = string.format(wt.L.SKILL, required or wt.L.UNKNOWN_SKILL_VALUE)
    if required and required > skill.rank then
        local color = categories[category].text
        skillLabel = skillLabel .. string.format(" |cff%02x%02x%02x(+%d)|r",
            color[1] * 255, color[2] * 255, color[3] * 255, required - skill.rank)
    end
    row.baseCategory = category
    if ignoreStore:IsIgnored(recipe.spell) then category = Category.IGNORED end
    row.requiredSkill, row.skillLabel = required, skillLabel
    row.reputationRequirement, row.reputationMet = repRequirement, reputationMet
    row.icon = (recipe.creates and C_Item.GetItemIconByID(recipe.creates))
        or (info and info.iconID) or "Interface\\Icons\\INV_Misc_QuestionMark"
    row.source = table.concat(labels, wt.L.SOURCE_SEPARATOR)
    row.requirement = not required and wt.L.SKILL_REQUIREMENT_UNKNOWN
        or (level and level > 0 and string.format(wt.L.REQUIRES_LEVEL, level))
        or (recipe.rank and not level and wt.L.CHECK_TRAINER_REQUIREMENTS) or nil
    return row, category
end

local function rowLess(a, b)
    local ar, br = a.requiredSkill or math.huge, b.requiredSkill or math.huge
    if ar ~= br then return ar < br end
    if a.profession ~= b.profession then return a.profession < b.profession end
    if not a.recipe.rank ~= not b.recipe.rank then return not not a.recipe.rank end
    if a.name ~= b.name then return a.name < b.name end
    return a.recipe.spell < b.recipe.spell
end
wt.RecipeLess = rowLess

function wt.GetRecipeGroups()
    local groups = {{}, {}, {}, {}, {}}
    local playerFaction = UnitFactionGroup("player")
    for _, id in ipairs(professions) do
        local skill = C_SkillInfo.GetSkillLineInfoByID(id)
        if skill then
            for _, recipe in ipairs(wt.Recipes[id]) do
                if (not recipe.faction or recipe.faction == playerFaction)
                    and not C_SpellBook.IsSpellKnown(recipe.spell, Enum.SpellBookSpellBank.Player) then
                    local row, category = rowFor(recipe, skill, id)
                    if row then tinsert(groups[category], row) end
                end
            end
        end
    end
    for _, rows in ipairs(groups) do table.sort(rows, rowLess) end
    return groups
end

function wt.RecipeSpellDataLoaded(spellID, success)
    if requested[spellID] ~= true then return false end
    requested[spellID] = false
    return success
end
