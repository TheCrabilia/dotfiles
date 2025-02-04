---@diagnostic disable: undefined-global
return {
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

	s("fun", fmt("function {}({})\n\t{}\nend", { i(1), i(2), i(3) })),
	s("lfun", fmt("local {} = function({})\n\t{}\nend", { i(1), i(2), i(3) })),
	s("afun", fmt("function({})\n\t{}\nend", { i(1), i(2) })),
}
