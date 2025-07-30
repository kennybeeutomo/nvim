local M = {}

local perLspConfigs = {
	hls = {
		settings = {
			haskell = {
				plugin = {
					rename = {
						config = { crossModule = true }
					}
				}
			}
		}
	}
}

function M.setup()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	vim.lsp.config("*", {
		capabilities = capabilities
	})

	vim.diagnostic.config({
		virtual_text = true,
	})

	for ls, config in pairs(perLspConfigs) do
		vim.lsp.config(ls, config)
	end

	require("plugins.lspconfig.mappings")
end

return M
