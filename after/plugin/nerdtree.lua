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
vim.api.nvim_set_keymap('n', '<leader>nt', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<CR>', { noremap = true })
