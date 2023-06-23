return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'NvimTree',
                        highlight = 'Directory',
                        text_align = 'center'
                    }
                },
                separator_style = 'slant',
                hover = {
                    enabled = true,
                    delay = 0,
                    reveal = {'close'}
                },
                indicator = {
                    style = 'icon'
                }
            }
        })
    end
}
