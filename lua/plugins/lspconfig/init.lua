local M = {}

function M.setup()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	vim.lsp.config("*", {
		capabilities = capabilities
	})

	vim.diagnostic.config({
		virtual_text = true,
	})

	require("plugins.lspconfig.mappings")
end

return M
