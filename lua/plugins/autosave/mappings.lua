local set = vim.keymap.set

set("n", "<leader>tas", function()
	vim.g.autosave = not vim.g.autosave
end, { desc = "Toggle Auto Save" })

