local M = {}

function M.setup()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls@3.16.4", -- use this version to prevent lazydev issue 136
			"clangd",
			"marksman",
			-- "clang-format",
		}
	})
end

return M
