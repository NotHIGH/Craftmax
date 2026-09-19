return function(api)
	minetest.register_craft({
		output = api.modname .. ":stick 4",
		recipe = {{api.modname .. ":log"}},
	})

	minetest.register_craft({
		output = api.modname .. ":stone_pickaxe",
		recipe = {
			{api.modname .. ":stone", api.modname .. ":stone", api.modname .. ":stone"},
			{"", api.modname .. ":stick", ""},
			{"", api.modname .. ":stick", ""},
		},
	})

	minetest.register_craft({
		output = api.modname .. ":campfire",
		recipe = {
			{api.modname .. ":stone", api.modname .. ":stone", api.modname .. ":stone"},
			{api.modname .. ":stone", api.modname .. ":stick", api.modname .. ":stone"},
			{api.modname .. ":stick", api.modname .. ":stick", api.modname .. ":stick"},
		},
	})
end