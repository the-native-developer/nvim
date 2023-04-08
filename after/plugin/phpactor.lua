if packer_plugins['phpactor.nvim'] then
    print("loaded phpactor")
    require("phpactor").setup({
        install = {
            path = vim.fn.stdpath("data") .. "/opt/",
            branch = "master",
            bin = vim.fn.stdpath("data") .. "/opt/phpactor/bin/phpactor",
            php_bin = "php",
            composer_bin = "composer",
            git_bin = "git",
            check_on_startup = "none",
        },
        lspconfig = {
            enabled = true,
            options = {},
        },
    })

    vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('setPhpActorShortCuts', { clear = true }),
        pattern = { 'php' },
        callback = function ()
            local opt = {remap = false}
            vim.keymap.set('n', '<leader>pt',  '<cmd>PhpActor transform<CR>', opt)
            vim.keymap.set('n', '<leader>pc',  '<cmd>PhpActor context_menu<CR>', opt)
            vim.keymap.set('n', '<leader>pga', '<cmd>PhpActor generate_accessor<CR>', opt)
            vim.keymap.set('n', '<leader>pcv', '<cmd>PhpActor change_visibility<CR>', opt)
        end
    })

    vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('setPhpKeyword', { clear = true }),
        pattern = { 'php' },
        callback = function ()
            vim.opt.iskeyword:append('$')
        end
    })
end
