local opts = { noremap = true, silent = true }
local keymap = vim.keymap
local global = vim.g
global.mapleader = ';'
global.maplocalleader = ';'

-- make CTRL + C behave exactly the same as ESC
keymap.set('i', '<C-c>', '<ESC>', opts)

-- open up lazy.nvim UI
keymap.set('n', '<leader>l', ':Lazy<CR>', opts)

-- switch between buffers without CTRL + W
keymap.set('n', '<C-l>', '<C-w>w', opts)

-- save all and quit all
keymap.set('n', '<leader>w', ':wa<CR>', opts)
keymap.set('n', '<leader>q', ':qa<CR>', opts)

-- clear search term
keymap.set('n', '<leader><leader>', ':noh<CR>', opts)

-- toggle transparency
keymap.set('n', '<leader>tr', ':TransparentToggle<CR>', opts)

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

-- creates a new line above the cursor and goes back into normal mode
keymap.set('n', '<leader><CR>', 'O<Esc>', opts)

-- quick resizing of buffers
keymap.set('n', '<C-up>', ':resize -2<cr>', opts)
keymap.set('n', '<C-down>', ':resize +2<cr>', opts)
keymap.set('n', '<C-left>', ':vertical resize -2<cr>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- copy into system clipboard with CTRL + C
keymap.set('v', '<C-c>', '"+y', opts)

-- copy into host system clipboard with <leader>y
keymap.set('v', '<leader>y', '"*y', opts)

-- indent and outdent lines in visual mode
keymap.set('v', '<TAB>', '<S->>gv', opts)
keymap.set('v', '<S-TAB>', '<S-<>gv', opts)

-- the greatest remap ever (Primeagen)
keymap.set('v', '<leader>p', "\"_dP", opts)

-- move lines around
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
