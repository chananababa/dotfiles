local status, telescope = pcall(require, "telescope")
if not status then
    return
end
local builtin = require("telescope.builtin")

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

require("telescope._extensions.zoxide.config").setup({
    mappings = {
        default = {
            after_action = function(selection)
                vim.cmd("tcd " .. selection.path)
            end,
        },
        ["<C-f>"] = {
            keepinsert = true,
            action = function(selection)
                vim.cmd("tcd " .. selection.path)
                builtin.find_files({ cwd = selection.path })
            end,
            --
        },
        ["<C-t>"] = {
            action = function(selection)
                vim.cmd("tabnew")
                vim.cmd("tcd " .. selection.path)
                builtin.find_files({ cwd = selection.path })
            end,
        },
    },
})
