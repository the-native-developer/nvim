require('matt')

vim.g['python3_host_prog'] = '/bin/python3'
vim.g['ruby_host_prog'] = '/home/mlueer/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'

vim.g.mapleader = ' '

-- Remove newbie crutches in Insert Mode
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { noremap = true })

-- Remove newbie crutches in Normal Mode
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true })

-- Remove newbie crutches in Visual Mode
vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', { noremap = true })

-- open netrw
vim.api.nvim_set_keymap('n', '<leader>ex', '<cmd>Ex<cr>', { noremap = true })

-- source current file
vim.api.nvim_set_keymap('n', '<leader><leader>x', '<cmd>source %<cr>', { noremap = true })

-- open terminal below all splits
vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>sp<CR><cmd>bo term<CR><C-w><S-k>i', { noremap = true })

-- load old config till all is ported to lua
vim.cmd('source ~/.config/nvim/old.vim')
