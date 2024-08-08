return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		tag = "v2.12.1",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
			{ "nvim-telescope/telescope.nvim" },
		},
		opts = {
			debug = true, -- Enable debugging
			window = {
				layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
				width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
			},
		},
		keys = {
			{ "<leader>cct", "<cmd>CopilotChatOpen<cr>" },
			{
				"<leader>ccp",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
			},
		},
	},
}
