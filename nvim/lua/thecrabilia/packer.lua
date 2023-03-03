local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd.packadd("packer.nvim")
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Color schemes
	use("ellisonleao/gruvbox.nvim")
	use("navarasu/onedark.nvim")

	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("kdheepak/tabline.nvim")
	use("goolord/alpha-nvim") -- Cute welcome screen

	-- Shortcuts
	use("folke/which-key.nvim")

	-- Git integration
	use({
		"tpope/vim-fugitive",
		"tpope/vim-rhubarb",
		"lewis6991/gitsigns.nvim",
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jayp0521/mason-null-ls.nvim" }, -- TODO: Configure mason null-ls
			{ "folke/lsp-colors.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "lukas-reineke/lsp-format.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	})

	-- Debugging
	use({
		"jayp0521/mason-nvim-dap.nvim",
		requires = {
			{ "mfussenegger/nvim-dap" },
			{ "rcarriga/nvim-dap-ui" },
		},
	})

	-- Language support
	use({
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		cond = vim.fn.executable("make") == 1,
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-project.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			{ "p00f/nvim-ts-rainbow" },
			{ "windwp/nvim-autopairs" },
			{ "nvim-treesitter/playground" },
		},
	})

	-- Movement
	use({
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- Misc
	use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically
	use("nathom/filetype.nvim") -- Override file types
	use("akinsho/toggleterm.nvim") -- Nvim builtin terminal
	use({
		"Pocco81/auto-save.nvim",
		disable = true,
		config = function()
			require("auto-save").setup()
		end,
	})
	use("RRethy/vim-illuminate")
	use({
		"lukas-reineke/indent-blankline.nvim", -- Add indentation guides
		config = function()
			require("indent_blankline").setup({
				char = "┊",
				show_trailing_blankline_indent = true,
			})
		end,
	})
	use({
		"numToStr/Comment.nvim", -- Comment lines
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"lewis6991/impatient.nvim", -- Lua modules chuck cachecс
		config = function()
			require("impatient")
		end,
	})
	use({
		"folke/neodev.nvim", -- Completion for nvim api
		config = function()
			require("neodev").setup()
		end,
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
