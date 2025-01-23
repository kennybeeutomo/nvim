local M = {}

function M.setup()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			themable = true,
			indicator = {
				style = "none",
			},
			separator_style = { "", "" },
		},
	})

	require("plugins.bufferline.mappings")
end

return M
