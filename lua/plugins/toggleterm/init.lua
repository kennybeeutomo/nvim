local M = {}

function M.setup()
	require("plugins.toggleterm.options")
	require("toggleterm").setup{}
	require("plugins.toggleterm.mappings")
end

return M
