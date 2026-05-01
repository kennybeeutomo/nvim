local M = {}

local treesitter = require("nvim-treesitter")

local ensure_installed = { "cpp", "c", "lua", "vimdoc", "markdown", "markdown_inline", "python" }

function M.setup()
	treesitter.setup({
		-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
		install_dir = vim.fn.stdpath('data') .. '/site'
	})

	treesitter.install(ensure_installed)
	require("plugins.treesitter.autocommands")
end

return M
