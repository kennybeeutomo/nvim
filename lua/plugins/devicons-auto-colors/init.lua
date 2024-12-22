local M = {}

local utils = require("utils")

local default = {
	"#88AAFF",
	"#88DD88",
	"#EE6677",
	"#00DDAA",
	"#DDDD74",
	"#9977FF",
	"#99BBFF",
	"#99EE99",
	"#FF9999",
	"#77EECC",
	"#FFFF90",
	"#BBBBFF",
}

function M.setup()
	require("tiny-devicons-auto-colors").setup()
end

function M.apply(colorscheme)
	local palettes = {
		pywal16 = require("pywal16.core").get_colors(),
		["night-owl"] = require("night-owl.palette"),
	}

	local palette = palettes[colorscheme]

	if not utils.colorschemeExists(colorscheme) then
		palette = default
	end

	require("tiny-devicons-auto-colors").apply(palette)
end

return M
