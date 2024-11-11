require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },

	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "nvim-treesitter/nvim-treesitter", },

	{ "nvim-tree/nvim-web-devicons" },
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		event = "VeryLazy",
		config = function()
			require("plugins.devicons-auto-colors")
		end,
	},
	{ "nvim-tree/nvim-tree.lua", },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ "lewis6991/gitsigns.nvim", },

	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", },
	},

	{
		"NvChad/nvim-colorizer.lua",
	},

	{
		"kwakzalver/duckytype.nvim",
		cmd = { "DuckyType" },
		config = function()
			require("plugins.duckytype")
		end
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		config = function()
			require("plugins.markdownpreview")
		end,
	},

	{
		"pocco81/auto-save.nvim",
	},
	{
		"nvim-neorg/neorg",
		cmd = "Neorg",
		version = "*",
		config = function()
			require("plugins.neorg")
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		opts = {},
	},

	{ "oxfist/night-owl.nvim", },
	{ "uZer/pywal16.nvim", },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		ft = "lua",
		opts = {},
	},

	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },

	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },

	{
		"barrett-ruth/live-server.nvim",
		build = "npm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},

	{ "Ron89/thesaurus_query.vim" },
})
