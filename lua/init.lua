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

require("auto-save").setup({
	trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
	-- function that determines whether to save the current buffer or not
	-- return true: if buffer is ok to be saved
	-- return false: if it's not ok to be saved
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
})
