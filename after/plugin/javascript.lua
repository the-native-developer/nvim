local toggleConceal = function ()
        if vim.o.conceallevel==1 then
            vim.o.conceallevel=0
        else
            vim.o.conceallevel=1
        end
end

vim.api.nvim_create_autocmd('FileType', {
    group    = vim.api.nvim_create_augroup('javascript', {clear=true}),
    pattern  = {'javascript'},
    callback = function ()
        vim.opt_local.formatprg='prettier'
        vim.keymap.set("n", '<leader>l', toggleConceal)
    end,
})

-- syntax highlighting for jsdoc
vim.g['javascript_plugin_jsdoc']                 = 1

-- setup conceal
vim.g['javascript_conceal_function']             = "ƒ"
vim.g['javascript_conceal_null']                 = "ø"
vim.g['javascript_conceal_this']                 = "@"
vim.g['javascript_conceal_return']               = "⇚"
vim.g['javascript_conceal_undefined']            = "¿"
vim.g['javascript_conceal_NaN']                  = "ℕ"
vim.g['javascript_conceal_prototype']            = "¶"
vim.g['javascript_conceal_static']               = "•"
vim.g['javascript_conceal_super']                = "Ω"
vim.g['javascript_conceal_arrow_function']       = "⇒"
vim.g['javascript_conceal_noarg_arrow_function'] = "λ"
vim.o.conceallevel                               = 1

vim.api.nvim_create_autocmd('BufWritePost', {
    group    = vim.api.nvim_create_augroup('saveVue', {clear=true}),
    pattern  = {'*.vue'},
    command = '!prettier -w --parser vue %'
})
