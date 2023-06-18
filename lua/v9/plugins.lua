local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'nvim-tree/nvim-tree.lua' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-lualine/lualine.nvim' },
    { 'marko-cerovac/material.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    {
        'akinsho/toggleterm.nvim',
        commit = '2a787c426ef00cb3488c11b14f5dcf892bbd0bda',
        config = "require('toggleterm')"
    },
    -- This method works for lazy, but it doubles startup time
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     config = function ()
    --       vim.fn["mkdp#util#install"]()
    --     end
    -- },
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        -- using npm to install rather than the vim function leads to significantly faster startup time
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        config = function()
            vim.keymap.set('n', '<leader>m', '<Plug>MarkdownPreviewToggle', { desc = 'Markdown Preview' })
        end,
    },
    -- Peek works (assuming deno and JavaScript dependencies are installed), but there is a bug currently where the preview doesn't load
    -- {
    --   'toppair/peek.nvim',
    --   run = 'deno task --quiet build:fast',
    --   config = function()
    --     vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    --     vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    --   end,
    -- },
    { 'numToStr/Comment.nvim' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'windwp/nvim-autopairs' },
    { 'windwp/nvim-ts-autotag' },
    {
        'goolord/alpha-nvim'
    },
    { 'luk400/vim-lichess' },
    { 'dstein64/vim-startuptime' },
    { 'rhysd/clever-f.vim' },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },
    { 'ThePrimeagen/vim-be-good' },
    { 'alec-gibson/nvim-tetris' },
    {
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        }
    },
    { 'xiyaowong/transparent.nvim' },
    { 'ThePrimeagen/harpoon' },
    { 'luisiacc/gruvbox-baby' },
    { 'Mofiqul/vscode.nvim' },
    { 'folke/neodev.nvim' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'tpope/vim-surround' },
    { 'zaldih/themery.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end
            },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' }
}

local opts = {
    defaults = { lazy = true }
}

require('lazy').setup(plugins, opts)
