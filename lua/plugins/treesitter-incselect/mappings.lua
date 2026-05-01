local incselect = require("incselect")
local set = vim.keymap.set

set({"n", "v"}, "<C-h>", incselect.undo, { desc = "Decrement node selection" })
set({"n", "v"}, "<C-l>", incselect.parent, { desc = "Increment node selection" })
