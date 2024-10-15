return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		tag = "v2.12.1",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("CopilotChat").setup({
				debug = false, -- Enable debugging
				window = {
					layout = "replace", -- 'vertical', 'horizontal', 'float', 'replace'
					width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
				},
				prompts = {},
			})
		end,

		vim.keymap.set("n", "<leader>ct", "<cmd>CopilotChat<cr>"),
	},
}
