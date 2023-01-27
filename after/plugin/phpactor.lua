-- if packer_plugins['phpactor'] and packer_plugins['phpactor'].loaded then
    require("phpactor").setup({
        install = {
            path = "/usr/bin/",
            branch = "main",
            bin = "/usr/bin/phpactor",
            php_bin = "php",
            composer_bin = "composer",
            git_bin = "git",
            check_on_startup = "always",
        },
        lspconfig = {
            enabled = true,
            options = {},
        },
    })
    local opt = {remap = false}
    vim.keymap.set('n', '<leader>pt', '<cmd>PhpActor transform<CR>', opt)
    vim.keymap.set('n', '<leader>pc', '<cmd>PhpActor context_menu<CR>', opt)
    vim.keymap.set('n', '<leader>pga', '<cmd>PhpActor generate_accessor<CR>', opt)
    vim.keymap.set('n', '<leader>pcv', '<cmd>PhpActor change_visibility<CR>', opt)
    vim.cmd 'autocmd FileType php set iskeyword+=$'
-- end
