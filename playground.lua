local bufnr = 5

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("TestingArround", {clear = true}),
    callback = function ()
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "current dir:" })
        vim.fn.jobstart({"ls", "-l", vim.fn.getcwd()}, {
            stdout_buffered = true,
            on_stdout = function (_, data)
                if data then
                   vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
                end
            end
        })
    end
})
