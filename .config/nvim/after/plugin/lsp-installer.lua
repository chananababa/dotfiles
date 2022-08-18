local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
    return
end

lsp_installer.setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})
