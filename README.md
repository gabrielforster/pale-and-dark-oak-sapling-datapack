# Pale Oak Saplings

Datapack for Minecraft Java Edition 26.2. Makes Pale Oak Leaves drop Pale Oak Saplings at a much higher, fixed rate so Pale Oak trees are sustainable to farm.

## What it does

Overrides `minecraft:blocks/pale_oak_leaves` loot table:

- **Pale Oak Sapling drop chance: ~15% per leaf broken**, up from vanilla's ~5-10% (Fortune-scaled).
- **Fortune does not affect this chance** — hand, plain tool, or Fortune V all roll the same 15%.
- Works when leaves are destroyed by **explosions** (TNT, etc.), not just hand-breaking.
- Shearing / Silk Touch still drops the leaves block itself, same as vanilla.
- Stick drops (Fortune-scaled, ~2-10%) are untouched.
- Only Pale Oak is affected — no other leaf type is modified.

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
