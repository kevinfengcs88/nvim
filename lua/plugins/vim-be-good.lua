return {
    'ThePrimeagen/vim-be-good',
    cmd = 'VimBeGood',
    config = function ()
        local status_ok, vimbegood = pcall(require, 'vim-be-good')
        if not status_ok then
            return
        end
    end
}
