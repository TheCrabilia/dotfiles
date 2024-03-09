local home = os.getenv("HOME")

vim.filetype.add({
	extension = {
		tf = "terraform",
		tfvars = "terraform-vars",
	},
	filename = {
		["Jenkinsfile"] = "groovy",
		[home .. "/.kube/config"] = "yaml",
		[home .. "/.terraformrc"] = "terraform",
	},
	pattern = {
		[".*/templates/.*%.yaml"] = "helm",
	},
})
