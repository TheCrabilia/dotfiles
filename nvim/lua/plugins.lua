-- Note: To install all the plugins enter :PackerInstall

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'neovim/nvim-lspconfig' -- LSP config
    
    -- File explorer
    use 'preservim/nerdtree'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Syntax highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "python", "go", "lua" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    }
    
    -- Keymaps
    use 'LionC/nest.nvim'
    
    -- Git plugins
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Finder (files, text, git)
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Integrated terminal
    use 'voldikss/vim-floaterm'

    -- Completion plugins
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Debugger
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'

    -- Language specific plugins
    use {
        'ray-x/go.nvim', -- Golang
        requires = { 
            { 'ray-x/guihua.lua' },
        },
        config = function()
            require('go').setup({
                go = "go",
                goimport = "gopls",
                fillstruct = "gopls",
                gofmt = "gopls",
                max_line_len = 120,
                null_ls_document_formatting_disable = true
            })
        end
    }

    -- Color schemes and interface modification plugins
    use 'rafamadriz/neon' -- Neon colorscheme
    use 'gruvbox-community/gruvbox' -- Gruvbox colorscheme
    use {
        'romgrk/barbar.nvim',
        requires = { {'kyazdani42/nvim-web-devicons'} }
    }
end)

