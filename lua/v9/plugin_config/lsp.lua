local neodev_status_ok, neodev = pcall(require, 'neodev')
if not neodev_status_ok then
  return
end

local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

-- set up neodev before any other LSP
neodev.setup()

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { 'lua_ls' }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
local capabilities_status_ok, capabilities = pcall(require, 'cmp_nvim_lsp')
if not capabilities_status_ok then
  return
end

capabilities = capabilities.default_capabilities()

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- the line below is necessary to ignore annoying Lua LSP for vim variable
        globals = { 'vim' }
      }
    }
  }
}
