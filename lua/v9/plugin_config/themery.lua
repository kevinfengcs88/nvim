require('themery').setup({
  -- themes = {'material', 'vscode', 'gruvbox-baby'},
  themes = {{
    name = 'material',
    colorscheme = 'material',
    before = [[
      vim.g.material_style = 'darker'
    ]]
  },
  {
    name = 'vscode',
    colorscheme = 'vscode'
  },
  {
    name = 'gruvbox',
    colorscheme = 'gruvbox-baby'
  }},
  themeConfigFile = '~/.config/nvim/lua/v9/plugin_config/colorscheme.lua',
  livePreview = true
})
