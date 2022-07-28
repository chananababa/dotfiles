vim.diagnostic.config({
    virtual_text = {
        source = "always",
        prefix = "●",
    },
    float = {
        source = "always",
    },
})

vim.api.nvim_create_autocmd({
    "CursorMoved",
}, {
    callback = function()
        vim.diagnostic.open_float()
    end,
})
