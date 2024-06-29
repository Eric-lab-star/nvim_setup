vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
	require("flash").jump({
		multi_window = true,
	})
end)
vim.keymap.set({ "n", "x", "o" }, "<leader>S", function()
	require("flash").treesitter()
end)
