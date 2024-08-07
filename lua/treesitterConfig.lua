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
		"rust",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
	},
	textobjects = {
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

