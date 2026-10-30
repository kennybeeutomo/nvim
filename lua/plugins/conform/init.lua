local M = {}

function M.setup()
	require("conform").setup({
		formatters_by_ft = {
			html = { "prettier" },
		},

		default_format_opts = {
			lsp_format = "fallback"
		}
	})

	require("plugins.conform.mappings")
end

return M
