local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local lualine = require("lualine")

local lualineRefresh = augroup("lualineRefresh", { clear = true })
autocmd({"User"}, {
	pattern = "AutosaveToggle",
	group = lualineRefresh,
	callback = function()
		lualine.refresh()
	end,
	desc = "Refresh lualine on toggling autosave"
})
