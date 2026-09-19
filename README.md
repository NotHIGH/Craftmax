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

## Run the game

1. Start Luanti.
2. Select `Craftmax` as the game.
3. Create a new world.
4. Enable damage in the world settings.
5. Start the world and gather resources during the day.

The current prototype uses the standard Luanti controls. Move, interact with
nodes, open the inventory, and craft items using the key bindings configured by
the Luanti installation.

## Current prototype

- Procedurally generated plains biome
- Grass, dirt, stone, sand, wood, leaves, coal ore, and campfires
- Apple food item and hunger system
- Stone pickaxe and basic crafting recipes
- No fixed ending: explore and survive as long as possible

## Gameplay systems

### World generation

Craftmax registers a plains biome with grass, dirt, and stone layers. Coal ore is
generated below the surface using the Luanti ore API.

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

## Project structure

```text
Craftmax/
├── game.conf
├── README.md
└── mods/
	└── craftmax_core/
		├── init.lua
		├── mod.conf
		├── src/
		│   ├── api.lua
		│   ├── crafting.lua
		│   ├── items.lua
		│   ├── nodes.lua
		│   ├── survival.lua
		│   ├── tools.lua
		│   └── world.lua
		├── textures/
		├── locale/
		└── doc/
```

`init.lua` is the module loader. Gameplay code is kept in `src/` and split by
responsibility:

- `api.lua` contains shared registration helpers.
- `nodes.lua` registers blocks and the campfire.
- `items.lua` registers food and crafting items.
- `tools.lua` registers tools and tool capabilities.
- `crafting.lua` registers recipes.
- `world.lua` registers biomes and ores.
- `survival.lua` manages hunger, HUD updates, and starvation damage.

Textures belong in `textures/`, translation files belong in `locale/`, and
module documentation belongs in `doc/`.

## Development

Make changes inside `mods/craftmax_core/`. Keep new gameplay features in a
focused module instead of adding more logic to `init.lua`.

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

