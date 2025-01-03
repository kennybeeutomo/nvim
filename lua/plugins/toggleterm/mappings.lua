local utils = require("utils")
local set = vim.keymap.set

-- General
set("n", "<M-v>", "<cmd>ToggleTerm direction=vertical size=60<cr>", { desc = "Show terminal vertically" })
set("n", "<M-h>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Show terminal horizontally" })
set("n", "<M-n>", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Show terminal in a tab" })
set("t", "<M-v>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
set("t", "<M-h>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
set("t", "<M-n>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })

-- Run / Compile
local function exec(command)
	local after = ""

	if vim.g.termfocus then
		after = after .. " go_back=0"
	end

	if vim.g.termfull then
		after = after .. " direction=tab"
	end

	vim.cmd("TermExec cmd=\"" .. command .. "\"" .. after)
end

local function runOrCompile(opts)
	setmetatable(opts, {__index={
		compile = true,
	}})

	local filetype = vim.bo.filetype

	local command = ""
	local beforeCommands = ""
	local afterCommands = ""

	if vim.g.termquit then
		if utils.isWindows() then
			afterCommands = afterCommands .. "; cmd /c pause; exit"
		else
			local shell = utils.getShell()
			afterCommands = afterCommands .. "; echo Press any key to continue..."
			if shell == "/bin/zsh" then
				afterCommands = afterCommands .. "; read -k 1 -sr; exit"
			elseif shell == "/bin/bash" or shell == "/dev/sh" then
				afterCommands = afterCommands .. "; read -n1 -sr; exit"
			end
		end
	end

	local function make()
		local makeCommand = ""
		if opts.compile then
			makeCommand = makeCommand .. "make && "
		end

		if vim.g.termtest then
			makeCommand = makeCommand .. "make test"
		else
			makeCommand = makeCommand .. "make run"
		end

		return makeCommand
	end

	local commands = {
		python = function() command = vim.api.nvim_buf_get_name(0) end,
		c = function() command = make() end,
		cpp = function() command = make() end,
	}

	if commands[filetype] then
		if vim.g.termcls then exec("cls") end
		commands[filetype]()
		exec(beforeCommands .. command .. afterCommands)
	else
		print("No run command for " .. filetype .. " yet")
	end
end

set("n", "<leader>rr", function() runOrCompile{} end, { desc = "Run / Compile" })
set("n", "<leader>rn", function() runOrCompile{compile = false} end, { desc = "Just Run" })
set("n", "<leader>rq", function() vim.g.termquit = not vim.g.termquit end, { desc = "Toggle quit" })
set("n", "<leader>rc", function() vim.g.termcls = not vim.g.termcls end, { desc = "Toggle cls" })
set("n", "<leader>rf", function() vim.g.termfocus = not vim.g.termfocus end, { desc = "Toggle focus" })
set("n", "<leader>rt", function() vim.g.termtest = not vim.g.termtest end, { desc = "Toggle test" })
set("n", "<leader>rF", function() vim.g.termfull = not vim.g.termtest end, { desc = "Toggle fullscreen" })
set("n", "<leader>rs", "<cmd>wincmd b<cr><cmd>res " .. vim.g.termsize .. "<cr><cmd>wincmd p<cr>",
	{ desc = "Reset terminal window size" })
set({"n", "t"}, "<M-q>", [[<cmd>TermExec cmd="exit"<cr>]], { desc = "Exit terminal" })

-- Programs
set("n", "<leader>y", [[<cmd>TermExec direction=float cmd="yazi; exit"<cr>]], { desc = "Open Yazi in floating window" })
if utils.isWindows() then
	set("n", "<leader>x", [[<cmd>!explorer .<cr><cr>]], { desc = "Open windows explorer" })
end
