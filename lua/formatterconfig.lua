-- Utilities for creating configurations
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

-- Formatter
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		go = { require("formatter.filetypes.go").goimports },
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
		gdscript = {
			function()
				return {
					exe = "gdformat",
					args = {
						"-",
					},
					stdin = 1,
				}
			end,
		},

		json = { require("formatter.filetypes.json").prettier },
		css = { require("formatter.filetypes.css").prettier },
		html = { require("formatter.filetypes.html").prettier },
		lua = { require("formatter.filetypes.lua").stylua },
		javascript = { require("formatter.filetypes.javascript").denofmt },
		markdown = { require("formatter.filetypes.markdown").prettier },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		java = { require("formatter.filetypes.java").clangformat },
		typescript = { require("formatter.filetypes.typescript").denofmt },
		typescriptreact = { require("formatter.filetypes.typescriptreact").denofmt },
		rust = { require("formatter.filetypes.rust").rustfmt },
	},
})
