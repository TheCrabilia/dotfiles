return {
	"nvim-neorg/neorg",
	version = "v6.*",
	cmd = { "Neorg" },
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.export"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						personal = "~/notes/personal",
						work = "~/notes/work",
					},
					default_workspace = "personal",
				},
			},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.presenter"] = {
				config = {
					zen_mode = "zen-mode",
				},
			},
		},
	},
}
