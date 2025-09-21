local M = {}

function M.setup()
	require("nvim-autopairs").setup({
		map_bs = false,
	})
end

return M
