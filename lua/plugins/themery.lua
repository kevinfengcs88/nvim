return {
    'zaldih/themery.nvim',
    cmd = 'Themery',
    config = function()
        local status_ok, themery = pcall(require, 'themery')
        if not status_ok then
            return
        end

        themery.setup({
            themes = {
                {
                    name = 'material',
                    colorscheme = 'material',
                    before = [[vim.g.material_style = 'darker']]
                },
                {
                    name = 'vscode',
                    colorscheme = 'vscode',
                },
                {
                    name = 'gruvbox-baby',
                    colorscheme = 'gruvbox-baby',
                },
                {
                    name = 'gruvbox-material',
                    colorscheme = 'gruvbox-material'
                },
                {
                    name = 'catppuccin',
                    colorscheme = 'catppuccin',
                },
                {
                    name = 'tokyonight',
                    colorscheme = 'tokyonight'
                },
                {
                    name = 'cyberdream',
                    colorscheme = 'cyberdream'
                },
            },
            themeConfigFile = '~/.config/nvim/lua/v9/colorscheme.lua',
            livePreview = true,
        })
    end
}
