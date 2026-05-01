local set = vim.keymap.set

local keymaps = {
	select = {
		operation = require("nvim-treesitter-textobjects.select"),
		modes = { "x", "o" },
		actions = {
			select_textobject = {
				["aa"] = { query = "@parameter.outer", desc = "Select around parameter" },
				["ia"] = { query = "@parameter.inner", desc = "Select inside parameter" },
				["af"] = { query = "@function.outer", desc = "Select around function" },
				["if"] = { query = "@function.inner", desc = "Select inside function" },
				["ac"] = { query = "@class.outer", desc = "Select around class" },
				["ic"] = { query = "@class.inner", desc = "Select inside class" },
				["as"] = { query = "@local.scope", desc = "Select around scope" },
				["is"] = { query = "@local.scope", desc = "Select inside scope" },
				["ab"] = { query = "@block.outer", desc = "Select around block" },
				["ib"] = { query = "@block.inner", desc = "Select inside block" },
			}
		}
	},

	swap = {
		operation = require("nvim-treesitter-textobjects.swap"),
		modes = { "n" },
		actions = {
			swap_previous = {
				["<leader>,"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
			},
			swap_next = {
				["<leader>."] = { query = "@parameter.inner", desc = "Swap next parameter" },
			},
		}
	},

	move = {
		operation = require("nvim-treesitter-textobjects.move"),
		modes = { "n", "x", "o" },
		actions = {
			goto_previous_end = {
				["<C-,>"] = { query = "@parameter.inner", desc = "Go to previous parameter" },
			},
			goto_next_end = {
				["<C-.>"] = { query = "@parameter.inner", desc = "Go to next parameter" },
			},
		}
	},
}

for _, keymap in pairs(keymaps) do
	for type, keys in pairs(keymap.actions) do
		for key, action in pairs(keys) do
			set(keymap.modes, key, function()
				keymap.operation[type](action.query, "textobjects")
			end, { desc = action.desc })
		end
	end
end
