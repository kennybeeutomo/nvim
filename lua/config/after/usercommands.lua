local utils = require("utils")

vim.api.nvim_create_user_command("Colo", function(opts)
	utils.cleanColorscheme(opts.fargs[1])
end, { nargs = 1, complete = "color", desc = "A clean :colorscheme" })
