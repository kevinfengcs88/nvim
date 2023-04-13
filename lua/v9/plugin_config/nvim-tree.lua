vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opts = { noremap = true, silent = true }

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>', opts)
