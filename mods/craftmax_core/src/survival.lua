return function(api)
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
end