local _, wt = ...

wt.WeaponGrouping = {}
local WeaponGrouping = wt.WeaponGrouping

-- Known skills sort as orderIndex + KNOWN_OFFSET so they fall after unknown ones with one global key
WeaponGrouping.KNOWN_OFFSET = 1000

-- Knowns are offset so they sort last.
function WeaponGrouping.computeSortOrder(orderIndex, isKnown)
    local base = orderIndex or 0
    if isKnown then
        return base + WeaponGrouping.KNOWN_OFFSET
    end
    return base
end

-- Builds the static grouped structure for one faction, alphabetized by zone then Master name.
function WeaponGrouping.buildSkeleton(weaponSkills, faction, zoneNames)
    local names = zoneNames or {}
    local mastersByNpc = {}

    -- Invert weapon -> trainers into Master -> weaponIds, deduping masters by npc id.
    for weaponId, weaponData in pairs(weaponSkills) do
        local trainers = weaponData.trainers and weaponData.trainers[faction]
        if trainers then
            for _, trainer in ipairs(trainers) do
                local master = mastersByNpc[trainer.npc]
                if not master then
                    master = {
                        npc = trainer.npc,
                        name = trainer.name,
                        zone = trainer.zone,
                        zoneIcon = trainer.zoneIcon,
                        x = trainer.x,
                        y = trainer.y,
                        groupedOnly = trainer.groupedOnly,
                        weaponIds = {},
                        seenWeapons = {},
                    }
                    mastersByNpc[trainer.npc] = master
                end
                if not master.seenWeapons[weaponId] then
                    master.seenWeapons[weaponId] = true
                    tinsert(master.weaponIds, weaponId)
                end
            end
        end
    end

    -- Group masters into zones
    local zonesById = {}
    local zones = {}
    for _, master in pairs(mastersByNpc) do
        master.seenWeapons = nil
        sort(master.weaponIds, function(a, b)
            local orderA = weaponSkills[a].orderIndex or 0
            local orderB = weaponSkills[b].orderIndex or 0
            if orderA == orderB then return a < b end
            return orderA < orderB
        end)

        local zone = zonesById[master.zone]
        if not zone then
            zone = {
                id = master.zone,
                name = names[master.zone],
                icon = master.zoneIcon,
                masters = {},
            }
            zonesById[master.zone] = zone
            tinsert(zones, zone)
        end
        tinsert(zone.masters, master)
    end

    for _, zone in ipairs(zones) do
        sort(zone.masters, function(a, b)
            local nameA, nameB = a.name or "", b.name or ""
            if nameA == nameB then return (a.npc or 0) < (b.npc or 0) end
            return nameA < nameB
        end)
    end

    sort(zones, function(a, b)
        local nameA, nameB = a.name or "", b.name or ""
        if nameA == nameB then return (a.id or 0) < (b.id or 0) end
        return nameA < nameB
    end)

    return zones
end

-- Flattens the skeleton into ordered rows:
-- zone header (indent 0) ->
--   Master subheader (indent 1) ->
--     skill rows (indent 2)
function WeaponGrouping.assembleList(skeleton, wrapperByWeaponId, ignoredIds, ignoredHeaderText)
    local ignored = ignoredIds or {}
    local rows = {}

    local ignoredIdList = {}
    local seenIgnored = {}

    for _, zone in ipairs(skeleton) do
        local zoneRows = {}

        for _, master in ipairs(zone.masters) do
            local visibleIds = {}
            for _, weaponId in ipairs(master.weaponIds) do
                local wrapper = wrapperByWeaponId[weaponId]
                if wrapper then
                    if ignored[weaponId] then
                        if not seenIgnored[weaponId] then
                            seenIgnored[weaponId] = true
                            tinsert(ignoredIdList, weaponId)
                        end
                    else
                        tinsert(visibleIds, weaponId)
                    end
                end
            end

            if #visibleIds > 0 then
                sort(visibleIds, function(a, b)
                    local orderA = wrapperByWeaponId[a].sortOrder or 0
                    local orderB = wrapperByWeaponId[b].sortOrder or 0
                    if orderA == orderB then return a < b end
                    return orderA < orderB
                end)

                tinsert(zoneRows, {
                    isHeader = true,
                    indent = 1,
                    name = master.name,
                    masterName = master.name,
                    npc = master.npc,
                    zone = master.zone,
                    zoneName = zone.name,
                    x = master.x,
                    y = master.y,
                })
                for _, weaponId in ipairs(visibleIds) do
                    local wrapper = wrapperByWeaponId[weaponId]
                    wrapper.indent = 2
                    tinsert(zoneRows, wrapper)
                end
            end
        end

        if #zoneRows > 0 then
            tinsert(rows, {
                isHeader = true,
                indent = 0,
                name = zone.name,
                zoneId = zone.id,
                zoneIcon = zone.icon,
            })
            for _, row in ipairs(zoneRows) do
                tinsert(rows, row)
            end
        end
    end

    if #ignoredIdList > 0 then
        sort(ignoredIdList, function(a, b)
            local orderA = wrapperByWeaponId[a].sortOrder or 0
            local orderB = wrapperByWeaponId[b].sortOrder or 0
            if orderA == orderB then return a < b end
            return orderA < orderB
        end)

        tinsert(rows, {
            isHeader = true,
            indent = 0,
            name = ignoredHeaderText,
        })
        for _, weaponId in ipairs(ignoredIdList) do
            local wrapper = wrapperByWeaponId[weaponId]
            wrapper.indent = 2
            tinsert(rows, wrapper)
        end
    end

    return rows
end

-- Builds the static "Group by Weapon Skill" structure for one faction
function WeaponGrouping.buildSkillSkeleton(weaponSkills, faction, zoneNames, displayOrder)
    local names = zoneNames or {}
    local skills = {}

    for _, weaponId in ipairs(displayOrder) do
        local weaponData = weaponSkills[weaponId]
        local trainers = weaponData and weaponData.trainers and weaponData.trainers[faction]
        if trainers then
            local rows = {}
            for _, trainer in ipairs(trainers) do
                local zoneName = names[trainer.zone] or ""
                local masterName = trainer.name or ""
                local searchText = string.lower(zoneName .. " " .. masterName)
                tinsert(rows, {
                    zoneName = zoneName,
                    masterName = masterName,
                    npc = trainer.npc,
                    zone = trainer.zone,
                    x = trainer.x,
                    y = trainer.y,
                    searchText = searchText,
                })
            end

            sort(rows, function(a, b)
                if a.zoneName == b.zoneName then
                    if a.masterName == b.masterName then
                        return (a.npc or 0) < (b.npc or 0)
                    end
                    return a.masterName < b.masterName
                end
                return a.zoneName < b.zoneName
            end)

            if #rows > 0 then
                tinsert(skills, {
                    weaponId = weaponId,
                    orderIndex = weaponData.orderIndex or 0,
                    rows = rows,
                })
            end
        end
    end

    return skills
end

-- Flattens the skill skeleton into ordered rows:
--   rich skill row (indent 0, the shared wrapper) ->
--     "Zone — Master" child rows (indent 1)
-- then a single deduped Ignored section (indent 0 rich rows, no children).
-- filter: lowercased search string ("" or nil = no filter). Behavior B:
--   skill-name match keeps all child rows; a child-only match prunes to matching rows.
function WeaponGrouping.assembleSkillList(skillSkeleton, wrapperByWeaponId, ignoredIds, ignoredHeaderText, filter)
    local ignored = ignoredIds or {}
    local hasFilter = filter ~= nil and filter ~= ""
    local rows = {}

    local visible = {}
    for _, skill in ipairs(skillSkeleton) do
        local wrapper = wrapperByWeaponId[skill.weaponId]
        if wrapper and not ignored[skill.weaponId] then
            local skillMatches = (not hasFilter) or strfind(wrapper.searchText, filter, 1, true)
            local keptChildren
            if skillMatches then
                keptChildren = skill.rows
            else
                keptChildren = {}
                for _, r in ipairs(skill.rows) do
                    if strfind(r.searchText, filter, 1, true) then
                        tinsert(keptChildren, r)
                    end
                end
            end
            -- Keep the skill if the name matched, or (in filter mode) any child matched.
            if skillMatches or #keptChildren > 0 then
                tinsert(visible, { wrapper = wrapper, children = keptChildren })
            end
        end
    end

    sort(visible, function(a, b)
        local orderA = a.wrapper.sortOrder or 0
        local orderB = b.wrapper.sortOrder or 0
        if orderA == orderB then return (a.wrapper.id or 0) < (b.wrapper.id or 0) end
        return orderA < orderB
    end)

    for _, entry in ipairs(visible) do
        entry.wrapper.indent = 0
        tinsert(rows, entry.wrapper)
        for _, r in ipairs(entry.children) do
            tinsert(rows, {
                isHeader = true,
                indent = 1,
                name = r.zoneName .. " \226\128\148 " .. r.masterName, -- em-dash U+2014
                masterName = r.masterName,
                npc = r.npc,
                zone = r.zone,
                zoneName = r.zoneName,
                x = r.x,
                y = r.y,
            })
        end
    end

    local ignoredList = {}
    for _, skill in ipairs(skillSkeleton) do
        local wrapper = wrapperByWeaponId[skill.weaponId]
        if wrapper and ignored[skill.weaponId] then
            if (not hasFilter) or strfind(wrapper.searchText, filter, 1, true) then
                tinsert(ignoredList, wrapper)
            end
        end
    end
    if #ignoredList > 0 then
        sort(ignoredList, function(a, b)
            local orderA = a.sortOrder or 0
            local orderB = b.sortOrder or 0
            if orderA == orderB then return (a.id or 0) < (b.id or 0) end
            return orderA < orderB
        end)
        tinsert(rows, {
            isHeader = true,
            indent = 0,
            name = ignoredHeaderText,
        })
        for _, wrapper in ipairs(ignoredList) do
            wrapper.indent = 0
            tinsert(rows, wrapper)
        end
    end

    return rows
end
