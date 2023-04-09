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
  {'ellisonleao/gruvbox.nvim', lazy=true},
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
  {
      "iamcco/markdown-preview.nvim",
      config = function()
        vim.fn["mkdp#util#install"]()
      end, lazy=true
  },
  {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  },
  {'JoosepAlviste/nvim-ts-context-commentstring', lazy=true},
  {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  },
  {
    "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup {} end
  },
  {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end, lazy=true
  },
  {'luk400/vim-lichess'},
  {'dstein64/vim-startuptime'}
}

local opts = {}

require("lazy").setup(plugins, opts)

