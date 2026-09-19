local modname = minetest.get_current_modname()

local function colored_texture(color)
	return "blank.png^[colorize:" .. color .. ":255"
end

local function texture(name)
	return "craftmax_" .. name .. ".png"
end

local function register_cube(name, description, color, groups, sounds)
	minetest.register_node(modname .. ":" .. name, {
		description = description,
		tiles = {colored_texture(color)},
		groups = groups,
		sounds = sounds,
	})
end

return {
	modname = modname,
	colored_texture = colored_texture,
	texture = texture,
	register_cube = register_cube,
}