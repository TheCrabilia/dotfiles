vim.filetype.add({
	extension = {
		tf = function()
			return "terraform", function()
				vim.bo.tabstop = 2
				vim.bo.shiftwidth = 2
			end
		end,
		tfvars = function()
			return "terraform-vars", function()
				vim.bo.tabstop = 2
				vim.bo.shiftwidth = 2
			end
		end,
		lua = function()
			return "lua", function()
				vim.bo.tabstop = 3
				vim.bo.shiftwidth = 3
			end
		end,
		yaml = function()
         local ft = ""
			local dirname = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
			if
				vim.fs.find("Chart.yaml", {
					upward = true,
					stop = vim.loop.os_homedir(),
					path = dirname,
				}) and vim.regex(".*/templates.*"):match_str(dirname)
			then
            ft = "helm"
         else
            ft = "yaml"
			end
         return ft, function()
            vim.bo.tabstop = 2
            vim.bo.shiftwidth = 2
         end
		end,
	},
})
