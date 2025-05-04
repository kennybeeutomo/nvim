local M = {}

local lspconfig = require("lspconfig")

function M.setup()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	vim.diagnostic.config({
		virtual_text = true,
	})

	local lsps = {
		"clangd",
		"lua_ls",
		"powershell_es",
		"marksman",
		"hls",
		"html",
		"cssls",
		"pylsp",
		"bashls",
		"hyprls",
		"tinymist",
		"jsonls",
		"gopls",
		"taplo",
	}

	for _, lsp in pairs(lsps) do
		lspconfig[lsp].setup({
			capabilities = capabilities
		})
	end

	require("plugins.lspconfig.mappings")
end

return M
