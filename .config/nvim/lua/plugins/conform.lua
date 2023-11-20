local prettier_root_patterns = {
  ".prettierrc",
  ".prettierrc.yml",
  ".prettierrc.yaml",
  ".prettierrc.json",
  ".prettierrc.cjs",
  ".prettier.config.cjs",
  ".prettierrc.toml",
  "prettierrc.js",
  "prettier.config.js",
  "prettierrc.mjs",
  "prettier.config.mjs",
}

local eslint_root_patterns = {
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
}

return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
      typescript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
    },
    formatters = {
      stylua = {
        prepend_args = { "--indent-type=spaces", "--indent-width=2" },
      },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)
    conform.formatters.prettierd = {
      cwd = require("conform.util").root_file(prettier_root_patterns),
    }
    conform.formatters.prettier = {
      cwd = require("conform.util").root_file(prettier_root_patterns),
    }
    conform.formatters.eslint_d = {
      cwd = require("conform.util").root_file(eslint_root_patterns),
    }
    conform.formatters.eslint = {
      cwd = require("conform.util").root_file(eslint_root_patterns),
    }
  end,
}
