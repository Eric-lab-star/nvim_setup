local key = vim.keymap
local opts = { noremap = true, silent = true }
key.set("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
key.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward)")
key.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward)")

key.set("n", "<S-C-h>", "<cmd>BufferPrevious<CR>")
key.set("n", "<S-C-l>", "<cmd>BufferNext<CR>")
key.set("n", "<M-c>", "<Cmd>BufferClose<CR>", opts)
key.set("n", "<M-<>", "<Cmd>BufferMovePrevious<CR>", opts)
key.set("n", "<M->>", "<Cmd>BufferMoveNext<CR>", opts)
key.set("n", "<M-1>", "<cmd>BufferClosAllButCurrent<cr>", opts)

---
require("leap.user").set_repeat_keys("<S-Enter>", "<S-Backspace>")

require("flash").setup({
	modes = {
		char = {
			enabled = true,
			jump_labels = true,
		},
	},
})

require("persistenceConfig")
require("nvim-tree").setup()
require("telescopeConfig")
require("lang")
require("treesitterConfig")
require("icon-picker").setup({ disable_legacy_commands = true })
require("flutter-tools").setup({})
require("todo-comments").setup()
require("noiceConfig")
require("notify").setup({
	max_width = 100,
	render = "wrapped-compact",
	timeout = 1000,
	stages = "fade_in_slide_out",
})
require("lualineConfig")
require("nvim-surround").setup()
require("tokyonightConfig")
require("formatterConfig")
-- require("harpoonconfig")
-- require("dapui").setup()
require("oilConfig")
require("toggleTermconfig")
require("neoclipConfig")
require("gitsignsConfig")
require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
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
-- require("helpers")
require("cmpConfig")
require("markConfig")
require("luaSnipConfig")
require("dapConfig")
-- require("nvim-dap-virtual-text").setup()

--- for godot
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end
