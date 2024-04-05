return {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('ibl').setup({
            enabled = true,
            scope = {
                enabled = false,
            },
        })
    end
}
