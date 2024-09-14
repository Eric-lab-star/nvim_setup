return {
	"zbirenbaum/copilot.lua",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = false,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<Right>",
				accept_word = false,
				accept_line = false,
				next = "<C-l>",
				prev = "<c-h>",
				dismiss = "<Left>"
			},
		},
	},
	event = "InsertEnter",
}


