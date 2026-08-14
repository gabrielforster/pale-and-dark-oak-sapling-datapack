# Oak Sapling Boost

Datapack for Minecraft Java Edition 26.2. Bumps Pale Oak and Dark Oak Sapling drop chance +5 percentage points over vanilla's default, per Fortune tier, so both trees are easier to keep sustainable without going overboard.

## What it does

Overrides two loot tables:

- `minecraft:blocks/pale_oak_leaves`
- `minecraft:blocks/dark_oak_leaves`

For both:

- **Sapling drop chance is vanilla's default + 5 percentage points, per Fortune tier** — Fortune still scales it up like vanilla, just from a higher floor.
- Works when leaves are destroyed by **explosions** (TNT, etc.), not just hand-breaking.
- Shearing / Silk Touch still drops the leaves block itself, same as vanilla.
- Stick drops (and Apple drops, Dark Oak only) are untouched.
- No other leaf type is modified.

## Drop rates: default vs this datapack

| Fortune level | Vanilla default | This datapack (+5pp) |
|---|---|---|
| None | 5% | **10%** |
| I | 6.25% | **11.25%** |
| II | 8.33% | **13.33%** |
| III | 10% | **15%** |

Same table for both Pale Oak and Dark Oak — vanilla uses the identical sapling formula for every oak-family leaf, and the +5pp is applied identically to both.

Dark Oak also keeps its untouched vanilla Apple drop, for reference:

| Fortune level | Apple (unchanged) |
|---|---|
| None | 0.5% |
| I | 0.556% |
| II | 0.625% |
| III | 0.833% |

## Why not "guarantee N saplings per tree"

Loot tables run per-block, with no knowledge of sibling blocks or which tree they belong to. There's no way to guarantee an exact number of saplings across an entire tree using a loot table alone — only a per-leaf chance. This datapack tunes that per-leaf chance instead. Guaranteeing a per-tree minimum would require a separate function/tracking system (out of scope here).

## Install

Copy the `oak-sapling-boost` folder into your world's datapacks directory:

```
<server_root>/<level-name>/datapacks/oak-sapling-boost/
```

`level-name` comes from `server.properties` (default: `world`), so typically:

```
world/datapacks/oak-sapling-boost/
```

## Verify

- `/datapack list` — should list `file/oak-sapling-boost` as enabled.
- `/reload` — reloads datapacks without a server restart if added while running.

## Test

In creative, break 30+ Pale Oak (or Dark Oak) Leaves with a bare hand or non-shear/non-silk-touch tool, no Fortune. Expect roughly 1 in 10 to be a sapling (~10%).

For a statistical check, run the following many times (repeating command block, or looped via a `/function`) and count sapling drops:

```
/loot spawn ~ ~ ~ loot blocks/pale_oak_leaves
/loot spawn ~ ~ ~ loot blocks/dark_oak_leaves
```

## Files

```
oak-sapling-boost/
├── pack.mcmeta
├── README.md
└── data/
    └── minecraft/
        └── loot_table/
            └── blocks/
                ├── pale_oak_leaves.json
                └── dark_oak_leaves.json
```

## Compatibility

- Target version: Minecraft Java Edition 26.2
- `pack.mcmeta` uses `min_format` / `max_format: 107` (post-25w31a format range syntax)
- Uses singular directory names (`loot_table`, per the 1.21+ rename)
