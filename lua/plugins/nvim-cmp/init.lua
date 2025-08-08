local M = {}

local cmp = require("cmp")

function M.setup()
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

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			-- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			{ name = "git" },
		}, {
			{ name = "buffer" },
		})
	})

	-- To make cmp work in cmdwin
	cmp.setup.filetype("vim", {
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" }
		}, {
			{ name = "buffer" }
		}),
	})

	cmp.setup.cmdline({ ":" }, {
		-- mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" }
		})
	})

	-- Insert `(` after select function or method item
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done()
	)

	require("plugins.nvim-cmp.mappings")
end

return M
