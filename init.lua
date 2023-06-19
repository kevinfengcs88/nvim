require('v9.options')
require('v9.keymaps')
require('v9.lazy')
require('v9.plugin_config')
-- -- vim.opt.guicursor='n:block-Cursor/lCursor,i:block-Cursor/lCursor,v:block-Cursor/lCurso'
vim.opt.guicursor = ''

vim.cmd([[autocmd FileType yaml setlocal indentexpr=]])
vim.cmd([[autocmd FileType yml setlocal indentexpr=]])
