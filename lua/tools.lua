local api = vim.api
local M = {}
function M.setup()
	api.nvim_buf_set_lines(0, 1, 0, {}, {"hello world"})
end

return M
