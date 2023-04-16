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
set.relativenumber = true
set.wrap = false

set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

-- make CTRL + C behave exactly the same as ESC
keymap.set('i', '<C-c>', '<ESC>', opts)

-- save all and quit all
keymap.set('n', '<leader>w', ':wa<CR>', opts)
keymap.set('n', '<leader>q', ':qa<CR>', opts)

-- clear search term
keymap.set('n', '<leader><leader>', ':noh<CR>', opts)

-- toggle transparency
keymap.set('n', '<leader>t', ':TransparentToggle<CR>', opts)

-- replace current word
keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file an executable
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

-- avoid falling into the black hole that is capital Q
keymap.set('n', 'Q', '<nop>', opts)

-- keep cursor at front when appending lines below
keymap.set('n', 'J', "mzJ`z", opts)

-- select entire file with CTRL + A
keymap.set('n', '<C-a>', 'ggVG', opts)

-- indent and outdent lines quickly
keymap.set('n', '<TAB>', '>>', opts)
keymap.set('n', '<S-TAB>', '<<', opts)

-- search movement keeps cursor in middle
keymap.set('n', 'n', 'nzzzv', opts)
keymap.set('n', 'N', 'Nzzzv', opts)

-- vertical movement keeps cursor in middle
keymap.set('n', '<C-j>', '<C-d>zz', opts)
keymap.set('n', '<C-k>', '<C-u>zz', opts)

-- creates a new line below the cursor and goes back into normal mode
keymap.set('n', '<CR>', 'o<Esc>', opts)

-- quick resizing of buffers
keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- copy into system clipboard with CTRL + C
keymap.set('v', '<C-c>', '"+y', opts)

-- indent and outdent lines in visual mode
keymap.set('v', '<TAB>', '<S->>', opts)
keymap.set('v', '<S-TAB>', '<S-<>', opts)

-- the greatest remap ever (Primeagen)
keymap.set('v', '<leader>p', "\"_dP", opts)

-- move lines around
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
