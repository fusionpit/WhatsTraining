local lib = LibStub:NewLibrary("FusionIgnoreStore-1.0", 2)
if not lib then return end

lib.subs = lib.subs or {}
local function notifySubs(ids, ignored)
    if #ids == 0 then return end
    for _, sub in ipairs(lib.subs) do
        sub(ids, ignored)
    end
end

function lib:MigrateOrUse(addonTable)
    if self.ignored ~= nil then
        self:MaybeMigrate(addonTable)
        return
    end
    addonTable.MIGRATED = nil
    self.ignored = addonTable
end

function lib:LoadIfNotAlready()
    if self.ignored ~= nil then return end
    FusionIgnoreStore = FusionIgnoreStore or {}
    self.ignored = FusionIgnoreStore
end

function lib:MaybeMigrate(addonTable)
    if addonTable.MIGRATED then return end
    for id, ignored in pairs(addonTable) do
        -- if spell is already ignored, respect that status
        if self.ignored[id] ~= true then
            self.ignored[id] = ignored
        end
    end
    addonTable.MIGRATED = true
end

function lib:Clear()
    local ids = {}
    for id, ignored in pairs(self.ignored) do
        if ignored == true then tinsert(ids, id) end
    end
    wipe(self.ignored)
    notifySubs(ids, false)
end

function lib:IsIgnored(id)
    return self.ignored[id]
end

function lib:AddSubscription(onChanged)
    tinsert(self.subs, onChanged)
end

function lib:Flip(id)
    self.ignored[id] = not self.ignored[id]
    notifySubs({id}, self.ignored[id])
end

function lib:Update(id, ignored)
    ignored = ignored == true
    if (self.ignored[id] == true) == ignored then return end
    self.ignored[id] = ignored
    notifySubs({id}, ignored)
end

function lib:UpdateMany(ids, ignored)
    ignored = ignored == true
    local changed = {}
    for _, id in ipairs(ids) do
        if (self.ignored[id] == true) ~= ignored then
            self.ignored[id] = ignored
            tinsert(changed, id)
        end
    end
    notifySubs(changed, ignored)
end

function lib:Import(ids)
    local imported = {}
    for _, id in ipairs(ids) do
        if self.ignored[id] ~= true then
            self.ignored[id] = true
            tinsert(imported, id)
        end
    end
    notifySubs(imported, true)
    return #imported
end
