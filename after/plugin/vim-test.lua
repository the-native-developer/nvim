local path = vim.fn.getcwd()
local rapidWirePath = '/home/mlueer/Projekte/RapidWire'

-- if path == rapidWirePath then
--     vim.g['test#php#phpunit#executable'] = './vendor/bin/phpunit --no-coverage'
-- else
--     vim.g['test#php#phpunit#executable'] = 'docker-compose exec -T php vendor/bin/phpunit --bootstrap tests/bootstrap.php -c tests/phpunit.xml '
-- end

vim.g['test#javascript#runner'] = 'npx cypress run'

vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>TestNearest<CR>', { noremap = true, silent = true}) -- Test nearest test
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>TestFile<CR>', { noremap = true, silent = true}) -- Test file
vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>TestSuite<CR>', { noremap = true, silent = true}) -- Test suite
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TestLast<CR>', { noremap = true, silent = true}) -- Test last test run
vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>TestVisit<CR>', { noremap = true, silent = true}) -- Test visit

