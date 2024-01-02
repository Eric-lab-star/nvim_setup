local api = vim.api
local M = {}
function M.setup(arg)
	local text = string.format("[%s](./src/%s.md)",arg, arg)
	-- api.nvim_buf_set_lines(0,0,0, {}, {text})
	api.nvim_put({text},"c",true, true) end

return M
