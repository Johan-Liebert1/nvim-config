local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim") -- Have packer manage itself

    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

    use("Johan-Liebert1/nvcode-color-schemes.vim") -- my color theme
    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })

    -- Git integration
    use("lewis6991/gitsigns.nvim")

    -- Tree sitter
    use({
        "nvim-treesitter/nvim-treesitter",
        -- used tag because of https://github.com/nvim-treesitter/nvim-treesitter/issues/2996
        -- first comment
        tag = "e4df4228b7c07f98e55345b40ac0093d27d0d18c"
    })
    use("p00f/nvim-ts-rainbow")
    use("nvim-treesitter/playground")

    -- Auto pairs for '(' '[' '{'
    use("jiangmiao/auto-pairs")

    -- File explorer
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })

    -- use("ryanoasis/vim-devicons")

    -- status line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- For Tab line
    use("kyazdani42/nvim-web-devicons") -- Recommended (for coloured icons)
    use("akinsho/bufferline.nvim") -- , { 'tag': 'v2.*' }
    use("moll/vim-bbye") -- so that we don't quit vim when closing buffers

    -- For Multiple Cursors
    use("mg979/vim-visual-multi") -- , {'branch': 'master'}

    -- colorizer
    use("norcalli/nvim-colorizer.lua")

    -- Black formatter
    use("ambv/black")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("hrsh7th/cmp-nvim-lsp") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
    use("honza/vim-snippets")
    -- use("SirVer/ultisnips")

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    -- use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })
    use("nvim-telescope/telescope-media-files.nvim")

    -- surround
    use("tpope/vim-surround")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
