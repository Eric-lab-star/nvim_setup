-- Lua
return {
	"folke/persistence.nvim",
	config = function()
		require("persistence").setup({
			dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
			need = 1,
			branch = true, -- use git branch to save session
		})
		vim.keymap.set("n", "<leader>ss", "<cmd>lua require('persistence').load()<CR>", { noremap = true, silent = true })
			
	end,
}
