local set = vim.keymap.set

set("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { desc = "Toggle Colorizer" })
set("n", "<leader>cr", "<cmd>ColorizerReloadAllBuffers<cr>", { desc = "Reload Colorizer" })
