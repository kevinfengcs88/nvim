local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {'nvim-tree/nvim-tree.lua', lazy=true},
  {'nvim-tree/nvim-web-devicons', lazy=true},
  {'nvim-lualine/lualine.nvim', lazy=true},
  {'marko-cerovac/material.nvim', lazy=true},
  {'nvim-treesitter/nvim-treesitter', lazy=true},
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }, lazy=true
  },
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    lazy=true
  },
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'L3MON4D3/LuaSnip'},
  {'saadparwaiz1/cmp_luasnip'},
  {'rafamadriz/friendly-snippets'},
  { "akinsho/toggleterm.nvim",
    commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda",
    config = "require('toggleterm')",
    lazy=true
  },
  -- {
  --     "iamcco/markdown-preview.nvim",
  --     config = function ()
  --       vim.fn["mkdp#util#install"]()
  --     end
  -- },
  {
    'toppair/peek.nvim',
    run = 'deno task --quiet build:fast',
    config = function()
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
  {
      'numToStr/Comment.nvim', lazy=true
  },
  {'JoosepAlviste/nvim-ts-context-commentstring', lazy=true},
  {"windwp/nvim-autopairs", lazy=true},
  {"windwp/nvim-ts-autotag", lazy=true},
  {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end, lazy=true
  },
  {'luk400/vim-lichess'},
  {'dstein64/vim-startuptime'},
  {'rhysd/clever-f.vim'},
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {'ThePrimeagen/vim-be-good'},
  {'alec-gibson/nvim-tetris'},
  {'tamton-aquib/zone.nvim', lazy=true, enabled=false},
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    lazy=true
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
