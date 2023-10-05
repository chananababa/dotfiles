local theme_status, catppuccin = pcall(require, "catppuccin")

if theme_status then
    vim.cmd("colorscheme catppuccin")

    catppuccin.setup({
        integrations = {
            lsp_saga = true,
            leap = true,
        },
    })
end
