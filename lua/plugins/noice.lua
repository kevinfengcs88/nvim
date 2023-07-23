return {
    'folke/noice.nvim',
    event = 'VimEnter',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    config = function ()
        local status_ok, noice = pcall(require, 'noice')

        if not status_ok then
            return
        end

        noice.setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
                signature = {
                    enabled = false
                },
                hover = {
                    enabled = false
                }
            },
            -- you can enable a preset for easier configuration
            presets = {
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
                bottom_search = false,
                command_palette = false
            },
            messages = {
                enabled = false
            },
            -- popupmenu = {
            --     enabled = false
            -- }
        })

        require('notify').setup({
            background_color = '#ff0000',
        })
    end
}
