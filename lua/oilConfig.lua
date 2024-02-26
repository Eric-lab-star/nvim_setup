require("oil").setup({
	default_file_explorer = true,
	-- Id is automatically added at the beginning, and name at the end
	-- See :help oil-columns
	columns = {
		"icon",
		"size",
		"mtime",
	},
})

vim.keymap.set("n", "<C-\\>", "<cmd>Oil<cr>", {})
