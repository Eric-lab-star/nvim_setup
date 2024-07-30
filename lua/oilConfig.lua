require("oil").setup({
	delete_to_trash = true,
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
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-v>"] = "actions.select_vsplit",
		["<C-h>"] = "actions.select_split",
		["<C-t>"] = "actions.select_tab",
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
})

local oil = require("oil")

local function open()
	local cwd = oil.get_current_dir()
	oil.open(cwd)
end

vim.keymap.set("n", "<C-\\>", open, {})
