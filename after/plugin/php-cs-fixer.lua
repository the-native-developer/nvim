local path = vim.fn.getcwd()
local command = "USERID=$UID GROUPID=$GID docker-compose exec -T php vendor/bin/php-cs-fixer fix "
local apiPath = '/home/mlueer/projects/vdp-api'
local etrailerPath = '/home/mlueer/projects/etrailer'
local rapidWirePath = '/home/mlueer/projects/RapidWire'

if path == apiPath then
    command = "docker-compose exec -T api vendor/bin/php-cs-fixer fix "
elseif path == etrailerPath then
    command = '../cs_fixer.sh fix '
elseif path == rapidWirePath then
    command = 'vendor/bin/phpcs && vendor/bin/phpcbf '
end

vim.api.nvim_create_autocmd({'BufWritePost'}, {
    pattern = {"*.php", "*.phtml"},
    -- command = "echo 'saved a PHP file'",
    callback = function ()
        local cmd = command .. vim.fn.expand("%")
        print("run php_cs_fixer")
        local handle = io.popen(cmd, 'r')
        if handle ~= nil then
            handle.flush(handle)
            local output = handle:read("*a")
            handle:close()
            print('success')
            vim.cmd[[e]]
        end
    end,
})
