require("telescopeConfig")
require("leap").create_default_mappings()
require("lang")
require("coc")
require("treesitterConfig")
require("go").setup()
require("icon-picker").setup({ disable_legacy_commands = true })
require("flutter-tools").setup({})
require("tabnineConfig")
require("noice").setup({
	messages = {
		enabled = false,
	},
})
require("notify").setup({
	background_colour = "#000000",
	max_width = 100,
	timeout = 1000,
	stages = "static",
})
require("lualineConfig")
require("nvim-surround").setup()
require("tokyonightConfig")
require("tools")
require("mason").setup()
require("formatterConfig")
require("harpoonconfig")

require("leap").add_repeat_mappings(";", ",", {
	-- False by default. If set to true, the keys will work like the
	-- native semicolon/comma, i.e., forward/backward is understood in
	-- relation to the last motion.
	relative_directions = true,
	-- By default, all modes are included.
	modes = { "n", "x", "o" },
})

require("nvimtreeConfig")
