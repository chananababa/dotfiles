local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local settings = setmetatable({
    sumneko_lua = {
        capabilities = cmp_capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
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
}, {
    __index = function()
        return {}
    end,
})

local servers = { "pyright", "tsserver", "sumneko_lua", "html", "tailwindcss" }

for _, server in ipairs(servers) do
    lspconfig[server].setup(settings[server])
end
