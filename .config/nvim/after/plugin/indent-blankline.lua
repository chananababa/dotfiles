local status, indent_blankline = pcall(require, "ibl")
if not status then
    return
end

indent_blankline.setup({
    scope = {
        show_start = false,
        show_end = false
    }
})
