return {
    'ggandor/leap.nvim',
    -- leap lazy-loads itself
    config = function ()
        local status_ok, leap = pcall(require, 'leap')

        if not status_ok then
            return
        end

        leap.setup({})
    end
}
