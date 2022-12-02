local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix


local date = function() return {os.date('%Y-%m-%d')} end
local datetime = function() return {os.date('%Y-%m-%d %H:%M:%S')} end

ls.add_snippets(nil, {
    all = {
        s({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            f(date, {}),
        }),
        s({
            trig = "datetime",
            namr = "DateTime",
            dscr = "DateTime in the form of YYYY-MM-DD HH:MM:SS",
        }, {
            f(datetime, {}),
        }),
    },
    php = {
        s({
            trig = "tc",
            namr = "phpunit test class",
            dscr = "generates a phpunit test class with import TestCase class"
        },{
            t({"use PHPUnit\\Framework\\TestCase;", ""}),
            t({"", "class "}), i(1, "ClassName"), t({"Test extends TestCase"}),
            t({"", "{"}),
            i(2),
            t({"", "}"}),
            i(0),
        }),
        s({
            trig = "php",
            namr = "php open",
            dscr = "php open"
        },{
            t({ "<?php", "", "" })
        }),

        s({
            trig = "mth",
            namr = "Create method body",
            dscr = "Creates method body"
        },
        {
            c(1, {t"public", t"protected", t"private"}),
            t({" function "}), i(2, "functionName"),
            t("("), i(3, "$params"), t("): "),
            i(4, "returnType"),
            t({"", "{"}), i(0),
            t({"", "}"}),
       }),
    }
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("i", "<C-n>", "<Plug>luasnip-next-choice", opts)
keymap("s", "<C-n>", "<Plug>luasnip-next-choice", opts)
keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", opts)
keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", opts)
