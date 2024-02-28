require("toggleterm-manager").setup({
	titles = {
		prompt = "Pick Term",
		results = "Terminals",
	},
})
vim.keymap.set("n", "<C-t>", "<cmd>Telescope toggleterm_manager<cr>", {})
