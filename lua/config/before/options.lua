-- Set shell to pwsh if on Windows
if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.cmd([[
	let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
	let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
	let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
	set shellquote= shellxquote=
	]])
end

-- OPTIONS
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard:append("unnamedplus")

vim.opt.fillchars = { eob = ' ' }

-- Set oldfiles limit to 1000
vim.opt.shada = string.gsub(vim.o.shada, "'%d+", "'1000", 1)

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.termguicolors = true

-- GLOBAL VARIABLES
vim.g.pywal = true

vim.g.termcls = true
vim.g.termfocus = true
vim.g.termsize = 15
vim.g.termquit = true
vim.g.termtest = false
vim.g.termfull = false

vim.g.autosave = false

-- NEOVIDE ONLY
vim.g.neovide_transparency = 0.8
vim.g.neovide_remember_window_size = true
vim.o.guifont = "JetBrainsMono Nerd Font:h10"
