local set = vim.opt
local global = vim.g
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

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
keymap.set('n', '<leader>w', ':wa<CR>', opts)
keymap.set('n', '<leader>q', ':qa<CR>', opts)
keymap.set('n', '<leader>m', ':MarkdownPreview<CR>', opts)
keymap.set('n', '<leader>s', ':source %<CR>', opts)
keymap.set('n', '<leader>p', ':PackerSync<CR>', opts)
keymap.set('n', '<leader>h', ':noh<CR>', opts)
keymap.set('n', '<leader>a', ':Alpha<CR>', opts)

keymap.set('n', '<C-a>', 'ggVG<CR>', opts)
keymap.set('n', '<TAB>', '>>', opts)
keymap.set('n', '<S-TAB>', '<<', opts)
-- this creates a new line below the cursor and goes back into normal mode
keymap.set('n', '<CR>', 'o<Esc>', opts)
-- makes toggling between buffers easier
keymap.set('n', '<C-j>', '<C-w>w', opts)

-- enables switching buffers from left to right and vice versa
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

keymap.set('v', '<C-c>', '"+y', opts)
keymap.set('v', '<TAB>', '<S-.>', opts)
keymap.set('v', '<S-TAB>', '<S-,>', opts)
