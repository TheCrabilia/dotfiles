---@diagnostic disable: undefined-global
return {
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
	s("ife", {
		t({ "if err != nil {", "\t" }),
		i(1),
		t({ "", "}" }),
	}),
}
