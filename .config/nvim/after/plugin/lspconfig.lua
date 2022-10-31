local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local lspconfig = require("lspconfig")

local function mergeTables(table1, table2)
    local resultTable = {}
    for k, v in pairs(table1) do
        resultTable[k] = v
    end
    for k, v in pairs(table2) do
        resultTable[k] = v
    end
    return resultTable
end

-- local ih = require("inlay-hints")

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
}, {
    __index = function()
        return {}
    end,
})

local servers = { "pyright", "tsserver", "sumneko_lua" }

for _, server in ipairs(servers) do
    lspconfig[server].setup(settings[server])
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        formatting.stylua.with({
            extra_args = { "--indent-type=spaces" },
        }),
        formatting.prettier,
        formatting.eslint_d,
        formatting.autopep8,
        formatting.beautysh.with({
            extra_args = { "--indent-size", "2" },
        }),
        formatting.fish_indent,
        diagnostics.eslint_d,
        diagnostics.flake8,
        diagnostics.shellcheck,
        diagnostics.fish,
    },
    on_attach = function(client, bufnr)
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
