return function(api)
	local wood_groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
	local stone_groups = {cracky = 3, stone = 1}

	api.register_cube("grass", "Grass Block", "#6b9f45", {crumbly = 3, soil = 1})
	api.register_cube("dirt", "Dirt", "#76502f", {crumbly = 3, soil = 1})
	api.register_cube("stone", "Stone", "#747b80", stone_groups)
	api.register_cube("sand", "Sand", "#d6b36a", {crumbly = 3, falling_node = 1})
	api.register_cube("log", "Forest Log", "#80522f", wood_groups)
	api.register_cube("leaves", "Forest Leaves", "#3f7d3d", {snappy = 3, leafdecay = 3, flammable = 2})
	api.register_cube("coal_ore", "Coal Ore", "#35383b", stone_groups)

	minetest.register_node(api.modname .. ":campfire", {
		description = "Campfire",
		tiles = {api.colored_texture("#d87932")},
		light_source = 12,
		damage_per_second = 1,
		groups = {crumbly = 2, flammable = 1},
	})
end