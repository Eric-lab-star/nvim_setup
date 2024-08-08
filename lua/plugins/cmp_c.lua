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
		"zbirenbaum/copilot-cmp",
	},

	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local copilot_cmp = require("copilot_cmp").setup()

		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
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
					require("copilot_cmp.comparators").prioritize,

					-- Below is the default comparitor list and order for nvim-cmp
					cmp.config.compare.offset,
					-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
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
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "s", "i" }),
			},
			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
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

		cmp.event:on("menu_opened", function()
			vim.b.copilot_suggestion_hidden = true
		end)

		cmp.event:on("menu_closed", function()
			vim.b.copilot_suggestion_hidden = false
		end)
	end,
}
