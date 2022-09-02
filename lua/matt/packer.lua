return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- lualine statusline.
    use { 'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Color theme plugins
    use {'dracula/vim', as =  'dracula' }
    use 'morhetz/gruvbox'
    use 'altercation/vim-colors-solarized'
    use 'ayu-theme/ayu-vim'
    use 'andbar-ru/vim-unicon'

    -- NerdTree
    use { 'preservim/nerdtree',
      requires = {'Xuyuanp/nerdtree-git-plugin', 'ryanoasis/vim-devicons'}
    }

    -- auto pairs
    use 'jiangmiao/auto-pairs'

    -- NerdCommenter
    use 'tpope/vim-commentary'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        requires = {'nvim-treesitter/nvim-treesitter-textobjects'}
    }

    use {
      'nvim-telescope/telescope.nvim', branch = '0.1.x',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-ui-select.nvim' }
      }
    }

    use {
        'glepnir/dashboard-nvim',
        requires = {
           'nvim-telescope/telescope.nvim'
        }
    }

    -- fugative
    use 'tpope/vim-fugitive'

    -- vim gutter
    use 'airblade/vim-gitgutter'

    -- vim-suround
    use 'tpope/vim-surround'

    -- html 5
    use 'othree/html5.vim'

    -- twig vim
    use 'lumiliet/vim-twig'

    -- Test suite
    use 'vim-test/vim-test'

    -- debugging 
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'nvim-telescope/telescope-dap.nvim',
            'go-delve/delve',
            'leoluz/nvim-dap-go',
        }
    }

    -- cs fixer
    use 'stephpy/vim-php-cs-fixer'

    -- Lua lsp
    use { 'tjdevries/nlua.nvim',
        requires = {'neovim/nvim-lspconfig', 'nvim-lua/completion-nvim', 'euclidianAce/BetterLua.vim'}
    }

    -- Phpactor
    use({
        "gbprod/phpactor.nvim",
        run = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin
        requires = {
            "nvim-lua/plenary.nvim", -- required to update phpactor
            "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
        },
    })

    -- language server
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- Web-Dev plugins
    use 'mattn/emmet-vim'

    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use { 'styled-components/vim-styled-components', branch = 'main' }

    use 'jparise/vim-graphql'

    -- Go dev plugins
    use {'fatih/vim-go', run = ':GoUpdateBinaries' }

    -- schemastore json
    use "b0o/schemastore.nvim"

    -- my plugins
    -- use '/home/mlueer/projects/nvim/plugins/stackmap.nvim'
    use '/home/mlueer/projects/nvim/plugins/phpunit.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
  end)
