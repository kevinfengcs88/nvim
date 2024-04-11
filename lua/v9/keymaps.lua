local opts = { noremap = true, silent = true }
local keymap = vim.keymap
local global = vim.g
global.mapleader = ' '
global.maplocalleader = ' '

-- make CTRL + C behave exactly the same as ESC
keymap.set('i', '<C-c>', '<ESC>', opts)

-- delete one word in insert mode (note that <C-h> sends the same ASCII escape sequence as <C-BS>)
keymap.set('i', '<C-h>', '<C-w>', opts)

-- remap ^ and $ to H and L, respectively
keymap.set('n', 'H', '^', opts)
keymap.set('n', 'L', '$', opts)

-- open up lazy.nvim UI
keymap.set('n', '<leader>l', ':Lazy<CR>', opts)

-- clear search term when centering the cursor
keymap.set('n', 'zz', 'zz:noh<CR>', opts)

-- open up Themery
keymap.set('n', '<leader>t', ':Themery<CR>', opts)

-- toggle Trouble
keymap.set('n', '<C-\\>', '<cmd>TroubleToggle<cr>')

-- indent and outdent lines quickly
keymap.set('n', '<TAB>', '>>', opts)
keymap.set('n', '<S-TAB>', '<<', opts)

-- keep cursor at front when appending lines below
keymap.set('n', 'J', 'mzJ`z', opts)

-- search movement keeps cursor in middle
keymap.set('n', 'n', 'nzzzv', opts)
keymap.set('n', 'N', 'Nzzzv', opts)

-- vertical movement keeps cursor in middle
keymap.set('n', '<C-d>', '<C-d>zz', opts)
keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- creates a new line below the cursor and goes back into normal mode
keymap.set('n', '<CR>', 'o<Esc>', opts)

-- quick resizing of buffers
keymap.set('n', '<C-up>', ':resize -2<cr>', opts)
keymap.set('n', '<C-down>', ':resize +2<cr>', opts)
keymap.set('n', '<C-left>', ':vertical resize -2<cr>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- copy into system clipboard with CTRL + C
keymap.set('v', '<C-c>', '"+y', opts)

-- copy into host system clipboard with <leader>y
keymap.set('v', '<leader>y', '"*y', opts)

-- prevent x from copying over Vim clipboard
keymap.set('n', 'x', '"_x', opts)

-- indent and outdent lines in visual mode
keymap.set('v', '<TAB>', '<S->>gv', opts)
keymap.set('v', '<S-TAB>', '<S-<>gv', opts)

-- the greatest remap ever (Primeagen)
keymap.set('v', '<leader>p', '"_dP', opts)

-- move lines around
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- vertical movement keeps cursor in middle (visual mode)
keymap.set('v', '<C-d>', '<C-d>zz', opts)
keymap.set('v', '<C-u>', '<C-u>zz', opts)
