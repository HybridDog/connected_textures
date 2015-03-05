local load_time_start = os.clock()

local glass_list = {
	["default:glass"] = {"default_glass.png", "connected_textures_glass_stripes.png"},
	["default:obsidian_glass"] = {"default_obsidian_glass.png", "connected_textures_invisible.png"},

	["moreblocks:iron_glass"] = {"moreblocks_iron_glass.png", "connected_textures_iron_glass_stripes.png"},
	["moreblocks:coal_glass"] = {"moreblocks_coal_glass.png", "connected_textures_coal_glass_stripes.png"},
	["moreblocks:clean_glass"] = {"moreblocks_clean_glass.png", "connected_textures_invisible.png"},
	["moreblocks:trap_glass"] = {"moreblocks_trap_glass.png", "connected_textures_glass_stripes.png"},
	["moreblocks:super_glow_glass"] = {"moreblocks_super_glow_glass.png", "connected_textures_glow_glass_stripes.png"},

	["titanium:glass"] = {"titanium_glass.png", "connected_textures_titanium_glass_stripes.png"},
}

for node,img in pairs(glass_list) do
	if minetest.registered_nodes[node] then
		minetest.override_item(node, {tiles = img, drawtype = "glasslike_framed"})
	end
end

print(string.format("[connected_textures] loaded after ca. %.2fs", os.clock() - load_time_start))
