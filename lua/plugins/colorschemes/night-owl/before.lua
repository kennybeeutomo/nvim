local M = {}

function M.setup()
	require("night-owl").setup({
		bold = true,
		italics = true,
		underline = true,
		undercurl = true,
		transparent_background = not vim.g.neovide,
	})
end

return M
