return {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require('lspsaga').setup({})
        vim.keymap.set("n", "gs", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
        vim.keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
        vim.keymap.set("n", "gh", "<cmd>Lspsaga finder def+ref+imp<CR>", { silent = true })
        vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

        vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
        vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

        vim.keymap.set("n", "<M-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
        vim.keymap.set("t", "<M-d>", "<cmd>Lspsaga close_floaterm<CR>", { silent = true })
    end,
}
