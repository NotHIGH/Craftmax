local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

local function colored_texture(color)
	return "blank.png^[colorize:" .. color .. ":255"
end

local function register_cube(name, description, color, groups, sounds)
	minetest.register_node(modname .. ":" .. name, {
		description = description,
		tiles = {colored_texture(color)},
		groups = groups,
		sounds = sounds,
	})
end

local wood_groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2}
local stone_groups = {cracky = 3, stone = 1}

register_cube("grass", "Grass Block", "#6b9f45", {crumbly = 3, soil = 1})
register_cube("dirt", "Dirt", "#76502f", {crumbly = 3, soil = 1})
register_cube("stone", "Stone", "#747b80", stone_groups)
register_cube("sand", "Sand", "#d6b36a", {crumbly = 3, falling_node = 1})
register_cube("log", "Forest Log", "#80522f", wood_groups)
register_cube("leaves", "Forest Leaves", "#3f7d3d", {snappy = 3, leafdecay = 3, flammable = 2})
register_cube("coal_ore", "Coal Ore", "#35383b", stone_groups)

minetest.register_node(modname .. ":campfire", {
	description = "Campfire",
	tiles = {colored_texture("#d87932")},
	light_source = 12,
	damage_per_second = 1,
	groups = {crumbly = 2, flammable = 1},
})

minetest.register_craftitem(modname .. ":apple", {
	description = "Wild Apple",
	inventory_image = colored_texture("#c94336"),
	stack_max = 99,
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem(modname .. ":stick", {
	description = "Stick",
	inventory_image = colored_texture("#a97843"),
	stack_max = 99,
})

minetest.register_tool(modname .. ":stone_pickaxe", {
	description = "Stone Pickaxe",
	inventory_image = colored_texture("#858c91"),
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level = 1,
		groupcaps = {
			cracky = {times = {[1] = 4.0, [2] = 2.0, [3] = 1.0}, uses = 60, maxlevel = 1},
		},
		damage_groups = {fleshy = 3},
	},
})

minetest.register_craft({
	output = modname .. ":stick 4",
	recipe = {{modname .. ":log"}},
})

minetest.register_craft({
	output = modname .. ":stone_pickaxe",
	recipe = {
		{modname .. ":stone", modname .. ":stone", modname .. ":stone"},
		{"", modname .. ":stick", ""},
		{"", modname .. ":stick", ""},
	},
})

minetest.register_craft({
	output = modname .. ":campfire",
	recipe = {
		{modname .. ":stone", modname .. ":stone", modname .. ":stone"},
		{modname .. ":stone", modname .. ":stick", modname .. ":stone"},
		{modname .. ":stick", modname .. ":stick", modname .. ":stick"},
	},
})

minetest.register_on_mods_loaded(function()
	minetest.register_biome({
		name = "craftmax_plains",
		node_top = modname .. ":grass",
		depth_top = 1,
		node_filler = modname .. ":dirt",
		depth_filler = 3,
		node_stone = modname .. ":stone",
		y_min = 1,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_ore({
		ore_type = "scatter",
		ore = modname .. ":coal_ore",
		wherein = {modname .. ":stone"},
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 4,
		clust_size = 3,
		y_min = -31000,
		y_max = 0,
	})
end)

local hunger_timer = 0
local hunger_hud = {}

local function get_hunger(player)
	local value = tonumber(player:get_meta():get("craftmax_hunger"))
	return value or 100
end

local function set_hunger(player, value)
	value = math.max(0, math.min(100, value))
	player:get_meta():set_int("craftmax_hunger", value)
	local hud_id = hunger_hud[player:get_player_name()]
	if hud_id then
		player:hud_change(hud_id, "text", "Hunger: " .. value .. "%")
	end
end

minetest.register_on_joinplayer(function(player)
	local meta = player:get_meta()
	if meta:get("craftmax_hunger") == "" then
		meta:set_int("craftmax_hunger", 100)
	end

	hunger_hud[player:get_player_name()] = player:hud_add({
		hud_elem_type = "text",
		position = {x = 0.02, y = 0.08},
		text = "Hunger: " .. get_hunger(player) .. "%",
		scale = {x = 100, y = 20},
		style = 1,
		color = "#f4d35e",
	})
end)

minetest.register_on_leaveplayer(function(player)
	hunger_hud[player:get_player_name()] = nil
end)

minetest.register_globalstep(function(dtime)
	hunger_timer = hunger_timer + dtime
	if hunger_timer < 30 then
		return
	end
	hunger_timer = 0

	for _, player in ipairs(minetest.get_connected_players()) do
		local hunger = get_hunger(player) - 1
		set_hunger(player, hunger)
		if hunger == 0 then
			player:set_hp(player:get_hp() - 1, {reason = "starvation"})
		end
	end
end)

minetest.register_chatcommand("hunger", {
	params = "",
	description = "Show your current hunger",
	privs = {},
	func = function(name)
		local player = minetest.get_player_by_name(name)
		return true, "Hunger: " .. get_hunger(player) .. "%"
	end,
})
