vim.keymap.set("t", "<Leader><ESC>", "<C-\\><C-n>", { noremap = true })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>s", "<Plug>(leap)")
vim.keymap.set("n", "<leader>S", "<Plug>(leap-from-window)")
vim.keymap.set({ "x", "o" }, "<leader>s", "<Plug>(leap-forward)")
vim.keymap.set({ "x", "o" }, "<leader>S", "<Plug>(leap-backward)")

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

require("bookmarks").setup({

	save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
	keywords = {
		["@t"] = " ", -- mark annotation startswith @t ,signs this icon as `Todo`
		["@w"] = " ", -- mark annotation startswith @w ,signs this icon as `Warn`
		["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
		["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
	},
	on_attach = function(bufnr)
		local bm = require("bookmarks")
		local map = vim.keymap.set
		map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
		map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
		map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
		map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
		map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
		map("n", "mx", bm.bookmark_clear_all) -- removes all bookmarks
	end,
})
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
require("harpoonconfig")
-- require("dapui").setup()
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
-- require("helpers")
require("cmpConfig")
-- require("markConfig")
require("luaSnipConfig")
require("dapConfig")
-- require("nvim-dap-virtual-text").setup()

--- for godot
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end
