local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "__pycache__" },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    tele_tabby = {
        use_highlighter = true,
    },
})

telescope.load_extension("zoxide")

require("telescope._extensions.zoxide.config").setup({
    mappings = {
        default = {
            after_action = function(selection)
                vim.cmd("tcd " .. selection.path)
            end,
        },
    },
})
