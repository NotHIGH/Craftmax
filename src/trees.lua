return function(api)
	local tree_def = {
		axiom = "FFFFFA",
		rules_a = "A&FF[&B]////[&B]////[&B]",
		rules_b = "BFF",
		trunk = api.modname .. ":log",
		leaves = api.modname .. ":leaves",
		angle = 30,
		iterations = 2,
		trunk_type = "single",
		thin_branches = true,
	}

	minetest.register_decoration({
		name = "craftmax_forest_trees",
		deco_type = "lsystem",
		place_on = {api.modname .. ":grass"},
		biomes = {"craftmax_plains", "craftmax_forest"},
		sidelen = 16,
		fill_ratio = 0.012,
		y_min = 1,
		y_max = 120,
		treedef = tree_def,
	})

	minetest.register_decoration({
		name = "craftmax_desert_cactus",
		deco_type = "simple",
		place_on = {api.modname .. ":sand"},
		biomes = {"craftmax_desert"},
		sidelen = 16,
		fill_ratio = 0.004,
		decoration = api.modname .. ":cactus",
		height = 2,
		height_max = 4,
		y_min = 1,
		y_max = 120,
	})
end