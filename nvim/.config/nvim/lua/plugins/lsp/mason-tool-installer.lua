return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependenices = {
		"williamboman/mason.nvim",
	},
	opts = {
		ensure_installed = {
			"clang-format",
			"clangd",
			"debugpy",
			"dockerls",
			"goimports",
			"gopls",
			"helm_ls",
			"impl",
			"jsonls",
			"lua_ls",
			"marksman",
			"pyright",
			"ruff_lsp",
			"ruff",
			"sqls",
			"stylua",
			"taplo",
			"terraformls",
			"tflint",
			"vimls",
			"yamlls",
		},
	},
}