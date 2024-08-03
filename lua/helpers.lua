-- vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
-- 	pattern = { "*.*" },
-- 	desc = "save view (folds), when closing file",
-- 	command = "mkview",
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
-- 	pattern = { "*.*" },
-- 	desc = "load view (folds), when opening file",
-- 	command = "silent! loadview",
-- })


local api = vim.api

local function write_current_date()
    local current_date = os.date('%Y-%m-%d')
    local buf = api.nvim_get_current_buf()
    local pos = api.nvim_win_get_cursor(0)
    api.nvim_buf_set_lines(buf, pos[1], pos[1], false, {tostring(current_date)})
end

-- api.nvim_command('command! -nargs=0 Date :lua write_current_date()')
api.nvim_create_user_command('Date', write_current_date,{})

