local nvim_lsp = require('lspconfig')
local lsp_util = require('lspconfig.util')
local lsp_status = require('lsp-status')

local function default_on_attach(client)
  local has_illuminate, illuminate = pcall(require, 'illuminate')
  if has_illuminate then illuminate.on_attach(client) end
  lsp_status.on_attach(client)
end

local function toggle_formatting(allow_formatting)
  return function(client)
	default_on_attach(client)
    client.resolved_capabilities.document_formatting = allow_formatting
    client.resolved_capabilities.document_range_formatting = allow_formatting
  end
end

nvim_lsp['tsserver'].setup({
  format = { enable = false }
})
nvim_lsp['eslint'].setup({
  on_attach = toggle_formatting(true),
  root_dir = lsp_util.find_git_ancestor,
  settings = {
    autoFixOnSave = true,
    codeActionsOnSave = {
      enable = true,
      mode = "all",
      rules = { "!debugger", "!no-only-tests/*" },
    },
  },
})

local function can_autofix(client)
  return client.config.settings.autoFixOnSave or false
end

local function format_on_save()
  local clients = vim.lsp.get_active_clients()
  local can_autofix_clients = vim.tbl_filter(can_autofix, clients)
  if #can_autofix_clients > 0 then
    vim.lsp.buf.formatting_seq_sync()
  end
end

vim.api.nvim_create_augroup('LspFormatting', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '<buffer>',
  group = 'LspFormatting',
  callback = format_on_save
})

