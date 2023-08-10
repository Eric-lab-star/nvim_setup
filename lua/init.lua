require('telescopeConfig')
require('lang')
require('coc')
require('treesitterConfig')
require('autopairConfig')
require('nvimtreeConfig')
require('goConfig')
require('structrue')
require("icon-picker").setup({disable_legacy_commands = true})
require("noice").setup()
require("startup")
require("flutter-tools").setup {}
require("notify").setup{
	background_colour = "#000000",
}

require("grappleConfig")
require("lualine").setup{}
require("markConfig")

