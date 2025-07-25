local M = {}

function M.colorschemeExists(colorscheme)
	-- Get the vimrc directory
	local vimrcPath = vim.fs.dirname(vim.fn.expand("$MYVIMRC"))
	-- Get the colorschemes directory
	local colorschemesPath = vimrcPath .. "/lua/plugins/colorschemes/"
	-- Get the list of colorschemes in that directory
	local colorschemes = vim.fs.dir(colorschemesPath)
	-- If colorscheme exists in the list, then load it
	for name, type in colorschemes do
		if name == colorscheme and type == "directory" then
			return true
		end
	end
	return false
end

function M.customHighlight(highlight)
	if M.colorschemeExists(vim.g.colors_name) then
		local hl = require("plugins.colorschemes." .. vim.g.colors_name .. ".custom").highlights[highlight]
		if hl ~= nil then
			hl()
		end
	end
end

function M.loadcolorscheme(colorscheme, file)
	if colorscheme == "pywal16" and vim.fn.executable("wal") ~= 1 then
		vim.print("pywal16 not installed!")
		return 1
	end

	require("plugins.colorschemes." .. colorscheme .. "." .. file).setup()

	return 0
end

function M.cleanColorscheme(colorscheme)
	vim.cmd.highlight("clear")
	if M.colorschemeExists(colorscheme) then
		M.loadcolorscheme(colorscheme, "before")
		vim.cmd.colorscheme(colorscheme)
		M.loadcolorscheme(colorscheme, "custom")
	else
		vim.cmd.colorscheme(colorscheme)
	end

	if not vim.g.nvimpager then
		require("plugins.lualine").setup(colorscheme)
	end

	require("plugins.devicons-auto-colors").apply("default")
	require("plugins.devicons-auto-colors").apply(colorscheme)
	vim.g.colors_name = colorscheme
end

function M.refreshpywal()
	if M.isWindows() then
		vim.cmd("silent !wwal")
	end
	M.cleanColorscheme("pywal16")
end

function M.isWindows()
	if vim.uv.os_uname().sysname == "Windows_NT" then
		return true
	end
	return false
end

function M.getShell()
	return vim.fs.basename(vim.api.nvim_get_option_value("shell", {}))
end

function M.spawnTerminal()
	local cwd = vim.uv.cwd()
	local terminal = os.getenv("TERM")
	local commands = {
		alacritty = ' --working-directory '
	}
	local command = "silent !" .. terminal .. commands[terminal] .. "\'" .. cwd .. "\' &"
	vim.cmd(command)
end

-- sequence = {index, table}
function M.getSequence(sequence)
	return sequence[2][sequence[1]]
end

function M.cycle(sequence, n)
	sequence[1] = sequence[1] - 1
	sequence[1] = (sequence[1] + n) % #sequence[2]
	sequence[1] = sequence[1] + 1
	return sequence
end

function M.toggleNumbers(opt)
	if opt == "r" then
		vim.g.relativenumber = not vim.g.relativenumber
	elseif opt == "n" then
		vim.o.number = not vim.o.number
	end
	vim.o.relativenumber = vim.o.number and vim.g.relativenumber
end

return M
