vim.keymap.set("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
vim.keymap.set("n", "M-d", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })

---
require("telescopeConfig")
require("flashConfig")
require("lang")
-- require("coc")
require("treesitterConfig")
-- require("go").setup()
require("icon-picker").setup({ disable_legacy_commands = true })
require("flutter-tools").setup({})
require("todo-comments").setup()
require("noiceConfig")
require("notify").setup({
	-- background_colour = "#000000",
	max_width = 100,
	render = "wrapped-compact",
	timeout = 1000,
	stages = "fade_in_slide_out",
})
require("lualineConfig")
require("nvim-surround").setup()
require("tokyonightConfig")
require("formatterConfig")
require("harpoonconfig")
require("dapui").setup()
require("oilConfig")
require("toggleTermconfig")
require("neoclipConfig")
require("gitsignsConfig")
require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
require("ibl").setup()
require("copilot").setup({})
require("copilotChatConfig")

require("ts_context_commentstring").setup()
vim.g.skip_ts_context_commentstring_module = true

require("im_select").setup({
	default_im_select = "org.youknowone.inputmethod.Gureum.system",
	default_command = "im-select",
	set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
	set_previous_events = { "InsertEnter" },
	keep_quiet_on_no_binary = false,
	async_switch_im = true,
})
require("helpers")
require("cmpConfig")
require("markConfig")
require("luaSnipConfig")
require("dapConfig")

--- for godot
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end
