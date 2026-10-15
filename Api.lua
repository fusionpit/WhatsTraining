local _, wt = ...

---A waypoint service, such as TomTom or Blizzard's map pin. What's Training calls each function
---with the provider as `self` and inside `xpcall`, so an error is reported without breaking
---tooltips or row clicks.
---@class WT_API.WaypointProvider
---@field name? string Label in the settings menu. Defaults to the provider's id.
---@field setWaypoint fun(self: WT_API.WaypointProvider, uiMapId: integer, x: number, y: number, title: string): boolean? Places a waypoint at `x`, `y` (0-1) for the trainer named `title`. Return `false` if nothing was placed.
---@field isAvailable? fun(self: WT_API.WaypointProvider): boolean Whether it can be used right now, e.g. its addon is loaded. Missing means always.
---@field canSetWaypoint? fun(self: WT_API.WaypointProvider, uiMapId: integer): boolean Whether it can place a waypoint on this map. Missing means every map.

---Public API for other addons. Read-only: assigning to it raises an error.
---@class WT_API
local api = {
    ---Raised when functions are added. Check it before calling a newer function.
    version = 1,

    ---Adds a waypoint provider. When two or more are available, players pick one in the settings
    ---menu and the choice is saved account-wide. `id` must be unique, so prefix it with your addon's
    ---name. Raises an error if `id` is taken or `def` has no `setWaypoint`.
    ---@type fun(id: string, def: WT_API.WaypointProvider)
    RegisterWaypointProvider = wt.registerWaypointProvider,
}

---@type WT_API
WT_API = setmetatable({}, {
    __index = api,
    __newindex = function() error("WT_API is read-only", 2) end,
    __metatable = false,
})
