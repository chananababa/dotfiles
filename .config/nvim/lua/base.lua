vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.cmd("colorscheme nightfox")

local function set_tab2(pattern)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = pattern,
        command = "setlocal shiftwidth=2 tabstop=2",
    })
end

local tab2_patterns = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" }

for _, pattern in ipairs(tab2_patterns) do
    set_tab2(pattern)
end
