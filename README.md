# Pale Oak Saplings

Datapack for Minecraft Java Edition 26.2. Makes Pale Oak Leaves drop Pale Oak Saplings at a much higher, fixed rate so Pale Oak trees are sustainable to farm.

## What it does

Overrides `minecraft:blocks/pale_oak_leaves` loot table:

- **Pale Oak Sapling drop chance: 15% flat per leaf broken.**
- **Fortune does not affect this chance** — hand, plain tool, or Fortune III all roll the same 15%.
- Works when leaves are destroyed by **explosions** (TNT, etc.), not just hand-breaking.
- Shearing / Silk Touch still drops the leaves block itself, same as vanilla.
- Stick drops (Fortune-scaled, ~2-10%) are untouched.
- Only Pale Oak is affected — no other leaf type is modified.

## Drop rates: default vs this datapack

Vanilla Pale Oak Sapling chance scales with Fortune (table_bonus), same formula as every other oak-family leaf:

| Fortune level | Vanilla default | This datapack |
|---|---|---|
| None | 5% | **15%** |
| I | 6.25% | **15%** |
| II | 8.33% | **15%** |
| III | 10% | **15%** |

15% is ~1.5x-3x vanilla depending on Fortune level, tuned high on purpose for a no-Fortune-farming sustainable loop. Feels overtuned? Lower `chance` in `data/minecraft/loot_table/blocks/pale_oak_leaves.json` (pool 0 → sapling entry → `random_chance`) to taste — e.g. `0.1` lands close to vanilla's Fortune III rate but flat at every Fortune level, `0.06` sits near vanilla's no-Fortune/Fortune-I range.

### Dark Oak, for reference (untouched, not shipped by this datapack)

Dark Oak Leaves share the exact same base sapling formula as Pale Oak in vanilla 26.2, plus an apple drop Pale Oak doesn't have:

| Drop | Fortune 0 | I | II | III |
|---|---|---|---|---|
| Sapling | 5% | 6.25% | 8.33% | 10% |
| Apple | 0.5% | 0.556% | 0.625% | 0.833% |

This datapack does not touch Dark Oak — listed only as a reference point for the numbers above.

## Why not "guarantee N saplings per tree"

Loot tables run per-block, with no knowledge of sibling blocks or which tree they belong to. There's no way to guarantee an exact number of saplings across an entire tree using a loot table alone — only a per-leaf chance. This datapack tunes that per-leaf chance instead. Guaranteeing a per-tree minimum would require a separate function/tracking system (out of scope here).

## Install

Copy the `pale-oak-saplings` folder into your world's datapacks directory:

```
<server_root>/<level-name>/datapacks/pale-oak-saplings/
```

`level-name` comes from `server.properties` (default: `world`), so typically:

```
world/datapacks/pale-oak-saplings/
```

## Verify

- `/datapack list` — should list `file/pale-oak-saplings` as enabled.
- `/reload` — reloads datapacks without a server restart if added while running.

## Test

In creative, break 30-40 Pale Oak Leaves with a bare hand or non-shear/non-silk-touch tool. Expect roughly 4-6 saplings (~15%).

For a statistical check, run the following many times (repeating command block, or looped via a `/function`) and count sapling drops:

```
/loot spawn ~ ~ ~ loot blocks/pale_oak_leaves
```

## Files

```
pale-oak-saplings/
├── pack.mcmeta
├── README.md
└── data/
    └── minecraft/
        └── loot_table/
            └── blocks/
                └── pale_oak_leaves.json
```

## Compatibility

- Target version: Minecraft Java Edition 26.2
- `pack.mcmeta` uses `min_format` / `max_format: 107` (post-25w31a format range syntax)
- Uses singular directory names (`loot_table`, per the 1.21+ rename)
