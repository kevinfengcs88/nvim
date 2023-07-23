return {
    {
        'mfussenegger/nvim-dap',
        config = function()
        end
    },
    {
        'leoluz/nvim-dap-go',
        ft = 'go',
        dependencies = 'mfussenegger/nvim-dap',
        config = function (_, opts)
            require('dap-go').setup(opts)
        end
    }
}
