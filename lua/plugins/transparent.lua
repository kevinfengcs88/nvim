return {
    'xiyaowong/transparent.nvim',
    cmd = 'TransparentToggle',
    config = function ()
        local transparent_status_ok, transparent = pcall(require, 'transparent')

        if not transparent_status_ok then
            return
        end

        transparent.setup({
            groups = { -- table: default groups
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'NormalSB', 'Pmenu',
            },
            extra_groups = {
                'NormalFloat', -- plugins which have float panel such as Lazy, Mason, LspInfo
                'FloatBorder',
                'NvimTreeWinSeparator',
                'NvimTreeNormal',
                'NvimTreeNormalNC',
                'TroubleNormal',
                'TelescopeNormal',
                'TelescopeBorder',
                'WhichKeyFloat',
            }
        })
    end
}
