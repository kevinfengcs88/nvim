return {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local ok, oil = pcall(require, 'oil')

        if not ok then
            return
        end

        oil.setup({
            vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" }),

            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                -- ["<C-h>"] = "actions.select_split",
                -- ["<C-t>"] = "actions.select_tab",
                -- ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                -- ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = false,
        })
    end
}
