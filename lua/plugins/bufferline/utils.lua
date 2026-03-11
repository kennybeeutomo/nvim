local M = {}

local bufferline = require("bufferline")

local function isFirstBuffer(bufferNumber)
	return bufferline.get_elements().elements[1].id == bufferNumber
end

function M.deleteCurrentBuffer()
	local bufferNumber = vim.fn.bufnr()
	if isFirstBuffer(bufferNumber) then
		bufferline.cycle(1)
	else
		bufferline.cycle(-1)
	end
	vim.cmd("bw! " .. bufferNumber)
end

return M
