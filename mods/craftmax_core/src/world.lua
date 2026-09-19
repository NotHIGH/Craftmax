return function(api)
	minetest.register_on_mods_loaded(function()
		minetest.register_biome({
			name = "craftmax_plains",
			node_top = api.modname .. ":grass",
			depth_top = 1,
			node_filler = api.modname .. ":dirt",
			depth_filler = 3,
			node_stone = api.modname .. ":stone",
			y_min = 1,
			y_max = 31000,
			heat_point = 50,
			humidity_point = 50,
		})

		minetest.register_ore({
			ore_type = "scatter",
			ore = api.modname .. ":coal_ore",
			wherein = {api.modname .. ":stone"},
			clust_scarcity = 9 * 9 * 9,
			clust_num_ores = 4,
			clust_size = 3,
			y_min = -31000,
			y_max = 0,
		})
	end)
end