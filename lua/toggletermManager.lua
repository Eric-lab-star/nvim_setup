require("toggleterm-manager").setup({
	titles = {
		prompt = "Pick Term",
		results = "Terminals",
	},
})
vim.keymap.set("n", "<leader>tt", "<cmd>Telescope toggleterm_manager<cr>", {})
