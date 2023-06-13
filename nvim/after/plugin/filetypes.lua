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
	},
})
