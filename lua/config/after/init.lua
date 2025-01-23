local function after(files)
	for _,file in pairs(files) do
		require("config.after." .. file)
	end
end

after({
	"autocommands",
	"usercommands"
})

require("utils").cleanColorscheme("pywal16")
-- require("utils").cleanColorscheme("night-owl")
