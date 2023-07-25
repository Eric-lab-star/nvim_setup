require("dashboard").setup({
    theme = 'hyper',
    config = {
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
                group = 'Label',
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
