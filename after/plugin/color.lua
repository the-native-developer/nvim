vim.opt.syntax = 'on'
vim.o.termguicolors = true
-- vim.opt.background= 'light'
-- vim.cmd 'let ayucolor="light"' -- light mode ayu theme

-- neon scheme
-- vim.g.neon_style = 'light'
-- vim.g.neon_italic_keyword = true
-- vim.g.neon_italic_function = true
-- vim.g.neon_transparent = false

vim.cmd.colorscheme('tokyonight-day')
vim.api.nvim_set_hl(0, 'ColorColumn', {bg='LightBlue'})
