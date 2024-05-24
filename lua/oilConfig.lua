require("oil").setup({
	default_file_explorer = true,
	-- Id is automatically added at the beginning, and name at the end
	-- See :help oil-columns
	columns = {
		"icon",
		"size",
		"mtime",
	},
	float = { -- Padding around the floating window
		padding = 2,
		max_width = 64,
		max_height = 40,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
})

local oil = require("oil")

local function toggleFloat()
	local cwd = oil.get_current_dir()
	oil.toggle_float(cwd)
end

vim.keymap.set("n", "<C-\\>", toggleFloat, {})
