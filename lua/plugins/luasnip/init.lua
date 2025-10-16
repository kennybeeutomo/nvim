local M = {}

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

local function inode(n)
	return f(function(args) return args[1][1] end, {n})
end

function M.setup()
	ls.add_snippets("c", {
		s("struct", {
			t("typedef struct "), i(1), t({" {",
			"} "}), inode(1), t(";")
		})
	})
	ls.add_snippets("cpp", {
		s("class", {
			t("class "), i(1), t({" {",
			"public:",
			"private:",
			"};"})
		})
	})
end

return M
