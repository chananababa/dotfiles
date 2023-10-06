local status, null_ls = pcall(require, "null-ls")
if not status then
    return
end

function mergeTable(table1, table2)
    for i = 1, #table1 do
        table.insert(table2, table1[i])
    end
end

function concatTables(tables)
    local result = {}

    for i = 1, #tables do
        mergeTable(tables[i], result)
    end

    return result
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

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
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json'
}


local default_root_patterns = {
    ".null-ls-root",
    "Makefile",
    ".git"
}

local root_patterns = concatTables({
    default_root_patterns,
    prettier_root_patterns,
    eslint_root_patterns
})


null_ls.setup({
    root_dir = require("null-ls.utils").root_pattern(unpack(root_patterns)),
    sources = {
        formatting.stylua.with({
            extra_args = { "--indent-type=spaces" },
        }),
        formatting.prettierd.with({
            condition = function(utils)
                return utils.root_has_file(prettier_root_patterns)
            end
        }),
        formatting.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file(eslint_root_patterns)
            end
        }),
        formatting.autopep8,
        formatting.beautysh.with({
            extra_args = { "--indent-size", "2" },
        }),
        formatting.fish_indent,
        diagnostics.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file(eslint_root_patterns)
            end
        }),
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
