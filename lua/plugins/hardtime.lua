return {
    'm4xshen/hardtime.nvim',
    config = function()
        local ok, hardtime = pcall(require, 'hardtime')

        if not ok then
            return
        end

        hardtime.setup({
            disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
            max_time = 0,
        })
    end
}
