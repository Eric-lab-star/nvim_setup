return {
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {
				"icon",
			},
			delete_to_trash = true,
			prompt_save_on_select_new_entry = true,
			view_options = {
				show_hidden = true,
			}
		},

		-- Optional dependencies
		dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
		keys = {
			{ "<C-\\>", "<CMD>Oil<CR>", desc = "Open Oil" },
		},
	},
}
