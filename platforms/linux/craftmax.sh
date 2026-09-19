#!/usr/bin/env sh

set -eu

GAME_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
GAME_PARENT=$(dirname "$GAME_DIR")
GAME_ID=$(basename "$GAME_DIR")
ENGINE=${CRAFTMAX_ENGINE:-}

if [ -z "$ENGINE" ]; then
	if command -v luanti >/dev/null 2>&1; then
		ENGINE=luanti
	elif command -v minetest >/dev/null 2>&1; then
		ENGINE=minetest
	else
		echo "Luanti was not found. Set CRAFTMAX_ENGINE to its executable." >&2
		exit 1
	fi
fi

exec "$ENGINE" --gamespath "$GAME_PARENT" --gameid "$GAME_ID" "$@"