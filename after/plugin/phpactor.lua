
if packer_plugins['phpactor'] and packer_plugins['phpactor'].loaded then
    require("phpactor").setup({
        install = {
            path = "/usr/bin/",
            branch = "main",
            bin = "/usr/bin/phpactor",
            php_bin = "php7",
            composer_bin = "composer",
            git_bin = "git",
            check_on_startup = "none",
        },
        lspconfig = {
            enabled = true,
            options = {},
        },
    })
    local opt = {noremap = true}
    vim.api.nvim_set_keymap('n', '<leader>pt', '<cmd>PhpActor transform<CR>', opt)
    vim.api.nvim_set_keymap('n', '<leader>pc', '<cmd>PhpActor context_menu<CR>', opt)
    vim.api.nvim_set_keymap('n', '<leader>pga', '<cmd>PhpActor generate_accessor<CR>', opt)
    vim.api.nvim_set_keymap('n', '<leader>pcv', '<cmd>PhpActor change_visibility<CR>', opt)
end
