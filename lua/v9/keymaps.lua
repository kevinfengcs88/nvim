local set = vim.opt
local global = vim.g
local keymap = vim.keymap

global.mapleader = ';'
global.maplocalleader = ';'

set.number = true
set.backspace = '2'
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.autoread = true

set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

-- useful keymaps
keymap.set('n', '<leader>w', ':wa<CR>')
keymap.set('n', '<leader>q', ':qa<CR>')
keymap.set('n', '<leader>m', ':MarkdownPreview<CR>')
keymap.set('n', '<leader>s', ':source %<CR>')
keymap.set('n', '<leader>a', 'ggVG<CR>')
