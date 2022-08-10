vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
    { noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>cd",
    ":lua require'telescope'.extensions.zoxide.list{}<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
