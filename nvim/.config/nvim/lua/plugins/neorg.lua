return {
	"nvim-neorg/neorg",
	enabled = false,
	cmd = "Neorg",
	version = "*",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					icons = {
						code_block = {
							conceal = true,
							width = "content",
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
