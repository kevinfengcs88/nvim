# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses lazy for managing plugins. Below are some useful keymaps and configuration tips as I learn more about Neovim as well as some additional Linux/miscellaneous tips that I discovered while setting up my workflow. 

## Useful keymaps
- `CTRL + J` cycles through buffers (particularly useful for switching between nvim-tree and the editor)
- `r` while focused on nvim-tree renames the current file
- `a` while focused on nvim-tree adds a new file (or folder, just append a '/' character)
- Neovim allows for pasting from the system clipboard via `CTRL + SHIFT + V` both in insert mode and command mode (note that wl-clipboard is installed, which might influence this behavior)
- `;q` quits Neovim (by quitting all buffers) and `;w` saves all buffers
- `TAB` and `SHIFT + TAB` indent and outdent a line, regardless of where the cursor is
    - In visual mode, the same keymaps work (just remapped to their multi-line variants)
- Upon opening Neovim (and seeing the alpha dashboard), just hit `ENTER` rather than `CTRL + P` for telescope's find file function since the cursor is already focused on the first option

## Other tips for configuring Neovim
- When setting the style for material.nvim, the style **MUST** come before enabling the colorscheme, otherwise, a manual `:source %` is required to apply the new style
- If installing the Lua language server with Mason for the first time, change "sumneko_lua" to "lua_ls"
- When installing certain LSPs like pyright, npm must be installed first through terminal (just run `sudo apt install nodejs npm`
- Make sure to add the languages that you are working with in `treesitter.lua`, otherwise their syntax highlighting will be suboptimal
- To show current keymaps, use `:nmap`, `:vmap`, and `:imap` for normal, visual, and insert mode mappings, respectively
- To show currently installed parsers for treesitter, use `:TSInstallInfo`
- `pip` is a requirement for lichess
    - `pip install berserk` for the lichess requirement
- `ripgrep` is a binary requirement for grep to work (install it as you would install Neovim, it's not a plugin)
    - For Ubuntu or other Debian distros:
```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```
- `deno` is a JavaScript runtime requirement for the peek plugin, install the latest version with these commands:
```
cd /tmp
curl -Lo "deno.zip" "https://github.com/denoland/deno/releases/latest/download/deno-x86_64-unknown-linux-gnu.zip"
sudo apt update
sudo apt install unzip
sudo unzip -d /usr/local/bin /tmp/deno.zip
```
- After installing deno (verify with `deno --version`), run this command to install the missing JavaScript bundles:
```
cd ~/.local/share/nvim/lazy/peek.nvim && deno task build:debug
```
- Another way of fixing the missing JavaScript bundles is to run:
```
cd ~/.local/share/nvim/lazy/peek.nvim
deno run --allow-run --allow-net --allow-read --allow-write --allow-env --no-check scripts/build.js
```
- Run this command if `python3` provider cannot be found for lichess plugin:
```
python3 -m pip install --user --upgrade pynvim
```
- For lazy-loading plugins, not having a separate, modular config file (that calls upon the plugin with `require`) can prevent the plugin from working (under `plugin_config` directory)
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

## Linux tips/miscellaneous tips
- `q` while stuck in `git diff` exits the logs (may need to hit `i` if the terminal doesn't respond to `q`)
- For moving files to `$PATH`, you cannot just drag and drop files via the file explorer (or copy + paste them for that matter). Instead you have to do it with super user permissions: `sudo mv filename /usr/local/bin`

## TODO
- Underline errors through LSP (this requires a terminal with undercurl support like Alacritty)
- Add lolcat figlet zsh output on desktop
- Figure out where "utf-8" Field autocomplete comes from, coding lines that end with '8' annoyingly autocomplete to this bogus
- Change directory structure to suggested one (include `after`) folder; this could possibly improve startup time as well (clean this one up)
- Fix noice error with transparency plugins
- Add bash script for opening a random background image
- Look into a plugin for maintaining sessions (persistence of buffers across sessions)
