local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opts = { noremap = true, silent = true }

tree.setup({
  view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>', opts)
