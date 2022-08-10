vim.g.mapleader = " "
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

vim.keymap.set("n", "<leader>gs", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.keymap.set("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

local action = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

vim.keymap.set("n", "<M-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
vim.keymap.set("t", "<M-d>", "<cmd>Lspsaga close_floaterm<CR>", { silent = true })
