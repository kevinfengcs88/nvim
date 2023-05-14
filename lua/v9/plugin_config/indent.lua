-- never enable this god forsaken option again...
-- vim.opt.list = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#757575 gui=nocombine]])

require("indent_blankline").setup({
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
})
