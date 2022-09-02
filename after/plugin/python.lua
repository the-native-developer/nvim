
local opt = { noremap = true }
-- Common Python commands
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = {'*.py'},
    callback = function ()
        vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>!python %<cr>', opt)
    end,
})
