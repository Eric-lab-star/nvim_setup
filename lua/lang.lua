-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.sqlls.setup{}
lspconfig.gopls.setup{}
lspconfig.lua_ls.setup{}

vim.g.dart_format_on_save = true
vim.g.dart_html_in_string = true
vim.g.dart_style_guide = 2

