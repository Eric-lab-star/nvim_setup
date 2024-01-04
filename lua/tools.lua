local api = vim.api
local M = {}
function M.setup(arg)
	local text = string.format("[%s](./src/%s.md)", arg, arg)
	api.nvim_put({ text }, "c", true, true)
end


return M
