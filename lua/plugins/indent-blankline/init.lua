local M = {}

local utils = require("utils")

function M.setup()
	require("plugins.indent-blankline.options")
	require("ibl").setup({
		indent = {
			char = utils.getSequence(vim.g.iblchar)
		},
	})

	require("plugins.indent-blankline.mappings")
end

return M
