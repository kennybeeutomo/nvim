local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local utils = require("utils")

-- local colorscheme_conf = augroup("colorscheme_conf", { clear = true })
-- autocmd({"ColorSchemePre"}, {
-- 	pattern = "*",
-- 	group = colorscheme_conf,
-- 	callback = function()
-- 		vim.cmd.highlight("clear")
-- 	end,
-- 	desc = "Clear leftover highlight groups before applying a colorscheme"
-- })
-- autocmd({"ColorSchemePre"}, {
-- 	pattern = "*",
-- 	group = colorscheme_conf,
-- 	callback = function(args)
-- 		if utils.colorschemeExists(args.match) then
-- 			utils.loadcolorscheme(args.match, true)
-- 		end
-- 	end,
-- 	desc = "Load custom configurations before applying a colorscheme"
-- })
-- autocmd({"ColorScheme"}, {
-- 	pattern = "*",
-- 	group = colorscheme_conf,
-- 	callback = function(args)
-- 		if utils.colorschemeExists(args.match) then
-- 			utils.loadcolorscheme(args.match, false)
-- 		end
-- 	end,
-- 	desc = "Load custom configurations after applying a colorscheme"
-- })
-- autocmd({"ColorScheme"}, {
-- 	pattern = "*",
-- 	group = colorscheme_conf,
-- 	callback = function(args)
-- 		require("plugins.lualine").setup(args.match)
-- 	end,
-- 	desc = "Load lualine theme based on the chosen colorscheme"
-- })
-- autocmd({"ColorScheme"}, {
-- 	pattern = "*",
-- 	group = colorscheme_conf,
-- 	callback = function(args)
-- 		require("plugins.devicons-auto-colors").apply(args.match)
-- 	end,
-- 	desc = "Load devicons auto colors based on the chosen colorscheme"
-- })

local pywal = augroup("pywal", { clear = true })
autocmd({"Signal"}, {
	pattern = "SIGUSR1",
	group = pywal,
	callback = function()
		utils.cleanColorscheme("pywal16")
		-- must :e if filetype is norg
		if (vim.o.ft == "norg") then
			vim.cmd("write")
			vim.cmd("edit")
		end
	end,
	desc = "Reload pywal on SIGUSR1 signal, useful after changing wallpapers"
})

local commentstrings = augroup("commentstrings", { clear = true })
autocmd({"Filetype"}, {
	pattern = "hyprlang",
	group = commentstrings,
	callback = function()
		vim.opt.commentstring = "# %s"
	end,
	desc = "Set commentstring for hyprland conf files"
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
