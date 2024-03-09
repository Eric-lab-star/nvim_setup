require("nvim-treesitter.configs").setup({
	modules = {},
	ignore_install = {},
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "markdown", "cpp", "java", "javascript" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
	},
	textobjects = {
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["[p"] = "@parameter.inner",
				["]p"] = "@parameter.outer",
				["]f"] = "@function.outer",
				["]c"] = { query = "@class.outer", desc = "Next class start" },
				["[v"] = "@assignment.inner",
				["]d"] = "@conditional.outer",
				["]l"] = "@loop.outer",
				["]e"] = "@call.outer",
			},
			goto_next_end = {},
			goto_next = {},
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["id"] = { query = "@conditional.inner", desc = "Select inner part of condition" },
				["ad"] = { query = "@conditional.outer", desc = "Select outer part of condition" },
				["ae"] = "@call.outer",
				["al"] = "@loop.outer",
				["ap"] = "@parameter.outer",
			},
		},
	},
})
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, "<right>", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, "<left>", ts_repeat_move.repeat_last_move_previous)
