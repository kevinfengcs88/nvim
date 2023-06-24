return {
    {
        'luk400/vim-lichess',
        event = 'VeryLazy',
        config = function ()


            -- lower my ELO (or boost me), I don't care :)
            vim.g.lichess_api_token = 'lip_ETrgIHObUoa63yibFO4W'
            -- catch this one, Git Guardian!


            vim.g.lichess_time = 10
            vim.g.lichess_increment = 0
            vim.g.lichess_rated = 0
            vim.g.lichess_variant = 'standard'
            vim.g.lichess_color = 'random'

            vim.g.python_cmd = 'python3'
            vim.g.lichess_debug_level = -1
        end
    },
    {
        'alec-gibson/nvim-tetris',
        cmd = 'Tetris'
    },
    {
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood'
    }
}
