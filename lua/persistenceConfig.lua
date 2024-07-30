local key = vim.keymap
key.set("n", "<leader>qs", function()
	require("persistence").load()
end)

require("persistence").setup({
	dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
	-- minimum number of file buffers that need to be open to save
	-- Set to 0 to always save
	need = 0,
	branch = true, -- use git branch to save session

	pre_save = function()
		vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
	end,
})
