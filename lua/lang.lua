-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.sqlls.setup{}
lspconfig.tailwindcss.setup{}
lspconfig.rust_analyzer.setup {}
lspconfig.java_language_server.setup{
	cmd = {"/Users/kyungsubkim/java/java-language-server/dist/lang_server_mac.sh"}
}
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.gopls.setup {}
-- lspconfig.dartls.setup {}
lspconfig.tsserver.setup {}
lspconfig.lua_ls.setup {}

vim.g.dart_format_on_save = true
vim.g.dart_html_in_string = true
vim.g.dart_style_guide = 2

