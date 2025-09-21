local M = {}

local autopairs = require("nvim-autopairs")

function M.setup()
	autopairs.setup({
		map_bs = false,
	})
end

return M
