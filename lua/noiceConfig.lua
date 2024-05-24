require("noice").setup()

vim.keymap.set("n", "<leader>nh", function()
	require("noice").cmd("telescope")
end)
