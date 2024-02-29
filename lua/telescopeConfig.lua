local builtin = require("telescope.builtin")
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
table.insert(vimgrep_arguments, "!**/node_modules/*")
table.insert(vimgrep_arguments, "!**/build/*")
table.insert(vimgrep_arguments, "!Flutter/**/ios/*")

local actions = require("telescope.actions")
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
