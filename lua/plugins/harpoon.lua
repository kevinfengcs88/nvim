return {
    'ThePrimeagen/harpoon',
    event = 'VimEnter',
    config = function ()

        local harpoon_status_ok, harpoon = pcall(require, 'harpoon')
        if not harpoon_status_ok then
            return
        end

        local harpoon_mark_status_ok, harpoon_mark = pcall(require, 'harpoon.mark')
        if not harpoon_mark_status_ok then
            return
        end

        local harpoon_ui_status_ok, harpoon_ui = pcall(require, 'harpoon.ui')
        if not harpoon_ui_status_ok then
            return
        end

        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap

        harpoon.setup({
            menu = {
                width = 60,
            },
        })

        keymap.set('n', '<leader>h', harpoon_mark.add_file, opts)
        keymap.set('n', '<C-e>', harpoon_ui.toggle_quick_menu, opts)

        keymap.set('n', '<leader>1', function() harpoon_ui.nav_file(1) end, opts)
        keymap.set('n', '<leader>2', function() harpoon_ui.nav_file(2) end, opts)
        keymap.set('n', '<leader>3', function() harpoon_ui.nav_file(3) end, opts)
        keymap.set('n', '<leader>4', function() harpoon_ui.nav_file(4) end, opts)
        keymap.set('n', '<leader>5', function() harpoon_ui.nav_file(5) end, opts)
        keymap.set('n', '<leader>6', function() harpoon_ui.nav_file(6) end, opts)
        keymap.set('n', '<leader>7', function() harpoon_ui.nav_file(7) end, opts)
        keymap.set('n', '<leader>8', function() harpoon_ui.nav_file(8) end, opts)
        keymap.set('n', '<leader>9', function() harpoon_ui.nav_file(9) end, opts)

    end
}
