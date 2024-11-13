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
						life = "~/neorg/life",
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
end

return M
