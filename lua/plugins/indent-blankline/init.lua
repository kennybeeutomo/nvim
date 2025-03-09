local M = {}

function M.setup()

	require("ibl").setup({
		indent = {
			char = "▏"
		},
	})
end

return M
