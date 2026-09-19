# Troubleshooting

## Craftmax is not listed

Check that `game.conf` is directly inside the Craftmax directory:

```text
games/Craftmax/game.conf
```

Do not put the repository inside a second nested `Craftmax` directory. Restart
Luanti after copying the game.

## The launcher cannot find Luanti

Set the engine executable explicitly.

Linux:

```sh
CRAFTMAX_ENGINE=/path/to/luanti ./platforms/linux/craftmax.sh
```

Windows: set `CRAFTMAX_ENGINE` to the full path of `luanti.exe`.

## A world shows missing nodes or items

Make sure the world is using Craftmax and that all directories under `mods/`
were copied. Do not remove `craftmax_core`, `mobs`, `mobs_monster`, or
`mobs_animal` while the world depends on them.

## Mobs do not appear

Check that the `mobs` mod is enabled and that `mobs_monster` and `mobs_animal`
are present. Mob spawning also depends on light, space, loaded map areas, and
the settings of the Luanti engine.

## The game reports a Lua error

1. Close the world.
2. Copy the complete error from the Luanti debug log.
3. Include the Craftmax version, operating system, and enabled mods when
   reporting the problem.

Do not delete the world before making a backup if it contains important builds.