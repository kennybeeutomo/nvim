local M = {}

function M.setup()
	require("plugins.indent-blankline.options")
	require("ibl").setup({
		indent = {
			char = vim.g.iblchar
		},
	})

	require("plugins.indent-blankline.mappings")
end

return M
