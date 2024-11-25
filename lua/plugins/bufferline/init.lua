local M = {}

function M.setup()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			themable = true,
			indicator = {
				style = "icon",
			},

		}
	})
end

return M
