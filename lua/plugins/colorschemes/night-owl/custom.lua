local M = {}

local palette = require("plugins.colorschemes.night-owl.palette")
local hl = vim.api.nvim_set_hl

M.highlights = {
	cmp = function()
		local customHighlights = {
			CmpItemAbbrDeprecated = { bg = 'NONE', strikethrough = true, fg = palette.fg },
			CmpItemAbbrMatch = { bg = 'NONE', fg = palette.light_blue },
			CmpItemAbbrMatchFuzzy = { link = 'CmpIntemAbbrMatch' },

			CmpItemKindClass = { bg = 'NONE', fg = palette.orange2 },
			CmpItemKindConstructor = { link = 'CmpItemKindClass' },
			CmpItemKindStruct = { link = 'CmpItemKindClass' },
			CmpItemKindKeyword = { link = 'CmpItemKindClass' },
			CmpItemKindInterface = { link = 'CmpItemKindClass' },

			CmpItemKindFunction = { bg = 'NONE', fg = palette.blue8 },
			CmpItemKindMethod = { link = 'CmpItemKindFunction' },
			CmpItemKindEnumMember = { link = 'CmpItemKindFunction' },

			CmpItemKindText = { bg = 'NONE', fg = palette.gray5 },

			CmpItemKindSnippet = { bg = 'NONE', fg = palette.red },

			CmpItemKindVariable = { bg = 'NONE', fg = palette.fg },

			["@type.builtin"] = { fg = palette.magenta7, bg = "NONE" },
		}

		for group, value in pairs(customHighlights) do
			hl(0, group, value)
		end
	end,
}

function M.setup()
	for _, highlight in pairs(M.highlights) do
		highlight()
	end
end

return M
