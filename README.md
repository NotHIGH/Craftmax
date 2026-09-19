# Craftmax

Craftmax is an open-source, single-player endless survival game for Minetest/Luanti.
It is implemented as a standalone game layer that runs on the Luanti engine.

## Requirements

- Luanti 5.x or a compatible Minetest release
- A new or existing world created with Craftmax selected as the game
- Damage enabled for the intended survival experience

Craftmax does not contain the Luanti engine itself. The engine provides rendering,
world storage, networking, physics, map generation, inventory handling, and the Lua
API used by the game.

## Install

### From a clone

Clone this repository into the `games` directory used by Luanti:

```text
<luanti-user-data>/games/Craftmax
```

Typical user data locations are:

- Linux: `~/.minetest/` or `~/.luanti/`
- Windows: `%APPDATA%/Minetest/` or `%APPDATA%/Luanti/`
- macOS: `~/Library/Application Support/minetest/` or `~/Library/Application Support/luanti/`

Example for Linux:

```sh
git clone https://github.com/NotHIGH/Craftmax.git ~/.minetest/games/Craftmax
```

The directory must contain `game.conf` directly:

```text
games/Craftmax/game.conf
```

Do not place Craftmax inside another nested `Craftmax` directory.

### From the Luanti launcher

1. Open the Luanti content or game directory.
2. Copy or clone this repository into its `games` folder.
3. Restart Luanti if the game does not appear immediately.
4. Create a new world and select `Craftmax` in the game list.

For player-focused instructions, see [doc/PLAYER_GUIDE.md](doc/PLAYER_GUIDE.md).

## Run the game

1. Start Luanti.
2. Select `Craftmax` as the game.
3. Create a new world.
4. Enable damage in the world settings.
5. Start the world and gather resources during the day.

The current prototype uses the standard Luanti controls. Move, interact with
nodes, open the inventory, and craft items using the key bindings configured by
the Luanti installation.

## Launch Craftmax directly

The repository includes platform launchers that select Craftmax automatically:

```sh
./platforms/linux/craftmax.sh
```

On Windows, run `platforms/windows/craftmax.bat`. The launcher requires Luanti
or Minetest to be installed. See [platforms/README.md](platforms/README.md)
for the platform layout.

For installation problems, see [doc/TROUBLESHOOTING.md](doc/TROUBLESHOOTING.md).

## Current prototype

- Four procedurally generated biomes: plains, forest, ocean, and desert
- Generated trees, desert cacti, and custom water
- Grass, dirt, stone, sand, wood, leaves, coal ore, and campfires
- Apple food item and hunger system
- Stone pickaxe and basic crafting recipes
- No fixed ending: explore and survive as long as possible

## Gameplay systems

### World generation

Craftmax registers plains, forest, ocean, and desert biomes. Forest and plains
biomes generate trees, while deserts generate cacti. Ocean areas use Craftmax
water and sand shore layers. Coal ore is generated below the surface using the
Luanti ore API.

### Resources and crafting

The prototype includes basic terrain resources, sticks, apples, a stone pickaxe,
and campfires. Recipes are registered by the game mod and use Craftmax node and
item namespaced IDs.

### Hunger

Players start with 100% hunger. Hunger decreases over time and apples restore
hunger. When hunger reaches zero, the player takes periodic starvation damage.
The current value is displayed in the HUD and can also be checked with:

```text
/hunger
```

## Included mods

Craftmax includes the following external survival mods in `mods/`:

- `mobs` (Mobs Redo): mob API used by the creature mods. MIT licensed.
- `mobs_monster`: hostile monsters for exploration and night survival. MIT
	licensed and depends on `mobs`.
- `mobs_animal`: farm animals and wildlife. MIT licensed and depends on `mobs`.
- `farming`: plants, crops, food, seeds, and farming tools. MIT licensed.
- `xcompat`: compatibility library required by Basic Materials. MIT licensed.
- `basic_materials`: steel bars, chains, wire, plastic, and other basic
	materials. LGPL-3.0-only and depends on `xcompat`.

The original license files are kept inside each mod directory. These mods come
from the [TenPlus1 Codeberg repositories](https://codeberg.org/tenplus1).
Craftmax may need a compatibility layer for some mod drops and interactions
because it uses custom `craftmax_core:*` items instead of the standard
`default:*` namespace. Craftmax's own coal ore remains the base ore for now;
no oversized third-party ore pack is enabled.

## Project structure

```text
Craftmax/
├── game.conf
├── README.md
├── clientmods/
├── doc/
├── locale/
├── menu/
├── platforms/
├── src/
├── textures/
└── mods/
	└── craftmax_core/
		├── init.lua
		└── mod.conf
```

`mods/` contains loadable server-side game mods. `clientmods/` is reserved for
mods that run only on player clients. Platform launchers and packaging notes
are kept in `platforms/`. Shared documentation, translations, textures, and
source code are kept at the project level.

`init.lua` loads gameplay code from the root `src/` directory. The source is
split by responsibility:

- `api.lua` contains shared registration helpers.
- `nodes.lua` registers blocks and the campfire.
- `items.lua` registers food and crafting items.
- `tools.lua` registers tools and tool capabilities.
- `crafting.lua` registers recipes.
- `world.lua` registers biomes and ores.
- `trees.lua` registers tree and cactus decorations.
- `survival.lua` manages hunger, HUD updates, and starvation damage.

Textures belong in `textures/`, including the CC0 Kenney source pack and the
Craftmax-mapped files used by nodes. Translation files belong in `locale/`, and
module documentation belongs in `doc/`.

## Development

Make gameplay changes inside `src/` and keep `mods/craftmax_core/init.lua` as a
small loader. Server-side mods belong in `mods/`; client-only mods belong in
`clientmods/`.

Before opening a pull request:

1. Start Luanti with Craftmax selected.
2. Create a fresh test world.
3. Check world generation, crafting, item use, hunger, HUD updates, and the
   `/hunger` command.
4. Review the changed files with `git diff`.

The repository currently has no external Lua dependencies or build step.

## Roadmap

- Procedural trees
- Hostile creatures at night
- A complete saveable day/night survival loop
- Final textures and translations
- Focused gameplay tests

## License

Craftmax is distributed under the MIT License. See [LICENSE](LICENSE).

