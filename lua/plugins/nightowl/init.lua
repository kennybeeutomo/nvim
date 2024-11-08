if not vim.g.pywal then
	require("night-owl").setup({
		bold = true,
		italics = true,
		underline = true,
		undercurl = true,
		transparent_background = not vim.g.neovide,
	})

	-- gray
	vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#D6dEEB' })

	-- light purple
	vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#78ccf0' })
	vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })

	-- orange 2
	vim.api.nvim_set_hl(0, 'CmpItemKindClass', { bg='NONE', fg='#ffcb8b' })
	vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link='CmpItemKindClass' })
	vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link='CmpItemKindClass' })
	vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { link='CmpItemKindClass' })
	vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindClass' })

	-- blue
	vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#5CA7E4' })
	vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
	vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link='CmpItemKindFunction' })

	-- gray 3
	vim.api.nvim_set_hl(0, 'CmpItemKindText', { bg='NONE', fg='#969696' })

	-- red
	vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { bg='NONE', fg='#ff5874' })

	-- front
	vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#D6dEEB' })

	-- local palette = require("night-owl.palette")
	--
	-- vim.api.nvim_set_hl(0, "@type.builtin", { fg = palette.magenta3, bg = "NONE" })

	vim.cmd.colorscheme("night-owl")
end
