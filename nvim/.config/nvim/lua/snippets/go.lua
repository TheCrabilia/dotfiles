require("luasnip.session.snippet_collection").clear_snippets("lua")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
	s("struct", fmt("type {} struct {\n\t{}\n}", { i(1), i(2) })),
	s("func", fmt("func {}({}) {} {\n\t{}\n}", { i(1), i(2), i(3) })),
	s("interface", fmt("type {} interface {\n\t{}\n}", { i(1), i(2) })),
	s("ife", fmt("if err != nil {\n\treturn err\n}")),
})
