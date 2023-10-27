local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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

    use {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    }

    -- tokyonight theme
    use {
        'folke/tokyonight.nvim',
        config = function ()
            vim.opt.syntax = 'on'
            vim.o.termguicolors = true

            vim.cmd.colorscheme('tokyonight-moon')
            vim.api.nvim_set_hl(0, 'ColorColumn', { bg=10040012, ctermbg=10040012 })
            vim.api.nvim_set_hl(0, 'Normal', { bg=nil, ctermbg=nil })
            vim.api.nvim_set_hl(0, 'NormalNC', { bg=nil, ctermbg=nil })
        end
    }

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
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'BurntSushi/ripgrep' }
        }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'mbbill/undotree'

    -- fugative
    use 'tpope/vim-fugitive'

    -- vim gutter
    use 'lewis6991/gitsigns.nvim'

    -- vim-suround
    use 'tpope/vim-surround'

    -- Test suite
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-plenary",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-vim-test",
            "olimorris/neotest-phpunit",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-phpunit"),
                    require("neotest-plenary"),
                    require("neotest-vitest"),
                    require("neotest-vim-test")({
                        ignore_file_types = { "typescript", "javascript", "vue", "lua" },
                    }),
                },
            })
        end
    }

    -- debugging
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'nvim-telescope/telescope-dap.nvim',
        }
    }

    -- lsp-zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    ----------------------------------------------------------------------------------------------
    -- my plugins
    -- use '/home/mlueer/projects/nvim/plugins/stackmap.nvim'
    -- use '/home/mlueer/projects/nvim/plugins/phpunit.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
