local set = vim.opt
local keymap = vim.keymap

keymap.mapleader = ';'
keymap.maplocalleader = ';'

vim.wo.number = true

set.backspace = '2'
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.cursorline = true
set.autoread = true

set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

keymap.set('n', '<leader>w', ':write<CR>')


