# Craftmax player guide

Craftmax is an endless survival game. There is no fixed campaign ending: gather
resources, build a safe place, explore the underground, and survive as long as
you can.

## First launch

1. Install Luanti 5.x or a compatible Minetest release.
2. Put the Craftmax directory inside the engine `games/` directory.
3. Start Luanti and select `Craftmax` in the game list.
4. Create a new world with damage enabled.
5. Join the world and begin in one of the generated biomes.

## Basic controls

Craftmax uses the standard Luanti controls. The exact keys can be changed in
the engine settings.

| Action | Default key or mouse button |
| --- | --- |
| Move | `W`, `A`, `S`, `D` |
| Jump | `Space` |
| Sneak | `Shift` |
| Dig, attack, or break a node | Left mouse button |
| Place a node or use an item | Right mouse button |
| Open inventory | `E` |
| Select hotbar slot | `1` to `9` |
| Show the game menu | `Esc` |

## The first day

1. Collect grass, dirt, stone, and wood.
2. Turn logs into sticks in the crafting menu.
3. Craft a stone pickaxe.
4. Gather stone and coal before night.
5. Craft a campfire and use it as a light and a temporary safe point.
6. Keep apples for hunger recovery.

## Hunger

Players start with 100% hunger. Hunger decreases over time. Use a Wild Apple
to restore hunger. At zero hunger, starvation damage starts.

Use the chat command below to check the current value:

```text
/hunger
```

The hunger value is also shown in the HUD while you play.

## Biomes and resources

The world contains four biomes:

- Plains: open grassland with occasional trees.
- Forest: greener terrain with more generated trees.
- Ocean: deep water with sandy shores.
- Desert: sand, heat, and generated cacti.

The world also contains grass, dirt, stone, sand, logs, leaves, coal ore,
apples, sticks, water, cacti, campfires, crops, and farming materials. Coal ore
is found underground in stone. The stone pickaxe is the first tool for faster
stone and coal gathering.

Farming Redo adds seeds, crops, food, and farming tools. Basic Materials adds
extra crafting materials such as steel bars, chains, wire, and plastic.

## Mobs

Craftmax includes Mobs Redo, Mobs Monster, and Mobs Animal. They add the mob
API, hostile creatures, and animals. Their behavior and drops are provided by
the external mods and may change as Craftmax compatibility improves.

## Saving and worlds

Luanti saves the world automatically. Use the engine menu to leave a world
cleanly. Back up the world directory before testing new mods or changing game
files.

## Multiplayer

The current game is designed and tested primarily for single-player use.
Luanti can provide multiplayer infrastructure, but Craftmax's hunger and mob
balance have not been tuned for public servers yet.