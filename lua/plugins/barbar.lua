return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		opts = {},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		config = function ()
			require('barbar').setup({
				icons = {
					preset = "slanted"
				}
			});
			vim.keymap.set("n","<c-h>","<cmd>BufferPrevious<cr>")
 			vim.keymap.set("n","<C-l>", "<cmd>BufferNext<CR>")
 			vim.keymap.set("n","<C-c>", "<Cmd>BufferClose<CR>")
 			vim.keymap.set("n","<M-h>", "<Cmd>BufferMovePrevious<CR>")
 			vim.keymap.set("n","<M-l>", "<Cmd>BufferMoveNext<CR>")
 			vim.keymap.set("n","<M-1>", "<cmd>BufferCloseAllButCurrent<cr>")
		end,
	},
}
