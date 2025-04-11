local M = {}

function M.setup()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
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
