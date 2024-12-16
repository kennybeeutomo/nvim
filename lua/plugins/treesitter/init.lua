local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup {
		ensure_installed = { "cpp", "c", "lua", "vimdoc", "norg", "markdown",
		                     "markdown_inline", "python" },

		sync_install = false,
		auto_install = false,
		ignore_install = {},
		modules = {},

		highlight = {
			additional_vim_regex_highlighting = false,
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = {
			enable = true,
		}
	}

	require("nvim-treesitter.install").prefer_git = true
end

return M
