local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets = {
	lua = {
		s(
			"req",
			fmt([[local {} = require("{}")]], {
				f(function(import_name)
					local parts = vim.split(import_name[1][1], ".", { plain = true })
					return parts[#parts] or ""
				end, { 1 }),
				i(1),
			})
		),
		-- Anonymouse function
		s("afun", { t("function("), i(1), t({ ")", "\t" }), i(2), t({ "", "end" }) }),
		s("fun", { t("function "), i(1), t("("), i(2), t({ ")", "\t" }), i(3), t({ "", "end" }) }),
	},
	terraform = {
		s("res", {
			t('resource "'),
			i(1, "type"),
			t('" "'),
			i(2, "name"),
			t({ '" {', "\t" }),
			i(3),
			t({ "", "}" }),
		}),
		s("data", {
			t('data "'),
			i(1, "type"),
			t('" "'),
			i(2, "name"),
			t({ '" {', "\t" }),
			i(3),
			t({ "", "}" }),
		}),
		s("var", {
			t('variable "'),
			i(1, "name"),
			t({ '" {', "\t" }),
			i(2),
			t({ "", "}" }),
		}),
		s("out", {
			t('output "'),
			i(1, "name"),
			t({ '" {', "\t" }),
			i(2),
			t({ "", "}" }),
		}),
	},
	go = {
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
	},
}

local M = {}

function M.load()
	for ft, snip in pairs(snippets) do
		ls.add_snippets(ft, snip)
	end
end

return M
