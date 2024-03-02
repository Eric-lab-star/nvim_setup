require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})
-- Setup language servers.

local lspconfig = require("lspconfig")

lspconfig.sqlls.setup({})
lspconfig.gopls.setup({})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {

				-- Make the server aware of Neovim runtime files
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.g.dart_format_on_save = true
vim.g.dart_html_in_string = true
vim.g.dart_style_guide = 2
