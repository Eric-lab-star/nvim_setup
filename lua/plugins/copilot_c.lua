return {
	"zbirenbaum/copilot.lua",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<M-l>",
				accept_word = false,
				accept_line = false,
				next = "<C-l>",
				prev = "<c-h>",
				dismiss = "<C-]>",
			},
		},
	},
	event = "InsertEnter",
}


