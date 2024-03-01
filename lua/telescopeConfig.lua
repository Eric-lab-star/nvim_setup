local builtin = require("telescope.builtin")
local telescope = require("telescope")
local action_state = require("telescope.actions.state")
local action_utils = require("telescope.actions.utils")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local finders = require("telescope.finders")

-- Clone the default Telescope configuration
local vimgrep_arguments =
	{ "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/node_modules/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/build/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!Flutter/**/ios/*")

telescope.setup({
	extensions = {
		coc = {
			theme = "ivy",
			prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
		},
	},
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer + actions.move_to_top,
				},
			},
		},
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--glob",
				"!**/node_modules/*",
				"--glob",
				"!**/.git/*",
				"--glob",
				"!**/ios/*",
				"--glob",
				"!**/build/*",
				"--glob",
				"!**/android/*",
				"--glob",
				"!**/macos/*",
				"--glob",
				"!**/web/*",
				"--glob",
				"!**/windows/*",
				"--glob",
				"!**/linux/*",
				"--glob",
				"!**/.dart_tool/*",
			},
		},
		oldfiles = {},
	},
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- notify
require("telescope").load_extension("notify")

-- dap
require("telescope").load_extension("dap")

-- fzf
require("telescope").load_extension("fzf")

-- goimpl
require("telescope").load_extension("goimpl")

vim.api.nvim_set_keymap(
	"n",
	"<leader>im",
	[[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
	{ noremap = true, silent = true }
)

-- bookmark
require("telescope").load_extension("bookmarks")

-- coc
require("telescope").load_extension("coc")

-- harpoon mark
-- telescope.load_extension("harpoon")

-- harpoon
local harpoon = require("harpoon")
harpoon:setup({})

local generate_new_finder = function()
	local harpoon_files = harpoon:list()
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end
	return finders.new_table({
		results = file_paths,
	})
end

local deleteHarpoon = function(prompt_bufnr)
	local confirmation = vim.fn.input(string.format("Delete current bullet(s)? [y/n]: "))
	if string.len(confirmation) == 0 or string.sub(string.lower(confirmation), 0, 1) ~= "y" then
		print(string.format("Didn't delete bullet"))
		return
	end

	local selection = action_state.get_selected_entry()
	harpoon:list():removeAt(selection.index)

	local function get_selections()
		local results = {}
		action_utils.map_selections(prompt_bufnr, function(entry)
			table.insert(results, entry)
		end)
		return results
	end

	local selections = get_selections()
	for _, current_selection in ipairs(selections) do
		harpoon:list():removeAt(current_selection.index)
	end

	local current_picker = action_state.get_current_picker(prompt_bufnr)
	current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

-- basic telescope configuration
local function toggle_telescope()
	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = generate_new_finder(),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(_, map)
				map("n", "<c-d>", deleteHarpoon)
				map("i", "<c-d>", deleteHarpoon)
				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "<C-h>", function()
	toggle_telescope()
end, { desc = "Open harpoon window" })
