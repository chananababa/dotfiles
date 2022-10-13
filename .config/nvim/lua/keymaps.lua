vim.g.mapleader = " "
vim.g.camelcasemotion_key = "<leader>"
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", { noremap = true })
vim.keymap.set(
    "n",
    "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
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

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tr", ":TabRename ")

vim.keymap.set("n", "<leader>gs", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.keymap.set("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

vim.keymap.set("n", "<M-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
vim.keymap.set("t", "<M-d>", "<cmd>Lspsaga close_floaterm<CR>", { silent = true })

vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true, noremap = true })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { silent = true, noremap = true })
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })
