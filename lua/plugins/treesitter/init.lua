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
				-- set to `false` to disable one of the mappings
				init_selection = false,
				node_incremental = false,
				scope_incremental = false,
				node_decremental = false,
			},
		},
		indent = {
			enable = true,
		}
	}

	require("nvim-treesitter.install").prefer_git = true
	require("plugins.treesitter.mappings")
end

return M
