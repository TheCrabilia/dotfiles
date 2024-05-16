require("luasnip.session.snippet_collection").clear_snippets("lua")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("go", {
	s("struct", {
		t("type "),
		i(1, "name"),
		t({ " struct {", "" }),
		i(2),
		t({ "", "}" }),
	}),
	s("interface", {
		t("type "),
		i(1, "name"),
		t({ " interface {", "" }),
		i(2),
		t({ "", "}" }),
	}),
	s("func", {
		t("func "),
		i(1, "name"),
		t({ "(" }),
		i(2),
		t({ ") " }),
		i(3),
		t({ " {", "\t" }),
		i(4),
		t({ "", "}" }),
	}),
})
