---@type LazySpec
return {
	{ "neovim/nvim-lspconfig" },
	{ "b0o/schemastore.nvim" },
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		build = function()
			vim.cmd.MasonUpdate()
		end,
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		cmd = "ConformInfo",
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				go = { "goimports", "gofumpt", "golines" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				java = { "clang_format" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				hcl = { "terraform_fmt" },
				proto = { "buf" },
				typescript = { "prettierd" },
				javascript = { "prettierd" },
				css = { "prettierd" },
				templ = { "templ" },
				sql = { "sql_formatter" },
				yaml = { "yamlfmt" },
				terraform = { "tofu_fmt", "terraform_fmt" },
				json = { "prettierd" },
				ml = { "ocamlformat" },
				["terraform-vars"] = { "tofu_fmt", "terraform_fmt" },
				["_"] = { "trim_whitespace" },
			},
			formatters = {
				clang_format = {
					inherit = true,
					prepend_args = {
						"-style={BasedOnStyle: Google, UseTab: Always, IndentWidth: 4, TabWidth: 4, ColumnLimit: 120}",
					},
				},
				ruff_format = {
					inherit = true,
					args = {
						"format",
						"--force-exclude",
						"--line-length",
						"120",
						"--stdin-filename",
						"$FILENAME",
						"-",
					},
				},
				golines = {
					inherit = true,
					prepend_args = {
						"-m",
						"120",
						"--shorten-comments",
						"--reformat-tags",
					},
				},
				yamlfmt = {
					inherit = true,
					prepend_args = {
						"-formatter",
						"retain_line_breaks=true",
					},
				},
				sql_formatter = {
					inherit = true,
					prepend_args = {
						"--config",
						[[{"keywordCase": "upper", "dataTypeCase": "upper", "functionCase": "upper"}]],
					},
				},
			},
		},
		keys = {
			{
				"<leader>lf",
				mode = { "n", "v" },
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format buffer",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local ok, lint = pcall(require, "lint")
			if ok then
				lint.linters_by_ft = {
					sh = { "shellcheck" },
					bash = { "shellcheck" },
					proto = { "buf_lint" },
				}

				lint.linters.shellcheck.args = {
					"--format",
					"json",
					"--enable",
					"all",
					"-e",
					"SC2154",
					"-",
				}

				vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
					callback = function()
						lint.try_lint()
					end,
				})
			end
		end,
	},
}
