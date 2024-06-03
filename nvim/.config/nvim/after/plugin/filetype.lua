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
	},
	pattern = {
		[".*/templates/.*%.yaml"] = "helm",
	},
})
