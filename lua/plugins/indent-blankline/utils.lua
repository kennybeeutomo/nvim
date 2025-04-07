local M = {}

local utils = require("utils")

function M.setchar(iblchar)
	require("ibl").overwrite({
		indent = {
			char = iblchar
		},
	})
	utils.customHighlight("ibl")
end

function M.setcharBuffer(iblchar)
	require("ibl").setup_buffer(0, {
		indent = {
			char = iblchar
		},
	})
	utils.customHighlight("ibl")
end

function M.toggle()
	vim.g.iblchar = utils.cycle(vim.g.iblchar, 1)
	M.setchar(utils.getSequence(vim.g.iblchar))
end

return M
