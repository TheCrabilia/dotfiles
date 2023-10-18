return {
	"mhartington/formatter.nvim",
	opts = function()
		return {
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					function()
						return {
							exe = "ruff",
							args = {
								"--fix",
								"-e",
								"-n",
								"--stdin-filename",
								vim.fn.shellescape(vim.api.nvim_buf_get_name(0), true),
							},
							stdin = true,
							no_append = true,
						}
					end,
					require("formatter.filetypes.python").black,
				},
				go = {
					require("formatter.filetypes.go").goimports,
					require("formatter.filetypes.go").gofmt,
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
				c = {
					function()
						return {
							exe = "clang-format",
							args = {
								"--style='{BasedOnStyle: Google, UseTab: Always, IndentWidth: 8, TabWidth: 8, ColumnLimit: 120}'",
								vim.fn.shellescape(vim.api.nvim_buf_get_name(0), true),
							},
							stdin = true,
						}
					end,
				},
				cpp = {
					function()
						return {
							exe = "clang-format",
							args = {
								"--style='{BasedOnStyle: Google, UseTab: Always, IndentWidth: 8, TabWidth: 8, ColumnLimit: 120}'",
								vim.fn.shellescape(vim.api.nvim_buf_get_name(0), true),
							},
							stdin = true,
						}
					end,
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
				vim.cmd.FormatLock()
			end,
			desc = "Format file",
		},
	},
}
