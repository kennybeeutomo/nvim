local function load(files)
	for _, file in pairs(files) do
		require("plugins." .. file)
	end
end

-- in order
load({
	"lazyinit",
	"plugins",

	"mason",
	"treesitter",

	-- "devicons-auto-colors",
	"nvtree",
	"lualine",
	"gitsigns",
	"toggleterm",
	"telescope",

	"colorizer",
	-- "duckytype",
	-- "markdownpreview",

	"autosave",
	-- "neorg",

	"nvim-cmp",
})
