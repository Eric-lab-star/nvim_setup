require("noice").setup()

vim.keymap.set("n", "<leader>nd", function()
	require("noice").cmd("dismiss")
end)
vim.keymap.set("n", "<leader>nh", function()
	require("noice").cmd("telescope")
end)
