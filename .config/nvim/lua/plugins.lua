local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("bkad/CamelCaseMotion")
    use("tpope/vim-surround")
    use("tpope/vim-commentary")
    use("ggandor/leap.nvim")
    use("ojroques/vim-oscyank")
    use("tpope/vim-repeat")

    --- for native neovim (not vscode)
    use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
    use("nvim-treesitter/playground")
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use("EdenEast/nightfox.nvim")
    use("rebelot/kanagawa.nvim")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use("neovim/nvim-lspconfig")
    use({ "williamboman/mason.nvim", run = ":MasonUpdate" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use("nvim-lua/lsp-status.nvim")
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
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use("jose-elias-alvarez/null-ls.nvim")
    use("nvim-lua/popup.nvim")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("akinsho/bufferline.nvim")
    use("lewis6991/gitsigns.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("jinh0/eyeliner.nvim")
    use("lvimuser/lsp-inlayhints.nvim")
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })
    use({
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function ()
            require('copilot').setup({
                filetypes = {
                    javascript = true,
                    typescript = true
                },
                suggestion = {
                    enabled = false
                },
                panel = {
                    enabled = false 
                },
            })
        end
    })
    use({
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    })
    use("oxfist/night-owl.nvim")


    if packer_bootstrap then
        require("packer").sync()
    end
end)
