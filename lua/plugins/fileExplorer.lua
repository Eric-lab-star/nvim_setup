return {
	{
	  'stevearc/oil.nvim',
	  opts = {},
	  layz = true,
	  -- Optional dependencies
	  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	  keys = {
		  {"<C-\\>", "<CMD>Oil<CR>", desc = "Open Oil"}
	  }
	}
}
