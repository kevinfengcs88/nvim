local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

treesitter.setup({
    ensure_installed = { 'lua', 'vim', 'python', 'markdown_inline' },

    sync_install = false,
    auto_install = false,
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
    indent = {
        enable = true,
        disable = { 'yaml', 'yml' }
    }
})
