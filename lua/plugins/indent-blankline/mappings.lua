local set = vim.keymap.set
local utils = require("plugins.indent-blankline.utils")

set("n", "<leader>tibl", utils.toggle, { desc = "Toggle Indent Blankline" })
