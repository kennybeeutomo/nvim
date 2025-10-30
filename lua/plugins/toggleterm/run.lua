local M = {}

local utils = require("utils")
local toggletermUtils = require("plugins.toggleterm.utils")

local toggleterm = require("toggleterm")

local function getCommand(ft, type, file)
	local command = {
		focus = true
	}

	local commands = {
		python = function()
			command.run = "python " .. file
		end,
		lua = function()
			command.run = "lua " .. file
		end,
		sh = function()
			command.run = file
		end,
		make = function()
			command.run = "make && make run"
			command.compile = "make"
			command.test = "make test"
			command.clean = "make clean"
			command.watch = "make watch"
		end,
		go = function()
			command.run = "go run ."
			command.compile = "go build"
			command.test = "go test"
			command.clean = "go clean"
			command.watch = "find . -name '*.go' | entr -cs '" .. command.run .. "'"
		end,
		rust = function()
			command.run = "cargo run"
			command.compile = "cargo build"
			command.test = "cargo test"
			command.clean = "cargo clean"
			command.watch = "find . -name '*.rs' | entr -cs '" .. command.run .. "'"
		end,
		typst = function()
			command.focus = false
			command.run = "zathura \"$(echo " .. file .. " | sed 's/\\.typ/.pdf/')\" &> /dev/null & disown"
			command.compile = "typst compile " .. file .. " && [ -z \"$(jobs)\" ] && exit"
			command.watch = "typst watch " .. file .. " &> /dev/null &"
			command.extra = function() toggleterm.toggle(1) end
		end,
		haskell = function()
			command.run = "cabal run"
			command.compile = "cabal build"
			command.test = "cabal test"
			command.clean = "cabal clean"
			command.watch = "find . -name '*.hs' | entr -cs '" .. command.run .. "'"
		end,
		java = function() -- TODO: switch to maven
			command.run = "javac *.java && java Main"
			command.compile = "javac *.java"
			command.test = nil
			command.clean = "rm *.class"
			command.watch = "find . -name '*.java' | entr -cs '" .. command.run .. "'"
		end,
		sql = function()
			command.run = "mariadb -u mariadb test < " .. file
			command.watch = "find . -name '*.sql' | entr -cs '" .. command.run .. "'"
		end,
	}

	commands["c"] = commands.make
	commands["cpp"] = commands.make
	commands["bash"] = commands.sh
	commands["zsh"] = commands.sh

	if commands[ft] ~= nil then
		commands[ft]()
	end

	if vim.uv.fs_stat("run_commands.lua") ~= nil then
		package.loaded.run_commands = nil
		local command_override = require("run_commands")
		command = vim.tbl_deep_extend("force", command, command_override)
	end

	if next(command) == nil then
		vim.print("No command for " .. ft .. " yet")
		return nil
	end

	return command[type]
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
