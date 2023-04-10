local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local function header()
  return require("v9.plugin_config.logos")["random"]
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = header()

 dashboard.section.buttons.val = {
   dashboard.button("CTRL+P", "  Find file", ":Telescope find_files <CR>"),
   dashboard.button("f", "  New file", ":ene <CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("gr", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("n", "  Open file tree", ":NvimTreeOpen <CR>"),
   dashboard.button("p", "  Plugins", ":e ~/.config/nvim/lua/v9/plugins.lua <CR>"),
   dashboard.button("m", "  Keymaps", ":e ~/.config/nvim/lua/v9/keymaps.lua <CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
 return "Not all those wander are lost..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
