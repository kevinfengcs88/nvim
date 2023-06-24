return {
    {
        'windwp/nvim-autopairs',
        event = { 'InsertEnter' },
        config = function()
            local autopairs_status_ok, autopairs = pcall(require, 'nvim-autopairs')

            if not autopairs_status_ok then
                return
            end

            autopairs.setup({})
        end
    },
    {
        'windwp/nvim-ts-autotag',
        event = { 'InsertEnter' },

        -- DO NOT USE A .setup() CALL
        -- TREESITTER HANDLES THIS CONFIGURATION

        -- config = function()
        --     local autotag_status_ok, autotag = pcall(require, 'nvim-ts-autotag')
        --
        --     if not autotag_status_ok then
        --         return
        --     end
        --
        --     autotag.setup({})
        -- end
    }
}
