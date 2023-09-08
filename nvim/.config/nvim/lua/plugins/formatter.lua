return {
	"mhartington/formatter.nvim",
	opts = function()
		return {
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					require("formatter.filetypes.python").black,
					function()
						return {
							exe = "ruff",
							args = { "--fix", "-e", "-n", "--stdin-filename", vim.api.nvim_buf_get_name(0), "-" },
							stdin = true,
							no_append = true,
						}
					end,
				},
				go = {
					require("formatter.filetypes.go").gofmt,
					require("formatter.filetypes.go").goimports,
				},
				toml = {
					require("formatter.filetypes.toml").taplo,
				},
				json = {
					require("formatter.filetypes.json").fixjson,
				},
				terraform = {
					require("formatter.filetypes.terraform").terraformfmt,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettierd,
				},
				css = {
					require("formatter.filetypes.css").prettierd,
				},
				graphql = {
					require("formatter.filetypes.graphql").prettierd,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		}
	end,
	keys = {
		{
			"<leader>lf",
			mode = "n",
			function()
				vim.cmd.Format()
			end,
			desc = "Format file",
		},
	},
}
