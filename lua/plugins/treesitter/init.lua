require("nvim-treesitter.configs").setup {
	ensure_installed = { "cpp", "c", "lua", "vimdoc" },
	highlight = {
		additional_vim_regex_highlighting = false,
		enable = true,
	},
	incremental_selection = {
		enable = false,
	},
	indent = {
		enable = true,
	}
}
require("nvim-treesitter.install").prefer_git = true
