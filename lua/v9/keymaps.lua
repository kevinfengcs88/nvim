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
set.cursorline = true

set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

-- useful keymaps
keymap.set('n', '<leader>w', ':wa<CR>')
keymap.set('n', '<leader>q', ':qa<CR>')
keymap.set('n', '<leader>m', ':MarkdownPreview<CR>')
keymap.set('n', '<leader>s', ':source %<CR>')
keymap.set('n', '<leader>p', ':PackerSync<CR>')
keymap.set('n', '<leader>h', ':noh<CR>')
keymap.set('n', '<leader>a', ':Alpha<CR>')

keymap.set('n', '<C-a>', 'ggVG<CR>')
keymap.set('n', '<TAB>', '>>')
keymap.set('n', '<S-TAB>', '<<')
keymap.set('n', '<CR>', 'o<Esc>') -- this creates a new line below the cursor and goes back into normal mode
keymap.set('n', '<C-l>', '<C-w>w') -- this creates a new line below the cursor and goes back into normal mode

keymap.set('v', '<C-c>', '"+y')
keymap.set('v', '<TAB>', '<S-.>')
keymap.set('v', '<S-TAB>', '<S-,>')
