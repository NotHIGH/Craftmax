local modpath = minetest.get_modpath(minetest.get_current_modname())
local srcpath = modpath .. "/../../src"
local api = dofile(srcpath .. "/api.lua")

for _, module_name in ipairs({
	"nodes",
	"items",
	"tools",
	"crafting",
	"world",
	"trees",
	"survival",
}) do
	dofile(srcpath .. "/" .. module_name .. ".lua")(api)
end
