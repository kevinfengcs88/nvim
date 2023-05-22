local status_ok, vim_illuminate = pcall(require, 'illuminate')
if not status_ok then
    return
end

local highlights = {
    IlluminatedWord = { bg = '#757575' },
    IlluminatedCurWord = { bg = '#757575' },
    IlluminatedWordText = { bg = '#757575' },
    IlluminatedWordRead = { bg = '#757575' },
    IlluminatedWordWrite = { bg = '#757575' },
}

for group, value in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, value)
end

vim_illuminate.configure({
    under_cursor = false,
})
