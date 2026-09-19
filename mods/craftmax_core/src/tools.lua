return function(api)
	minetest.register_tool(api.modname .. ":stone_pickaxe", {
		description = "Stone Pickaxe",
		inventory_image = api.colored_texture("#858c91"),
		tool_capabilities = {
			full_punch_interval = 1.2,
			max_drop_level = 1,
			groupcaps = {
				cracky = {times = {[1] = 4.0, [2] = 2.0, [3] = 1.0}, uses = 60, maxlevel = 1},
			},
			damage_groups = {fleshy = 3},
		},
	})
end