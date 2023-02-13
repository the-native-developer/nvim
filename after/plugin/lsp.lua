-- reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local servers = {
    'clangd',
    'cmake',
    'tsserver',
    'html',
    'cssls',
    'cssmodules_ls',
    'emmet_ls',
    'eslint',
    'volar',
    'phpactor',
    'intelephense',
    'psalm',
    'graphql',
    'bashls',
    'gopls',
    'golangci_lint_ls',
    'rust_analyzer',
    'jsonls',
    'yamlls',
    -- 'lua_ls',
    'sqls',
    'sqlls',
}
lsp.ensure_installed(servers)

---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { silent = true, buffer = bufnr, remap = false }

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
end

lsp.on_attach(on_attach)

lsp.configure('jsonls', {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    },
})

lsp.configure('intelephense', {
    init_options = {
        licenseKey = os.getenv('INTELEPHENSE_LICENSE_KEY'), -- this is tested and working as intended
    },
})

lsp.configure('phpactor', {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        local bufopts = { silent = true, buffer = bufnr, remap = false }
        vim.keymap.set('n', '<leader>pt', '<cmd>PhpActor transform<CR>', bufopts)
        vim.keymap.set('n', '<leader>pc', '<cmd>PhpActor context_menu<CR>', bufopts)
        vim.keymap.set('n', '<leader>pga', '<cmd>PhpActor generate_accessor<CR>', bufopts)
        vim.keymap.set('n', '<leader>pcv', '<cmd>PhpActor change_visibility<CR>', bufopts)
    end,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = true,
    }
})

lsp.configure('intelephense', {
    init_options = {
        licenseKey = os.getenv('INTELEPHENSE_LICENSE_KEY'), -- this is tested and working as intended
    },
})

lsp.configure('rust_analyzer', {
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
--     -- Include globals you want to tell the LSP are real :)
--     globals = {
--         -- Colorbuddy
--         "Color", "c", "Group", "g", "s",
--     }
-- })

lsp.setup()

---- luasnip setup
local luasnip = require 'luasnip'

---- nvim-cmp setup
local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.setup_nvim_cmp({
  mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-5),
        ['<C-u>'] = cmp.mapping.scroll_docs(5),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })

})

vim.diagnostic.config({
    virtual_text = true
})
