vim.cmd([[
	set number
	set relativenumber

	set ignorecase

	set tabstop=4
	set shiftwidth=4

	set clipboard+=unnamedplus
]])

if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = "-command"
	vim.opt.shellquote = '\"'
	vim.opt.shellxquote = ''
end

vim.opt.fillchars = { eob = ' ' }

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- NEOVIDE ONLY
vim.g.neovide_transparency = 0.8
vim.g.neovide_remember_window_size = true
vim.o.guifont = "JetBrainsMono Nerd Font:h10"
