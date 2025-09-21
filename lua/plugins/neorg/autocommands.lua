local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local localOptions = augroup("localOptions", { clear = false })
autocmd({"Filetype"}, {
	pattern = "norg",
	group = localOptions,
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
	end,
	desc = "Hide numbers on norg files"
})
