local M = {}

local utils = require("utils")
local toggletermUtils = require("plugins.toggleterm.utils")

local toggleterm = require("toggleterm")

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
			run = "zathura \"$(echo " .. file .. " | sed 's/\\.typ/.pdf/')\" &> /dev/null & disown",
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
		},
		java = { -- TODO: switch to maven
			focus = true,
			run = "javac *.java && java Main",
			compile = "javac *.java",
			test = nil,
			clean = "rm *.class",
			watch = "find . -name '*.java' | entr -cs 'java Main'"
		},
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

function M.run(type)
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
	toggletermUtils.exec(command, focus)

	if getCommand(ft, "extra", file) ~= nil then
		getCommand(ft, "extra", file)()
	end
end

return M
