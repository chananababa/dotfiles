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
})

telescope.load_extension("zoxide")

local z_utils = require("telescope._extensions.zoxide.utils")

require("telescope._extensions.zoxide.config").setup({
    mappings = {
        default = {
            after_action = function(selection)
                vim.cmd("tcd " .. selection.path)
            end,
        },
        ["<C-t>"] = { action = z_utils.create_basic_command("tabnew") },
    },
})
