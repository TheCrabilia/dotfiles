---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		vim.cmd.TSUpdate()
	end,
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
				local max_filesize = 1000 * 1024 -- 1 MiB
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
