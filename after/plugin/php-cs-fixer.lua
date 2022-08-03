-- If php-cs-fixer is in $PATH, you don't need to define line below
-- vim.g['php_cs_fixer_path'] = "php-cs-fixer" -- define the path to the php-cs-fixer.phar

vim.g['php_cs_fixer_php_path'] = "php7"               -- Path to PHP
vim.g['php_cs_fixer_enable_default_mapping'] = 1     -- Enable the mapping by default (<leader>pcd)
vim.g['php_cs_fixer_dry_run'] = 0                    -- Call command with dry-run option
vim.g['php_cs_fixer_verbose'] = 0                    -- Return the output of command if 1, else an inline information.

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>pd', vim.fn.PhpCsFixerFixDirectory, opts)
vim.keymap.set('n', '<leader>pf', vim.fn.PhpCsFixerFixFile, opts)

vim.api.nvim_create_autocmd({'BufWritePost'}, {
    pattern = {"*.php", "*.phtml"},
    -- command = "echo 'saved a PHP file'",
    callback = function ()
        vim.fn.PhpCsFixerFixFile()
    end,
})
