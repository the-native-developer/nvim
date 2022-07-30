vim.g['user_emmet_mode'] = 'a'  -- enable all function in all mode.

vim.g['user_emmet_install_global'] = 0  -- only enable Emmet for certain file types

vim.api.nvim_create_autocmd({'BufEnter'},{
    pattern = { '*.htm', '*.html', '*.php', '*.gotmpl', '*.css', '*.jsx', '*.twig' },
    callback = function ()
        vim.cmd('EmmetInstall')
    end
})
