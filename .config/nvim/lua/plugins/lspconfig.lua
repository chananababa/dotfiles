local required_servers = { "lua_ls", "eslint", "tsserver", "pyright", "tailwindcss", "html", "prismals" }

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
