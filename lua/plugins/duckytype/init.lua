local M = {}

function M.setup()
	require("duckytype").setup{
		number_of_words = 15,

		-- :h group-name
		highlight = {
			good = "Function",
			bad = "Error",
			remaining = "Ignore",
		},

		window_config = {
			width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
			border = "none"
		}
	}
end

return M
