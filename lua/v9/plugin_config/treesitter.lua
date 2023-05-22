local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

treesitter.setup({
    ensure_installed = { 'lua', 'vim', 'python' },

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        autocmd = false,
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
})
