vim.g.mapleader = ' '

local opt = { noremap = true }
--Remove newbie crutches in Insert Mode
vim.keymap.set('i', '<Down>', '<Nop>', opt)
vim.keymap.set('i', '<Left>', '<Nop>', opt)
vim.keymap.set('i', '<Right>', '<Nop>', opt)
vim.keymap.set('i', '<Up>', '<Nop>', opt)

-- Remove newbie crutches in Normal Mode
vim.keymap.set('n', '<Down>', '<Nop>', opt)
vim.keymap.set('n', '<Left>', '<Nop>', opt)
vim.keymap.set('n', '<Right>', '<Nop>', opt)
vim.keymap.set('n', '<Up>', '<Nop>', opt)

-- Remove newbie crutches in Visual Mode
vim.keymap.set('v', '<Down>', '<Nop>', opt)
vim.keymap.set('v', '<Left>', '<Nop>', opt)
vim.keymap.set('v', '<Right>', '<Nop>', opt)
vim.keymap.set('v', '<Up>', '<Nop>', opt)

-- source current file
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<cr>', opt)

--paste without overwriting clipboard
vim.keymap.set('x', '<leader>p', "\"_dP", opt)

-- open terminal above all splits
vim.keymap.set('n', '<leader>to', '<cmd>sp<CR><cmd>bo term<CR><C-w><S-k>i', opt)

-- remap page up and down to be centered on screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', opt)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opt)

-- open netrw
vim.keymap.set('n', '<leader>ex', vim.cmd.Explore, opt)

-- remap brakets to english keyboard style
vim.o.langmap="öäÖÄ;[]{}"

-- Alt to AltGr remappings
vim.keymap.set({'n', 'i'}, '<A-7>', '{', opt)
vim.keymap.set({'n', 'i'}, '<A-8>', '[', opt)
vim.keymap.set({'n', 'i'}, '<A-9>', ']', opt)
vim.keymap.set({'n', 'i'}, '<A-0>', '}', opt)
vim.keymap.set({'n', 'i'}, '<A-ß>', '\\', opt)
vim.keymap.set({'n', 'i'}, '<A-+>', '~', opt)
vim.keymap.set({'n', 'i'}, '<A-m>', 'µ', opt)

