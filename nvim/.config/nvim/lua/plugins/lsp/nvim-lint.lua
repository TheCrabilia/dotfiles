---@type LazySpec
return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = "BufReadPost",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {}

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
