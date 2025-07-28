local M = {}

function M.setup()
	-- Set up nvim-cmp.
	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},

		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
			completion = {
				winblend = 10,
			},
			documentation = {
				winblend = 10,
			}
		},

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "lazydev", group_index = 0 },
		}, {
				{ name = "buffer" },
			}),
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
				{ name = "buffer" },
			})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		-- mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "nvim_lsp_document_symbol" },
		}, {
				{ name = "buffer" }
			})
	})

	-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
	cmp.setup.cmdline({ ":", "q:" }, {
		-- mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
				{ name = "cmdline" }
			}),
		matching = { disallow_symbol_nonprefix_matching = false },
	})

	-- If you want insert `(` after select function or method item
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done()
	)

	require("plugins.nvim-cmp.mappings")
end

return M
