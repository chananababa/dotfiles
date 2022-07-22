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


	if allow_formatting then
	  vim.api.nvim_command [[augroup Format]]
	  vim.api.nvim_command [[autocmd! * <buffer>]]
	  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
	  vim.api.nvim_command [[augroup END]]
	end
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

