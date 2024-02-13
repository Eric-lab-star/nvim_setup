-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

local function toggle()
	local root = vim.fn.getcwd()
	local api = require("nvim-tree.api")
	api.tree.toggle({ path = root, find_file = true, update_root = false, focus = true })
end

vim.keymap.set("n", "<C-\\>", toggle, { silent = true })
