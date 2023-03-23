# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses packer for managing plugins. Below are some useful keymaps and configuration tips as I learn more about Neovim as well as some additional Linux/miscellaneous tips that I discovered while setting up my workflow. 

## Useful keymaps
- `CTRL + W + W` cycles through buffers (particularly useful for switching between nvim-tree and the editor)
- `r` while focused on nvim-tree renames the current file
- `a` while focused on nvim-tree adds a new file (or folder, just append a '/' character)
- Neovim allows for pasting from the system clipboard via `CTRL + SHIFT + V` both in insert mode and command mode (note that wl-clipboard is installed, which might influence this behavior)

## Other tips for configuring Neovim
- When setting the style for material.nvim, the style **MUST** come before enabling the colorscheme, otherwise, a manual `:source %` is required to apply the new style
- If installing the Lua language server with Mason for the first time, change "sumneko_lua" to "lua_ls"
- When installing certain LSPs like pyright, npm must be installed first through terminal (just run `sudo apt install nodejs npm`
- Make sure to add the languages that you are working with in `treesitter.lua`, otherwise their syntax highlighting will be suboptimal
- For installing markdown-preview plugin, use this code to install without yarn or npm:
```lua
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
```
- To show current keymaps, use `:nmap`, `:vmap`, and `:imap` for normal, visual, and insert mode mappings, respectively
- To show currently installed parsers for treesitter, use `:TSInstallInfo`
- `pip` is a requirement for lichess
    - `pip install berserk` for the lichess requirement

## Linux tips/miscellaneous tips
- `q` while stuck in `git diff` exits the logs (may need to hit `i` if the terminal doesn't respond to `q`)
- For moving files to `$PATH`, you cannot just drag and drop files via the file explorer (or copy + paste them for that matter). Instead you have to do it with super user permissions: `sudo mv filename /usr/local/bin`
