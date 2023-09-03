return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },
	build = function()
		vim.cmd.TSUpdate()
	end,
	dependencies = {
		"nvim-ts-context-commentstring",
		"nvim-treesitter-textobjects",
		"nvim-treesitter-context",
	},
	main = "nvim-treesitter.configs",
	opts = {
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
				local max_filesize = 100 * 1024 -- 100 KiB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = { "yaml" },
		},
		context_commentstring = { enable = true },
		playground = { enable = true },
	},
}
