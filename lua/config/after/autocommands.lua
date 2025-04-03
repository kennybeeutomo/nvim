local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local utils = require("utils")

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
