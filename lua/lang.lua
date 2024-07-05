local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("neodev").setup({
	-- add any options here, or leave empty to use the default settings
})
-- Setup language servers.

local lspconfig = require("lspconfig")

lspconfig.kotlin_language_server.setup({
	capabilities = capabilities,
})
lspconfig.gdscript.setup({
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
})

lspconfig.sqlls.setup({
	capabilities = capabilities,
})
lspconfig.gopls.setup({
	capabilities = capabilities,
})
lspconfig.gradle_ls.setup({
	capabilities = capabilities,
	cmd = {
		"gradle-language-server",
	},
})

lspconfig.jdtls.setup({
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
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

--add missing imports and remove unused imports for TS
-- @return boolean
local function format_ts_imports()
	lspconfig.tsserver.setup({})
	local params = vim.lsp.util.make_range_params()
	params.context = {
		only = { "source.addMissingImports.ts", "source.removeUnused.ts" },
	}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.kind == "source.addMissingImports.ts" then
				vim.lsp.buf.code_action({
					apply = true,
					context = {
						only = { "source.addMissingImports.ts" },
					},
				})
				vim.cmd("write")
			else
				if r.kind == "source.removeUnused.ts" then
					vim.lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source.removeUnused.ts" },
						},
					})
					vim.cmd("write")
				end
			end
		end
	end
	return true
end

vim.api.nvim_create_user_command("FormatTSImports", format_ts_imports, {})
