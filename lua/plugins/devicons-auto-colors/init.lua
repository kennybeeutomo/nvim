local M = {}

function M.setup()
	require("tiny-devicons-auto-colors").setup({
		colors = require("pywal16.core").get_colors()
	})
end

return M
