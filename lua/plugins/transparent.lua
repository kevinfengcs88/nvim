return {
    'xiyaowong/transparent.nvim',
    cmd = 'TransparentToggle',
    config = function ()
        local transparent_status_ok, transparent = pcall(require, 'transparent')
        -- nothing
    end
}
