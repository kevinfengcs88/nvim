return {
    'zaldih/themery.nvim',
    cmd = 'Themery',
    config = function()
        local status_ok, themery = pcall(require, 'themery')
        if not status_ok then
            return
        end

        themery.setup({
            -- themes = {'material', 'vscode', 'gruvbox-baby'},
            themes = {
                {
                    name = 'material',
                    colorscheme = 'material',
                    before = [[vim.g.material_style = 'darker']],
                },
                {
                    name = 'vscode',
                    colorscheme = 'vscode',
                },
                {
                    name = 'gruvbox',
                    colorscheme = 'gruvbox-baby',
                },
            },
            themeConfigFile = '~/.config/nvim/lua/v9/colorscheme.lua',
            livePreview = true,
        })
    end
}
