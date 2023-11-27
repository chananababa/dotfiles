local required_servers = { "lua_ls", "eslint", "tsserver", "pyright", "tailwindcss", "html", "prismals" }

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = required_servers,
      },
    },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    local settings = setmetatable({
      tsserver = {
        capabilities = cmp_capabilities,
      },
      html = {
        capabilities = cmp_capabilities,
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
          },
        },
      },
      prismals = {
        on_attach = on_attach,
      },
    }, {
      __index = function()
        return {}
      end,
    })

    for _, server in ipairs(required_servers) do
      lspconfig[server].setup(settings[server])
    end
  end,
}
