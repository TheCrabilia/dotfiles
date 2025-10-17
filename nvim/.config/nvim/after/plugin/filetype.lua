vim.filetype.add({
	extension = {
		tf = "terraform",
		tfvars = "terraform-vars",
		tofu = "opentofu",
		j2 = function(path)
			return "jinja",
				function(bufnr)
					local filename = vim.fs.basename(path)
					local parts = vim.split(filename, ".", { plain = true, trimempty = true })

					if vim.list_contains({ "yaml", "yml" }, parts[#parts - 1]) then
						vim.bo[bufnr].tabstop = 2
						vim.bo[bufnr].shiftwidth = 2
						vim.bo[bufnr].commentstring = "# %s"
					end
				end
		end,
	},
	filename = {
		["Jenkinsfile"] = "groovy",
		[os.getenv("HOME") .. "/.kube/config"] = "yaml",
		[".terraformrc"] = "terraform",
		[".zimrc"] = "zsh",
		[".antigenrc"] = "zsh",
		["Brewfile"] = function()
			return "brewfile", function(bufnr)
				vim.bo[bufnr].commentstring = "# %s"
			end
		end,
	},
	pattern = {
		[".*/templates/.*%.yaml"] = "helm",
		[".*/roles/.*%.ya?ml"] = "yaml.ansible",
		[".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
		["${XDG_CONFIG_HOME}/git/config%..*"] = "gitconfig",
	},
})
