-- require 'alpha.term'
-- local dashboard = lvim.builtin.alpha.dashboard;
-- local alphadash = require("alpha.themes.dashboard")

-- local function button(sc, txt, keybind, keybind_opts)
--     return alphadash.button(sc, txt, keybind, keybind_opts)
-- end

ASCII_IMAGES_FOLDER = os.getenv("HOME") .. "/.config/nvim/static"

-- Ascii images have the extension .cat, and colored ascii images have
-- the extension .ccat,
--
-- Lolcat will only be used with the non colored ascii images
local function list_files(path, extension)
    local files = {}
    local pfile = io.popen("ls " .. path .. "/*" .. extension)

    for filename in pfile:lines() do
        table.insert(files, filename)
    end

    return files
end

local function get_random_ascii_image(path)

    math.randomseed(os.clock())

    -- For some reason ls *.(cat|ccat) will not work under vim,
    -- so gotta ls twice and merge

    local images = list_files(path, ".cat")
    local colored_images = list_files(path, ".ccat")

    for _, v in pairs(colored_images) do
        table.insert(images, v)
    end

    return images[math.random(1, #images)]
end

local function remove_escaped_colors(str)
    return str:gsub("\27%[[0-9;]*m", "")
end

local function get_ascii_image_dim(path)
    local width = 0
    local height = 0

    local pfile = io.open(path, "r")

    for line in pfile:lines() do
        -- Take into account colored output
        line = remove_escaped_colors(line)
        local current_width = vim.fn.strdisplaywidth(line)
        if current_width > width then
            width = current_width
        end
        height = height + 1
    end

    -- For some reason, after the last update or something,
    -- I have to add 2 to width, otherwise the image is not
    -- displayed correctly
    width = width + 2

    return { width, height }
end

local function is_colored_image(path)
    return path:sub(-4) == 'ccat'
end

local random_image = get_random_ascii_image(ASCII_IMAGES_FOLDER)
local image_width, image_height = unpack(get_ascii_image_dim(random_image))

image_height = 32

-- This avoids "process exited message"
local command = "cat | "
if is_colored_image(random_image) then
    command = command .. "cat "
else
    command =  "animated-ascii "
    -- command = os.getenv("HOME") .. "/.config/lvim/static/animated_lolcat.sh "
end

local terminal = {
    type = "terminal",
    command = command .. random_image,
    width = image_width,
    height = image_height,

    opts = {
        redraw = true,
        window_config = {},
    },
}

-- alphadash.section.buttons.val = {
--     button("SPC f", "  Find File", "<CMD>Telescope find_files<CR>"),
--     button("SPC n", "  New File", "<CMD>ene!<CR>"),
--     button("SPC P", "  Recent Projects ", "<CMD>Telescope projects<CR>"),
--     button("SPC s r", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>"),
--     button("SPC s t", "  Find Word", "<CMD>Telescope live_grep<CR>"),
--     --     button("SPC C t", "-  Open tmux config", "<CMD>edit ~/.tmux.conf<CR>"),
--     --     button("SPC C z", "-  Open zshrc", "<CMD>edit ~/.zshrc<CR>"),
--     --     button("SPC C a", "-  Open zsh_aliases", "<CMD>edit ~/.zsh_aliases<CR>"),
-- }

--
-- local text = require "lvim.interface.text"
--
-- local function footer()
--     local custom_plugins = #vim.tbl_keys(lvim.plugins)
--     local datetime = os.date(" %d/%m/%Y   %H:%M:%S")
--     local version = vim.version()
--     local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
--
--     local text_table = text.align_center({ width = 0 }, {
--         datetime .. "   " .. custom_plugins .. " custom plugins" .. nvim_version_info,
--     }, 0.5)
--
--     table.insert(text_table, "Pytness")
--
--     return {
--         type = "text",
--         val = text_table,
--         opts = {
--             position = "center",
--             hl = "Number",
--         },
--     }
-- end
--
-- local image_padding = image_height + 8
--
-- dashboard.config.layout = {
--     terminal,
--     { type = "padding", val = image_padding },
--     alphadash.section.buttons,
--     { type = "padding", val = 1 },
--     footer(),
--
-- }
