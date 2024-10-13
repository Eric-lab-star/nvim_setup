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
				prompts = {
					MyCustomPrompt = {
						-- prompt = "Explain how it works.",
						mapping = "<leader>ct",
						description = "My custom prompt description",
						selection = require("CopilotChat.select").visual,
					},
				},
			})
		end,

		cmd = {
			"CopilotChatToggle",
			"CopilotChat",
			"CopilotChatExplain",
			"CopilotChatMyCustomPrompt",
		},

		keys = {
			{ "<leader>ct", "<cmd>CopilotChatMyCustomPrompt<cr>" },
			{
				"<leader>cp",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
			},
		},
	},
}
