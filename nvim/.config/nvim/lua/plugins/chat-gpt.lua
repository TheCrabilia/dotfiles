---@type LazySpec
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
		extra_curl_params = {
			"--proxy",
			"http://127.0.0.1:3128",
		},
		openai_params = {
			model = "gpt-4-1106-preview",
			max_tokens = 500,
		},
	},
}
