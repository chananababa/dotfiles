local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end

local settings = setmetatable({
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
    tsserver = {
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
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    },
}, {
    __index = function()
        return {}
    end,
})

local servers = { "pyright", "tsserver", "sumneko_lua", "html" }

for _, server in ipairs(servers) do
    lspconfig[server].setup(settings[server])
end
