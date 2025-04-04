vim.filetype.add({
	extension = {
		tf = "terraform",
		tfvars = "terraform-vars",
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
		[os.getenv("XDG_CONFIG_HOME") .. "/git/config%..*"] = "gitconfig",
	},
})
