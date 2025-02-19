require("dapui").setup({
	layouts = {
		{
			elements = {
				{ id = "repl", size = 0.2 },
				{ id = "stacks", size = 0.2 },
				{ id = "scopes", size = 0.6 },
			},
			position = "right",
			size = 80,
		},
		{
			elements = {
				{ id = "console", size = 1.0 },
			},
			position = "bottom",
			size = 10,
		}
	},
})

local dap = require("dap")
local dapui = require("dapui")
local nvtree = require("nvim-tree.api")

dap.listeners.before.attach.dapui_config = function()
	nvtree.tree.close()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	nvtree.tree.close()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
