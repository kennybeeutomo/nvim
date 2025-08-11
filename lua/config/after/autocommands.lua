local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local utils = require("utils")
local set = vim.keymap.set
local utilsIbl = require("plugins.indent-blankline.utils")

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

local disableIbl = augroup("disableIbl", { clear = true })
autocmd({"Filetype"}, {
	pattern = "norg",
	group = disableIbl,
	callback = function()
		utilsIbl.setcharBuffer(" ")
	end,
	desc = "Disable ibl for norg"
})

local localMappings = augroup("localMappings", { clear = true })
autocmd({"BufRead"}, {
	pattern = "colors-readable.txt",
	group = localMappings,
	callback = function()
		set("n", "y", "f#ye0", { buffer = true, desc = "Copy color" })
	end,
	desc = "Pywal Colors"
})

local localOptions = augroup("localOptions", { clear = true })
autocmd({"Filetype"}, {
	pattern = "norg",
	group = localOptions,
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
	end,
	desc = "Norg Options"
})

local autoViews = augroup("autoViews", { clear = true })
autocmd({"BufWinEnter"}, {
	group = autoViews,
	command = "silent! loadview",
	desc = "Restore folds on buffer open"
})
autocmd({"BufWritePost", "BufWinLeave"}, {
	group = autoViews,
	callback = function()
		-- For normal buffers only
		if vim.o.buftype == "" and not vim.api.nvim_buf_get_name(0) == "" then
			vim.cmd("mkview")
		end
	end,
	desc = "Save folds on buffer close and buffer save"
})
