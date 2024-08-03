require("helpers")

require("flash").setup({
	modes = {
		char = {
			jump_labels = true,
		},
	},
})


require("nvim-tree").setup()
require("telescopeConfig")
require("lang")
--
require("treesitterConfig")
require("icon-picker").setup({ disable_legacy_commands = true })
require("todo-comments").setup()
require("lualineConfig")
require("nvim-surround").setup()
require("tokyonightConfig")
require("formatterConfig")
require("oilConfig")
require("toggleTermconfig")
require("neoclipConfig")
require("gitsignsConfig")
require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
--- copilot
require("copilotChatConfig")
require("copilotConfig")

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
-- cmp 
require("cmpConfig")
require("markConfig")
require("luaSnipConfig")
require("dapConfig")
require("persistenceConfig")

--- lua ls

--- for godot
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.uv.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end

local key = vim.keymap
local opts = { noremap = true, silent = true }
key.set("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

--buffer
key.set("n", "<C-h>", "<cmd>BufferPrevious<CR>")
key.set("n", "<C-l>", "<cmd>BufferNext<CR>")
key.set("n", "<C-c>", "<Cmd>BufferClose<CR>", opts)
key.set("n", "<M-,>", "<Cmd>BufferMovePrevious<CR>", opts)
key.set("n", "<M-.>", "<Cmd>BufferMoveNext<CR>", opts)
key.set("n", "<M-1>", "<cmd>BufferClosAllButCurrent<cr>", opts)
-- flash

local f = require("flash")
local function jump ()
	f.jump()
end

key.set({"n", "x", "o"}, "s", jump,  opts)
