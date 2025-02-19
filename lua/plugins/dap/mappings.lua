local set = vim.keymap.set

local dap = require("dap")
local dapui = require("dapui")

set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: REPL mode" })
set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: breakpoint" })
set("n", "<leader>dc", dap.continue, { desc = "DAP: continue" })
set("n", "<leader>dl", dap.clear_breakpoints, { desc = "DAP: clear breakpoints" })
set("n", "<leader>dt", dap.terminate, { desc = "DAP: terminate" })
set("n", "<leader>ds", dap.step_over, { desc = "DAP: step over" })
set("n", "<leader>di", dap.step_into, { desc = "DAP: step into" })
set("n", "<leader>do", dap.step_out, { desc = "DAP: step out" })
set("n", "<leader>du", dapui.toggle, { desc = "DAP: show ui" })
