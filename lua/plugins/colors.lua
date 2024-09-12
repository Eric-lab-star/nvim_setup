return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,

		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "night",
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					-- colors.hint = colors.orange
					-- colors.error = "#ff0000"
				end,
				transparent = true

			})
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
