local M = {}

function M.setup()
	require("duckytype").setup{
		number_of_words = 15,
		highlight = {
			good = "Function",
			bad = "Error",
			remaining = "Ignore",
		}
	}
end
-- :h group-name

return M
