local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
    use("nvim-treesitter/playground")
    use("EdenEast/nightfox.nvim")
    use("rebelot/kanagawa.nvim")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({
                options = {
                    section_separators = "",
                    component_separators = "",
                },
            })
        end,
    })
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("nvim-lua/lsp-status.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        {
            ["do"] = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    })
    use("jvgrootveld/telescope-zoxide")
    use("nvim-telescope/telescope-file-browser.nvim")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use("jose-elias-alvarez/null-ls.nvim")
    use("nvim-lua/popup.nvim")
    use("bkad/CamelCaseMotion")
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga()
        end,
    })
    use({
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "tabs",
                    show_buffer_close_icons = false,
                    always_show_bufferline = false,
                    show_close_icon = false,
                    color_icons = true,
                },
            })
        end,
    })
    use("tpope/vim-surround")
    use("tpope/vim-commentary")
    use("ggandor/leap.nvim")
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame = false,
                current_line_blame_opts = {
                    delay = 300,
                },
            })
        end,
    })
    use("lukas-reineke/indent-blankline.nvim")
    use({
        "gelguy/wilder.nvim",
        config = function()
            local wilder = require("wilder")
            wilder.setup({ modes = { ":", "/", "?" } })
            wilder.set_option(
                "renderer",
                wilder.popupmenu_renderer({
                    -- highlighter applies highlighting to the candidates
                    highlighter = wilder.basic_highlighter(),
                })
            )
        end,
    })
    use({
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup({
                highlight_on_key = true,
            })
        end,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })
    use("ojroques/vim-oscyank")
    -- use({ "simrat39/inlay-hints.nvim", config = require("inlay-hints").setup() })
    use({
        "lvimuser/lsp-inlayhints.nvim",
        config = function()
            require("lsp-inlayhints.adapter").set_old_tsserver()
            require("lsp-inlayhints").setup({
                inlay_hints = {
                    highlight = "Comment",
                },
            })
        end,
    })

    use({
        "glepnir/dashboard-nvim",
        config = function()
            local db = require("dashboard")
            vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#86c8fa" })

            -- db.custom_header = {
            --     "",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⢀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⢀⣿⡀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⢀⣾⣿⣇⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⢠⡄⠀⠀⢿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⣜⣭⣍⣭⣀⡀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⢠⣿⣷⠀⠀⠘⠿⠿⢿⣿⡿⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣷⣌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⢀⣾⣿⡿⢃⣤⣶⣿⣿⣷⡌⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⠿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⣼⣿⠟⣴⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠉⣁⣀⠀⠀⠀⠈⠉⠁⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⣸⣿⣿⢸⣿⣿⣿⣿⠟⠋⠀⢠⣤⣶⣶⣿⣿⣿⣿⠀⢀⣤⣤⣤⡀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⢠⡿⠿⠛⠘⠿⠿⠛⠁⠀⠀⢀⣀⣉⣉⠛⢿⣿⣿⡇⢠⣿⣿⣿⣿⣿⣆⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣷⣄⠙⣿⡁⢸⣿⠟⠛⢿⣿⣿⣧⠀⠈⠛⠋⠉⠁⠀⠀⠀⠈⢿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⡈⠇⠸⡏⠀⠀⢈⣫⣭⣥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⠋⠉⠙⣿⣿⣿⣷⠀⣤⣴⣶⣾⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠀⠀⠀⢸⣿⣿⣿⡇⢹⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣆⠀⠀⢠⣿⣿⣿⣷⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⣀⣀⣠⠀⣿⣿⣿⡟",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⡟⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⡿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⡿⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⡿⠟⣫⣶",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⠿⠟⠛⣉⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣠⣴⣿⣿",
            --     "⣿⣿⢋⣏⡙⠛⣩⣍⡙⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢠⣿⣿⣿⣿",
            --     "⣿⠷⠹⣿⣿⣾⣿⣿⡇⠿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠁⣠⣿⣿⣿⣿⣿",
            --     "⢡⣾⣿⣿⣿⣿⣿⣿⣿⣷⣦⣌⡉⠛⠻⠿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⣿⣿⣿⠿⠛⢉⣉⣉⡙⠛⠛⠿⠿⠟⠛⠛⠉⢉⣀⣤⣴⡀⢸⣿⣿⣿⡿⠋⣠",
            --     "⣦⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣀⡀⠀⠀⠀⢀⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⠋⣰⣿⣿⣿⣿⣿⣿⣷⣶⣶⠾⡿⠟⢁⣾⣿⣿⣿⣇⠀⣿⠟⢉⣠⣾⣿",
            --     "⣇⢾⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣈⠉⠛⠻⢿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠰⣿⣿⣿⣿⣿⣿⣿⡀⢀⣴⣿⣿⣿⣿",
            --     "⣿⣦⣤⣴⣶⣶⣦⣬⣉⡛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠿⢿⣿⣿⣿⣿⣇⠈⣿⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⡉⠙⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣾⣿⣿⣿⣿⣿⡀⢻⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣈⠉⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣤⣤⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠘⣿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⣿",
            --     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⢀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠈⣿⣿⣿",
            --     "",
            -- }

            db.custom_header = {
                "",
                "",
                " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                "",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⢠⡆⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢀⣿⣷⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢠⡆⠀⢸⣿⣿⣿⣿⣿⠇⠀⠀⠀⣚⣛⣛⣃⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢀⣿⣷⡀⠀⠿⠿⠿⣿⠏⠀⠀⢰⣿⣿⣿⣿⣿⣿⣦⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⢀⣾⣿⡿⣣⣶⣿⣿⣿⡎⠀⠀⠀⣨⠛⠛⠛⠛⠿⠿⠟⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⣼⣿⢏⣾⣿⣿⣿⠿⠫⢀⣀⣠⣤⣴⣶⣶⠀⢀⣀⡀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⢰⣿⡿⠞⢿⡿⠟⠁⠀⠀⠈⠛⠻⢿⣿⣿⡏⣰⣿⣿⣿⣦⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣷⣦⠹⣿⠀⣿⡿⠻⣿⣿⣷⡀⠘⠟⠛⠉⠉⠀⠈⠻⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣷⡘⡆⠿⠅⢀⣘⣭⣭⡆⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠁⠀⠹⣿⣿⣷⠐⣶⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡀⠀⠀⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⢀⢸⣿⣿⡿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣷⣤⣴⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⢸⣿⣿⣷",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⡿⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⡿⢛⣵",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠛⣛⣩⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢈⣴⣿⣿",
                "⣿⡏⣴⣮⣉⣵⣮⢹⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣾⣿⣿⣿",
                "⢟⣥⣽⣿⣿⣿⣿⣜⣛⠿⢿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⣿⣿⣿⠿⠿⠛⣋⡉⢴⣾⣿⣿⣿⠟",
                "⣜⢿⣿⣿⣝⣛⣿⣿⣿⣿⣶⣦⣍⣙⠂⠀⠀⠀⢀⣀⣠⣶⣾⣿⣿⣿⣿⣿⢋⣴⣾⣿⣷⣶⣦⣬⣥⣴⡶⢆⣶⣿⣿⣧⠸⣿⡿⢋⣥⣾",
                "⡇⣾⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣉⡛⠻⢿⣿⣿⣿⣿⣿⡇⠈⠉⠉⠉⠉⠉⠁⠀⠀⠀⣶⣿⣿⣿⣿⣿⡄⢉⣴⣿⣿⣿",
                "⣿⣶⣶⣾⣷⣶⣮⣽⣛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠟⢻⣿⣿⣿⣷⢸⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣬⣉⡛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⣀⣠⣴⣾⣿⣿⣿⣿⣿⡀⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠈⢙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢹⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿",
                "",
            }
            db.custom_center = {
                -- {
                --     icon = "  ",
                --     desc = "Recently latest session                  ",
                --     shortcut = "SPC s l",
                --     action = "SessionLoad",
                -- },
                -- {
                --     icon = "  ",
                --     desc = "Recently opened files                   ",
                --     action = "DashboardFindHistory",
                --     shortcut = "SPC f h",
                -- },
                {
                    icon = "  ",
                    desc = "Find  File                              ",
                    action = "Telescope find_files find_command=rg,--hidden,--files",
                    shortcut = "SPC f f",
                },
                {
                    icon = "  ",
                    desc = "File Browser                            ",
                    action = "Telescope file_browser",
                    shortcut = "SPC f b",
                },
                {
                    icon = "  ",
                    desc = "Find  word                              ",
                    action = "Telescope live_grep",
                    shortcut = "SPC f g",
                },
            }
        end,
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
