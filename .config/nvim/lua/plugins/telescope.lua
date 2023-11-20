return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", "__pycache__" },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
    },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    { "<leader>cd", ":lua require'telescope'.extensions.zoxide.list{}<CR>" },
  },
}
