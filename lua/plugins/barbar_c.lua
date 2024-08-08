return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		keys = {
			{"<C-h>", "<cmd>BufferPrevious<CR>"},
 			{"<C-l>", "<cmd>BufferNext<CR>"},
 			{"<C-c>", "<Cmd>BufferClose<CR>"},
 			{"<M-h>", "<Cmd>BufferMovePrevious<CR>"},
 			{"<M-l>", "<Cmd>BufferMoveNext<CR>"},
 			{"<M-1>", "<cmd>BufferCloseAllButCurrent<cr>"},
		}
	},
}
