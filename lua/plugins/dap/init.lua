local M = { }

local dap = require("dap")

function M.setup()
	dap.adapters.codelldb = {
		type = "executable",
		command = "codelldb",
	}

	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
		},
	}

	dap.configurations.c = dap.configurations.cpp

	require("plugins.dap.dapui")
	require("plugins.dap.mappings")
end

return M
