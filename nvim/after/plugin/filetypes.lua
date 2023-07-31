vim.filetype.add({
	extension = {
		tf = function()
			return "terraform"
		end,
		tfvars = function()
			return "terraform-vars"
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
			return ft
		end,
	},
})
