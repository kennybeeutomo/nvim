local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local function loadColorscheme(colorscheme, pre)
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
			if pre then
				require("plugins.colorschemes." .. colorscheme .. ".before").setup()
			else
				require("plugins.colorschemes." .. colorscheme .. ".after").setup()
			end
		end
	end
end

local colorscheme_conf = augroup("colorscheme_conf", { clear = true })
autocmd({"ColorSchemePre"}, {
	pattern = "*",
	group = colorscheme_conf,
	callback = function()
		vim.cmd.highlight("clear")
	end,
	desc = "Clear leftover highlight groups before applying a colorscheme"
})
autocmd({"ColorSchemePre"}, {
	pattern = "*",
	group = colorscheme_conf,
	callback = function(args)
		loadColorscheme(args.match, true)
	end,
	desc = "Load custom configurations before applying a colorscheme"
})
autocmd({"ColorScheme"}, {
	pattern = "*",
	group = colorscheme_conf,
	callback = function(args)
		loadColorscheme(args.match, false)
	end,
	desc = "Load custom configurations after applying a colorscheme"
})
autocmd({"ColorScheme"}, {
	pattern = "*",
	group = colorscheme_conf,
	callback = function(args)
		require("plugins.lualine").setup(args.match)
	end,
	desc = "Load lualine theme based on the chosen colorscheme"
})

-- The events on which lualine redraws itself
-- from https://github.com/nvim-lualine/lualine.nvim/issues/1293#issuecomment-2280456044
local default_refresh_events = {"WinEnter","BufEnter","BufWritePost","SessionLoadPost","FileChangedShellPost","VimResized","Filetype","CursorMoved","CursorMovedI","ModeChanged"}
local lualine_conf = augroup("lualine_conf", { clear = true })
autocmd(default_refresh_events, {
	pattern = "*",
	group = lualine_conf,
	callback = function()
		require("lualine").refresh()
	end,
	desc = "Refresh lualine on some events"
})
