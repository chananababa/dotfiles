return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
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

    local servers = { "pyright", "tsserver", "html", "tailwindcss", "lua_ls" }

    for _, server in ipairs(servers) do
      lspconfig[server].setup(settings[server])
    end
  end,
}
