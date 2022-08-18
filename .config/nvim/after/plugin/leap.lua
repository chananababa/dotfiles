local status, leap = pcall(require, "leap")
if not status then
    return
end

leap.set_default_keymaps()
