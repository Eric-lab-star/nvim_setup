local key = vim.keymap
key.set("n", "<leader>qs", function()
	require("persistence").load()
end)

-- select a session to load
key.set("n", "<leader>qS", function()
	require("persistence").select()
end)

-- load the last session
key.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end)

-- stop Persistence => session won't be saved on exit
key.set("n", "<leader>qd", function()
	require("persistence").stop()
end)

require("persistence").setup({
	dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
	-- minimum number of file buffers that need to be open to save
	-- Set to 0 to always save
	need = 1,
	branch = true, -- use git branch to save session

	pre_save = function()
		vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
	end,
})
