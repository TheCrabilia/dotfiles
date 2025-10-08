vim.filetype.add({
	extension = {
		tf = "terraform",
		tfvars = "terraform-vars",
		tofu = "opentofu",
		j2 = "jinja",
		-- j2 = function(path)
		-- 	local filename = vim.fs.basename(path)
		-- 	local parts = vim.split(filename, ".", { plain = true, trimempty = true })
		-- 	-- a little bit of magic, because we need to match "yml" to "yaml", maybe some other cases
		-- 	return vim.filetype.match({ filename = "file." .. parts[#parts - 1] })
		-- end,
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
