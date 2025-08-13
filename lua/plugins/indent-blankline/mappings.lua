local set = vim.keymap.set
local utils = require("plugins.indent-blankline.utils")

set("n", "<C-T>", utils.toggle, { desc = "Toggle Indent Blankline" })
