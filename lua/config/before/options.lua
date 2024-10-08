vim.cmd([[
	set number
	set relativenumber

	set ignorecase

	set tabstop=4
	set shiftwidth=4

	set clipboard+=unnamedplus
]])

if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.cmd([[
	let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
	let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
	let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
	set shellquote= shellxquote=
	]])
end

vim.opt.fillchars = { eob = ' ' }

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.termcls = true
vim.g.termfocus = false
vim.g.termsize = 15
vim.g.autosave = false

-- NEOVIDE ONLY
vim.g.neovide_transparency = 0.8
vim.g.neovide_remember_window_size = true
vim.o.guifont = "JetBrainsMono Nerd Font:h10"
