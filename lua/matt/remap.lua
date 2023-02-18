vim.g.mapleader = ' '

local opt = { noremap = true }
--Remove newbie crutches in Insert Mode
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', opt)
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', opt)
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', opt)
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', opt)

-- Remove newbie crutches in Normal Mode
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', opt)
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', opt)
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', opt)
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', opt)

-- Remove newbie crutches in Visual Mode
vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', opt)
vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', opt)
vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', opt)
vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', opt)

-- source current file
vim.api.nvim_set_keymap('n', '<leader><leader>x', '<cmd>source %<cr>', opt)

-- open terminal below all splits
vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>sp<CR><cmd>bo term<CR><C-w><S-k>i', opt)

-- remap page up and down to be centered on screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', opt)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opt)

-- open netrw
vim.keymap.set('n', '<leader>ex', vim.cmd.Explore, opt)

-- remap brakets to english keyboard style
vim.o.langmap="ü+Ü*;[]{}"
