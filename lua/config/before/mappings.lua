vim.g.mapleader = ' '
local set = vim.keymap.set

-- General
set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit All" })
set("n", "<leader>qw", "<cmd>wqa!<cr>", { desc = "Save and quit All" })

-- Options
set("n", "<leader>trn", function()
	vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle Relative Number" })

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

-- Windows
set("n", "<leader>wv", "<C-w>v", { desc = "New vertical window" })
set("n", "<leader>wh", "<C-w>s", { desc = "New horizontal window" })

-- Selection
set("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Fold
set("n", "<leader>o", "zo", { desc = "Open fold" })
set("n", "<leader>O", "zc", { desc = "Close fold" })

-- Format
set("n", "<leader>\\f", function()
	local file = vim.api.nvim_buf_get_name(0)
	vim.cmd("!clang-format -i " .. file)
end, { desc = "clang-format current file" })

-- Search
set("n", "<esc>", "<cmd>noh<cr>")

-- WhichKey
set("n", "\\", "<cmd>WhichKey<cr>")

-- -- Command Mode
set("n", ";", "q:i", { desc = "Open command mode in vim mode" })
