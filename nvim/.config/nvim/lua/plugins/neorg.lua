return {
	"nvim-neorg/neorg",
	cmd = "Neorg",
	version = "*",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					icons = {
						code_block = {
							spell_check = false,
						},
					},
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/notes",
					},
					default_workspace = "notes",
				},
			},
		},
	},
}
