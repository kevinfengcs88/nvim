require('v9.options')
require('v9.keymaps')
require('v9.lazy')
require('v9.colorscheme')
vim.opt.guicursor = ''

vim.cmd([[autocmd FileType yaml setlocal indentexpr=]])
vim.cmd([[autocmd FileType yml setlocal indentexpr=]])
