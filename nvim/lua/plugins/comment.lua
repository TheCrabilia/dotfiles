return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
		config = function(_, opts)
      require("Comment").setup(opts)

      local ft = require("Comment.ft")
      ft.set("terraform-vars", "#%s")
    end,
	},
}
