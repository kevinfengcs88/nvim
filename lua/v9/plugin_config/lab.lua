local status_ok, lab = pcall(require, "lab")
if not status_ok then
    return
end

lab.setup({
    require("lab").setup({
        code_runner = {
            enabled = true,
        },
        quick_data = {
            enabled = true,
        },
    }),
})
