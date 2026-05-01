local M = {}

local bufferline = require("bufferline")

local function getBuffers()
	return bufferline.get_elements().elements
end

local function isFirstBuffer(buffers, bufferNumber)
	return buffers[1].id == bufferNumber
end

local function isLastBuffer(buffers, bufferNumber)
	return buffers[#buffers].id == bufferNumber
end

function M.deleteCurrentBuffer(reverse)
	local bufferNumber = vim.fn.bufnr()
	local buffers = getBuffers()

	if isFirstBuffer(buffers, bufferNumber) then
		bufferline.cycle(1)
	elseif isLastBuffer(buffers, bufferNumber) then
		bufferline.cycle(-1)
	else
		bufferline.cycle(reverse and 1 or -1)
	end

	vim.cmd("bw! " .. bufferNumber)
end

return M
