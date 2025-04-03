local set = vim.keymap.set
local api = require("nvim-tree.api")

local function nvcd()
	vim.cmd("cd %:h")
	api.tree.change_root(vim.fn.expand("%:p:h"))
end

set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus NvimTree" })
set("n", "<leader>n", "<cmd>NvimTreeClose<cr>", { desc = "Close NvimTree" })
set("n", "<C-c>", nvcd, { desc = "cd to directory of current file" })
set("n", "<leader>qb", "<cmd>bd<cr><cmd>NvimTreeClose<cr>", { desc = "Delete buffer" })
set("n", "<leader>qB", "<cmd>bd!<cr><cmd>NvimTreeClose<cr>", { desc = "Delete buffer" })
