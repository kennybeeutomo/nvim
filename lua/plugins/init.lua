require("plugins.lazyinit")
require("plugins.plugins")

local function load(files)
	for _, file in pairs(files) do
		require("plugins." .. file).setup()
	end
end

-- in order
load({
	"mason",
	"treesitter",

	"nvtree",
	"lualine",
	"bufferline",
	"gitsigns",
	"toggleterm",
	"telescope",
	"autopairs",

	"colorizer",
	"zenmode",

	"nvim-cmp",
	"lspconfig",
	"dap",
	"indent-blankline",
})
