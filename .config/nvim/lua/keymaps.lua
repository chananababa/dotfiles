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
vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>Telescope zoxide list<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>$tabnew<cr>", { noremap = true })

vim.api.nvim_set_keymap(
    "n",
    "<leader>pp",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_create_user_command("Tr", function(input)
    vim.cmd("TabRename " .. input.args)
end, { nargs = 1 })
