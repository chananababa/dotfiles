vim.api.nvim_create_user_command("Tr", function(input)
    vim.cmd("TabRename " .. input.args)
end, { nargs = 1 })
