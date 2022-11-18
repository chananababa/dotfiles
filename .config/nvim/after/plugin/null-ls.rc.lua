local status, null_ls = pcall(require, "null-ls")
if not status then
    return
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
        if client.server_capabilities.documentFormattingProvider then
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
