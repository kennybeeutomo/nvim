local M = {}

local toggleterm = require("toggleterm")
local toggletermConfig = require("toggleterm.config")
local size = toggletermConfig.get("size")

-- Send command to terminal
function M.sendCommand(direction)
	local command = vim.fn.input("")
	if command ~= "" then
		toggleterm.exec(command, 1, size, "", direction)
	end
end

-- Execute command
function M.exec(command, focus)
	local isZen = require("zen-mode.view").is_open()
	local direction = toggletermConfig.get("direction")
	if vim.g.termfull then direction = "tab" end
	if isZen then direction = "float" end
	toggleterm.exec(command, 1, size, "", direction, "Run", not focus)
end

-- Reset terminal window size
function M.resetWinSize()
	vim.cmd("wincmd b")
	vim.cmd("res " .. size)
	vim.cmd("wincmd p")
end

return M
