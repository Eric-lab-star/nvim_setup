return {
    'nvim-lualine/lualine.nvim',
		opts = {
		},
    dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
		config = function ()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
					disabled_filetypes = {},
					always_divide_middle = true
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff',
						{
							'diagnostics',
							sources = { "nvim_diagnostic" },
							symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
						}
					},
					lualine_c = {
						{
							require("noice").api.status.message.get,
							cond = require("noice").api.status.message.has,
						},
					},

					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},

				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { 'filename' },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				extensions = {}
			})
		end

}
