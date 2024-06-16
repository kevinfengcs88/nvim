# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins.

## work in progress...

- Make jumping to a mark also perform zz afterwards
- Prevent comment lines being added in bash
- Get harpoon back in here primeagen is just terry davis v2
- Find out why ESC is slow (some keymap is stalling it)

## Uninstalling

I build Neovim from source. To uninstall just run:

```
rm -f $(which nvim)
```

## Dependencies

- shellcheck
    - Required for bash-language-server to give diagnostics
- ripgrep?
    - Required for telescope to grep files
