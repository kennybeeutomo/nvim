local utils = require("utils")
local toggletermUtils = require("plugins.toggleterm.utils")
local run = require("plugins.toggleterm.run")

local set = vim.keymap.set

-- General
set("n", "<M-v>", "<cmd>ToggleTerm direction=vertical size=60<cr>", { desc = "Show terminal vertically" })
set("n", "<M-h>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Show terminal horizontally" })
set("n", "<M-n>", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Show terminal in a tab" })
set("t", "<M-v>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
set("t", "<M-h>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
set("t", "<M-n>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
set("n", "<leader>rs", toggletermUtils.resetWinSize, { desc = "Reset terminal window size" })
set("n", "<M-q>", [[<cmd>TermExec cmd="exit"<cr>]], { desc = "Exit terminal" })
set("t", "<M-q>", [[i<bs><cmd>TermExec cmd="exit"<cr>]], { desc = "Exit terminal" })

-- Send command to terminal
set("n", "<leader>h", function() toggletermUtils.sendCommand("horizontal") end, { desc = "Send command to terminal (horizontal)" })
set("n", "<leader>v", function() toggletermUtils.sendCommand("vertical") end, { desc = "Send command to terminal (vertical)" })

-- Run
set("n", "<leader>rr", function() run.run("run") end, { desc = "Run" })
set("n", "<leader>rb", function() run.run("compile") end, { desc = "Compile" })
set("n", "<leader>rt", function() run.run("test") end, { desc = "Test" })
set("n", "<leader>rc", function() run.run("clean") end, { desc = "Clean" })
set("n", "<leader>rw", function() run.run("watch") end, { desc = "Watch" })
set("n", "<leader>rf", function() vim.g.termfocus = not vim.g.termfocus end, { desc = "Toggle focus" })
set("n", "<leader>rF", function() vim.g.termfull = not vim.g.termfull end, { desc = "Toggle fullscreen" })

-- Programs
set("n", "<leader>y", [[<cmd>TermExec direction=float cmd="yazi; exit"<cr>]], { desc = "Open Yazi in floating window" })
if utils.isWindows() then
	set("n", "<leader>x", "<cmd>!explorer .<cr><cr>", { desc = "Open windows explorer" })
end
