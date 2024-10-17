---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{ "nvim-treesitter/nvim-treesitter-context", enabled = false },
	},
	build = function()
		vim.cmd.TSUpdate()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"dockerfile",
				"go",
				"gomod",
				"gosum",
				"hcl",
				"java",
				"json",
				"jsonc",
				"lua",
				"make",
				"python",
				"query",
				"rego",
				"terraform",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 1 MiB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "yaml", "go" },
			},
		})

		local ok, ts_context = pcall(require, "nvim-treesitter-context")
		if ok then
			ts_context.setup({
				enable = true,
				max_lines = 3,
				min_window_height = 32,
				line_numbers = true,
				multiline_threshold = 20,
				trim_scope = "outer",
				mode = "cursor", -- "cursor" or "topline"
				separator = nil,
				zindex = 20,
			})
			vim.api.nvim_set_hl(0, "TreesitterContextBottom", { sp = "Gray" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { sp = "Gray" })
		end
	end,
}
