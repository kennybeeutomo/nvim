local set = vim.keymap.set
local bufferline = require("bufferline")
local utils = require("plugins.bufferline.utils")

set("n", "L", function() bufferline.cycle(1) end, { desc = "Next Buffer" })
set("n", "H", function() bufferline.cycle(-1) end, { desc = "Previous Buffer" })

set("n", "<M-L>", function() bufferline.move(1) end, { desc = "Move Buffer Right" })
set("n", "<M-H>", function() bufferline.move(-1) end, { desc = "Move Buffer Left" })

set("n", "<C-B>", function() utils.deleteCurrentBuffer(false) end, { desc = "Delete Buffer" })
set("n", "<M-b>", function() utils.deleteCurrentBuffer(true) end, { desc = "Delete Buffer Reverse" })

set("n", "<C-1>", function() bufferline.go_to(1, true) end, { desc = "Go to buffer 1" })
set("n", "<C-2>", function() bufferline.go_to(2, true) end, { desc = "Go to buffer 2" })
set("n", "<C-3>", function() bufferline.go_to(3, true) end, { desc = "Go to buffer 3" })
set("n", "<C-4>", function() bufferline.go_to(4, true) end, { desc = "Go to buffer 4" })
set("n", "<C-5>", function() bufferline.go_to(5, true) end, { desc = "Go to buffer 5" })
set("n", "<C-6>", function() bufferline.go_to(6, true) end, { desc = "Go to buffer 6" })
set("n", "<C-7>", function() bufferline.go_to(7, true) end, { desc = "Go to buffer 7" })
set("n", "<C-8>", function() bufferline.go_to(8, true) end, { desc = "Go to buffer 8" })
set("n", "<C-9>", function() bufferline.go_to(9, true) end, { desc = "Go to buffer 9" })
