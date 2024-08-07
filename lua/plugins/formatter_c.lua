return {
	"mhartington/formatter.nvim",

	cmd = {
		"Format",
		"FormatWrite",
	},

	config = function()
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

				json = {
					function()
						return {
							exe = "clang-format",
							args = { "--style=Google", "--assume-filename=.json" },
							stdin = true,
						}
					end,
				},
				css = { require("formatter.filetypes.css").prettier },
				html = { require("formatter.filetypes.html").prettier },
				lua = { require("formatter.filetypes.lua").stylua },
				javascript = { require("formatter.filetypes.javascript").denofmt },
				-- markdown = { require("formatter.filetypes.markdown").prettier },
				cpp = { require("formatter.filetypes.cpp").clangformat },
				java = { require("formatter.filetypes.java").google_java_format },
				typescript = { require("formatter.filetypes.typescript").denofmt },
				typescriptreact = { require("formatter.filetypes.typescriptreact").denofmt },
				rust = { require("formatter.filetypes.rust").rustfmt },
			},
		})
	end,
}
