return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"luckasRanarison/tailwind-tools.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					before = require("tailwind-tools.cmp").lspkind_format,
					mode = "symbol_text",
					maxwidth = 60,
					ellipsis_char = "...",
					show_labelDetails = true,
					preset = "codicons",
					symbol_map = {
						Copilot = "",
					},
				}),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			mapping = {
				["<C-e>"] = cmp.mapping.abort(),
				["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
				["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
				["<TAB>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "s", "i" }),
			},
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "path" },
				{ name = "nvim_lua" },
				{ name = "lazydev", group_index = 0 },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		--- hide copilot suggestion when menu is opened
		cmp.event:on("menu_opened", function()
			vim.b.copilot_suggestion_hidden = true
		end)

		cmp.event:on("menu_closed", function()
			vim.b.copilot_suggestion_hidden = false
		end)
	end,
}
