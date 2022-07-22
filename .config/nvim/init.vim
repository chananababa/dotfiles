runtime ./plug.vim
runtime ./maps.vim

set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
colorscheme nightfox

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2


lua << EOF
require('plugins.lsp-installer')
require('plugins.lspconfig')
require('plugins.treesitter')
require('nvim-tree').setup()
EOF
