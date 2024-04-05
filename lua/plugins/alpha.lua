return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
        local opts = { noremap = true, silent = true }

        vim.keymap.set('n', '<leader>a', ':Alpha<CR>', opts)

        local status_ok, alpha = pcall(require, 'alpha')
        if not status_ok then
            return
        end

        local function header()
            return require('v9.logos')['random']
        end

        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = header()

        dashboard.section.buttons.val = {
            dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
            dashboard.button('e', '  New file', ':ene <CR>'),
            dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
            dashboard.button('gr', '  Find text', ':Telescope live_grep <CR>'),
            dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
        }

        local v = vim.version()
        local version = ' v' .. v.major .. '.' .. v.minor .. '.' .. v.patch
        local datetime = os.date(' %d-%m-%Y 󱑏 %H:%M:%S')

        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyVimStarted',
            callback = function()
                local stats = require('lazy').stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = {
                    '',
                    '',
                    version,
                    '',
                    datetime,
                    '',
                    '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms',
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        dashboard.section.footer.val = {}

        dashboard.section.footer.opts.hl = 'Type'
        dashboard.section.header.opts.hl = 'Include'
        dashboard.section.buttons.opts.hl = 'Keyword'

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end
}
