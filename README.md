# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins.

## work in progress...

- Make jumping to a mark also perform zz afterwards
- Prevent comment lines being added in bash
- Get harpoon back in here primeagen is just terry davis v2
- Have treesitter install vimdoc by default (help menus are broken without it)
- Prevent pattern not found from spawning a message (is this from noice?)

## Uninstalling

I build Neovim from source. To uninstall just run:

```
rm -f $(which nvim)
```

## Dependencies

- shellcheck
    - Required for bash-language-server to give diagnostics
- ripgrep
    - Required for telescope to grep files
- xclip (Linux)
    - Required for clipboard tool in Linux, in WSL, rely on powershell command and clip.exe
