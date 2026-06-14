local utils = require("utils")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
local set = vim.keymap.set

-- General
set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit All" })
set("n", "<leader>qw", "<cmd>wqa!<cr>", { desc = "Save and quit All" })
set("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
set("n", "<C-p>", "<cmd>q<cr>", { desc = "Quit" })
set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
set("n", "<leader>tas", function()
	vim.g.autosave = not vim.g.autosave
	vim.api.nvim_exec_autocmds("User", { pattern = "AutosaveToggle" })
end, { desc = "Toggle Autosave" })

-- Editing
set("i", "<C-BS>", "<Esc>vbc", { desc = "Delete word" })
set("v", "<leader>r", "y:%s/<C-R>\"//g<Left><Left>", { desc = "Replace selected" })

-- Navigation
set({"n", "v"}, "j", "gj")
set({"n", "v"}, "k", "gk")

-- buffers
set("n", "L", "<cmd>bn<cr>", { desc = "Next Buffer" })
set("n", "H", "<cmd>bN<cr>", { desc = "Previous Buffer" })
set("n", "<C-B>", utils.cleanBufferDelete, { desc = "Delete Buffer" })

-- Options
set("n", "<leader>tw", function() vim.o.wrap = not vim.o.wrap end, { desc = "Toggle Wrapping" })
set("n", "<leader>tic", function() vim.o.ignorecase = not vim.o.ignorecase end, { desc = "Toggle Ignore Case" })
set("n", "<C-o>", utils.cycleNumbers, { desc = "Cycle line number styles" })
set("n", "<leader>c", utils.toggleConcealCursor, { desc = "Toggle normal concealcursor" })

set({"i", "v", "n"}, "<C-`>", function()
	vim.o.virtualedit = utils.cycle(vim.o.virtualedit, {"all", ""})
end, { desc = "Toggle Virtual Edit" })

set("n", "<leader>ls", function()
	vim.o.laststatus = utils.cycle(vim.o.laststatus, {0, 2})
end, { desc = "Toggle Status-Line" })

set("n", "<leader>lt", function()
	vim.o.showtabline = utils.cycle(vim.o.showtabline, {0, 2})
end, { desc = "Toggle Tab-Line" })

set("n", "<leader>lc", function()
	vim.o.cmdheight = utils.cycle(vim.o.cmdheight, {0, 1})
end, { desc = "Toggle Command-Line" })

set("n", "<leader>lf", function()
	vim.o.foldcolumn = utils.cycle(vim.o.foldcolumn, {"0", "4"})
end, { desc = "Toggle Fold Column" })

set("n", "<leader>m", function()
	vim.g.minimal = utils.cycle(vim.g.minimal, {true, false})
	utils.updateMinimalUI()
end, { desc = "Toggle Minimal UI" })

-- Surround
set("v", "s(", "c(<Esc>pa)<Esc>", { desc = "Surround in ()" })
set("v", "s[", "c[<Esc>pa]<Esc>", { desc = "Surround in []" })
set("v", "s{", "c{<Esc>pa}<Esc>", { desc = "Surround in {}" })
set("v", "s\'", "c'<Esc>pa'<Esc>", { desc = "Surround in ''" })
set("v", "s\"", "c\"<Esc>pa\"<Esc>", { desc = "Surround in \"\"" })
set("v", "s<", "c<<Esc>pa><Esc>", { desc = "Surround in <>" })

-- Selection
set("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Fold
set("n", "<Tab>", "za")

-- Search
set("n", "<esc>", "<cmd>noh<cr>")
set("n", "?", "q/")

-- Command Mode
set("n", "<leader>;", "q:i", { desc = "Open command mode in vim mode" })
set("c", "<C-F>", "<Right>")
set("c", "<C-B>", "<Left>")

-- Terminal
set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Go to normal mode in terminal" })
set({"n", "t"}, "<M-m>", "<C-\\><C-n><C-w>p", { desc = "Move focus out of terminal" })
set("n", "<leader><cr>", utils.spawnTerminal, { desc = "Spawn terminal in current directory" })

-- pywal16
set("n", "<leader>pw", utils.refreshpywal, { desc = "Reload pywal16" })

-- Hex Dump
set("n", "<leader>x", "<cmd>%!xxd<cr>", { desc = "Hex Dump" })
