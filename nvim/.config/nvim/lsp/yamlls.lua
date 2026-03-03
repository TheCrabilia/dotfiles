---@type vim.lsp.Config
return {
	filetypes = { "yml", "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
	settings = {
		-- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
		},
	},
}
