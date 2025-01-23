local M = {}

-- Custom Highlights
function M.setup()
	local colors = require("pywal16.core").get_colors()
	local devicons = require("nvim-web-devicons")
	local hl = vim.api.nvim_set_hl

	-- Terminal colors
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

	local icons = vim.tbl_extend('keep', devicons.get_icons_by_filename(), devicons.get_icons_by_extension())

	local highlightPresets = {
		opaque = { bg = colors.background },
		opaqueInvert = { bg = colors.color1, fg = colors.background }
	}

	local highlightChoice = vim.g.bufferLineInvert and highlightPresets.opaqueInvert or highlightPresets.opaque

	local customHighlights = {
		BufferLineBackground = highlightChoice,
		BufferLinePick = highlightChoice,
		BufferLineModified = highlightChoice,
		BufferLineDevIconDefault = highlightChoice,
		BufferLineCloseButton = highlightChoice,
		BufferLineWarning = highlightChoice,
		BufferLineWarningDiagnostic = highlightChoice,
		BufferLineError = highlightChoice,
		BufferLineErrorDiagnostic = highlightChoice,
	}

	local function hlDevIconFormat(iconName)
		return "BufferLineDevIcon" .. iconName
	end

	for _, icon in pairs(icons) do
		customHighlights[hlDevIconFormat(icon.name)] = highlightChoice
	end

	for group, value in pairs(customHighlights) do
		hl(0, group, value)
	end
end

return M

-- BufferLineWarningDiagnosticSelected
-- BufferLineWarningDiagnosticVisible
-- BufferLineErrorDiagnosticSelected
-- BufferLineInfoDiagnosticSelected
-- BufferLineHintDiagnosticSelected
-- BufferLineErrorDiagnosticVisible
-- BufferLineInfoDiagnosticVisible
-- BufferLineHintDiagnosticVisible
-- BufferLineCloseButtonSelected
-- BufferLineDiagnosticSelected
-- BufferLineCloseButtonVisible
-- BufferLineWarningDiagnostic
-- BufferLineIndicatorSelected
-- BufferLineDuplicateSelected
-- BufferLineDiagnosticVisible
-- BufferLineModifiedSelected
-- BufferLineIndicatorVisible
-- BufferLineDuplicateVisible
-- BufferLineWarningSelected
-- BufferLineNumbersSelected
-- BufferLineModifiedVisible
-- BufferLineErrorDiagnostic
-- BufferLineWarningVisible
-- BufferLineNumbersVisible
-- BufferLineInfoDiagnostic
-- BufferLineHintDiagnostic
-- BufferLineErrorSelected
-- BufferLinePickSelected
-- BufferLineInfoSelected
-- BufferLineHintSelected
-- BufferLineErrorVisible
-- BufferLineTruncMarker
-- BufferLinePickVisible
-- BufferLineInfoVisible
-- BufferLineHintVisible
-- BufferLineCloseButton
-- BufferLineGroupLabel
-- BufferLineDiagnostic
-- BufferLineBackground
-- BufferLineSeparatorVisible
-- BufferLineOffsetSeparator
-- BufferLineGroupSeparator
-- BufferLineSeparatorSelected
-- BufferLineSeparator
-- BufferLineDuplicate
-- BufferLineModified
-- BufferLineWarning
-- BufferLineNumbers
-- BufferLineError
-- BufferLinePick
-- BufferLineInfo
-- BufferLineHint
-- BufferLineFill
-- BufferLineBufferSelected
-- BufferLineBufferVisible
-- BufferLineBuffer
-- BufferLineTabSeparatorSelected
-- BufferLineTabSeparator
-- BufferLineTabSelected
-- BufferLineTabClose
-- BufferLineTab
