require("nvim-treesitter.configs").setup({

	modules = {},
	ignore_install = {},
	ensure_installed = {
		"typescript",
		"xml",
		"yaml",
		"c",
		"lua",
		"vim",
		"vimdoc",
		"go",
		"markdown",
		"cpp",
		"java",
		"javascript",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
	},
	textobjects = {
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			--  start inner - [
			--  start outer - ]
			--  end inner - ;
			--  end outer - '
			--  next - small
			--  prev - big
			goto_next_start = {
				["sip"] = "@parameter.inner",
				["sop"] = "@parameter.outer",
				["sof"] = "@function.outer",
				["sif"] = "@function.inner",
				["soc"] = { query = "@class.outer", desc = "Next class start" },
				["sic"] = { query = "@class.inner", desc = "Next class end" },
				["siv"] = "@assignment.inner",
				["sov"] = "@assignment.outer",
				["sod"] = "@conditional.outer",
				["sid"] = "@conditional.inner",
				["sol"] = "@loop.outer",
				["sil"] = "@loop.inner",
				["soe"] = "@call.outer",
				["sie"] = "@call.inner",
			},
			goto_next_end = {
				["eip"] = "@parameter.inner",
				["eop"] = "@parameter.outer",
				["eif"] = "@function.inner",
				["eof"] = "@function.outer",
				["eoc"] = { query = "@class.outer", desc = "Next class start" },
				["eic"] = { query = "@class.inner", desc = "Next class end" },
				["eiv"] = "@assignment.inner",
				["eov"] = "@assignment.outer",
				["eod"] = "@conditional.outer",
				["eid"] = "@conditional.inner",
				["eol"] = "@loop.outer",
				["eil"] = "@loop.inner",
				["eoe"] = "@call.outer",
				["eie"] = "@call.inner",
			},
			goto_previous_end = {
				["eiP"] = "@parameter.inner",
				["eoP"] = "@parameter.outer",
				["eoF"] = "@function.outer",
				["eiF"] = "@function.inner",
				["eoC"] = { query = "@class.outer", desc = "Next class start" },
				["eiC"] = { query = "@class.inner", desc = "Next class end" },
				["eiV"] = "@assignment.inner",
				["eoV"] = "@assignment.outer",
				["eoD"] = "@conditional.outer",
				["eiD"] = "@conditional.inner",
				["eoL"] = "@loop.outer",
				["eiL"] = "@loop.inner",
				["eoE"] = "@call.outer",
				["eiE"] = "@call.inner",
			},
			goto_previous_start = {
				["siP"] = "@parameter.inner",
				["soP"] = "@parameter.outer",
				["soF"] = "@function.outer",
				["siF"] = "@function.inner",
				["soC"] = { query = "@class.outer", desc = "Next class start" },
				["siC"] = { query = "@class.inner", desc = "Next class end" },
				["siV"] = "@assignment.inner",
				["soV"] = "@assignment.outer",
				["soD"] = "@conditional.outer",
				["siD"] = "@conditional.inner",
				["soL"] = "@loop.outer",
				["siL"] = "@loop.inner",
				["soE"] = "@call.outer",
				["siE"] = "@call.inner",
			},
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
				["ip"] = "@parameter.inner",
			},
		},
	},
})
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, "<right>", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, "<left>", ts_repeat_move.repeat_last_move_previous)
