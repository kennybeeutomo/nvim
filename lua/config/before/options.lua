vim.cmd([[
	set number
	set relativenumber

	set ignorecase

	set tabstop=4
	set shiftwidth=4

	set clipboard=unnamedplus

	set shell=pwsh
	set shellcmdflag=-command
	set shellquote=\"
	set shellxquote=
]])

vim.opt.fillchars = { eob = ' ' }

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- NEOVIDE ONLY
vim.g.neovide_transparency = 0.8
vim.g.neovide_remember_window_size = true
vim.o.guifont = "JetBrainsMono Nerd Font:h10"
