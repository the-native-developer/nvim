-- Vim-Go
vim.g['go_def_mapping_enabled'] = 0

local opt = { noremap = true }
-- Common Go commands
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = {'*.go', '*.gomod', '*.gotmpl'},
    callback = function ()
        vim.api.nvim_set_keymap('n', '<leader>r', '<Plug>(go-run)', opt)
        vim.api.nvim_set_keymap('n', '<leader>b', '<Plug>(go-build)', opt)
        vim.api.nvim_set_keymap('n', '<leader>bb', '<Plug>(go-benchmark)', opt)
        vim.api.nvim_set_keymap('n', '<leader>t', '<Plug>(go-test)', opt)
        vim.api.nvim_set_keymap('n', '<leader>c', '<Plug>(go-coverage-toggle)', opt)
        vim.api.nvim_set_keymap('n', '<leader>R', '<Plug>(go-rename)', opt)
        vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>(go-implements)', opt)
        vim.api.nvim_set_keymap('n', '<leader>i', '<Plug>(go-info)', opt)
    end,
})
