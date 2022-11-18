local status, eyeliner = pcall(require, "eyeliner")
if not status then
    return
end

eyeliner.setup({
    highlight_on_key = true,
})
