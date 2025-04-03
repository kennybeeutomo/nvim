local set = vim.keymap.set
local utils = require("utils")

local function toggle()
	vim.g.iblchar = utils.cycle(vim.g.iblchar, 1)
	require("ibl").overwrite({
		indent = {
			char = utils.getSequence(vim.g.iblchar)
		},
	})
	utils.customHighlight("ibl")
end

set("n", "<leader>tibl", toggle, { desc = "Toggle Indent Blankline" })
