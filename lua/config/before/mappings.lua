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

-- Editing
set("i", "<C-BS>", "<Esc>vbc", { desc = "Delete word" })

-- Navigation
set({"n", "v"}, "j", "gj")
set({"n", "v"}, "k", "gk")

-- Options
local function toggleNumbers(opt)
	if opt == "r" then
		vim.g.relativenumber = not vim.g.relativenumber
	elseif opt == "n" then
		vim.o.number = not vim.o.number
	end
	vim.o.relativenumber = vim.o.number and vim.g.relativenumber
end

set("n", "<leader>trn", function() toggleNumbers("r") end, { desc = "Toggle Relative Number" })
set("n", "<leader>tln", function() toggleNumbers("n") end, { desc = "Toggle Line Numbers" })

-- Surround
set("v", "<leader>s(", "c(<Esc>pa)<Esc>", { desc = "Surround in ()" })
set("v", "<leader>s[", "c[<Esc>pa]<Esc>", { desc = "Surround in []" })
set("v", "<leader>s{", "c{<Esc>pa}<Esc>", { desc = "Surround in {}" })
set("v", "<leader>s\'", "c'<Esc>pa'<Esc>", { desc = "Surround in ''" })
set("v", "<leader>s\"", "c\"<Esc>pa\"<Esc>", { desc = "Surround in \"\"" })
set("v", "<leader>s<", "c<<Esc>pa><Esc>", { desc = "Surround in <>" })

-- Buffers
set("n", "L", "<cmd>bn<cr>", { desc = "Next Buffer" })
set("n", "H", "<cmd>bN<cr>", { desc = "Previous Buffer" })

-- Beautifier
set("n", "<leader>s", "T{i<cr><esc>t}a<cr><esc>", { desc = "Expand curly braces" })

-- Selection
set("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Fold
set("n", "<leader>o", "za", { desc = "Toggle fold" })

-- Format
set("n", "<leader>\\f", function()
	local file = vim.api.nvim_buf_get_name(0)
	vim.cmd("!clang-format -i " .. file)
end, { desc = "clang-format current file" })

-- Search
set("n", "<esc>", "<cmd>noh<cr>")

-- WhichKey
set("n", "g?", "<cmd>WhichKey<cr>")

-- Command Mode
set("n", ";", "q:i", { desc = "Open command mode in vim mode" })

-- Terminal
set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Go to normal mode in terminal" })
set({"n", "t"}, "<M-m>", "<C-\\><C-n><C-w>p", { desc = "Go to normal mode in terminal" })
set("n", "<leader><cr>", utils.spawnTerminal, { desc = "Spawn terminal in current directory" })

-- pywal16
set("n", "<leader>pw", utils.refreshpywal, { desc = "Reload pywal16" })

-- Hex Dump
set("n", "<leader>x", "<cmd>%!xxd<cr>", { desc = "Hex Dump" })
