local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local utils = require("utils")
local set = vim.keymap.set

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

local localMappings = augroup("localMappings", { clear = false })
autocmd({"BufRead"}, {
	pattern = "colors-readable.txt",
	group = localMappings,
	callback = function()
		set("n", "y", "f#ye0", { buffer = true, desc = "Copy color" })
	end,
	desc = "Pywal Colors"
})

local localOptions = augroup("localOptions", { clear = false })
-- autocmd({"Filetype"}, {
-- 	pattern = "",
-- 	group = localOptions,
-- 	callback = function()
-- 	end,
-- 	desc = ""
-- })

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
		if not vim.o.buftype == "" then return end
		-- For named buffers only
		if vim.api.nvim_buf_get_name(0) == "" then return end

		vim.cmd("mkview")
	end,
	desc = "Save folds on buffer close and buffer save"
})

local autosave = augroup("autosave", { clear = true })
autocmd({"InsertLeave", "TextChanged"}, {
	group = autosave,
	callback = function()
		-- Only if autosave is on
		if not vim.g.autosave then return end
		-- For normal buffers only
		if not vim.o.buftype == "" then return end
		-- For named buffers only
		if vim.api.nvim_buf_get_name(0) == "" then return end

		vim.cmd("w")
	end,
	desc = "Autosave"
})
