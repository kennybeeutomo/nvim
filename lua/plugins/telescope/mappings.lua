local set = vim.keymap.set

-- Telescope
set("n", "<leader>ff", "<cmd>Telescope find_files<cr><esc>", { desc = "Find files" })
set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr><esc>", { desc = "Old files" })
set("n", "<leader>fb", "<cmd>Telescope buffers<cr><esc>", { desc = "Buffers" })
set("n", "<leader>fh", "<cmd>Telescope highlights<cr><esc>", { desc = "Highlights" })
set("n", "<leader>fg", "<cmd>Telescope live_grep<cr><esc>", { desc = "Live Grep" })
