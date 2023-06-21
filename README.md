# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses lazy for managing plugins. Below, you can find various tips/commands that I learned while configuring Neovim and my workflow as a whole.

## Useful keymaps/tricks
- `r` while focused on nvim-tree renames the current file
- `a` while focused on nvim-tree adds a new file (or folder, just append a '/' character)
- Neovim allows for pasting from the system clipboard via `CTRL + SHIFT + V` both in insert mode and command mode (note that xclip is installed, which might influence this behavior)
- `;q` quits Neovim (by quitting all buffers) and `;w` saves all buffers
- `TAB` and `SHIFT + TAB` indent and outdent a line, regardless of where the cursor is
    - In visual mode, the same keymaps work (just remapped to their multi-line variants)
- Upon opening Neovim (and seeing the alpha dashboard), just hit `ENTER` rather than `f` for telescope's find file function since the cursor is already focused on the first option
- A simple search and replace of the whole file can be completed like this:
```
:%s/original/replaced/g
```
- Use visual mode and the `=` command to set all the tabs to be the same width as shiftwidth (if `:retab` doesn't work)
    - Note that commented lines may alter the behavior of this
- Use `da(` to delete everything inside parentheses and the parentheses themselves
- `<C-t>` toggles the transparency plugin
- To show current keymaps, use `:nmap`, `:vmap`, and `:imap` for normal, visual, and insert mode mappings, respectively
- To show currently installed parsers for treesitter, use `:TSInstallInfo`
- vim-surround enables very quick "surround" operations, like `ysiw` to surround a word with quotes or `ci"'` to replace double quotes with single quotes
- Switching colorscheme can fix cursor bugs

## Installing dependencies + additional tools
- Install `berserk` for lichess:
```
pip install berserk
```
- Run this command if `python3` provider cannot be found for lichess plugin:
```
python3 -m pip install --user --upgrade pynvim
```
- If the animated alpha dashboard ASCII art is broken due to a zsh permission error, that means the permissions of the script, `animated_lolcat.sh` need to be updated with something like this:
```
sudo chmod +x animated_lolcat.sh
```
- Run this command for changing the font size rendering of GNOME terminal:
```
gsettings set org.gnome.desktop.interface text-scaling-factor 1
```
- Run this command to find the profile of the GNOME terminal:
```
dconf dump /org/gnome/terminal/legacy/profiles:/
```
- Run this command using that profile ID to change the transparency of the terminal to a specific value (more precise than using the slider in preferences):
```
dconf write /org/gnome/terminal/legacy/profiles:/<PROFILE-ID>/background-transparency-percent 50
```
- For resizing VMWare disk space, unmount the drive if `gparted` claims that the file system is read-only (seems safe?)

- To set nvim as the global git editor, run:
```
git config --global core.editor "nvim"
```
- If Neovim can't find xsel, try running
```
export DISPLAY=:0
```

## List of dependencies/tools
Below is a list of dependencies/tools for my Neovim config and overall workflow
- [Gnome Shell Extension Prefs](https://www.omgubuntu.co.uk/2017/02/hidden-gnome-shell-extensions-prefs-app)
- [Variety](https://github.com/varietywalls/variety)
- `node`
    - `npm`
- `gcc` (especially for Windows machines which installed Neovim without building from source code)
- `xsel` (in conjunction with 'unnamedplus' clipboard)
- `ripgrep`
- `deno`
- `python3`
- `figlet`
- `lolcat`
- `neofetch`
- `pip`
    - `berserk`

## TODO
- Comments still wrap when hitting <CR> in insert mode (a new line is created with a comment by default)
- Organize dotfiles (.zsh, .gitconfig, .wezterm, etc.) in preparation for new repo
- Change color of relative line numbers to white (more visible)
- Python f-string fixes:
    - Disable annoying {} wrapping around ''
    - Disable annoying f''' behavior (it should be f'')

## Plugins to test
- https://github.com/napisani/nvim-github-codesearch
- https://github.com/stevearc/oil.nvim
- Sessions/persistence (one of these)
    - https://github.com/folke/persistence.nvim
    - https://github.com/rmagatti/auto-session
- https://github.com/akinsho/bufferline.nvim
