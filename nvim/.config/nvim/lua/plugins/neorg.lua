return {
	"nvim-neorg/neorg",
	version = "v6.*",
	cmd = { "Neorg" },
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						personal = "~/notes/personal",
						work = "~/notes/work",
					},
					default_workspace = "personal",
				},
			},
		},
	},
}
