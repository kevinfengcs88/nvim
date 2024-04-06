local set = vim.opt

set.number = true
set.backspace = '2'
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.autoread = true
set.cursorline = true
set.cursorlineopt = 'number'
set.relativenumber = true
set.wrap = false
set.ignorecase = true
set.smartcase = true
set.termguicolors = true
set.autoindent = true
set.smartindent = true
set.softtabstop = 4
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.shiftround = true
set.mousemoveevent = true
set.winbar = " %{%v:lua.vim.fn.expand('%F')%}  %{%v:lua.require'nvim-navic'.get_location()%}"

-- set.clipboard = 'unnamedplus'
