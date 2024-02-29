require("neoclip").setup({
	history = 1000,
	continuous_sync = true,
	enable_persistent_history = true,
})

vim.keymap.set("n", "<leader>nc", "<cmd>Telescope neoclip<cr>", {})
vim.keymap.set("n", "<leader>nm", "<cmd>Telescope macroscope<cr>", {})

-- clear all history
-- :lua require('neoclip').clear_history()
