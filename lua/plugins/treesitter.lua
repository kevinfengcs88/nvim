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
                modules = {},
                ensure_installed = { 'lua', 'vim', 'python', 'markdown_inline', 'go' },
                highlight = {
                    enable = true
                },
                sync_install = false,
                auto_install = false,
                ignore_install = {},
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
                    enable = true,
                    disable = { 'go' }
                }
            })
        end

    }
}
