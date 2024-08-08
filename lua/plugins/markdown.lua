return {
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        -- using npm to install rather than the vim function leads to significantly faster startup time
        init = function()
            -- how to get
            -- https://github.com/iamcco/markdown-preview.nvim/issues/7
            -- :call mkdp#util#install()
            -- to run automatically on init
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        config = function()
            vim.keymap.set('n', '<leader>m', '<Plug>MarkdownPreviewToggle', { desc = 'Markdown Preview' })
        end
    },
    -- {
    --     "OXY2DEV/markview.nvim",
    --     lazy = false,      -- Recommended
    --     -- ft = "markdown" -- If you decide to lazy-load anyway
    --
    --     dependencies = {
    --         -- You will not need this if you installed the
    --         -- parsers manually
    --         -- Or if the parsers are in your $RUNTIMEPATH
    --         "nvim-treesitter/nvim-treesitter",
    --
    --         "nvim-tree/nvim-web-devicons"
    --     }
    -- },
    {
        'MeanderingProgrammer/markdown.nvim',
        main = "render-markdown",
        opts = {},
        name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    }
}
