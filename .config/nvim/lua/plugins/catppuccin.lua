return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  -- config here instead of `after` to let nvim load compiled config for transparency
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      transparent_background = true,
      integrations = {
        lsp_saga = true,
        leap = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
  build = ":CatppuccinCompile",
}
