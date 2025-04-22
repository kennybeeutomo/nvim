local M = {}

local colors = require("pywal16.core").get_colors()
local devicons = require("nvim-web-devicons")
local hl = vim.api.nvim_set_hl

M.highlights = {
	vim = function()
		hl(0, "Visual", { fg = colors.color0, bg = colors.color12 })
		-- hl(0, "Visual", { reverse = true })
		hl(0, "Search", { fg = colors.color0, bg = colors.color12 })
		hl(0, "IncSearch", { fg = colors.color0, bg = colors.color4 })
	end,

	terminal = function()
		-- Base colors
		vim.g.terminal_color_0  = colors.color0  -- Black
		vim.g.terminal_color_1  = colors.color1  -- Red
		vim.g.terminal_color_2  = colors.color2  -- Green
		vim.g.terminal_color_3  = colors.color3  -- Yellow
		vim.g.terminal_color_4  = colors.color4  -- Blue
		vim.g.terminal_color_5  = colors.color5  -- Magenta
		vim.g.terminal_color_6  = colors.color6  -- Cyan
		vim.g.terminal_color_7  = colors.color7  -- White

		-- -- Bright colors
		vim.g.terminal_color_8  = colors.color8  -- Bright Black
		vim.g.terminal_color_9  = colors.color9  -- Bright Red
		vim.g.terminal_color_10 = colors.color10 -- Bright Green
		vim.g.terminal_color_11 = colors.color11 -- Bright Yellow
		vim.g.terminal_color_12 = colors.color12 -- Bright Blue
		vim.g.terminal_color_13 = colors.color13 -- Bright Magenta
		vim.g.terminal_color_14 = colors.color14 -- Bright Cyan
		vim.g.terminal_color_15 = colors.color15 -- Bright White
	end,

	bufferline = function()
		local blColors = { bg = colors.color12, fg = colors.background }

		local blIcons = vim.tbl_extend('keep', devicons.get_icons_by_filename(), devicons.get_icons_by_extension())
		table.insert(blIcons, { name = "Default" })

		local blCustomGroups = {
			"BufferLineBackground",
			"BufferLinePick",
			"BufferLineModified",
			"BufferLineCloseButton",
			"BufferLineWarning",
			"BufferLineWarningDiagnostic",
			"BufferLineError",
			"BufferLineErrorDiagnostic",
			"BufferLineHint",
			"BufferLineHintDiagnostic",
			"BufferLineInfo",
			"BufferLineInfoDiagnostic",
			"BufferLineDuplicate",
			"BufferLineBuffer",
		}

		local blGroups = { }

		for _, group in pairs(blCustomGroups) do
			table.insert(blGroups, group .. "Selected")
			table.insert(blGroups, group .. "Visible")
		end

		for _, icon in pairs(blIcons) do
			table.insert(blGroups, "BufferLineDevIcon" .. icon.name .. "Selected")
			table.insert(blGroups, "BufferLineDevIcon" .. icon.name .. "Inactive")
		end

		for _, group in pairs(blGroups) do
			hl(0, group, blColors)
		end
	end,

	ibl = function()
		-- hl(0, "IblWhitespace", { bg = "NONE" })
		hl(0, "@ibl.whitespace.char.1", { bg = "NONE" })
		hl(0, "@ibl.scope.underline.1", { bg = "NONE", bold = true, italic = true })
	end,

	dapui = function()
		hl(0, "DapUIBreakpointsLine", { fg = colors.color14 })
		hl(0, "DapUIScope", { fg = colors.color14 })
		hl(0, "DapUIModifiedValue", { fg = colors.color14 })
		hl(0, "DapUIDecoration", { fg = colors.color14 })
		hl(0, "DapUIStoppedThread", { fg = colors.color14 })
		hl(0, "DapUILineNumber", { fg = colors.color14 })
		hl(0, "DapUIFloatBorder", { fg = colors.color14 })
		hl(0, "DapUIBreakpointsPath", { fg = colors.color14 })
		hl(0, "DapUIStepOver", { fg = colors.color14 })
		hl(0, "DapUIStepInto", { fg = colors.color14 })
		hl(0, "DapUIStepBack", { fg = colors.color14 })
		hl(0, "DapUIStepOut", { fg = colors.color14 })
		hl(0, "DapUIWinSelect", { fg = colors.color14 })
		hl(0, "DapUIStepOverNC", { fg = colors.color14 })
		hl(0, "DapUIStepIntoNC", { fg = colors.color14 })
		hl(0, "DapUIStepBackNC", { fg = colors.color14 })
		hl(0, "DapUIStepOutNC", { fg = colors.color14 })
		hl(0, "DapUIType", { fg = colors.color13 })
		hl(0, "DapUISource", { fg = colors.color13 })
		hl(0, "DapUICurrentFrameName", { fg = colors.color10 })
		hl(0, "DapUIThread", { fg = colors.color10 })
		hl(0, "DapUIWatchesValue", { fg = colors.color10 })
		hl(0, "DapUIBreakpointsInfo", { fg = colors.color10 })
		hl(0, "DapUIBreakpointsCurrentLine", { fg = colors.color10 })
		hl(0, "DapUIPlayPause", { fg = colors.color10 })
		hl(0, "DapUIRestart", { fg = colors.color10 })
		hl(0, "DapUIPlayPauseNC", { fg = colors.color10 })
		hl(0, "DapUIRestartNC", { fg = colors.color10 })
		hl(0, "DapUIWatchesEmpty", { fg = colors.color9 })
		hl(0, "DapUIWatchesError", { fg = colors.color9 })
		hl(0, "DapUIStop", { fg = colors.color9 })
		hl(0, "DapUIStopNC", { fg = colors.color9 })
	end
}

function M.setup()
	colors = require("pywal16.core").get_colors()
	for _, highlight in pairs(M.highlights) do
		highlight()
	end
end

return M
