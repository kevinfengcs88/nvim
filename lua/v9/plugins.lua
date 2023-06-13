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
    { 'nvim-tree/nvim-tree.lua', lazy = true },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'nvim-lualine/lualine.nvim', lazy = true },
    { 'marko-cerovac/material.nvim', lazy = true },
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        lazy = true,
    },
    {
        'akinsho/toggleterm.nvim',
        commit = '2a787c426ef00cb3488c11b14f5dcf892bbd0bda',
        config = "require('toggleterm')",
        lazy = true,
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
    { 'numToStr/Comment.nvim', lazy = true },
    { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },
    { 'windwp/nvim-autopairs', lazy = true },
    { 'windwp/nvim-ts-autotag', lazy = true },
    {
        'goolord/alpha-nvim',
        lazy = true,
    },
    { 'luk400/vim-lichess' },
    { 'dstein64/vim-startuptime' },
    { 'rhysd/clever-f.vim' },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end,
        lazy = true,
    },
    { 'ThePrimeagen/vim-be-good', lazy = true },
    { 'alec-gibson/nvim-tetris' },
    {
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        lazy = true,
    },
    { 'xiyaowong/transparent.nvim' },
    { 'ThePrimeagen/harpoon', lazy = true },
    { 'luisiacc/gruvbox-baby', lazy = true },
    { 'Mofiqul/vscode.nvim', lazy = true },
    { 'folke/neodev.nvim', lazy = true },
    { 'lukas-reineke/indent-blankline.nvim', lazy = true, enabled = true},
    { 'tpope/vim-surround' },
    { 'zaldih/themery.nvim', lazy = true },
    { 'lewis6991/gitsigns.nvim', lazy = true },
    {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
    }

}

local opts = {}

require('lazy').setup(plugins, opts)
