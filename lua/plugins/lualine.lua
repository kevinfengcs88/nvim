return {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
        local status_ok, lualine = pcall(require, 'lualine')
        if not status_ok then
            return
        end

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
            },
            sections = {
                lualine_a = {
                    {
                        'filename',
                        path = 1,
                    },
                },
            },
        })
    end
}
