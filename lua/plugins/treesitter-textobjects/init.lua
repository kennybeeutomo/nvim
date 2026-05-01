local M = {}

function M.setup()
	require("nvim-treesitter-textobjects").setup({
		select = {
			lookahead = true,
			selection_modes = { },
			include_surrounding_whitespace = false,
		},
		move = {
			set_jumps = true
		}
	})

	require("plugins.treesitter-textobjects.mappings")
end

return M
