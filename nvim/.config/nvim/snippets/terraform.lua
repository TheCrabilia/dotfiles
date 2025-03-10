---@diagnostic disable: undefined-global
return {
	s(
		"res",
		fmt(
			[[
	resource "{}" "{}" {{
		{}
	}}
		]],
			{ i(1), i(2), i(3) }
		)
	),
	s(
		"data",
		fmt(
			[[
	data "{}" "{}" {{
		{}
	}}
		]],
			{ i(1), i(2), i(3) }
		)
	),
	s(
		"var",
		fmt(
			[[
	variable "{}" {{
		type = {}
	}}
		]],
			{ i(1), i(2) }
		)
	),
	s(
		"module",
		fmt(
			[[
	module "{}" {{
		source = "{}"
	}}
		]],
			{ i(1), i(2) }
		)
	),
}
