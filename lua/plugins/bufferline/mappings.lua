local set = vim.keymap.set
local utils = require("utils")

set("n", "<leader>tb", function()
	if vim.g.colors_name == "pywal16" then
		vim.g.bufferLineInvert = not vim.g.bufferLineInvert
		utils.refreshpywal()
	end
end, { desc = "Toggle Buffer Line highlight invert" })
