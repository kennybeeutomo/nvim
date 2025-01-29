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
			show_close_icon = false,
			show_buffer_close_icons = false,
		},
	})
end

return M
