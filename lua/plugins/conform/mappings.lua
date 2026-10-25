local set = vim.keymap.set
local conform = require("conform")

set({ "n", "v" }, "<C-F>", conform.format, { desc = "Conform: Format" })
