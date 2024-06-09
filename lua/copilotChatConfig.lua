local chat = require("CopilotChat")
vim.keymap.set("n", "<leader>cct", chat.toggle)
require("CopilotChat").setup({
	mappings = {
		complete = {
			detail = "Use @<Tab> or /<Tab> for options.",
			insert = "",
		},
	},
})
