local M = {}

-- Custom Highlights
function M.setup()
	local colors = require("pywal16.core").get_colors()

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
end

return M
