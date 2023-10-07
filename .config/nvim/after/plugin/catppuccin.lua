local theme_status, catppuccin = pcall(require, "catppuccin")

if theme_status then
    vim.cmd("colorscheme catppuccin")
end
