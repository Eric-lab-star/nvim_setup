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
require("formatterConfig")
require("harpoonconfig")

require("leap").add_repeat_mappings(";", ",", {
	relative_directions = true,
	modes = { "n", "x", "o" },
})

require("dapui").setup()
require("oilConfig")

require("toggleterm").setup({
	open_mapping = [[<c-t>]],
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})
require("neoclipConfig")
require("auto-save").setup({})

vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
