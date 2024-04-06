# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins.

## work in progress...

- still need to fix treesitter parse query error
    - more information: this is a treesitter telescope error when telescope renders the file's preview and tries to parse the syntax

## Uninstalling

I build Neovim from source. To uninstall just run:

```
rm -f $(which nvim)
```
