return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
        local opts = { noremap = true, silent = true }

        vim.keymap.set('n', '<leader>a', ':Alpha<CR>', opts)

        local status_ok, alpha = pcall(require, 'alpha')
        if not status_ok then
            return
        end

        local function header()
            return require('v9.logos')['random']
        end

        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = header()

        dashboard.section.buttons.val = {
            dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
            dashboard.button('e', '  New file', ':ene <CR>'),
            dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
            dashboard.button('gr', '  Find text', ':Telescope live_grep <CR>'),
            dashboard.button('n', '  Open file tree', ':NvimTreeOpen <CR>'),
            dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
        }

        local v = vim.version()
        local version = ' v' .. v.major .. '.' .. v.minor .. '.' .. v.patch
        local datetime = os.date(' %d-%m-%Y 󱑏 %H:%M:%S')

        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyVimStarted',
            callback = function()
                local stats = require('lazy').stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = {
                    '',
                    '',
                    version,
                    '',
                    datetime,
                    '',
                    '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms',
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        dashboard.section.footer.val = {}

        dashboard.section.footer.opts.hl = 'Type'
        dashboard.section.header.opts.hl = 'Include'
        dashboard.section.buttons.opts.hl = 'Keyword'

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)


        -- ALPHA LOLCAT ALPHA LOLCAT ALPHA LOLCAT --


        -- local opts = { noremap = true, silent = true }
        --
        -- vim.keymap.set('n', '<leader>a', ':Alpha<CR>', opts)
        --
        -- require 'alpha.term'
        --
        -- local status_ok, alpha = pcall(require, "alpha")
        -- if not status_ok then
        --     return
        -- end
        --
        -- local dashboard = require("alpha.themes.dashboard")
        --
        -- local function header()
        --     return require("v9.logos")["random"]
        -- end
        --
        -- dashboard.section.header.val = header()
        --
        -- local random_image = header()
        --
        -- ASCII_IMAGES_FOLDER = os.getenv("HOME") .. "/.config/nvim/static"
        --
        -- local function list_files(path, extension)
        --     local files = {}
        --     local pfile = io.popen("ls " .. path .. "/*" .. extension)
        --
        --     for filename in pfile:lines() do
        --         table.insert(files, filename)
        --     end
        --
        --     return files
        -- end
        --
        -- local function get_random_ascii_image(path)
        --
        --     math.randomseed(os.clock())
        --
        --     local images = list_files(path, ".cat")
        --     local colored_images = list_files(path, ".ccat")
        --
        --     for _, v in pairs(colored_images) do
        --         table.insert(images, v)
        --     end
        --
        --     return images[math.random(1, #images)]
        -- end
        --
        -- local function remove_escaped_colors(str)
        --     return str:gsub("\27%[[0-9;]*m", "")
        -- end
        --
        -- local function get_ascii_image_dim(path)
        --     local width = 0
        --     local height = 0
        --
        --     local pfile = io.open(path, "r")
        --
        --     for line in pfile:lines() do
        --         line = remove_escaped_colors(line)
        --         local current_width = vim.fn.strdisplaywidth(line)
        --         if current_width > width then
        --             width = current_width
        --         end
        --         height = height + 1
        --     end
        --     return { width, height }
        -- end
        --
        -- local function is_colored_image(path)
        --     return path:sub(-4) == 'ccat'
        -- end
        --
        -- local random_image = get_random_ascii_image(ASCII_IMAGES_FOLDER)
        -- local image_width, image_height = unpack(get_ascii_image_dim(random_image))
        --
        -- image_height = 32
        --
        -- local command = "cat | "
        --
        -- if is_colored_image(random_image) then
        --     command = command .. "cat "
        -- else
        --     command = os.getenv("HOME") .. "/.config/nvim/static/animated_lolcat.sh "
        -- end
        --
        --
        -- local terminal = {
        --     type = "terminal",
        --     command = command .. random_image,
        --
        --     width = image_width,
        --     height = image_height,
        --
        --     opts = {
        --         redraw = true,
        --         window_config = {}
        --     }
        -- }
        --
        -- dashboard.section.buttons.val = {
        --     dashboard.button("gr", "  Find text", ":Telescope live_grep <CR>"),
        --     dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        --     dashboard.button("e", "  New file", ":ene <CR>"),
        --     dashboard.button("CTRL+P", "  Find file", ":Telescope find_files <CR>"),
        --     dashboard.button("CTRL+N", "  Open file tree", ":NvimTreeOpen <CR>"),
        --     dashboard.button("p", "  Plugins", ":e ~/.config/nvim/lua/v9/plugins.lua <CR>"),
        --     dashboard.button("m", "  Keymaps", ":e ~/.config/nvim/lua/v9/keymaps.lua <CR>"),
        --     dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        -- }
        --
        -- local function footer()
        --     return "Not all those wander are lost..."
        -- end
        --
        -- dashboard.section.footer.val = footer()
        --
        -- dashboard.section.footer.opts.hl = "Type"
        -- dashboard.section.header.opts.hl = "Include"
        -- dashboard.section.buttons.opts.hl = "Keyword"
        --
        -- dashboard.opts.opts.noautocmd = true
        -- alpha.setup(dashboard.opts)
        --
        -- local image_padding = -32
        --
        -- dashboard.config.layout = {
        --     terminal,
        --     { type = "padding", val = image_padding },
        --     dashboard.section.buttons,
        --     { type = "padding", val = 1 },
        -- }
    end
}
