local M = {}

local bufferline = require("bufferline")

function M.next()
	if vim.o.showtabline == 0 then
		vim.cmd("bnext")
	else
		bufferline.cycle(1)
	end
end

function M.prev()
	if vim.o.showtabline == 0 then
		vim.cmd("bprevious")
	else
		bufferline.cycle(-1)
	end
end

local function getBuffers()
	return bufferline.get_elements().elements
end

local function isFirstBuffer(buffers, bufferNumber)
	return buffers[1].id == bufferNumber
end

function M.deleteCurrentBuffer()
	local bufferNumber = vim.fn.bufnr()

	if vim.o.showtabline == 0 then
		M.prev()
	else
		local buffers = getBuffers()

		if isFirstBuffer(buffers, bufferNumber) then
			M.next()
		else
			M.prev()
		end
	end

	vim.cmd("bw! " .. bufferNumber)
end

return M
