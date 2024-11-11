local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local colorscheme_conf = augroup('colorscheme_conf', { clear = true })
autocmd({'ColorSchemePre'}, {
	pattern = '*',
	group = colorscheme_conf,
	callback = function()
		vim.cmd.highlight("clear")
	end,
	desc = "Clear leftover highlight groups before applying a colorscheme"
})
autocmd({'ColorSchemePre'}, {
	pattern = '*',
	group = colorscheme_conf,
	callback = function(args)
		require("plugins.colorschemes." .. args.match .. ".before").setup()
	end,
	desc = "Load custom configurations before applying a colorscheme"
})
autocmd({'ColorScheme'}, {
	pattern = '*',
	group = colorscheme_conf,
	callback = function(args)
		require("plugins.colorschemes." .. args.match .. ".after").setup()
	end,
	desc = "Load custom configurations after applying a colorscheme"
})
autocmd({'ColorScheme'}, {
	pattern = '*',
	group = colorscheme_conf,
	callback = function(args)
		require("plugins.lualine").setup(args.match)
	end,
	desc = "Load lualine theme based on the chosen colorscheme"
})
