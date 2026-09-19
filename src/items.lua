return function(api)
	minetest.register_craftitem(api.modname .. ":apple", {
		description = "Wild Apple",
		inventory_image = api.colored_texture("#c94336"),
		stack_max = 99,
		on_use = minetest.item_eat(6),
	})

	minetest.register_craftitem(api.modname .. ":stick", {
		description = "Stick",
		inventory_image = api.colored_texture("#a97843"),
		stack_max = 99,
	})
end