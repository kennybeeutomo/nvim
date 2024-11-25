local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
				-- that way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s", "c" }),

		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s", "c" }),
	},
})

local set = vim.keymap.set

set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
set("n", "gr", vim.lsp.buf.rename, { desc = "LSP: Refactor" })
set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature help" })
