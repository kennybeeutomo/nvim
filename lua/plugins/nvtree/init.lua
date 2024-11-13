local M = {}

function M.setup()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("nvim-tree").setup()
	require("plugins.nvtree.mappings")
end

return M
