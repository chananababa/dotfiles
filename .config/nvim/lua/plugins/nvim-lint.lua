return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd(opts.events, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
