vim.filetype.add({
	extension = {
		tf = function()
			return "terraform",
				function()
					vim.opt_local.tabstop = 2
					vim.opt_local.shiftwidth = 2
					vim.opt_local.softtabstop = 2
				end
		end,
		tfvars = function()
			return "terraform-vars",
				function()
					vim.opt_local.tabstop = 2
					vim.opt_local.shiftwidth = 2
					vim.opt_local.softtabstop = 2
				end
		end,
		yaml = function()
			local ft = "yaml"
			local dirname = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
			if
				vim.fs.find("Chart.yaml", {
					upward = true,
					stop = vim.loop.os_homedir(),
					path = dirname,
				}) and vim.regex(".*/templates.*"):match_str(dirname)
			then
				ft = "helm"
			end
			return ft,
				function()
					vim.opt_local.tabstop = 2
					vim.opt_local.shiftwidth = 2
					vim.opt_local.softtabstop = 2
				end
		end,
	},
	filename = {
		["Jenkinsfile"] = "groovy",
	},
})
