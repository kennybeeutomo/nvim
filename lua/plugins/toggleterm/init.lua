local M = {}

function M.setup()
	require("toggleterm").setup{}

	require("plugins.toggleterm.mappings")
end

return M
