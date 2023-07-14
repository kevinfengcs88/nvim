return {
    'epwalsh/obsidian.nvim',
    event = { 'BufReadPre C:/Users/Kevin/Documents/Obsidian Vault/**.md' },
    dependencies = {
        -- Required.
        'nvim-lua/plenary.nvim',

        -- Optional, for completion.
        'hrsh7th/nvim-cmp',

        -- Optional, for search and quick-switch functionality.
        'nvim-telescope/telescope.nvim',
    },
    opts = {
        dir = 'C:/Users/Kevin/Documents/Obsidian Vault',  -- no need to call 'vim.fn.expand' here

        -- see below for full list of options 👇
    },
    config = function(_, opts)
        require('obsidian').setup(opts)

        -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
        -- see also: 'follow_url_func' config option below.
        vim.keymap.set('n', 'gf', function()
            if require('obsidian').util.cursor_on_markdown_link() then
                return '<cmd>ObsidianFollowLink<CR>'
            else
                return 'gf'
            end
        end, { noremap = false, expr = true })
    end
}
