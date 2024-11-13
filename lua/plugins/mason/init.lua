local M = {}

function M.setup()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"clangd",
			"marksman",
			-- "clang-format",
		}
	})
end

return M
