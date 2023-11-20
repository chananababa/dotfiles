return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("file_browser")

    vim.keymap.set("n", "<leader>sf", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        hidden = true,
        grouped = true,
        initial_mode = "normal",
        respect_gitignore = false,
      })
    end)
  end,
}
