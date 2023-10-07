local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end

require("mason").setup()
require("mason-lspconfig").setup()

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local settings = setmetatable({
    tsserver = {
        capabilities = cmp_capabilities,
        on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
        end,
        settings = {
            javascript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
            typescript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
        },
    },
    html = {
        capabilities = cmp_capabilities,
    },
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' }
                },
            }
        }
    }
}, {
    __index = function()
        return {}
    end,
})

local servers = { "pyright", "tsserver", "html", "tailwindcss", "lua_ls" }

for _, server in ipairs(servers) do
    lspconfig[server].setup(settings[server])
end
