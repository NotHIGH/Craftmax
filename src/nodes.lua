return function(api)
	local wood_groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
	local stone_groups = {cracky = 3, stone = 1}

	local function register_textured_cube(name, description, groups, sounds)
		minetest.register_node(api.modname .. ":" .. name, {
			description = description,
			tiles = {api.texture(name)},
			groups = groups,
			sounds = sounds,
		})
	end

	register_textured_cube("grass", "Grass Block", {crumbly = 3, soil = 1})
	register_textured_cube("dirt", "Dirt", {crumbly = 3, soil = 1})
	register_textured_cube("stone", "Stone", stone_groups)
	register_textured_cube("sand", "Sand", {crumbly = 3, falling_node = 1})
	register_textured_cube("log", "Forest Log", wood_groups)
	register_textured_cube("leaves", "Forest Leaves", {snappy = 3, leafdecay = 3, flammable = 2})
	register_textured_cube("coal_ore", "Coal Ore", stone_groups)

	minetest.register_node(api.modname .. ":cactus", {
		description = "Cactus",
		tiles = {api.texture("cactus_top"), api.texture("cactus_top"), api.texture("cactus")},
		groups = {choppy = 3, flammable = 1},
		damage_per_second = 2,
	})

	minetest.register_node(api.modname .. ":water_source", {
		description = "Water Source",
		drawtype = "liquid",
		tiles = {api.texture("water")},
		special_tiles = {
			{name = api.texture("water"), backface_culling = false},
			{name = api.texture("water"), backface_culling = true},
		},
		alpha = 160,
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		liquidtype = "source",
		liquid_alternative_flowing = api.modname .. ":water_flowing",
		liquid_alternative_source = api.modname .. ":water_source",
		liquid_viscosity = 1,
		post_effect_color = {a = 103, r = 30, g = 90, b = 160},
		groups = {liquid = 3, water = 1},
	})

	minetest.register_node(api.modname .. ":water_flowing", {
		description = "Flowing Water",
		drawtype = "flowingliquid",
		paramtype = "light",
		paramtype2 = "flowingliquid",
		tiles = {api.texture("water")},
		special_tiles = {
			{name = api.texture("water"), backface_culling = false},
			{name = api.texture("water"), backface_culling = true},
		},
		alpha = 160,
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		liquidtype = "flowing",
		liquid_alternative_flowing = api.modname .. ":water_flowing",
		liquid_alternative_source = api.modname .. ":water_source",
		liquid_viscosity = 1,
		post_effect_color = {a = 103, r = 30, g = 90, b = 160},
		groups = {liquid = 3, water = 1},
	})

	minetest.register_node(api.modname .. ":campfire", {
		description = "Campfire",
		tiles = {api.colored_texture("#d87932")},
		light_source = 12,
		damage_per_second = 1,
		groups = {crumbly = 2, flammable = 1},
	})
end