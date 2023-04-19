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
}

local M = {}

function M.load()
	for ft, snip in pairs(snippets) do
		ls.add_snippets(ft, snip)
	end
end

return M
