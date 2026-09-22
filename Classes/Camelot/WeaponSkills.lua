local _, wt = ...

wt.WeaponSkills[196].classes.ROGUE = true -- One-Handed Axes
wt.WeaponSkills[197].classes.SHAMAN = true -- Two-Handed Axes
wt.WeaponSkills[199].classes.SHAMAN = true -- Two-Handed Maces

-- Forever's Stormwind map includes the Harbor, which shifts every coordinate on it.
local movedMasters = {
    [11867] = { x = 63.9, y = 69.1 }, -- Woo Ping
}

for _, weaponData in pairs(wt.WeaponSkills) do
    for _, trainers in pairs(weaponData.trainers) do
        for _, trainer in ipairs(trainers) do
            local moved = movedMasters[trainer.npc]
            if moved then trainer.x, trainer.y = moved.x, moved.y end
        end
    end
end
