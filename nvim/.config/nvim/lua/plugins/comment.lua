return {
	"numToStr/Comment.nvim",
	opts = function()
		return {
			filetype_commentstring = {
				["terraform-vars"] = "#%s",
			},
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}
	end,
	config = function(_, opts)
		require("Comment").setup(opts)

		local ft = require("Comment.ft")
		for filetype, commentstring in pairs(opts.filetype_commentstring) do
			ft.set(filetype, commentstring)
		end
	end,
	keys = {
		{ "gcc", mode = "n" },
		{ "gc", mode = "v" },
	},
}
