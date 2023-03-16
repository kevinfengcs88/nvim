# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses packer for managing plugins. Below are some useful keymaps and configuration tips as I learn more about Neovim as well as some additional Linux/miscellaneous tips that I learned about.

## Useful keymaps
- `CTRL + W + W` switches between nvim-tree and the editor
- `r` while focused on nvim-tree renames the current file
- `a` while focused on nvim-tree adds a new file (or folder)
- Neovim allows for pasting from the system clipboard via `CTRL + SHIFT + V` both in insert mode and command mode (note that wl-clipboard is installed, I don't know if this influences this functionality)

## Other tips for configuring Neovim
- When setting the style for material.nvim, the style **MUST** come before enabling the colorscheme, otherwise, a manual `:source %` is required to apply the new style
- When installing the Lua language server with Mason for the first time, change "sumneko_lua" to "lua_ls"
- When installing certain LSPs like pyright, npm must be installed first through terminal (just run `sudo apt install nodejs npm`
- The toggleterm plugin does **not** function properly without being in the `~/.config/nvim/plugin` directory
- Make sure to add the languages that you are working with in `treesitter.lua`, otherwise their syntax highlighting will be suboptimal
- There are various tools that are required for certain plugins to work, including:
    - git
    - nodejs + npm

## Linux tips/miscellaneous tips
- `q` while stuck in `git diff` exits the logs (may need to hit `i` if the terminal doesn't respond to `q`
- For moving files to `$PATH`, you cannot just drag and drop files via the file explorer (or copy + paste them for that matter). Instead you have to run something like `sudo mv filename /usr/local/bin`
