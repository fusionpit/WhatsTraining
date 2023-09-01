local lib = LibStub:NewLibrary("FusionIgnoreStore-1.0", 1)
if not lib then return end

lib.subs = {}
local function notifySubs()
    for _, sub in ipairs(lib.subs) do
        sub()
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
    wipe(self.ignored)
    notifySubs()
end

function lib:IsIgnored(id)
    return self.ignored[id]
end

function lib:AddSubscription(onChanged)
    tinsert(self.subs, onChanged)
end

function lib:Flip(id)
    self.ignored[id] = not self.ignored[id]
    notifySubs()
end

function lib:Update(id, ignored)
    self.ignored[id] = ignored
    notifySubs()
end

function lib:UpdateMany(ids, ignored)
    for _, id in ipairs(ids) do
        self.ignored[id] = ignored
    end
    notifySubs()
end

function lib:Import(ids)
    local imported = 0
    for _, id in ipairs(ids) do
        if self.ignored[id] ~= true then
            self.ignored[id] = true
            imported = imported + 1
        end
    end
    notifySubs()
    return imported
end
