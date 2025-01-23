local M = {}

function M.colorschemeExists(colorscheme)
	-- Get the vimrc directory
	local vimrcPath = vim.fn.substitute(vim.fn.expand("$MYVIMRC"), "init.lua", "", "")
	-- Get the colorschemes directory
	local colorschemesPath = vim.fn.glob(vimrcPath .. "lua/plugins/colorschemes/")
	-- Get the list of colorschemes in that directory
	local colorschemes = vim.fn.split(vim.fn.glob(colorschemesPath .. "*"), '\n')
	-- If colorscheme exists in the list, then load it
	for _,v in pairs(colorschemes) do
		local colorschemeFullPath = vim.fn.glob(colorschemesPath .. colorscheme)
		if v == colorschemeFullPath then
			return true
		end
	end
	return false
end

function M.loadcolorscheme(colorscheme, before)
	if colorscheme == "pywal16" and vim.fn.executable("wal") ~= 1 then
		vim.print("pywal16 not installed!")
		return 1
	end

	if before then
		require("plugins.colorschemes." .. colorscheme .. ".before").setup()
	else
		require("plugins.colorschemes." .. colorscheme .. ".after").setup()
	end

	return 0
end

function M.cleanColorscheme(colorscheme)
	vim.cmd.highlight("clear")
	if M.colorschemeExists(colorscheme) then
		M.loadcolorscheme(colorscheme, true)
		vim.cmd.colorscheme(colorscheme)
		M.loadcolorscheme(colorscheme, false)
	else
		vim.cmd.colorscheme(colorscheme)
	end
	require("plugins.lualine").setup(colorscheme)
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
	if vim.loop.os_uname().sysname == "Windows_NT" then
		return true
	end
	return false
end

function M.getShell()
	return vim.api.nvim_get_option("shell")
end

function M.spawnTerminal()
	local cwd = vim.loop.cwd()
	local terminal = os.getenv("TERM")
	local commands = {
		alacritty = ' --working-directory '
	}
	local command = "silent !" .. terminal .. commands[terminal] .. "\'" .. cwd .. "\' &"
	vim.cmd(command)
end

return M
