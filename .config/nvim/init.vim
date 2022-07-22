call plug#begin('~/.vim/plugged')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'EdenEast/nightfox.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

call plug#end()

:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:colorscheme nightfox

:autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
:autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
:autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
:autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2

:nnoremap <leader>t <cmd>NvimTreeToggle<cr>
:nnoremap <leader>ff <cmd>Telescope find_files<cr>
:nnoremap <leader>fg <cmd>Telescope live_grep<cr>
:nnoremap <leader>fb <cmd>Telescope buffers<cr>
:nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local nvim_lsp_installer = require('nvim-lsp-installer')
local nvim_lsp = require('lspconfig')
local lsp_util = require('lspconfig.util')
local lsp_status = require('lsp-status')

nvim_lsp_installer.setup({
  automatic_installation = true
})

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

require('telescope').setup({
  defaults = {
	file_ignore_patterns = {"node_modules", "__pycache__"}
  }
})

require("nvim-tree").setup()
require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
