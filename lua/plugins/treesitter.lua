return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = { 'TSInstallInfo', 'TSInstall' },
        config = function()
            local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')

            if not status_ok then
                return
            end

            treesitter.setup({
                ensure_installed = { 'lua', 'vim', 'python', 'markdown_inline' },
                sync_install = false,
                auto_install = false,
                highlight = {
                    enable = true
                },
                context_commentstring = {
                    enable = true,
                    autocmd = false
                },
                autopairs = {
                    enable = true
                },
                autotag = {
                    enable = true
                },
                indent = {
                    enable = true
                }
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function ()
            local treesitter_context = require('treesitter-context')
            treesitter_context.setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = '*',
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                -- vim.cmd([[highlight TreesitterContextBottom gui=underline guisp=Grey]])
            })
        end
    }
}
