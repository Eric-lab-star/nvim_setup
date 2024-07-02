require("flash").setup({

	modes = {
		search = {
			enabled = true,
		},
		char = {
			enabled = true,
			jump_labels = true,
		},
	},
})

vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
	require("flash").jump({
		multi_window = true,
		mode = {
			char = {
				jump_labels = true,
			},
		},
	})
end)

vim.keymap.set({ "n", "x", "o" }, "<leader>S", function()
	require("flash").treesitter()
end)
