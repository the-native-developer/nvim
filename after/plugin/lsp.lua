-- reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer

lsp.configure('intelephense', {
    settings = {
        intelephense = {
            files = {
                maxSize = 10000000;
            },
        }
    },
    init_options = {
        licenseKey = os.getenv('INTELEPHENSE_LICENSE_KEY'), -- this is tested and working as intended
    },
})

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
