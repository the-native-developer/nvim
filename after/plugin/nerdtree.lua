vim.g['NERDTreeGitStatusUseNerdFonts'] = 1
vim.g['NERDTreeGitStatusIndicatorMapCustom'] = {
    Modified = '✹',
    Staged = '✚',
    Untracked = '✭',
    Renamed = '➜',
    Unmerged = '═',
    Deleted = '✖',
    Dirty = '✗',
    Ignored = '☒',
    Clean = '✔︎',
    Unknown = '?',
}

vim.api.nvim_set_keymap('n', '<leader>n',':NERDTreeFocus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':NERDTreeFind<CR>', { noremap = true })
