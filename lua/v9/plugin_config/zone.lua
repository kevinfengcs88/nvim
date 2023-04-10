require('zone').setup {
    style = "dvd",
    after = 5,          -- Idle timeout
    exclude_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree", "dashboard", "lazy" },
    -- More options to come later

    treadmill = {
        direction = "left",
        headache = true,
        tick_time = 30,     -- Lower, the faster
        -- Opts for Treadmill style
    },
    epilepsy = {
        stage = "aura",     -- "aura" or "ictal"
        tick_time = 100,
    },
    dvd = {
        -- text = {"line1", "line2", "line3", "etc"}
        tick_time = 100,
        -- Opts for Dvd style
    },
    -- etc
}
