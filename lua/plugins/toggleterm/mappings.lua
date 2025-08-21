local utils = require("utils")
local toggleterm = require("toggleterm")
local set = vim.keymap.set

local toggletermConfig = require("toggleterm.config")
local size = toggletermConfig.get("size")

local function getCommand(ft, type, file)
	local commands = {
		python = {
			focus = true,
			run = "python " .. file,
		},
		lua = {
			focus = true,
			run = "lua " .. file,
		},
		sh = {
			focus = true,
			run = file,
		},
		make = {
			focus = true,
			run = "make && make run",
			compile = "make",
			test = "make test",
			clean = "make clean",
			watch = "make watch",
		},
		go = {
			focus = true,
			run = "go run .",
			compile = "go build",
			test = "go test",
			clean = "go clean",
			watch = "find . -name '*.go' | entr -cs 'go run .'"
		},
		rust = {
			focus = true,
			run = "cargo run",
			compile = "cargo build",
			test = "cargo test",
			clean = "cargo clean",
			watch = "find . -name '*.rs' | entr -cs 'cargo run'"
		},
		typst = {
			focus = false,
			run = "typst compile " .. file .. " && [ -z \"$(jobs)\" ] && exit",
			compile = "typst compile " .. file .. " && [ -z \"$(jobs)\" ] && exit",
			watch = "typst watch " .. file .. " &> /dev/null &",
			extra = function() toggleterm.toggle(1) end
		},
		haskell = {
			focus = true,
			run = "cabal run",
			compile = "cabal build",
			test = "cabal test",
			clean = "cabal clean",
			watch = "find . -name '*.hs' | entr -cs 'cabal run'"
		}
	}

	commands["c"] = commands.make
	commands["cpp"] = commands.make
	commands["bash"] = commands.sh
	commands["zsh"] = commands.sh

	if commands[ft] == nil then
		vim.print("No command for " .. ft .. " yet")
		return nil
	end

	return commands[ft][type]
end

-- General
set("n", "<M-v>", "<cmd>ToggleTerm direction=vertical size=60<cr>", { desc = "Show terminal vertically" })
set("n", "<M-h>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Show terminal horizontally" })
set("n", "<M-n>", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Show terminal in a tab" })
set("t", "<M-v>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
set("t", "<M-h>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
set("t", "<M-n>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })

-- Send command to terminal
local function sendCommand(direction)
	local command = vim.fn.input("")
	if command ~= "" then
		toggleterm.exec(command, 1, size, "", direction)
	end
end

set("n", "<leader>h", function() sendCommand("horizontal") end, { desc = "Send command to terminal (horizontal)" })
set("n", "<leader>v", function() sendCommand("vertical") end, { desc = "Send command to terminal (vertical)" })

-- Run / Compile
local function exec(command, focus)
	local direction = vim.g.termfull and "tab" or toggletermConfig.get("direction")
	require("zen-mode").close()
	toggleterm.exec(command, 1, size, "", direction, "Compile and Run", not focus)
end

local function runOrCompile(type)
	local ft = vim.bo.filetype
	local file = vim.api.nvim_buf_get_name(0)

	local command = getCommand(ft, type, file)
	if command == nil then
		vim.print("No " .. type .. " command for " .. ft .. " yet")
		return
	end

	local before = ""
	local after = ""

	if utils.isWindows() then
		before = before .. "cls; "
	else
		before = before .. "clear; "
	end

	local focus = vim.g.termfocus and getCommand(ft, "focus", file)

	if focus then
		local shell = utils.getShell()

		local shellCommands = {
			-- Windows
			["pwsh"] = "; cmd /c pause",
			["powershell"] = "; cmd /c pause",
			["cmd"] = "; pause",

			-- Linux
			["zsh"] = "; read -k 1 -sr",
			["bash"] = "; read -n1 -sr",
			["sh"] = "; read -n1 -sr",
		}

		after = after .. shellCommands[shell] .. "; exit"
	end

	command = before .. command .. after
	exec(command, focus)

	if getCommand(ft, "extra", file) ~= nil then
		getCommand(ft, "extra", file)()
	end
end

set("n", "<leader>rr", function() runOrCompile("run") end, { desc = "Compile and Run" })
set("n", "<leader>rb", function() runOrCompile("compile") end, { desc = "Just Compile" })
set("n", "<leader>rt", function() runOrCompile("test") end, { desc = "Test" })
set("n", "<leader>rc", function() runOrCompile("clean") end, { desc = "Clean" })
set("n", "<leader>rw", function() runOrCompile("watch") end, { desc = "Watch" })
set("n", "<leader>rf", function() vim.g.termfocus = not vim.g.termfocus end, { desc = "Toggle focus" })
set("n", "<leader>rF", function() vim.g.termfull = not vim.g.termfull end, { desc = "Toggle fullscreen" })
set("n", "<leader>rs", "<cmd>wincmd b<cr><cmd>res " .. size .. "<cr><cmd>wincmd p<cr>",
	{ desc = "Reset terminal window size" })
set({"n", "t"}, "<M-q>", [[<cmd>TermExec cmd="exit"<cr>]], { desc = "Exit terminal" })

-- Programs
set("n", "<leader>y", [[<cmd>TermExec direction=float cmd="yazi; exit"<cr>]], { desc = "Open Yazi in floating window" })
if utils.isWindows() then
	set("n", "<leader>x", [[<cmd>!explorer .<cr><cr>]], { desc = "Open windows explorer" })
end
