require("telescopeConfig")

vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward)")

require("leap").add_repeat_mappings(";", ",", {
	relative_directions = true,
	modes = { "n", "x", "o" },
})
require("lang")
require("coc")
require("treesitterConfig")
require("go").setup()
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

require("render-markdown").setup({})
require("dapui").setup()
require("oilConfig")
require("toggleTermconfig")
require("neoclipConfig")
require("gitsignsConfig")
require("Comment").setup()
require("ibl").setup()
require("copilot").setup({})

local chat = require("CopilotChat")
vim.keymap.set("n", "<leader>cct", chat.toggle)
require("CopilotChat").setup({
	mappings = {
		complete = {
			detail = "Use @<Tab> or /<Tab> for options.",
			insert = "<C-f>",
		},
	},
	debug = false, -- Enable debugging
	-- See Configuration section for rest
	window = {
		layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
		width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
		height = 0.8, -- fractional height of parent, or absolute height in rows when > 1
		-- Options below only apply to floating windows
		relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
		border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
		row = 4, -- row position of the window, default is centered
		col = nil, -- column position of the window, default is centered
		title = "Copilot Chat", -- title of chat window
		footer = nil, -- footer of chat window
		zindex = 1, -- determines if window is on top or below other floating windows
	},
})
require("im_select").setup({
	default_im_select = "org.youknowone.inputmethod.Gureum.system",
	default_command = "im-select",
	set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
	set_previous_events = { "InsertEnter" },
	keep_quiet_on_no_binary = false,
	async_switch_im = true,
})
