require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "__pycache__" },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
})
