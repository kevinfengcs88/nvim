local neodev_status_ok, neodev = pcall(require, 'neodev')
if not neodev_status_ok then
    return
end

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    'pyright',
    'lua_ls'
})

lsp.setup()

