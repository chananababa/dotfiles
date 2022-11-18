local status, ih = pcall(require, "lsp-inlayhints")
if not status then
    return
end

require("lsp-inlayhints.adapter").set_old_tsserver()
ih.setup({
    inlay_hints = {
        highlight = "Comment",
    },
})
