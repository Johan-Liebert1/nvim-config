local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Lazy manages itself
    { "folke/lazy.nvim" },

    -- Utils
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },

    -- Theme
    { "Johan-Liebert1/nvcode-color-schemes.vim" },

    -- Git
    { "lewis6991/gitsigns.nvim" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },

    -- {
    --     "nvim-treesitter/playground",
    --     lazy = false,
    -- },

    -- Auto pairs
    -- { "jiangmiao/auto-pairs" },

    -- Icons
    { "nvim-tree/nvim-web-devicons" },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Buffer delete
    { "moll/vim-bbye" },

    -- Multiple cursors
    { "mg979/vim-visual-multi" },

    -- Colorizer
    { "norcalli/nvim-colorizer.lua" },

    -- Black formatter
    { "ambv/black" },

    -- CMP
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "saadparwaiz1/cmp_luasnip" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "honza/vim-snippets" },

    -- Mason
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- LSP
    { "neovim/nvim-lspconfig" },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    { "nvim-telescope/telescope-media-files.nvim" },

    -- Surround
    { "tpope/vim-surround" },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

    -- Oil
    { "stevearc/oil.nvim" },

    -- Lua dev
    { "folke/neodev.nvim" },

    -- Markdown rendering
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("render-markdown").setup({
                enabled = false,
                render_modes = { "n", "c", "t" },
            })
        end,
    },

}, {
    ui = {
        border = "rounded",
    },
})
