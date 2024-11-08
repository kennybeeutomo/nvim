-- Open Folds automatically on file/buffer open
local open_folds = vim.api.nvim_create_augroup('open_folds', { clear = true })
vim.api.nvim_create_autocmd({'BufReadPost', 'FileReadPost'}, {
	pattern = '*',
	group = open_folds,
	command = "normal zR"
})
