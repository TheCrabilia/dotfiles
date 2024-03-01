return {
	"jackMort/ChatGPT.nvim",
	cmd = {
		"ChatGPT",
		"ChatGPTActAs",
		"ChatGPTEditWithInstructions",
		"ChatGPTRun",
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		api_key_cmd = "op read op://Personal/OpenAI/credential --no-newline",
	},
}
