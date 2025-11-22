local M = {}

local ibl = require("ibl")
local utils = require("utils")

function M.setchar(iblchar)
	ibl.overwrite({
		indent = {
			char = iblchar
		},
	})
	utils.customHighlight("ibl")
end

function M.setcharBuffer(iblchar)
	ibl.setup_buffer(0, {
		indent = {
			char = iblchar
		},
	})
	utils.customHighlight("ibl")
end

function M.toggle()
	vim.g.iblchar = utils.cycle(vim.g.iblchar, vim.g.iblchars)
	M.setchar(vim.g.iblchar)
end

return M
