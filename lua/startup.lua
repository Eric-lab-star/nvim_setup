require("dashboard").setup({
    theme = 'hyper',
    config = {
		week_header = {
			enable = true,
		},
        shortcut = {
            {desc = ' Config', action = 'new ~/.config/nvim', key = 'c'},
            {
                desc = '󰊳 Update',
                group = '@property',
                action = 'PlugUpdate',
                key = 'u'
            }, {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
				action = 'Telescope find_files',
                group = 'Label',
				key = 'f',
            }, {
                desc = ' Apps',
                group = 'DiagnosticHint',
                action = 'Telescope app',
                key = 'a'
            }, {
                desc = ' dotfiles',
                group = 'Number',
            }
        }
    }
})
