---@diagnostic disable: undefined-global
return {
	s(
		";code",
		fmt(
			[[
			```{}
			{}
			```
			]],
			{ i(1), i(2) }
		)
	),
	s(";task", { t("- [ ] "), i(1) }),
	s(";link", fmt("[{}]({})", { i(1), i(2) })),
	s(";img", fmt("![{}]({})", { i(1), i(2) })),
}
