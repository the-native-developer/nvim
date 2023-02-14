vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd('FileType', {
    group    = vim.api.nvim_create_augroup('vue', {clear=true}),
    pattern  = {
        'javascript',
        'javascript.jsx',
        'typescript',
        'html',
        'css',
        'less',
        'vue'
    },
    callback = function ()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})

vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.wo.colorcolumn='100'-- highlight column after 'textwidth'                                    
