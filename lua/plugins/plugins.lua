require("lazy").setup({
	"nvim-lua/plenary.nvim",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",

	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},

	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{
		"shaunsingh/nord.nvim",
		lazy = true,
	},

	{
		'windwp/nvim-autopairs',
		lazy = true,
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},

	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp-signature-help',

	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	'norcalli/nvim-colorizer.lua',

	{ "folke/neodev.nvim", opts = {}, ft = { "lua" } },

	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},

	{
		"kwakzalver/duckytype.nvim",
		cmd = { "DuckyType" }
	},
	{
		"https://github.com/barrett-ruth/live-server.nvim",
		build = "npm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true
	},

	'lewis6991/gitsigns.nvim',

	'pocco81/auto-save.nvim',
})
