local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
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
    use 'rafamadriz/neon'
    use 'folke/tokyonight.nvim'
    use 'savq/melange'

    -- auto pairs
    use 'jiangmiao/auto-pairs'

    -- vim commentary
    use 'tpope/vim-commentary'

    -- nvim colorizer
    use 'norcalli/nvim-colorizer.lua'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context'
        }
    }

    use {
      'nvim-telescope/telescope.nvim', branch = '0.1.x',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-ui-select.nvim' }
      }
    }

    use 'mbbill/undotree'

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
            'mfussenegger/nvim-dap-python',
        }
    }

    -- rust
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    -- Lua lsp
    -- use { 'tjdevries/nlua.nvim',
    --     requires = {'neovim/nvim-lspconfig', 'nvim-lua/completion-nvim', 'euclidianAce/BetterLua.vim'}
    -- }

    -- -- language server
    -- use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    -- use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    -- use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    -- use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    -- use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- Web-Dev plugins
    use 'mattn/emmet-vim'

    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'leafoftree/vim-vue-plugin'
    use 'peitalin/vim-jsx-typescript'
    use { 'styled-components/vim-styled-components', branch = 'main' }

    use 'jparise/vim-graphql'

    -- Go dev plugins
    use {'fatih/vim-go', run = ':GoUpdateBinaries' }

    -- schemastore json
    use "b0o/schemastore.nvim"

    -- Phpactor
    use ({
      "gbprod/phpactor.nvim",
      run = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin
      requires = {
        "nvim-lua/plenary.nvim", -- required to update phpactor
        "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
      },
    })

    ----------------------------------------------------------------------------------------------
    -- my plugins
    -- use '/home/mlueer/projects/nvim/plugins/stackmap.nvim'
    -- use '/home/mlueer/projects/nvim/plugins/phpunit.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
  end)
