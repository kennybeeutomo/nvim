local M = {}

function M.setup()
	require("neorg").setup({
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					icon_preset = "diamond",
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						todo = "~/neorg/todo",
						notes = "~/neorg/notes",
					},
				},
			},
			-- ["core.keybinds"] = {
			-- 	config = {
			-- 		default_keybinds = false,
			-- 	}
			-- }
		}
	})
	require("plugins.neorg.autocommands")
end

return M
