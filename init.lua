local load_time_start = os.clock()

local glass_list = {
	["moreblocks:iron_glass"] = "connected_textures_iron_glass_stripes.png",
	["moreblocks:coal_glass"] = "connected_textures_coal_glass_stripes.png",
	["moreblocks:clean_glass"] = "connected_textures_invisible.png",
	["moreblocks:trap_glass"] = "connected_textures_glass_stripes.png",
	["moreblocks:super_glow_glass"] = "connected_textures_glow_glass_stripes.png",
}

for node,img in pairs(glass_list) do
	local def = minetest.registered_nodes[node]
	if def
	and def.drawtype == "glasslike" then
		def.tiles[2] = img
		minetest.override_item(node, {tiles = def.tiles, drawtype = "glasslike_framed_optional"})
	end
end

--[[
local bookshelf = minetest.registered_nodes["default:bookshelf"]
if bookshelf then
	bookshelf.tiles[2] = "connected_textures_bookshelf_middle.png"
	minetest.override_item(node, {tiles = def.tiles, drawtype = "glasslike_framed_optional", paramtype = "light"})
end--]]

local time = math.floor(tonumber(os.clock()-load_time_start)*100+0.5)/100
local msg = "[connected_textures] loaded after ca. "..time
if time > 0.05 then
	print(msg)
else
	minetest.log("info", msg)
end
