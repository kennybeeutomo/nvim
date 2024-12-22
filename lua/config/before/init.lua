local function before(files)
	for _,file in pairs(files) do
		require("config.before." .. file)
	end
end

before({
	"options",
	"mappings",
})
