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
  opts = function()
    return {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
        javascriptreact = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
        typescript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
        typescriptreact = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
      },
      formatters = {
        stylua = {
          prepend_args = { "--indent-type=spaces", "--indent-width=2" },
        },
        prettierd = {
          cwd = require("conform.util").root_file(prettier_root_patterns),
          require_cwd = true,
        },
        prettier = {
          cwd = require("conform.util").root_file(prettier_root_patterns),
          require_cwd = true,
        },
        eslint_d = {
          cwd = require("conform.util").root_file(eslint_root_patterns),
          require_cwd = true,
        },
        eslint = {
          cwd = require("conform.util").root_file(eslint_root_patterns),
          require_cwd = true,
        },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = false,
      },
    }
  end,
}
