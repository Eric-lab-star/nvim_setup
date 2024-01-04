require("telescopeConfig")
require("leap").create_default_mappings()
require("lang")
require("coc")
require("treesitterConfig")
require("autopairConfig")
require("go").setup()
require("icon-picker").setup({ disable_legacy_commands = true })
require("flutter-tools").setup({})
require("tabnineConfig")
require("noice").setup()
require("notify").setup({
	background_colour = "#000000",
	max_width = 100,
	timeout = 1000,
	stages = "static",
})
require("markConfig")
require("lualineConfig")
require("nvim-surround").setup()
require("tokyonightConfig")
require("tools")
require("mason").setup()
require("formatterConfig")
require("highlighterConfig")
