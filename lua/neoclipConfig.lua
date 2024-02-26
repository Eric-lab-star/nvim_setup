require("neoclip").setup({
	continuous_sync = true,
	enable_persistent_history = true,
})

vim.keymap.set("n", "<leader>nc", "<cmd>Telescope neoclip<cr>", {})
