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

telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader>sf", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        hidden = true,
        grouped = true,
        initial_mode = "normal",
        respect_gitignore = false,
    })
end)
