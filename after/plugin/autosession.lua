---------------------------------------------------------------------------------------------------
-- Automatic session
---------------------------------------------------------------------------------------------------

local function hex(data)
    local new_data = ""
    for i = 1, #data do
        local char = string.sub(data, i, i)
        new_data = new_data .. string.format("%02x", string.byte(char))
    end
    return new_data
end

local function isFile(filename)
    local f = io.open(filename, 'r')
    if f == nil then
        return false
    else
        io.close(f)
        return true
    end
end
-- vim.cmd('set sessionoptions+=globals')
-- vim.cmd('set sessionoptions+=options')

-- vim.api.nvim_create_autocmd("VimLeavePre", {
--     callback = function ()
--         vim.cmd('mksession! ~/sessions/' .. hex(vim.fn.getcwd()))
--     end
-- })

-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function ()
--         local file = os.getenv('HOME') .. '/sessions/' .. hex(vim.fn.getcwd())
--         if isFile(file) then
--             vim.cmd(':source ' .. file)
--         end
--         require("matt/lualine")
--     end
-- })

