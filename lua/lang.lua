local key = vim.keymap
local opt = {noremap = true}
key.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
key.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
key.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
key.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
key.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
key.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
key.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
key.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.kotlin_language_server.setup({
	capabilities = capabilities,
})
lspconfig.gdscript.setup({
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
		},
	},
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

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			completion = {
				autoRequire = true,
				callSnippet = "Both",
			},
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				disable = { "lowercase-global" },
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = {
					"/usr/local/share/nvim/runtime/lua",
				},
				checkThirdParty = true,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.g.dart_format_on_save = true
vim.g.dart_html_in_string = true
vim.g.dart_style_guide = 2

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
