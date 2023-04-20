# My Neovim Config
This repository contains my Neovim config, which is written in Lua. It uses lazy for managing plugins. Below, you can find various tips/commands that I learned while configuring Neovim and my workflow as a whole.

## Useful keymaps/tricks
- `r` while focused on nvim-tree renames the current file
- `a` while focused on nvim-tree adds a new file (or folder, just append a '/' character)
- Neovim allows for pasting from the system clipboard via `CTRL + SHIFT + V` both in insert mode and command mode (note that wl-clipboard is installed, which might influence this behavior)
- `;q` quits Neovim (by quitting all buffers) and `;w` saves all buffers
- `TAB` and `SHIFT + TAB` indent and outdent a line, regardless of where the cursor is
    - In visual mode, the same keymaps work (just remapped to their multi-line variants)
- Upon opening Neovim (and seeing the alpha dashboard), just hit `ENTER` rather than `f` for telescope's find file function since the cursor is already focused on the first option
- A simple search and replace of the whole file can be completed like this:
```
:%s/original/replaced/g
```
- `;t` toggles the transparency plugin
- To show current keymaps, use `:nmap`, `:vmap`, and `:imap` for normal, visual, and insert mode mappings, respectively
- To show currently installed parsers for treesitter, use `:TSInstallInfo`

## Installing dependencies + additional tools
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
- Use this command to open up a random image for background (make sure transparency is toggled to see the image):
```
cd waifus && shuf -ezn1 * | xargs -0 -n1 xdg-open && cd ..
```
- Commands for installing figlet and lolcat (lolcat is a dependency for animated alpha dashboard):
```
sudo apt-get install figlet
git clone https://github.com/busyloop/lolcat
cd lolcat/bin
sudo gem install lolcat
```
- Some dependencies for the lab plugin are required, which can be installed with all of the following commands:
```
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo n latest
sudo npm install eslint --global
sudo npm install -g typescript
```
- Install Variety (import background images as you wish):
```
sudo apt install variety
```
- For resizing VMWare disk space, unmount the drive if `gparted` claims that the file system is read-only (?)
- To set nvim as the global git editor, run:
```
git config --global core.editor "nvim"
```

## List of tools
Below is a list of tools that I've installed on my Ubuntu OS, apart from Neovim (this will be used as a reference for my dotfiles repo).
- [Gnome Shell Extension Prefs](https://www.omgubuntu.co.uk/2017/02/hidden-gnome-shell-extensions-prefs-app)
- [Variety](https://github.com/varietywalls/variety)

## List of dependencies
Below is a list of dependencies that are required specifically for my Neovim config alone.
- `ripgrep`
- `deno`
- `python3`
- `figlet`
- `lolcat`
- `typescript`
- `eslint`
- `pip`
- `berserk` (which is installed through pip)

## TODO
- Underline errors through LSP (this requires a terminal with undercurl support like Alacritty)
- Figure out where "utf-8" Field autocomplete comes from, coding lines that end with '8' (at least in Lua) annoyingly autocomplete to this bogus
- Change directory structure to the suggested one (include `after`) folder; this could possibly improve startup time as well (clean this one up)
- Fix noice error with transparency plugins
- Look into a plugin for maintaining sessions (persistence of buffers across sessions)
- Fix blackjack score storing directory bug (once the directory is created, it becomes a permission error)
- Find out if there is a way to do fuzzy finding for cmdline
- Add installation and set up for i3wm
- Add installation and set up for tmux
- Add installation and set up for nnn
- Add installation and set up for Alacritty
- Add indent line plugin
- Add GitHub code search plugin
- Add colorscheme swapping plugin (Telescope has a built-in one, so not necessary)?
- Set Git editor to nvim
