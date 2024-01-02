local function pwd()
	return tostring(vim.fn.getcwd(0))
end
require("lualine").setup{
	sections = {
		lualine_c={ pwd, 'filename'},
	},
	options = {
		theme = 'tokyonight'
	}
}


