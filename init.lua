vim.cmd [[
    let g:clipboard = {
      \   'name': 'win32yank-wsl',
      \   'copy': {
      \      '+': 'win32yank.exe -i --crlf',
      \      '*': 'win32yank.exe -i --crlf',
      \    },
      \   'paste': {
      \      '+': 'win32yank.exe -o --lf',
      \      '*': 'win32yank.exe -o --lf',
      \   },
      \   'cache_enabled': 0,
      \ }
]]
require('v9.options')
require('v9.keymaps')
require('v9.lazy')
require('v9.colorscheme')
-- -- vim.opt.guicursor='n:block-Cursor/lCursor,i:block-Cursor/lCursor,v:block-Cursor/lCurso'
vim.opt.guicursor = ''

vim.cmd([[autocmd FileType yaml setlocal indentexpr=]])
vim.cmd([[autocmd FileType yml setlocal indentexpr=]])
