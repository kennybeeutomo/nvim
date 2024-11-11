local function after(files)
	for _,file in pairs(files) do
		require("config.after." .. file)
	end
end

after({
})

vim.cmd.colorscheme("pywal16")
-- vim.cmd.colorscheme("night-owl")
-- for _,v in pairs(require("lazy").plugins()) do
-- 	print(v.name)
-- end
