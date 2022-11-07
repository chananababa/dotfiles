-- map leader to Space
vim.g.mapleader = " "

-- for calmelCaseMotion
vim.g.camelcasemotion_key = "<leader>"

-- Toggle nvim-tree
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle .<cr>", { noremap = true })

-- telescope
vim.keymap.set(
    "n",
    "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>"
    ,
    { noremap = true }
)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
vim.keymap.set(
    "n",
    "<leader>cd",
    ":lua require'telescope'.extensions.zoxide.list{}<CR>",
    { noremap = true, silent = true }
)

-- tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tr", ":TabRename ")

-- lspsaga
vim.keymap.set("n", "gs", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

vim.keymap.set("n", "<M-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
vim.keymap.set("t", "<M-d>", "<cmd>Lspsaga close_floaterm<CR>", { silent = true })


-- move line block
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true, noremap = true })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { silent = true, noremap = true })
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- copy to clipboard
vim.keymap.set("v", "<leader>c", ":OSCYank<CR>", { noremap = true })

-- map jk to ESC
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true })
