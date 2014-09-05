local load_time_start = os.clock()
local function connect_glass(node, img)
	local tmp = minetest.registered_nodes[node]
	if not tmp then
		return
	end
	if tmp.tile_images then
		tmp.tile_images = img
	else
		tmp.tiles = img
	end
	tmp.drawtype = "glasslike_framed"
	minetest.register_node(":"..node, tmp)
end


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

for nd,tex in pairs(glass_list) do
	connect_glass(nd, tex)
end


minetest.register_node(":default:ice", {
	description = "Ice",
	tiles = {"connected_textures_ice.png"},
	is_ground_content = true,
	use_texture_alpha = true,
	paramtype = "light",
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})
print(string.format("[connected_textures] loaded after ca. %.2fs", os.clock() - load_time_start))
