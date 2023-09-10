-- map leader to Space
vim.g.mapleader = " "

-- for calmelCaseMotion
vim.g.camelcasemotion_key = "<leader>"

-- tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tr", ":TabRename ")


-- move line block
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true, noremap = true })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { silent = true, noremap = true })
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { silent = true, noremap = true })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- copy to clipboard
vim.keymap.set("v", "<leader>c", "<Plug>OSCYankVisual", { noremap = true })

-- map jk to ESC
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true })

-- bufferline
-- vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {})
-- vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', {})
