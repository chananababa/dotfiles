local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    return
end

nvim_tree.setup()


-- Toggle nvim-tree
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle .<cr>", { noremap = true })
