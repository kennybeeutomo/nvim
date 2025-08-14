local utils = require("utils")

-- Set shell to pwsh if on Windows
-- See :h shell-powershell
if utils.isWindows() then
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

vim.opt.linebreak = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

vim.opt.clipboard:append("unnamedplus")

vim.opt.fillchars = { eob = ' ' }

vim.opt.showmode = false

vim.opt.shortmess:append({ I = true })

-- Set oldfiles limit to 10000
vim.opt.shada = string.gsub(vim.o.shada, "'%d+", "'10000", 1)

vim.wo.foldlevel = 20
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.termguicolors = true

-- Filetype detection
vim.filetype.add({
	filename = {
		["colors-hypr.conf"] = "hyprlang",
		["aliases"] = "bash",
		["functions"] = "bash",
	},
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/cava/config"] = "dosini",
		[".*%.rasi"] = "rasi",
		[".*%.h"] = "c",
		[".*/uwsm/env.*"] = "sh",
		[".*/.scripts/utils"] = "sh",
	},
})

-- GLOBAL VARIABLES
vim.g.termfocus = true
vim.g.termfull = false

vim.g.autosave = false

vim.g.iblchar = { 1, { "│", " " } }

-- NEOVIDE ONLY
vim.g.neovide_opacity = 0.8
vim.g.neovide_remember_window_size = true
vim.o.guifont = "JetBrainsMono Nerd Font:h12"
