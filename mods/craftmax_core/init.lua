local modpath = minetest.get_modpath(minetest.get_current_modname())
local api = dofile(modpath .. "/src/api.lua")

for _, module_name in ipairs({
	"nodes",
	"items",
	"tools",
	"crafting",
	"world",
	"survival",
}) do
	dofile(modpath .. "/src/" .. module_name .. ".lua")(api)
end
