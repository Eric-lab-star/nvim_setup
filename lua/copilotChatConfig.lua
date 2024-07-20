local chat = require("CopilotChat")
vim.keymap.set("n", "<leader>cct", chat.toggle)
require("CopilotChat").setup({
	mappings = {
		complete = {
			detail = "Use @<Tab> or /<Tab> for options.",
			insert = "",
		},
	},

	window = {
		layout = "vertical",
		width = 0.3,
		height = 1,
	},
})
