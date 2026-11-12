# Forever profession vendor locations

`Forever.json` is a separate, English-language snapshot for the vendor NPC IDs
already referenced by `Crafting/Recipes/Camelot/*.lua`. It is not loaded by the
addon. Recipe records and UI behavior are unchanged.

Collected November 9, 2026: all **287** referenced vendor NPCs have names;
**279** have mapped coordinates, totaling **629** reported points. Exact NPC-ID
coverage and coordinate/map fields pass the collector's offline `--check`.

Wowhead provides no mapped coordinates for these eight NPC IDs:

| NPC ID | Name |
| --- | --- |
| 9499 | Plugger Spazzring |
| 12944 | Lokhtos Darkbargainer |
| 14371 | Shen'dralar Provisioner |
| 15471 | Lieutenant General Andorov |
| 216672 | Namdo Bizzfizzle |
| 217689 | Ziri "The Wrench" Littlesprocket |
| 242498 | Reagent Bot |
| 254695 | Repair Bot |

The `npcs` object is keyed by NPC ID. Each record contains the NPC's `name`,
optional `title`, `locations`, source URL, UTC `fetched_at`, and coverage `status`.
Locations retain Wowhead's NPC `g_mapperData` fields:

- `area`: Wowhead/game area ID, matching the ID type used in recipe vendor data.
- `uiMapId`: client map ID; this is distinct from `area`.
- `uiMapName`: English map label.
- `coords`: all reported `[x, y]` pairs, in percentages from 0 to 100.
- `count`: Wowhead's reported point count.

All reported points and map entries are preserved. Multiple coordinates can
represent movement, multiple spawns, or observations; they are not verified
stationary waypoints. No preferred point is selected. Missing coordinates stay
explicit (`no_coordinates`); unavailable NPC pages use `not_found` and a null name.
No Classic/TBC data is substituted for missing Forever data.

Collected through `wowhead_get(version="forever", kind="npc", format="both")`
using the local wowhead-rip MCP and its existing shared service/cache. The NPC map
data is decoded from raw page JSON because the service's parsed `mapper` field
handles quest objectives, not NPC locations.

The local collector is `tools/collect_profession_vendors.py` (the repository's
`tools/` directory is locally excluded from Git). It resumes saved records and
validates exact coverage against the current Forever recipe files, coordinate
ranges, map IDs, names, and source links. Run `--check` for offline validation.
