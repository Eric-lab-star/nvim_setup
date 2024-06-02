-- Utilities for creating configurations
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })

autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

autocmd("CompleteDone", {
	command = ""
	
})

autocmd("BufWritePre", {
	group = "__formatter__",
	command = ":SqlFormat",
})
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		go = {
			function()
				return {
					exe = "goimports",
					args = {
						"-w",
					},
				}
			end,
		},
		python = {
			function()
				return {
					exe = "autopep8",
					args = {
						"--aggressive",
						"--aggressive",
						"-",
					},
					stdin = 1,
				}
			end,
		},
		cmake = {
			function()
				return {
					exe = "cmake-format",
					args = { "-" },
					stdin = true,
				}
			end,
		},
		kotlin = {
			require("formatter.filetypes.kotlin").ktlint,
		},
		groovy = {
			function()
				return {
					exe = "npm-groovy-lint",
					args = {
						"--format",
						"*.gradle",
					},
				}
			end,
		},
		json = { require("formatter.filetypes.json").prettier },

		css = { require("formatter.filetypes.css").prettier },
		html = { require("formatter.filetypes.html").prettier },
		lua = { require("formatter.filetypes.lua").stylua },
		javascript = { require("formatter.filetypes.javascript").prettier },
		markdown = { require("formatter.filetypes.markdown").prettier },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		java = { require("formatter.filetypes.java").clangformat },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
