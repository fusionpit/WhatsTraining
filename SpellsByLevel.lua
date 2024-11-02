setfenv(1, WhatsTraining)

---@alias SpellsByLevel table<integer, Spell[]>

---@type table<string, SpellsByLevel[]>
ClassSpellsByLevel = {}

---@type table<string, table<integer>>
OverridenSpells = {}